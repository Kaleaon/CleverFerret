package com.universalmedialibrary.services.audiobook.free

import android.app.DownloadManager
import android.content.Context
import android.net.Uri
import android.os.Environment
import dagger.hilt.android.qualifiers.ApplicationContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Simple wrapper around Android's DownloadManager for fetching free audiobooks.
 * For now we store downloads in the app-specific Music directory and leave
 * integration/import duties to a follow-up workflow.
 */
@Singleton
class FreeAudiobookDownloadService @Inject constructor(
    @ApplicationContext private val context: Context
) {

    private val downloadManager = context.getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager

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

        return downloadManager.enqueue(request)
    }

    private fun sanitize(input: String): String {
        return input.replace(Regex("[^a-zA-Z0-9._-]+"), "_").trim('_')
    }
}
