package com.universalmedialibrary.services.pipeline

/**
 * Status of pipeline execution for a media item
 */
enum class PipelineStatus {
    PENDING,
    PROCESSING,
    COMPLETED,
    FAILED,
    STAGED
}
