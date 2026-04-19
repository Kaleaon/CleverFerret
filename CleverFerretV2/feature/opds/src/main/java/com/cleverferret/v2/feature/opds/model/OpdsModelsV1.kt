package com.cleverferret.v2.feature.opds.model

data class OpdsLinkV1(
    val href: String,
    val rel: List<String>,
    val type: String?,
    val title: String? = null,
)

data class OpdsEntryV1(
    val id: String,
    val title: String,
    val authors: List<String>,
    val summary: String?,
    val acquisitionLinks: List<OpdsLinkV1>,
)

data class OpdsFeedV1(
    val catalogId: String,
    val title: String,
    val entries: List<OpdsEntryV1>,
)

enum class DownloadLifecycleStatusV1 {
    QUEUED,
    DOWNLOADING,
    VERIFYING,
    IMPORTED,
    FAILED,
}

data class DownloadLifecycleRecordV1(
    val downloadId: String,
    val status: DownloadLifecycleStatusV1,
    val sourceUrl: String,
    val localFileUri: String?,
    val failureReason: String?,
)

data class OpdsFlowResultV1(
    val catalogTitle: String,
    val importedLibraryItemId: String,
    val lifecycle: DownloadLifecycleRecordV1,
)
