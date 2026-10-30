package com.universalmedialibrary.services.sync

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.RemoteSyncMutationDao
import com.universalmedialibrary.data.local.entity.EmbyServer
import com.universalmedialibrary.data.local.entity.JellyfinServer
import com.universalmedialibrary.data.local.entity.RemoteSyncMutation
import com.universalmedialibrary.services.integration.emby.EmbyApi
import com.universalmedialibrary.services.integration.emby.EmbyIntegrationService
import com.universalmedialibrary.services.integration.emby.EmbySyncService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinApi
import com.universalmedialibrary.services.integration.jellyfin.JellyfinIntegrationService
import com.universalmedialibrary.services.integration.jellyfin.JellyfinSyncService
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flowOf
import kotlinx.coroutines.runBlocking
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.Protocol
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.Mockito.`when`
import org.mockito.Mockito.mock
import org.mockito.kotlin.any
import org.mockito.kotlin.eq
import org.robolectric.RobolectricTestRunner
import retrofit2.Response as RetrofitResponse

@RunWith(RobolectricTestRunner::class)
class RemoteSyncQueueTest {

    private lateinit var context: Context
    private lateinit var fakeMutationDao: FakeRemoteSyncMutationDao
    private lateinit var credentialManager: ServerCredentialManager

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        fakeMutationDao = FakeRemoteSyncMutationDao()
        credentialManager = ServerCredentialManager(context)
    }

    @Test
    fun testMutationEnqueueingAndOrderingInDao() = runBlocking {
        val m1 = RemoteSyncMutation(
            serverType = "PLEX",
            serverId = 1L,
            targetItemId = "item100",
            mutationType = "PROGRESS",
            payloadJson = "{\"time\":1000}",
            createdAt = 1000L
        )
        val m2 = RemoteSyncMutation(
            serverType = "JELLYFIN",
            serverId = 2L,
            targetItemId = "item200",
            mutationType = "RATING",
            payloadJson = "{\"rating\":4.5}",
            createdAt = 2000L
        )

        fakeMutationDao.insert(m2) // Insert out of order
        fakeMutationDao.insert(m1)

        val pending = fakeMutationDao.getPendingMutations()
        assertEquals(2, pending.size)
        // Verify chronological order (m1 created at 1000L comes before m2 created at 2000L)
        assertEquals("PLEX", pending[0].serverType)
        assertEquals("JELLYFIN", pending[1].serverType)
    }

    @Test
    fun testJellyfinSyncServiceEnqueuesMutationOnFailure() = runBlocking {
        val mockDatabase = mock(AppDatabase::class.java)
        val mockJellyfinIntegration = mock(JellyfinIntegrationService::class.java)
        val mockJellyfinApi = mock(JellyfinApi::class.java)

        `when`(mockJellyfinIntegration.createApi(any(), any())).thenReturn(mockJellyfinApi)
        `when`(mockJellyfinApi.updateProgress(any(), any(), any(), any())).thenThrow(RuntimeException("Server Unreachable"))

        val jellyfinSyncService = JellyfinSyncService(
            context = context,
            database = mockDatabase,
            jellyfinIntegration = mockJellyfinIntegration,
            remoteSyncMutationDao = fakeMutationDao,
            credentialManager = credentialManager
        )

        val server = JellyfinServer(
            id = 10L,
            name = "Test Jellyfin",
            host = "localhost",
            port = 8096,
            apiKey = "test_token",
            userId = "user123"
        )

        val result = jellyfinSyncService.updateProgress(server, "item_55", 12000L)
        assertTrue(result.isFailure)

        val pending = fakeMutationDao.getPendingMutations()
        assertEquals(1, pending.size)
        val mutation = pending.first()
        assertEquals("JELLYFIN", mutation.serverType)
        assertEquals(10L, mutation.serverId)
        assertEquals("item_55", mutation.targetItemId)
        assertEquals("PROGRESS", mutation.mutationType)
        assertTrue(mutation.payloadJson.contains("12000"))
    }

    @Test
    fun testEmbySyncServiceEnqueuesMutationOnHttpError() = runBlocking {
        val mockDatabase = mock(AppDatabase::class.java)
        val mockEmbyIntegration = mock(EmbyIntegrationService::class.java)
        val mockEmbyApi = mock(EmbyApi::class.java)

        `when`(mockEmbyIntegration.createApi(any(), any())).thenReturn(mockEmbyApi)
        
        val errorResponseBody = "{\"error\":\"Internal Server Error\"}".toResponseBody("application/json".toMediaType())
        val errorResponse = RetrofitResponse.error<Unit>(500, errorResponseBody)
        `when`(mockEmbyApi.updateRating(any(), any(), any(), any(), any())).thenReturn(errorResponse)

        val embySyncService = EmbySyncService(
            context = context,
            database = mockDatabase,
            embyIntegration = mockEmbyIntegration,
            remoteSyncMutationDao = fakeMutationDao,
            credentialManager = credentialManager
        )

        val server = EmbyServer(
            id = 20L,
            name = "Test Emby",
            host = "localhost",
            port = 8096,
            apiKey = "emby_token",
            userId = "emby_user_1"
        )

        val result = embySyncService.updateRating(server, "item_99", 5.0)
        assertTrue(result.isFailure)

        val pending = fakeMutationDao.getPendingMutations()
        assertEquals(1, pending.size)
        val mutation = pending.first()
        assertEquals("EMBY", mutation.serverType)
        assertEquals(20L, mutation.serverId)
        assertEquals("item_99", mutation.targetItemId)
        assertEquals("RATING", mutation.mutationType)
        assertTrue(mutation.payloadJson.contains("5.0"))
    }

    @Test
    fun testRemoteTokenRefreshInterceptorRetriesWithNewToken() {
        credentialManager.saveCredentials("JELLYFIN", 1L, "localhost", 8096, token = "expired_token")

        var tokenRefreshCalled = false
        val interceptor = RemoteTokenRefreshInterceptor(
            serverType = "JELLYFIN",
            serverId = 1L,
            credentialManager = credentialManager,
            tokenAuthenticator = {
                tokenRefreshCalled = true
                "fresh_refreshed_token"
            }
        )

        var callCount = 0
        val chain = object : Interceptor.Chain {
            private val initialRequest = Request.Builder()
                .url("http://localhost:8096/Users/Me")
                .header("X-Emby-Token", "expired_token")
                .build()

            override fun request(): Request = initialRequest

            override fun proceed(request: Request): Response {
                callCount++
                return if (callCount == 1) {
                    Response.Builder()
                        .request(request)
                        .protocol(Protocol.HTTP_1_1)
                        .code(401)
                        .message("Unauthorized")
                        .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
                        .build()
                } else {
                    assertEquals("fresh_refreshed_token", request.header("X-Emby-Token"))
                    Response.Builder()
                        .request(request)
                        .protocol(Protocol.HTTP_1_1)
                        .code(200)
                        .message("OK")
                        .body("{\"status\":\"success\"}".toResponseBody("application/json".toMediaType()))
                        .build()
                }
            }

            override fun connection(): okhttp3.Connection? = null
            override fun call(): okhttp3.Call = TODO()
            override fun connectTimeoutMillis(): Int = 1000
            override fun withConnectTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
            override fun readTimeoutMillis(): Int = 1000
            override fun withReadTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
            override fun writeTimeoutMillis(): Int = 1000
            override fun withWriteTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
        }

        val response = interceptor.intercept(chain)
        assertTrue(tokenRefreshCalled)
        assertEquals(200, response.code)
        assertEquals(2, callCount)
        assertEquals("fresh_refreshed_token", credentialManager.getCredentials("JELLYFIN", 1L)?.token)
    }

    @Test
    fun testRemoteTokenRefreshInterceptorMax3RetriesLimit() {
        credentialManager.saveCredentials("PLEX", 2L, "localhost", 32400, token = "bad_token")

        var authAttempts = 0
        val interceptor = RemoteTokenRefreshInterceptor(
            serverType = "PLEX",
            serverId = 2L,
            credentialManager = credentialManager,
            tokenAuthenticator = {
                authAttempts++
                "attempt_token_$authAttempts"
            }
        )

        var proceedCount = 0
        val chain = object : Interceptor.Chain {
            private val initialRequest = Request.Builder()
                .url("http://localhost:32400/library/sections")
                .header("X-Plex-Token", "bad_token")
                .build()

            override fun request(): Request = initialRequest

            override fun proceed(request: Request): Response {
                proceedCount++
                return Response.Builder()
                    .request(request)
                    .protocol(Protocol.HTTP_1_1)
                    .code(401)
                    .message("Unauthorized")
                    .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
                    .build()
            }

            override fun connection(): okhttp3.Connection? = null
            override fun call(): okhttp3.Call = TODO()
            override fun connectTimeoutMillis(): Int = 1000
            override fun withConnectTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
            override fun readTimeoutMillis(): Int = 1000
            override fun withReadTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
            override fun writeTimeoutMillis(): Int = 1000
            override fun withWriteTimeout(timeout: Int, unit: java.util.concurrent.TimeUnit): Interceptor.Chain = this
        }

        val response = interceptor.intercept(chain)
        assertEquals(401, response.code)
        assertEquals(3, authAttempts)
        assertEquals(4, proceedCount) // 1 initial + 3 retries
    }

    /**
     * Fake RemoteSyncMutationDao implementation for unit tests
     */
    class FakeRemoteSyncMutationDao : RemoteSyncMutationDao {
        private val list = mutableListOf<RemoteSyncMutation>()
        private var idSeq = 1L

        override suspend fun insert(mutation: RemoteSyncMutation): Long {
            val id = if (mutation.id == 0L) idSeq++ else mutation.id
            val entity = mutation.copy(id = id)
            list.removeAll { it.id == id }
            list.add(entity)
            return id
        }

        override suspend fun insertAll(mutations: List<RemoteSyncMutation>): List<Long> {
            return mutations.map { insert(it) }
        }

        override suspend fun update(mutation: RemoteSyncMutation) {
            list.removeAll { it.id == mutation.id }
            list.add(mutation)
        }

        override suspend fun delete(mutation: RemoteSyncMutation) {
            list.removeAll { it.id == mutation.id }
        }

        override suspend fun deleteById(id: Long) {
            list.removeAll { it.id == id }
        }

        override suspend fun getById(id: Long): RemoteSyncMutation? {
            return list.find { it.id == id }
        }

        override suspend fun getPendingMutations(): List<RemoteSyncMutation> {
            return list.filter { it.status != "COMPLETED" && it.status != "FAILED" }.sortedBy { it.createdAt }
        }

        override fun observePendingMutations(): Flow<List<RemoteSyncMutation>> {
            return flowOf(list.filter { it.status != "COMPLETED" && it.status != "FAILED" }.sortedBy { it.createdAt })
        }

        override suspend fun getMutationsForServer(serverType: String, serverId: Long): List<RemoteSyncMutation> {
            return list.filter { it.serverType == serverType && it.serverId == serverId }.sortedBy { it.createdAt }
        }

        override suspend fun updateStatus(id: Long, status: String, retryCount: Int, lastAttemptAt: Long) {
            val idx = list.indexOfFirst { it.id == id }
            if (idx != -1) {
                list[idx] = list[idx].copy(status = status, retryCount = retryCount, lastAttemptAt = lastAttemptAt)
            }
        }

        override suspend fun clearCompleted() {
            list.removeAll { it.status == "COMPLETED" }
        }
    }
}
