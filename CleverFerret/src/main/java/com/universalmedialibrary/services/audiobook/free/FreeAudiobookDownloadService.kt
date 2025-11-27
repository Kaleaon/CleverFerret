package com.universalmedialibrary.services.audiobook.free

import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.Environment
import androidx.core.content.ContextCompat
import com.universalmedialibrary.services.audiobook.AudiobookService
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import com.universalmedialibrary.utils.FileNameSanitizer
import javax.inject.Inject
import javax.inject.Singleton
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.cancel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch

@Singleton
class FreeAudiobookDownloadService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val audiobookService: AudiobookService,
    private val fileNameSanitizer: FileNameSanitizer
) {

    private val downloadManager = context.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
    private val scope = CoroutineScope(SupervisorJob() + Dispatchers.IO)

    private val pendingDownloads = mutableMapOf<Long, DownloadRequest>()

    private val _events = MutableSharedFlow<DownloadEvent>(extraBufferCapacity = 8)
    val events: SharedFlow<DownloadEvent> = _events.asSharedFlow()

    private val downloadReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val downloadId = intent?.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1) ?: return
            if (downloadId != -1L) {
                handleDownloadComplete(downloadId)
            }
        }
    }

    init {
        ContextCompat.registerReceiver(
            context,
            downloadReceiver,
            IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE),
            ContextCompat.RECEIVER_NOT_EXPORTED
        )
    }

    fun enqueueDownload(
        audiobook: FreeAudiobook,
        option: AudiobookDownloadOption
    ): Long {
        val sanitizedTitle = sanitize(audiobook.title.ifBlank { "audiobook" })
        val subDir = when (audiobook.source) {
            FreeAudiobookSource.LIT2GO -> "Lit2Go"
            FreeAudiobookSource.INTERNET_ARCHIVE -> "InternetArchive"
        }

        val extension = Uri.parse(option.url).lastPathSegment?.substringAfterLast('.', "")?.ifBlank { "mp3" }
            ?: "mp3"
        val fileName = "$sanitizedTitle.$extension"

        val request = DownloadManager.Request(Uri.parse(option.url))
            .setTitle(audiobook.title)
            .setDescription("Downloading from ${audiobook.source.displayName}")
            .setAllowedOverMetered(true)
            .setAllowedOverRoaming(false)
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
            .setDestinationInExternalFilesDir(
                context,
                Environment.DIRECTORY_MUSIC,
                File(subDir, fileName).path
            )

        val downloadId = downloadManager.enqueue(request)
        pendingDownloads[downloadId] = DownloadRequest(audiobook, option)
        return downloadId
    }

    private fun handleDownloadComplete(downloadId: Long) {
        val request = pendingDownloads.remove(downloadId) ?: return

        scope.launch {
            val query = DownloadManager.Query().setFilterById(downloadId)
            val cursor = downloadManager.query(query)

            try {
                if (!cursor.moveToFirst()) {
                    _events.emit(
                        DownloadEvent.Failed(
                            audiobookId = request.audiobook.id,
                            title = request.audiobook.title,
                            message = "Download failed"
                        )
                    )
                    return@launch
                }

                val statusIndex = cursor.getColumnIndex(DownloadManager.COLUMN_STATUS)
                val status = cursor.getInt(statusIndex)
                val localUriIndex = cursor.getColumnIndex(DownloadManager.COLUMN_LOCAL_URI)
                val localUri = cursor.getString(localUriIndex)

                if (status != DownloadManager.STATUS_SUCCESSFUL) {
                    _events.emit(
                        DownloadEvent.Failed(
                            audiobookId = request.audiobook.id,
                            title = request.audiobook.title,
                            message = "Download failed"
                        )
                    )
                    return@launch
                }

                val path = localUri?.let { Uri.parse(it).path }
                if (path != null && (path.endsWith(".mp3", true) || path.endsWith(".m4b", true))) {
                    val result = audiobookService.importAudiobook(path)
                    if (result.isSuccess) {
                        _events.emit(
                            DownloadEvent.Imported(
                                audiobookId = request.audiobook.id,
                                title = request.audiobook.title
                            )
                        )
                    } else {
                        _events.emit(
                            DownloadEvent.Saved(
                                audiobookId = request.audiobook.id,
                                title = request.audiobook.title,
                                filePath = path,
                                message = "Saved to $path. Import manually."
                            )
                        )
                    }
                } else {
                    _events.emit(
                        DownloadEvent.Saved(
                            audiobookId = request.audiobook.id,
                            title = request.audiobook.title,
                            filePath = path,
                            message = "Saved to ${path ?: "download folder"}. Import manually."
                        )
                    )
                }
            } finally {
                cursor.close()
            }
        }
    }

    fun onDestroy() {
        try {
            context.unregisterReceiver(downloadReceiver)
        } catch (_: Exception) {
        }
        // Cancel coroutine scope to prevent memory leaks
        scope.cancel()
    }

    private fun sanitize(input: String): String {
        return fileNameSanitizer.sanitizeFileName(input)
    }

    private data class DownloadRequest(
        val audiobook: FreeAudiobook,
        val option: AudiobookDownloadOption
    )

    sealed class DownloadEvent {
        data class Imported(val audiobookId: String, val title: String) : DownloadEvent()
        data class Saved(val audiobookId: String, val title: String, val filePath: String?, val message: String) : DownloadEvent()
        data class Failed(val audiobookId: String, val title: String, val message: String) : DownloadEvent()
    }
}
