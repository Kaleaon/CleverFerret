package com.universalmedialibrary.services.podcast

import android.util.Log
import javax.inject.Inject
import javax.inject.Singleton

interface PodcastDownloadTelemetry {
    fun recordMissingFileMismatch(episodeId: Long, storedPath: String?)
    fun recordChecksumMismatch(episodeId: Long, storedChecksum: String, calculatedChecksum: String)
}

@Singleton
class LogcatPodcastDownloadTelemetry @Inject constructor() : PodcastDownloadTelemetry {
    override fun recordMissingFileMismatch(episodeId: Long, storedPath: String?) {
        Log.w(TAG, "download_reconciliation_missing_file episodeId=$episodeId path=$storedPath")
    }

    override fun recordChecksumMismatch(episodeId: Long, storedChecksum: String, calculatedChecksum: String) {
        Log.w(
            TAG,
            "download_reconciliation_checksum_mismatch episodeId=$episodeId expected=$storedChecksum actual=$calculatedChecksum"
        )
    }

    private companion object {
        const val TAG = "PodcastDownloadTelemetry"
    }
}
