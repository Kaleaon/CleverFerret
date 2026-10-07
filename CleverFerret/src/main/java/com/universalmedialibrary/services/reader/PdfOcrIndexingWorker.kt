package com.universalmedialibrary.services.reader

import android.content.Context
import android.graphics.pdf.PdfRenderer
import android.os.ParcelFileDescriptor
import android.util.Log
import androidx.work.Constraints
import androidx.work.CoroutineWorker
import androidx.work.Data
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.WorkerParameters
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.entity.PdfOcrCacheEntity
import java.io.File

/**
 * Background WorkManager job that extracts and caches OCR page text for scanned PDFs
 * during idle charging time.
 */
class PdfOcrIndexingWorker(
    appContext: Context,
    params: WorkerParameters
) : CoroutineWorker(appContext, params) {

    override suspend fun doWork(): Result {
        val filePath = inputData.getString(KEY_FILE_PATH)
        val filePaths = inputData.getStringArray(KEY_FILE_PATHS)?.toList()
            ?: listOfNotNull(filePath)

        if (filePaths.isEmpty()) {
            Log.w(TAG, "No file paths provided for OCR background indexing worker")
            return Result.success()
        }

        val db = AppDatabase.getDatabase(applicationContext)
        val cacheDao = db.pdfOcrCacheDao()
        val pdfSearchEngine = PDFSearchEngine(applicationContext, cacheDao)

        for (path in filePaths) {
            try {
                val file = File(path)
                if (!file.exists() || !file.isFile) continue

                val fileHash = PdfFileHasher.computeHash(file)
                if (fileHash.isBlank()) continue

                // Check if file is already indexed
                val existing = cacheDao.getPagesForFile(fileHash)
                if (existing.isNotEmpty()) {
                    Log.d(TAG, "File $path ($fileHash) already indexed with ${existing.size} pages")
                    continue
                }

                Log.d(TAG, "Indexing scanned PDF in background: ${file.name}")
                val pageCount = getPdfPageCount(file)
                if (pageCount <= 0) continue

                val extractedTexts = pdfSearchEngine.extractAllPagesWithParallelOCR(file, pageCount)

                val now = System.currentTimeMillis()
                val entities = extractedTexts.mapIndexed { pageIdx, text ->
                    PdfOcrCacheEntity(
                        fileHash = fileHash,
                        pageIndex = pageIdx,
                        text = text,
                        timestamp = now,
                        fileSize = file.length(),
                        lastModified = file.lastModified()
                    )
                }
                cacheDao.insertAll(entities)
                Log.d(TAG, "Successfully cached OCR for $pageCount pages in ${file.name}")

            } catch (e: Exception) {
                Log.e(TAG, "Error during background OCR indexing for $path", e)
            }
        }

        return Result.success()
    }

    private fun getPdfPageCount(file: File): Int {
        return try {
            ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY).use { pfd ->
                PdfRenderer(pfd).use { renderer ->
                    renderer.pageCount
                }
            }
        } catch (e: Exception) {
            Log.e(TAG, "Failed to get PDF page count for ${file.path}", e)
            0
        }
    }

    companion object {
        private const val TAG = "PdfOcrIndexingWorker"
        const val KEY_FILE_PATH = "key_file_path"
        const val KEY_FILE_PATHS = "key_file_paths"
        const val WORK_NAME = "pdf_ocr_background_indexing"

        /**
         * Schedules a background indexing job requiring idle and charging constraints.
         */
        fun scheduleWorker(context: Context, filePath: String) {
            scheduleWorker(context, listOf(filePath))
        }

        /**
         * Schedules a background indexing job for multiple PDF paths requiring idle and charging constraints.
         */
        fun scheduleWorker(context: Context, filePaths: List<String>) {
            if (filePaths.isEmpty()) return

            val constraints = Constraints.Builder()
                .setRequiresCharging(true)
                .setRequiresDeviceIdle(true)
                .build()

            val inputData = Data.Builder()
                .putStringArray(KEY_FILE_PATHS, filePaths.toTypedArray())
                .build()

            val workRequest = OneTimeWorkRequestBuilder<PdfOcrIndexingWorker>()
                .setConstraints(constraints)
                .setInputData(inputData)
                .build()

            WorkManager.getInstance(context).enqueueUniqueWork(
                "${WORK_NAME}_${filePaths.hashCode()}",
                ExistingWorkPolicy.REPLACE,
                workRequest
            )
        }
    }
}
