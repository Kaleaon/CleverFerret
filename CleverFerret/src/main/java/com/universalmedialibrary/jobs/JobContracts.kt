package com.universalmedialibrary.jobs

import androidx.work.Constraints

/**
 * Canonical contract layer for app-managed background jobs.
 */
enum class JobContractType {
    ONE_OFF_IMPORT,
    PERIODIC_METADATA_REFRESH,
    FEED_CATALOG_SYNC,
    WEB_FICTION_UPDATE_SCAN,
    THUMBNAIL_PREVIEW_GENERATION
}

enum class JobTrigger {
    ONE_OFF,
    PERIODIC
}

data class JobContract(
    val type: JobContractType,
    val uniqueName: String,
    val trigger: JobTrigger,
    val constraints: Constraints? = null,
    val intervalHours: Long? = null,
    val tags: Set<String> = emptySet()
)
