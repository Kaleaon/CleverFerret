package com.universalmedialibrary.services.importer

import kotlinx.serialization.Serializable

@Serializable
data class ImportTransactionLog(
    val version: Int = 1,
    val importId: String,
    val startedAt: Long,
    val finishedAt: Long? = null,
    val inputTreeUri: String? = null,
    val outputTreeUri: String? = null,
    val moveFiles: Boolean,
    val conflictStrategy: String,
    val preventDuplicates: Boolean,
    val duplicateStrategy: String,
    val operations: List<ImportOperationLog> = emptyList(),
    val errors: List<String> = emptyList()
)

@Serializable
data class ImportOperationLog(
    val index: Int,
    val sourceUri: String,
    val sourceDisplayName: String,
    val sourceParentUri: String? = null,
    val destinationUri: String? = null,
    val destinationDisplayName: String? = null,
    val mediaType: String,
    val insertedItemId: Long? = null,
    val status: ImportOperationStatus,
    val message: String? = null
)

@Serializable
enum class ImportOperationStatus {
    COPIED,
    MOVED,
    SKIPPED,
    QUARANTINED,
    FAILED
}

@Serializable
data class ImportLogInfo(
    val fileName: String,
    val importId: String,
    val startedAt: Long,
    val finishedAt: Long? = null,
    val moveFiles: Boolean,
    val operationCount: Int,
    val failedCount: Int
)

@Serializable
data class UndoSummary(
    val restoredFiles: Int = 0,
    val restoredFailures: Int = 0,
    val deletedDbItems: Int = 0,
    val deletedDbFailures: Int = 0
)

