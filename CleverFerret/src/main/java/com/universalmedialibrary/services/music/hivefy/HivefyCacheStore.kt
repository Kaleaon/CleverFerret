package com.universalmedialibrary.services.music.hivefy

import android.content.Context
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Simple SharedPreferences-backed cache with TTL handling so we can avoid hammering the Saavn
 * mirror for discovery data during a single day.
 */
@Singleton
class HivefyCacheStore @Inject constructor(
    @ApplicationContext context: Context,
    private val ioDispatcher: CoroutineDispatcher
) {

    private val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    suspend fun read(key: String): CachedEntry? = withContext(ioDispatcher) {
        val timestamp = prefs.getLong(key.timestampKey(), -1L)
        val payload = prefs.getString(key, null) ?: return@withContext null
        CachedEntry(payload, timestamp)
    }

    suspend fun write(key: String, payload: String) = withContext(ioDispatcher) {
        prefs.edit()
            .putString(key, payload)
            .putLong(key.timestampKey(), System.currentTimeMillis())
            .apply()
    }

    suspend fun clear(key: String) = withContext(ioDispatcher) {
        prefs.edit()
            .remove(key)
            .remove(key.timestampKey())
            .apply()
    }

    data class CachedEntry(
        val payload: String,
        val timestamp: Long
    )

    private fun String.timestampKey(): String = "${this}_ts"

    private companion object {
        private const val PREFS_NAME = "hivefy_cache"
    }
}
