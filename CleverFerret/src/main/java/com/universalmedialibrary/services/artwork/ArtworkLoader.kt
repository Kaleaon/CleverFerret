package com.universalmedialibrary.services.artwork

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import androidx.core.graphics.drawable.toBitmap
import coil.ImageLoader
import coil.request.ImageRequest
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified Artwork Loading Service
 * 
 * Provides cached and scaled artwork for both Plex and local media items.
 * Optimized for notification, widget, and UI display with different size requirements.
 */
@Singleton
class ArtworkLoader @Inject constructor(
    @ApplicationContext private val context: Context
) {
    
    private val imageLoader = ImageLoader.Builder(context)
        .crossfade(true)
        .build()
    
    /**
     * Load artwork as bitmap with specified dimensions for widgets/notifications
     */
    suspend fun loadArtworkBitmap(
        artworkUrl: String?,
        targetWidth: Int,
        targetHeight: Int,
        cornerRadius: Float = 0f
    ): Bitmap? = withContext(Dispatchers.IO) {
        if (artworkUrl.isNullOrBlank()) {
            return@withContext createDefaultArtwork(targetWidth, targetHeight, cornerRadius)
        }
        
        try {
            val request = ImageRequest.Builder(context)
                .data(artworkUrl)
                .size(targetWidth, targetHeight)
                .build()
            
            val drawable = imageLoader.execute(request).drawable
            val bitmap = drawable?.toBitmap(targetWidth, targetHeight, Bitmap.Config.ARGB_8888)
            
            if (cornerRadius > 0f && bitmap != null) {
                return@withContext applyCornerRadius(bitmap, cornerRadius)
            }
            
            bitmap ?: createDefaultArtwork(targetWidth, targetHeight, cornerRadius)
        } catch (e: Exception) {
            createDefaultArtwork(targetWidth, targetHeight, cornerRadius)
        }
    }
    
    /**
     * Create default artwork when none is available
     */
    private fun createDefaultArtwork(
        width: Int, 
        height: Int, 
        cornerRadius: Float = 0f
    ): Bitmap {
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        
        val paint = Paint().apply {
            color = 0xFF424242.toInt() // Material dark gray
            isAntiAlias = true
        }
        
        if (cornerRadius > 0f) {
            canvas.drawRoundRect(
                0f, 0f, width.toFloat(), height.toFloat(), 
                cornerRadius, cornerRadius, paint
            )
        } else {
            canvas.drawRect(0f, 0f, width.toFloat(), height.toFloat(), paint)
        }
        
        // Draw music note icon in center
        val iconPaint = Paint().apply {
            color = 0xFF9E9E9E.toInt() // Lighter gray
            isAntiAlias = true
            textAlign = Paint.Align.CENTER
            textSize = minOf(width, height) * 0.3f
        }
        
        canvas.drawText(
            "♪", 
            width / 2f, 
            height / 2f + iconPaint.textSize / 3f, 
            iconPaint
        )
        
        return bitmap
    }
    
    /**
     * Apply corner radius to bitmap
     */
    private fun applyCornerRadius(bitmap: Bitmap, cornerRadius: Float): Bitmap {
        val output = Bitmap.createBitmap(bitmap.width, bitmap.height, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(output)
        
        val paint = Paint().apply {
            isAntiAlias = true
        }
        
        val rect = RectF(0f, 0f, bitmap.width.toFloat(), bitmap.height.toFloat())
        canvas.drawRoundRect(rect, cornerRadius, cornerRadius, paint)
        
        paint.xfermode = android.graphics.PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_IN)
        canvas.drawBitmap(bitmap, 0f, 0f, paint)
        
        return output
    }
    
    /**
     * Get image URI for Compose AsyncImage components
     */
    fun getArtworkUri(artworkUrl: String?): String {
        return artworkUrl ?: ""
    }
    
    /**
     * Common artwork sizes for different use cases
     */
    object ArtworkSize {
        const val NOTIFICATION_WIDTH = 64
        const val NOTIFICATION_HEIGHT = 64
        const val WIDGET_SMALL_WIDTH = 120
        const val WIDGET_SMALL_HEIGHT = 120
        const val WIDGET_LARGE_WIDTH = 250
        const val WIDGET_LARGE_HEIGHT = 250
        const val PLAYER_THUMB_WIDTH = 200
        const val PLAYER_THUMB_HEIGHT = 200
    }
}