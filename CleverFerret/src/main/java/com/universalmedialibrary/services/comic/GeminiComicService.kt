package com.universalmedialibrary.services.comic

import android.content.Context
import android.graphics.Bitmap
import android.util.Log
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Gemini Comic Service - Placeholder for v1.0.0
 * Full implementation in v1.1.0
 */
@Singleton
class GeminiComicService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val TAG = "GeminiComicService"
    
    suspend fun detectPanels(bitmap: Bitmap, pageNumber: Int): Any? {
        Log.d(TAG, "Panel detection coming in v1.1.0")
        return null
    }
}
