package com.universalmedialibrary.services.sync

import android.util.Log
import okhttp3.Interceptor
import okhttp3.Request
import okhttp3.Response
import java.io.IOException

/**
 * OkHttp Interceptor for Plex, Jellyfin, and Emby API clients.
 * Listens for HTTP 401 Unauthorized responses and uses saved server credentials
 * from ServerCredentialManager to transparently re-authenticate and retry
 * failed requests up to MAX_RETRIES (3) times.
 */
class RemoteTokenRefreshInterceptor(
    private val serverType: String,
    private val serverId: Long,
    private val credentialManager: ServerCredentialManager,
    private val tokenAuthenticator: (credentials: ServerCredentialManager.ServerCredentials) -> String?
) : Interceptor {

    companion object {
        private const val TAG = "RemoteTokenRefresh"
        const val MAX_RETRIES = 3
    }

    @Throws(IOException::class)
    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        var response = chain.proceed(request)

        if (response.code == 401) {
            val credentials = credentialManager.getCredentials(serverType, serverId)
            if (credentials == null) {
                Log.w(TAG, "No saved credentials found for $serverType server $serverId on 401 response")
                return response
            }

            var attempt = 0
            while (response.code == 401 && attempt < MAX_RETRIES) {
                attempt++
                Log.i(TAG, "Received 401 for $serverType (serverId=$serverId). Attempting token refresh (attempt $attempt/$MAX_RETRIES)...")

                val newToken = try {
                    synchronized(this) {
                        tokenAuthenticator(credentials)
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Token re-authentication exception on attempt $attempt", e)
                    null
                }

                if (newToken.isNullOrBlank()) {
                    Log.w(TAG, "Token refresh failed on attempt $attempt")
                    continue
                }

                // Update saved token
                credentialManager.updateToken(serverType, serverId, newToken)

                // Build new request with updated token
                val newRequestBuilder = request.newBuilder()
                when (serverType.uppercase()) {
                    "PLEX" -> {
                        newRequestBuilder.header("X-Plex-Token", newToken)
                        // If query parameter X-Plex-Token is present in original URL, update URL
                        val url = request.url
                        if (url.queryParameter("X-Plex-Token") != null) {
                            val newUrl = url.newBuilder()
                                .setQueryParameter("X-Plex-Token", newToken)
                                .build()
                            newRequestBuilder.url(newUrl)
                        }
                    }
                    "JELLYFIN", "EMBY" -> {
                        newRequestBuilder.header("X-Emby-Token", newToken)
                        val url = request.url
                        if (url.queryParameter("api_key") != null) {
                            val newUrl = url.newBuilder()
                                .setQueryParameter("api_key", newToken)
                                .build()
                            newRequestBuilder.url(newUrl)
                        }
                    }
                }

                response.close()
                val retriedRequest = newRequestBuilder.build()
                response = chain.proceed(retriedRequest)

                if (response.isSuccessful) {
                    Log.i(TAG, "Request successfully retried with fresh token on attempt $attempt")
                    break
                }
            }
        }

        return response
    }
}
