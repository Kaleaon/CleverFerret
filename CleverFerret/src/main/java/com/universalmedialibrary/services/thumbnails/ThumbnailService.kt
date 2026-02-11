package com.universalmedialibrary.services.thumbnails

import android.util.Log
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
    suspend fun extractCoverFromEpub(uri: Uri, sizePx: Int = 600): File? = withContext(Dispatchers.IO) {
        // Minimal EPUB cover extraction by scanning for cover images in the zip
        try {
            context.contentResolver.openInputStream(uri)?.use { input ->
                java.util.zip.ZipInputStream(input).use { zis ->
                    var entry: java.util.zip.ZipEntry?
                    while (zis.nextEntry.also { entry = it } != null) {
                        val name = entry!!.name.lowercase()
                        if (name.contains("cover") && name.matches(Regex(".*\\.(jpg|jpeg|png)$"))) {
                            val outDir = File(context.cacheDir, "thumbnails").apply { mkdirs() }
                            val ext = name.substringAfterLast('.', "jpg")
                            val outFile = File(outDir, "epub_${uri.hashCode()}_${sizePx}.$ext")
                            FileOutputStream(outFile).use { out -> zis.copyTo(out) }
                            return@withContext outFile
                        }
                    }
                }
            }
            null
        } catch (e: Exception) { Log.w("ThumbnailService", "Error extracting cover from EPUB", e); null }
    }

    suspend fun extractCoverFromCbz(uri: Uri, sizePx: Int = 600): File? = withContext(Dispatchers.IO) {
        try {
            context.contentResolver.openInputStream(uri)?.use { input ->
                java.util.zip.ZipInputStream(input).use { zis ->
                    var entry: java.util.zip.ZipEntry?
                    var best: Pair<java.util.zip.ZipEntry, File>? = null
                    while (zis.nextEntry.also { entry = it } != null) {
                        val name = entry!!.name
                        if (name.lowercase().matches(Regex(".*\\.(jpg|jpeg|png)$"))) {
                            val outDir = File(context.cacheDir, "thumbnails").apply { mkdirs() }
                            val ext = name.substringAfterLast('.', "jpg").lowercase()
                            val outFile = File(outDir, "cbz_${uri.hashCode()}_${name.hashCode()}_${sizePx}.$ext")
                            FileOutputStream(outFile).use { out -> zis.copyTo(out) }
                            if (best == null || name < best!!.first.name) best = entry!! to outFile
                        }
                    }
                    best?.second
                }
            }
        } catch (e: Exception) { Log.w("ThumbnailService", "Error extracting cover from CBZ", e); null }
    }
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
