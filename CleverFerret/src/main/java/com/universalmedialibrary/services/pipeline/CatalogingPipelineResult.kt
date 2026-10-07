package com.universalmedialibrary.services.pipeline

/**
 * Encapsulates the final outcome of running an item through CatalogingPipelineEngine
 */
data class CatalogingPipelineResult(
    val context: CatalogingPipelineContext,
    val isSuccess: Boolean,
    val isStaged: Boolean,
    val message: String
)
