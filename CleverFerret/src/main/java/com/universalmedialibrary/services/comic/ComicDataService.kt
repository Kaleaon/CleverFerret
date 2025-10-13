package com.universalmedialibrary.services.comic

import android.content.Context
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Comic Data Service - Placeholder for v1.0.0
 * Full implementation in v1.1.0
 */
@Singleton
class ComicDataService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "ComicDataService"
    
    suspend fun saveDetectedPanels(comicId: Long, result: Any): Long {
        Log.d(TAG, "Panel saving coming in v1.1.0")
        return 0L
    }
}
