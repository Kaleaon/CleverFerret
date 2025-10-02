package com.universalmedialibrary.services.thumbnails

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.net.Uri
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import java.io.FileOutputStream
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class ThumbnailService @Inject constructor(
    @ApplicationContext private val context: Context
) {
    suspend fun generatePlaceholder(title: String, sizePx: Int = 600): File = withContext(Dispatchers.IO) {
        val bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        canvas.drawColor(Color.DKGRAY)
        val paint = Paint().apply {
            color = Color.WHITE
            textAlign = Paint.Align.CENTER
            textSize = sizePx / 10f
            isAntiAlias = true
        }
        canvas.drawText(title.take(20), sizePx / 2f, sizePx / 2f, paint)

        val outDir = File(context.cacheDir, "thumbnails").apply { mkdirs() }
        val outFile = File(outDir, "thumb_${title.hashCode()}_${sizePx}.jpg")
        FileOutputStream(outFile).use { fos ->
            bitmap.compress(Bitmap.CompressFormat.JPEG, 85, fos)
        }
        outFile
    }
}

