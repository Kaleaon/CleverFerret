package com.universalmedialibrary.services.pipeline

/**
 * Sequential processing phases of the cataloging pipeline
 */
enum class PipelineStage {
    RAW_EXTRACTION,
    SCHEMA_NORMALIZATION,
    REMOTE_ENRICHMENT,
    STAGING_PERSISTENCE
}
