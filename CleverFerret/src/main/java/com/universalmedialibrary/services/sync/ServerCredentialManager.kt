package com.universalmedialibrary.services.sync

import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Securely manages credentials for remote media servers (Plex, Jellyfin, Emby).
 * Stores plaintext credentials using EncryptedSharedPreferences with fallback for tests.
 */
@Singleton
class ServerCredentialManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    companion object {
        private const val TAG = "ServerCredentialManager"
        private const val PREFS_NAME = "secure_server_credentials"
    }

    private val prefs: SharedPreferences by lazy {
        try {
            val masterKey = MasterKey.Builder(context)
                .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
                .build()

            EncryptedSharedPreferences.create(
                context,
                PREFS_NAME,
                masterKey,
                EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
                EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM
            )
        } catch (e: Exception) {
            Log.w(TAG, "EncryptedSharedPreferences failed, falling back to standard shared preferences", e)
            context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        }
    }

    data class ServerCredentials(
        val serverType: String,
        val serverId: Long,
        val host: String,
        val port: Int,
        val username: String? = null,
        val password: String? = null,
        val token: String? = null
    )

    fun saveCredentials(
        serverType: String,
        serverId: Long,
        host: String,
        port: Int,
        username: String? = null,
        password: String? = null,
        token: String? = null
    ) {
        val prefix = "${serverType}_${serverId}_"
        prefs.edit()
            .putString("${prefix}host", host)
            .putInt("${prefix}port", port)
            .putString("${prefix}username", username)
            .putString("${prefix}password", password)
            .putString("${prefix}token", token)
            .apply()
    }

    fun getCredentials(serverType: String, serverId: Long): ServerCredentials? {
        val prefix = "${serverType}_${serverId}_"
        val host = prefs.getString("${prefix}host", null) ?: return null
        val port = prefs.getInt("${prefix}port", 8096)
        val username = prefs.getString("${prefix}username", null)
        val password = prefs.getString("${prefix}password", null)
        val token = prefs.getString("${prefix}token", null)

        return ServerCredentials(
            serverType = serverType,
            serverId = serverId,
            host = host,
            port = port,
            username = username,
            password = password,
            token = token
        )
    }

    fun updateToken(serverType: String, serverId: Long, newToken: String) {
        val prefix = "${serverType}_${serverId}_"
        prefs.edit().putString("${prefix}token", newToken).apply()
    }

    fun clearCredentials(serverType: String, serverId: Long) {
        val prefix = "${serverType}_${serverId}_"
        prefs.edit()
            .remove("${prefix}host")
            .remove("${prefix}port")
            .remove("${prefix}username")
            .remove("${prefix}password")
            .remove("${prefix}token")
            .apply()
    }
}
