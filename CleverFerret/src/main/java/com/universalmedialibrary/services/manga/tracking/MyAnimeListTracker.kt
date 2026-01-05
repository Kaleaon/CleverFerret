package com.universalmedialibrary.services.manga.tracking

import android.content.Context
import android.util.Base64
import android.util.Log
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.FormBody
import okhttp3.OkHttpClient
import okhttp3.Request
import org.json.JSONObject
import java.security.SecureRandom
import javax.inject.Inject
import javax.inject.Singleton

/**
 * MyAnimeList Manga Tracker
 * 
 * Integration with MyAnimeList API for manga tracking
 * Uses OAuth 2.0 with PKCE for authentication
 * https://myanimelist.net/apiconfig/references/api/v2
 */
@Singleton
class MyAnimeListTracker @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository,
    private val tokenStorage: TrackingTokenStorage
) : MangaTracker {
    
    companion object {
        private const val TAG = "MALTracker"
        private const val API_URL = "https://api.myanimelist.net/v2"
        private const val CLIENT_ID_KEY = "mal_client_id"
        private const val CODE_VERIFIER_KEY = "mal_code_verifier"
    }
    
    override val service = TrackingService.MYANIMELIST
    
    // Store code verifier for PKCE
    private var codeVerifier: String? = null
    
    override suspend fun isAuthenticated(): Boolean {
        return tokenStorage.getToken(service) != null
    }
    
    override suspend fun getUser(): Result<TrackingUser> = withContext(Dispatchers.IO) {
        try {
            val token = tokenStorage.getToken(service)
                ?: return@withContext Result.failure(Exception("Not authenticated"))
            
            val request = Request.Builder()
                .url("$API_URL/users/@me")
                .header("Authorization", "Bearer ${token.accessToken}")
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(Exception("Failed to get user: ${response.code}"))
                }
                
                val json = JSONObject(response.body?.string() ?: "")
                
                Result.success(TrackingUser(
                    service = service,
                    id = json.getInt("id").toString(),
                    username = json.getString("name"),
                    avatarUrl = json.optString("picture"),
                    profileUrl = "https://myanimelist.net/profile/${json.getString("name")}"
                ))
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to get user", e)
            Result.failure(e)
        }
    }
    
    override suspend fun authenticate(code: String): Result<TrackingToken> = 
        withContext(Dispatchers.IO) {
            try {
                val clientId = apiKeyRepository.getAPIKeyValue(CLIENT_ID_KEY)
                    ?: return@withContext Result.failure(Exception("MAL client ID not configured"))
                
                val verifier = codeVerifier
                    ?: return@withContext Result.failure(Exception("Code verifier not found"))
                
                val body = FormBody.Builder()
                    .add("client_id", clientId)
                    .add("code", code)
                    .add("code_verifier", verifier)
                    .add("grant_type", "authorization_code")
                    .add("redirect_uri", "cleverferret://mal-callback")
                    .build()
                
                val request = Request.Builder()
                    .url(service.getTokenUrl())
                    .post(body)
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(
                            Exception("Token exchange failed: ${response.code}")
                        )
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val token = TrackingToken(
                        service = service,
                        accessToken = json.getString("access_token"),
                        refreshToken = json.optString("refresh_token"),
                        expiresAt = System.currentTimeMillis() + (json.optLong("expires_in", 0) * 1000)
                    )
                    
                    tokenStorage.saveToken(token)
                    codeVerifier = null // Clear after use
                    Result.success(token)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Authentication failed", e)
                Result.failure(e)
            }
        }
    
    override suspend fun refreshToken(): Result<TrackingToken> = withContext(Dispatchers.IO) {
        try {
            val currentToken = tokenStorage.getToken(service)
                ?: return@withContext Result.failure(Exception("Not authenticated"))
            
            val clientId = apiKeyRepository.getAPIKeyValue(CLIENT_ID_KEY)
                ?: return@withContext Result.failure(Exception("MAL client ID not configured"))
            
            val body = FormBody.Builder()
                .add("client_id", clientId)
                .add("grant_type", "refresh_token")
                .add("refresh_token", currentToken.refreshToken ?: "")
                .build()
            
            val request = Request.Builder()
                .url(service.getTokenUrl())
                .post(body)
                .build()
            
            httpClient.newCall(request).execute().use { response ->
                if (!response.isSuccessful) {
                    return@withContext Result.failure(
                        Exception("Token refresh failed: ${response.code}")
                    )
                }
                
                val json = JSONObject(response.body?.string() ?: "")
                val token = TrackingToken(
                    service = service,
                    accessToken = json.getString("access_token"),
                    refreshToken = json.optString("refresh_token") ?: currentToken.refreshToken,
                    expiresAt = System.currentTimeMillis() + (json.optLong("expires_in", 0) * 1000)
                )
                
                tokenStorage.saveToken(token)
                Result.success(token)
            }
        } catch (e: Exception) {
            Log.e(TAG, "Token refresh failed", e)
            Result.failure(e)
        }
    }
    
    override suspend fun logout() {
        tokenStorage.clearToken(service)
    }
    
    override suspend fun search(query: String): Result<List<TrackSearchResult>> = 
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                
                val url = "$API_URL/manga?q=${java.net.URLEncoder.encode(query, "UTF-8")}&limit=20" +
                        "&fields=id,title,main_picture,synopsis,num_chapters,mean,start_date,status"
                
                val requestBuilder = Request.Builder().url(url)
                token?.let { requestBuilder.header("Authorization", "Bearer ${it.accessToken}") }
                
                httpClient.newCall(requestBuilder.build()).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(Exception("Search failed: ${response.code}"))
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val data = json.getJSONArray("data")
                    
                    val results = (0 until data.length()).map { i ->
                        val node = data.getJSONObject(i).getJSONObject("node")
                        
                        TrackSearchResult(
                            remoteId = node.getInt("id").toString(),
                            title = node.getString("title"),
                            coverUrl = node.optJSONObject("main_picture")?.optString("large"),
                            summary = node.optString("synopsis")?.take(500),
                            totalChapters = node.optInt("num_chapters", 0),
                            score = node.optDouble("mean", 0.0).toFloat(),
                            startDate = node.optString("start_date"),
                            status = node.optString("status"),
                            service = service
                        )
                    }
                    
                    Result.success(results)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Search failed", e)
                Result.failure(e)
            }
        }
    
    override suspend fun getMangaList(status: TrackingStatus?): Result<TrackingMangaList> =
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                    ?: return@withContext Result.failure(Exception("Not authenticated"))
                
                val statusParam = status?.let { "&status=${it.toMALStatus()}" } ?: ""
                val url = "$API_URL/users/@me/mangalist?fields=list_status,num_chapters,main_picture$statusParam&limit=100"
                
                val request = Request.Builder()
                    .url(url)
                    .header("Authorization", "Bearer ${token.accessToken}")
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(Exception("Failed to get list: ${response.code}"))
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val data = json.getJSONArray("data")
                    
                    val items = (0 until data.length()).map { i ->
                        val item = data.getJSONObject(i)
                        val node = item.getJSONObject("node")
                        val listStatus = item.getJSONObject("list_status")
                        
                        TrackedManga(
                            id = node.getInt("id").toLong(),
                            remoteId = node.getInt("id").toString(),
                            service = service,
                            mangaId = 0,
                            title = node.getString("title"),
                            coverUrl = node.optJSONObject("main_picture")?.optString("large"),
                            status = TrackingStatus.fromMALStatus(listStatus.optString("status")),
                            score = listStatus.optInt("score", 0).toFloat(),
                            chaptersRead = listStatus.optInt("num_chapters_read", 0),
                            totalChapters = node.optInt("num_chapters", 0),
                            startDate = parseMALDate(listStatus.optString("start_date")),
                            finishDate = parseMALDate(listStatus.optString("finish_date")),
                            lastUpdated = parseMALDate(listStatus.optString("updated_at")) 
                                ?: System.currentTimeMillis()
                        )
                    }
                    
                    Result.success(TrackingMangaList(
                        service = service,
                        items = items,
                        totalCount = items.size,
                        hasNextPage = json.has("paging") && json.getJSONObject("paging").has("next")
                    ))
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to get manga list", e)
                Result.failure(e)
            }
        }
    
    override suspend fun getTrackedManga(remoteId: String): Result<TrackedManga?> =
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                    ?: return@withContext Result.failure(Exception("Not authenticated"))
                
                val url = "$API_URL/manga/$remoteId?fields=id,title,main_picture,num_chapters,my_list_status"
                
                val request = Request.Builder()
                    .url(url)
                    .header("Authorization", "Bearer ${token.accessToken}")
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        if (response.code == 404) return@withContext Result.success(null)
                        return@withContext Result.failure(Exception("Failed: ${response.code}"))
                    }
                    
                    val json = JSONObject(response.body?.string() ?: "")
                    val listStatus = json.optJSONObject("my_list_status")
                        ?: return@withContext Result.success(null)
                    
                    Result.success(TrackedManga(
                        id = json.getInt("id").toLong(),
                        remoteId = json.getInt("id").toString(),
                        service = service,
                        mangaId = 0,
                        title = json.getString("title"),
                        coverUrl = json.optJSONObject("main_picture")?.optString("large"),
                        status = TrackingStatus.fromMALStatus(listStatus.optString("status")),
                        score = listStatus.optInt("score", 0).toFloat(),
                        chaptersRead = listStatus.optInt("num_chapters_read", 0),
                        totalChapters = json.optInt("num_chapters", 0),
                        startDate = parseMALDate(listStatus.optString("start_date")),
                        finishDate = parseMALDate(listStatus.optString("finish_date"))
                    ))
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to get tracked manga", e)
                Result.failure(e)
            }
        }
    
    override suspend fun addManga(
        remoteId: String,
        status: TrackingStatus
    ): Result<TrackedManga> = updateManga(ScrobblingEntry(
        remoteId = remoteId,
        service = service,
        status = status
    ))
    
    override suspend fun updateManga(entry: ScrobblingEntry): Result<TrackedManga> =
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                    ?: return@withContext Result.failure(Exception("Not authenticated"))
                
                val bodyBuilder = FormBody.Builder()
                    .add("status", entry.status.toMALStatus())
                
                if (entry.score > 0) bodyBuilder.add("score", entry.score.toInt().toString())
                if (entry.chaptersRead > 0) bodyBuilder.add("num_chapters_read", entry.chaptersRead.toString())
                
                val request = Request.Builder()
                    .url("$API_URL/manga/${entry.remoteId}/my_list_status")
                    .header("Authorization", "Bearer ${token.accessToken}")
                    .patch(bodyBuilder.build())
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful) {
                        return@withContext Result.failure(Exception("Update failed: ${response.code}"))
                    }
                    
                    // Fetch the full manga info after update
                    return@withContext getTrackedManga(entry.remoteId).mapCatching { it!! }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to update manga", e)
                Result.failure(e)
            }
        }
    
    override suspend fun removeManga(remoteId: String): Result<Unit> =
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                    ?: return@withContext Result.failure(Exception("Not authenticated"))
                
                val request = Request.Builder()
                    .url("$API_URL/manga/$remoteId/my_list_status")
                    .header("Authorization", "Bearer ${token.accessToken}")
                    .delete()
                    .build()
                
                httpClient.newCall(request).execute().use { response ->
                    if (!response.isSuccessful && response.code != 404) {
                        return@withContext Result.failure(Exception("Delete failed: ${response.code}"))
                    }
                    Result.success(Unit)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to remove manga", e)
                Result.failure(e)
            }
        }
    
    override suspend fun syncProgress(
        remoteId: String,
        chaptersRead: Int
    ): Result<TrackedManga> {
        val current = getTrackedManga(remoteId).getOrNull()
        
        return updateManga(ScrobblingEntry(
            remoteId = remoteId,
            service = service,
            status = current?.status ?: TrackingStatus.READING,
            score = current?.score ?: 0f,
            chaptersRead = chaptersRead
        ))
    }
    
    override suspend fun updateScore(
        remoteId: String,
        score: Float
    ): Result<TrackedManga> {
        val current = getTrackedManga(remoteId).getOrNull()
        
        return updateManga(ScrobblingEntry(
            remoteId = remoteId,
            service = service,
            status = current?.status ?: TrackingStatus.READING,
            score = score,
            chaptersRead = current?.chaptersRead ?: 0
        ))
    }
    
    override fun getAuthorizationUrl(clientId: String, redirectUri: String): String {
        // Generate PKCE code verifier
        val random = SecureRandom()
        val bytes = ByteArray(64)
        random.nextBytes(bytes)
        codeVerifier = Base64.encodeToString(bytes, Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP)
        
        // Code challenge is the same as verifier for MAL (plain method)
        val codeChallenge = codeVerifier
        
        return "${service.getAuthUrl()}?" +
               "response_type=code" +
               "&client_id=$clientId" +
               "&redirect_uri=$redirectUri" +
               "&code_challenge=$codeChallenge" +
               "&code_challenge_method=plain"
    }
    
    private fun parseMALDate(dateString: String?): Long? {
        if (dateString.isNullOrBlank()) return null
        return try {
            val format = java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.US)
            format.parse(dateString)?.time
        } catch (e: Exception) {
            null
        }
    }
}
