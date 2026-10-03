package com.cleverferret.v2.feature.opds.services.opds

interface OpdsHttpClient {
    data class HttpResponse(val code: Int, val body: String)

    fun get(url: String): HttpResponse
    fun download(url: String): ByteArray
}

interface DownloadLifecycleStore {
    fun createQueued(sourceUrl: String): String
    fun markDownloading(downloadId: String)
    fun markVerifying(downloadId: String)
    fun markImportedAtomically(downloadId: String, localFileUri: String)
    fun markFailed(downloadId: String, reason: String)
    fun get(downloadId: String): com.cleverferret.v2.feature.opds.model.DownloadLifecycleRecordV1?
}

fun interface LibraryImportGateway {
    fun importFile(localFileUri: String, title: String, authors: List<String>): String
}
