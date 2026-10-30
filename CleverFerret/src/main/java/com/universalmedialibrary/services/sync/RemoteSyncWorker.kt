package com.universalmedialibrary.services.sync

import android.content.Context
import android.util.Log
import androidx.hilt.work.HiltWorker
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.RemoteSyncMutationDao
import com.universalmedialibrary.data.local.entity.RemoteSyncMutation
import com.universalmedialibrary.services.integration.emby.EmbyIntegrationService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService
import com.universalmedialibrary.services.plex.PlexApi
import dagger.assisted.Assisted
import dagger.assisted.AssistedInject
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit

/**
 * WorkManager worker scheduled with NetworkType.CONNECTED constraints.
 * Drains pending mutations in remote_sync_mutations in chronological order,
 * applying exponential backoff and retry limits.
 */
@HiltWorker
class RemoteSyncWorker @AssistedInject constructor(
    @Assisted private val appContext: Context,
    @Assisted params: WorkerParameters,
    private val database: AppDatabase,
    private val remoteSyncMutationDao: RemoteSyncMutationDao,
    private val credentialManager: ServerCredentialManager,
    private val jellyfinIntegrationService: JellyfinIntegrationService,
    private val embyIntegrationService: EmbyIntegrationService
) : CoroutineWorker(appContext, params) {

    companion object {
        private const val TAG = "RemoteSyncWorker"
        const val MAX_RETRIES = 3
    }

    override suspend fun doWork(): Result {
        Log.i(TAG, "RemoteSyncWorker started executing pending sync queue...")
        val pendingMutations = remoteSyncMutationDao.getPendingMutations()

        if (pendingMutations.isEmpty()) {
            Log.i(TAG, "No pending remote sync mutations found.")
            return Result.success()
        }

        var anyFailed = false

        for (mutation in pendingMutations) {
            if (mutation.retryCount >= MAX_RETRIES) {
                remoteSyncMutationDao.updateStatus(
                    id = mutation.id,
                    status = "FAILED",
                    retryCount = mutation.retryCount,
                    lastAttemptAt = System.currentTimeMillis()
                )
                continue
            }

            val success = processMutation(mutation)
            if (success) {
                remoteSyncMutationDao.deleteById(mutation.id)
                Log.i(TAG, "Mutation ${mutation.id} (${mutation.serverType} ${mutation.mutationType}) completed successfully.")
            } else {
                anyFailed = true
                val newRetryCount = mutation.retryCount + 1
                val newStatus = if (newRetryCount >= MAX_RETRIES) "FAILED" else "PENDING"
                remoteSyncMutationDao.updateStatus(
                    id = mutation.id,
                    status = newStatus,
                    retryCount = newRetryCount,
                    lastAttemptAt = System.currentTimeMillis()
                )
                Log.w(TAG, "Mutation ${mutation.id} failed (attempt $newRetryCount/$MAX_RETRIES).")
            }
        }

        return if (anyFailed) Result.retry() else Result.success()
    }

    private suspend fun processMutation(mutation: RemoteSyncMutation): Boolean {
        return try {
            val credentials = credentialManager.getCredentials(mutation.serverType, mutation.serverId)
                ?: run {
                    Log.w(TAG, "No credentials found for ${mutation.serverType} server ${mutation.serverId}")
                    return false
                }

            val interceptor = RemoteTokenRefreshInterceptor(
                serverType = mutation.serverType,
                serverId = mutation.serverId,
                credentialManager = credentialManager,
                tokenAuthenticator = { creds ->
                    // Re-authenticator logic per server type
                    refreshServerToken(creds)
                }
            )

            when (mutation.serverType.uppercase()) {
                "PLEX" -> processPlexMutation(mutation, credentials, interceptor)
                "JELLYFIN" -> processJellyfinMutation(mutation, credentials, interceptor)
                "EMBY" -> processEmbyMutation(mutation, credentials, interceptor)
                else -> false
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error processing mutation ${mutation.id}", e)
            false
        }
    }

    private suspend fun processPlexMutation(
        mutation: RemoteSyncMutation,
        credentials: ServerCredentialManager.ServerCredentials,
        interceptor: RemoteTokenRefreshInterceptor
    ): Boolean {
        val baseUrl = "http://${credentials.host}:${credentials.port}"
        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(interceptor)
            .connectTimeout(10, TimeUnit.SECONDS)
            .readTimeout(10, TimeUnit.SECONDS)
            .build()

        val api = Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(PlexApi::class.java)

        val token = credentials.token ?: ""

        return when (mutation.mutationType.uppercase()) {
            "PROGRESS" -> {
                val time = parseJsonLong(mutation.payloadJson, "time")
                val response = api.updateProgress(
                    token = token,
                    time = time,
                    state = "paused",
                    ratingKey = mutation.targetItemId,
                    key = "/library/metadata/${mutation.targetItemId}"
                )
                response.isSuccessful
            }
            "RATING" -> {
                val rating = parseJsonFloat(mutation.payloadJson, "rating")
                val response = api.updateMediaItem(
                    ratingKey = mutation.targetItemId,
                    token = token,
                    rating = rating
                )
                response.isSuccessful
            }
            else -> false
        }
    }

    private suspend fun processJellyfinMutation(
        mutation: RemoteSyncMutation,
        credentials: ServerCredentialManager.ServerCredentials,
        interceptor: RemoteTokenRefreshInterceptor
    ): Boolean {
        val serverUrl = "http://${credentials.host}:${credentials.port}"
        val api = jellyfinIntegrationService.createApi(serverUrl, interceptor)
        val token = credentials.token ?: ""
        val userId = getJellyfinUserId(credentials.serverId)

        return when (mutation.mutationType.uppercase()) {
            "PROGRESS" -> {
                val positionTicks = parseJsonLong(mutation.payloadJson, "positionTicks")
                val response = api.updateProgress(
                    userId = userId,
                    itemId = mutation.targetItemId,
                    token = token,
                    positionTicks = positionTicks
                )
                response.isSuccessful
            }
            "RATING" -> {
                val rating = parseJsonFloat(mutation.payloadJson, "rating")
                val response = api.updateRating(
                    userId = userId,
                    itemId = mutation.targetItemId,
                    token = token,
                    rating = rating.toDouble()
                )
                response.isSuccessful
            }
            else -> false
        }
    }

    private suspend fun processEmbyMutation(
        mutation: RemoteSyncMutation,
        credentials: ServerCredentialManager.ServerCredentials,
        interceptor: RemoteTokenRefreshInterceptor
    ): Boolean {
        val serverUrl = "http://${credentials.host}:${credentials.port}"
        val api = embyIntegrationService.createApi(serverUrl, interceptor)
        val token = credentials.token ?: ""
        val userId = getEmbyUserId(credentials.serverId)

        return when (mutation.mutationType.uppercase()) {
            "PROGRESS" -> {
                val positionTicks = parseJsonLong(mutation.payloadJson, "positionTicks")
                val response = api.updateProgress(
                    userId = userId,
                    itemId = mutation.targetItemId,
                    token = token,
                    positionTicks = positionTicks
                )
                response.isSuccessful
            }
            "RATING" -> {
                val rating = parseJsonFloat(mutation.payloadJson, "rating")
                val response = api.updateRating(
                    userId = userId,
                    itemId = mutation.targetItemId,
                    token = token,
                    rating = rating.toDouble()
                )
                response.isSuccessful
            }
            else -> false
        }
    }

    private suspend fun getJellyfinUserId(serverId: Long): String {
        return database.jellyfinServerDao().getById(serverId)?.userId ?: ""
    }

    private suspend fun getEmbyUserId(serverId: Long): String {
        return database.embyServerDao().getById(serverId)?.userId ?: ""
    }

    private fun refreshServerToken(creds: ServerCredentialManager.ServerCredentials): String? {
        return creds.token
    }

    private fun parseJsonLong(json: String, key: String): Long {
        return try {
            val regex = "\"$key\":\\s*(\\d+)".toRegex()
            regex.find(json)?.groupValues?.get(1)?.toLong() ?: 0L
        } catch (_: Exception) {
            0L
        }
    }

    private fun parseJsonFloat(json: String, key: String): Float {
        return try {
            val regex = "\"$key\":\\s*([0-9.]+)".toRegex()
            regex.find(json)?.groupValues?.get(1)?.toFloat() ?: 0f
        } catch (_: Exception) {
            0f
        }
    }
}
