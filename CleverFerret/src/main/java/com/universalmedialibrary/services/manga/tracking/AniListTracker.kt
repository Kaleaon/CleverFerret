package com.universalmedialibrary.services.manga.tracking

import android.content.Context
import android.util.Log
import com.universalmedialibrary.data.repository.APIKeyRepository
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONArray
import org.json.JSONObject
import javax.inject.Inject
import javax.inject.Singleton

/**
 * AniList Manga Tracker
 * 
 * Integration with AniList GraphQL API for manga tracking
 * https://anilist.gitbook.io/anilist-apiv2-docs/
 */
@Singleton
class AniListTracker @Inject constructor(
    @ApplicationContext private val context: Context,
    private val httpClient: OkHttpClient,
    private val apiKeyRepository: APIKeyRepository,
    private val tokenStorage: TrackingTokenStorage
) : MangaTracker {
    
    companion object {
        private const val TAG = "AniListTracker"
        private const val API_URL = "https://graphql.anilist.co"
        private const val CLIENT_ID_KEY = "anilist_client_id"
    }
    
    override val service = TrackingService.ANILIST
    
    override suspend fun isAuthenticated(): Boolean {
        return tokenStorage.getToken(service) != null
    }
    
    override suspend fun getUser(): Result<TrackingUser> = withContext(Dispatchers.IO) {
        try {
            val token = tokenStorage.getToken(service)
                ?: return@withContext Result.failure(Exception("Not authenticated"))
            
            val query = """
                query {
                    Viewer {
                        id
                        name
                        avatar { large }
                        siteUrl
                        statistics {
                            manga {
                                count
                                chaptersRead
                            }
                        }
                    }
                }
            """.trimIndent()
            
            val response = executeGraphQL(query, token.accessToken)
            val viewer = response.getJSONObject("data").getJSONObject("Viewer")
            
            val stats = viewer.optJSONObject("statistics")?.optJSONObject("manga")
            
            Result.success(TrackingUser(
                service = service,
                id = viewer.getInt("id").toString(),
                username = viewer.getString("name"),
                avatarUrl = viewer.optJSONObject("avatar")?.optString("large"),
                profileUrl = viewer.optString("siteUrl"),
                mangaCount = stats?.optInt("count") ?: 0,
                chaptersRead = stats?.optInt("chaptersRead") ?: 0
            ))
        } catch (e: Exception) {
            Log.e(TAG, "Failed to get user", e)
            Result.failure(e)
        }
    }
    
    override suspend fun authenticate(code: String): Result<TrackingToken> = 
        withContext(Dispatchers.IO) {
            try {
                val clientId = apiKeyRepository.getAPIKeyValue(CLIENT_ID_KEY)
                    ?: return@withContext Result.failure(Exception("AniList client ID not configured"))
                
                val clientSecret = apiKeyRepository.getAPIKeyValue("anilist_client_secret")
                    ?: return@withContext Result.failure(Exception("AniList client secret not configured"))
                
                val body = JSONObject().apply {
                    put("grant_type", "authorization_code")
                    put("client_id", clientId)
                    put("client_secret", clientSecret)
                    put("code", code)
                    put("redirect_uri", "cleverferret://anilist-callback")
                }
                
                val request = Request.Builder()
                    .url(service.getTokenUrl())
                    .post(body.toString().toRequestBody("application/json".toMediaType()))
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
                    Result.success(token)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Authentication failed", e)
                Result.failure(e)
            }
        }
    
    override suspend fun refreshToken(): Result<TrackingToken> {
        // AniList tokens don't expire, so just return the existing token
        val token = tokenStorage.getToken(service)
            ?: return Result.failure(Exception("Not authenticated"))
        return Result.success(token)
    }
    
    override suspend fun logout() {
        tokenStorage.clearToken(service)
    }
    
    override suspend fun search(query: String): Result<List<TrackSearchResult>> = 
        withContext(Dispatchers.IO) {
            try {
                val token = tokenStorage.getToken(service)
                
                val graphqlQuery = """
                    query (${'$'}search: String) {
                        Page(perPage: 20) {
                            media(search: ${'$'}search, type: MANGA) {
                                id
                                title { romaji english native }
                                coverImage { large }
                                description
                                chapters
                                averageScore
                                startDate { year month day }
                                status
                            }
                        }
                    }
                """.trimIndent()
                
                val variables = JSONObject().put("search", query)
                val response = executeGraphQL(graphqlQuery, token?.accessToken, variables)
                
                val mediaList = response.getJSONObject("data")
                    .getJSONObject("Page")
                    .getJSONArray("media")
                
                val results = (0 until mediaList.length()).map { i ->
                    val media = mediaList.getJSONObject(i)
                    val titles = media.getJSONObject("title")
                    
                    TrackSearchResult(
                        remoteId = media.getInt("id").toString(),
                        title = titles.optString("english").takeIf { it.isNotBlank() }
                            ?: titles.optString("romaji").takeIf { it.isNotBlank() }
                            ?: titles.optString("native", "Unknown"),
                        coverUrl = media.optJSONObject("coverImage")?.optString("large"),
                        summary = media.optString("description")?.take(500),
                        totalChapters = media.optInt("chapters", 0),
                        score = media.optInt("averageScore", 0) / 10f,
                        startDate = formatDate(media.optJSONObject("startDate")),
                        status = media.optString("status"),
                        service = service
                    )
                }
                
                Result.success(results)
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
                
                val statusFilter = status?.let { "status: ${it.toAniListStatus()}" } ?: ""
                
                val query = """
                    query {
                        Viewer {
                            id
                        }
                    }
                """.trimIndent()
                
                val userResponse = executeGraphQL(query, token.accessToken)
                val userId = userResponse.getJSONObject("data")
                    .getJSONObject("Viewer")
                    .getInt("id")
                
                val listQuery = """
                    query (${'$'}userId: Int) {
                        MediaListCollection(userId: ${'$'}userId, type: MANGA) {
                            lists {
                                status
                                entries {
                                    id
                                    mediaId
                                    status
                                    score
                                    progress
                                    startedAt { year month day }
                                    completedAt { year month day }
                                    notes
                                    private
                                    updatedAt
                                    media {
                                        id
                                        title { romaji english }
                                        coverImage { large }
                                        chapters
                                    }
                                }
                            }
                        }
                    }
                """.trimIndent()
                
                val variables = JSONObject().put("userId", userId)
                val listResponse = executeGraphQL(listQuery, token.accessToken, variables)
                
                val lists = listResponse.getJSONObject("data")
                    .getJSONObject("MediaListCollection")
                    .getJSONArray("lists")
                
                val allItems = mutableListOf<TrackedManga>()
                
                for (i in 0 until lists.length()) {
                    val list = lists.getJSONObject(i)
                    val listStatus = list.optString("status")
                    
                    // Filter by status if specified
                    if (status != null && listStatus != status.toAniListStatus()) continue
                    
                    val entries = list.getJSONArray("entries")
                    for (j in 0 until entries.length()) {
                        val entry = entries.getJSONObject(j)
                        val media = entry.getJSONObject("media")
                        val titles = media.getJSONObject("title")
                        
                        allItems.add(TrackedManga(
                            id = entry.getLong("id"),
                            remoteId = entry.getInt("mediaId").toString(),
                            service = service,
                            mangaId = 0, // Will be matched locally
                            title = titles.optString("english").takeIf { it.isNotBlank() }
                                ?: titles.optString("romaji", "Unknown"),
                            coverUrl = media.optJSONObject("coverImage")?.optString("large"),
                            status = TrackingStatus.fromAniListStatus(entry.optString("status")),
                            score = entry.optDouble("score", 0.0).toFloat(),
                            chaptersRead = entry.optInt("progress", 0),
                            totalChapters = media.optInt("chapters", 0),
                            startDate = dateToTimestamp(entry.optJSONObject("startedAt")),
                            finishDate = dateToTimestamp(entry.optJSONObject("completedAt")),
                            notes = entry.optString("notes"),
                            isPrivate = entry.optBoolean("private", false),
                            lastUpdated = entry.optLong("updatedAt", 0) * 1000
                        ))
                    }
                }
                
                Result.success(TrackingMangaList(
                    service = service,
                    items = allItems,
                    totalCount = allItems.size
                ))
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
                
                val query = """
                    query (${'$'}mediaId: Int) {
                        MediaList(mediaId: ${'$'}mediaId) {
                            id
                            mediaId
                            status
                            score
                            progress
                            startedAt { year month day }
                            completedAt { year month day }
                            notes
                            private
                            updatedAt
                            media {
                                title { romaji english }
                                coverImage { large }
                                chapters
                            }
                        }
                    }
                """.trimIndent()
                
                val variables = JSONObject().put("mediaId", remoteId.toInt())
                val response = executeGraphQL(query, token.accessToken, variables)
                
                val entry = response.getJSONObject("data").optJSONObject("MediaList")
                    ?: return@withContext Result.success(null)
                
                val media = entry.getJSONObject("media")
                val titles = media.getJSONObject("title")
                
                Result.success(TrackedManga(
                    id = entry.getLong("id"),
                    remoteId = entry.getInt("mediaId").toString(),
                    service = service,
                    mangaId = 0,
                    title = titles.optString("english").takeIf { it.isNotBlank() }
                        ?: titles.optString("romaji", "Unknown"),
                    coverUrl = media.optJSONObject("coverImage")?.optString("large"),
                    status = TrackingStatus.fromAniListStatus(entry.optString("status")),
                    score = entry.optDouble("score", 0.0).toFloat(),
                    chaptersRead = entry.optInt("progress", 0),
                    totalChapters = media.optInt("chapters", 0),
                    startDate = dateToTimestamp(entry.optJSONObject("startedAt")),
                    finishDate = dateToTimestamp(entry.optJSONObject("completedAt")),
                    notes = entry.optString("notes"),
                    isPrivate = entry.optBoolean("private", false),
                    lastUpdated = entry.optLong("updatedAt", 0) * 1000
                ))
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
                
                val mutation = """
                    mutation (${'$'}mediaId: Int, ${'$'}status: MediaListStatus, ${'$'}score: Float, 
                              ${'$'}progress: Int, ${'$'}notes: String, ${'$'}private: Boolean) {
                        SaveMediaListEntry(
                            mediaId: ${'$'}mediaId
                            status: ${'$'}status
                            score: ${'$'}score
                            progress: ${'$'}progress
                            notes: ${'$'}notes
                            private: ${'$'}private
                        ) {
                            id
                            mediaId
                            status
                            score
                            progress
                            notes
                            private
                            updatedAt
                            media {
                                title { romaji english }
                                coverImage { large }
                                chapters
                            }
                        }
                    }
                """.trimIndent()
                
                val variables = JSONObject().apply {
                    put("mediaId", entry.remoteId.toInt())
                    put("status", entry.status.toAniListStatus())
                    if (entry.score > 0) put("score", entry.score * 10) // AniList uses 0-100
                    if (entry.chaptersRead > 0) put("progress", entry.chaptersRead)
                    entry.notes?.let { put("notes", it) }
                    put("private", entry.isPrivate)
                }
                
                val response = executeGraphQL(mutation, token.accessToken, variables)
                val saved = response.getJSONObject("data").getJSONObject("SaveMediaListEntry")
                
                val media = saved.getJSONObject("media")
                val titles = media.getJSONObject("title")
                
                Result.success(TrackedManga(
                    id = saved.getLong("id"),
                    remoteId = saved.getInt("mediaId").toString(),
                    service = service,
                    mangaId = 0,
                    title = titles.optString("english").takeIf { it.isNotBlank() }
                        ?: titles.optString("romaji", "Unknown"),
                    coverUrl = media.optJSONObject("coverImage")?.optString("large"),
                    status = TrackingStatus.fromAniListStatus(saved.optString("status")),
                    score = saved.optDouble("score", 0.0).toFloat() / 10f,
                    chaptersRead = saved.optInt("progress", 0),
                    totalChapters = media.optInt("chapters", 0),
                    notes = saved.optString("notes"),
                    isPrivate = saved.optBoolean("private", false),
                    lastUpdated = saved.optLong("updatedAt", 0) * 1000
                ))
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
                
                // First get the entry ID
                val tracked = getTrackedManga(remoteId).getOrNull()
                    ?: return@withContext Result.success(Unit) // Already removed
                
                val mutation = """
                    mutation (${'$'}id: Int) {
                        DeleteMediaListEntry(id: ${'$'}id) {
                            deleted
                        }
                    }
                """.trimIndent()
                
                val variables = JSONObject().put("id", tracked.id)
                executeGraphQL(mutation, token.accessToken, variables)
                
                Result.success(Unit)
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
            chaptersRead = chaptersRead,
            notes = current?.notes,
            isPrivate = current?.isPrivate ?: false
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
            chaptersRead = current?.chaptersRead ?: 0,
            notes = current?.notes,
            isPrivate = current?.isPrivate ?: false
        ))
    }
    
    override fun getAuthorizationUrl(clientId: String, redirectUri: String): String {
        return "${service.getAuthUrl()}?client_id=$clientId&redirect_uri=$redirectUri&response_type=code"
    }
    
    // Helper methods
    
    private fun executeGraphQL(
        query: String, 
        token: String?, 
        variables: JSONObject = JSONObject()
    ): JSONObject {
        val body = JSONObject().apply {
            put("query", query)
            put("variables", variables)
        }
        
        val requestBuilder = Request.Builder()
            .url(API_URL)
            .post(body.toString().toRequestBody("application/json".toMediaType()))
            .header("Content-Type", "application/json")
            .header("Accept", "application/json")
        
        token?.let { requestBuilder.header("Authorization", "Bearer $it") }
        
        httpClient.newCall(requestBuilder.build()).execute().use { response ->
            val responseBody = response.body?.string() ?: "{}"
            val json = JSONObject(responseBody)
            
            if (json.has("errors")) {
                val errors = json.getJSONArray("errors")
                val errorMessage = (0 until errors.length())
                    .map { errors.getJSONObject(it).optString("message") }
                    .joinToString(", ")
                throw Exception("GraphQL error: $errorMessage")
            }
            
            return json
        }
    }
    
    private fun formatDate(dateObj: JSONObject?): String? {
        if (dateObj == null) return null
        val year = dateObj.optInt("year", 0)
        val month = dateObj.optInt("month", 0)
        val day = dateObj.optInt("day", 0)
        return if (year > 0) "$year-${month.toString().padStart(2, '0')}-${day.toString().padStart(2, '0')}" else null
    }
    
    private fun dateToTimestamp(dateObj: JSONObject?): Long? {
        if (dateObj == null) return null
        val year = dateObj.optInt("year", 0)
        val month = dateObj.optInt("month", 1)
        val day = dateObj.optInt("day", 1)
        return if (year > 0) {
            java.util.Calendar.getInstance().apply {
                set(year, month - 1, day, 0, 0, 0)
            }.timeInMillis
        } else null
    }
}
