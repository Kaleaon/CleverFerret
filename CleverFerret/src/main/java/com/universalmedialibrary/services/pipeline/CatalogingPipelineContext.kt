package com.universalmedialibrary.services.pipeline

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMovie
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import java.io.File

/**
 * Mutable state transport object that travels between stages in the cataloging pipeline engine.
 */
data class CatalogingPipelineContext(
    val file: File,
    val mediaType: String,
    val libraryId: Long,
    val mediaItem: MediaItem? = null,
    val rawMetadata: RawMetadata? = null,
    val normalizedCommon: MetadataCommon? = null,
    val bookMetadata: MetadataBook? = null,
    val musicTrackMetadata: MetadataMusicTrack? = null,
    val movieMetadata: MetadataMovie? = null,
    val pluginEnrichments: Map<String, String> = emptyMap(),
    val confidenceScore: Float = 1.0f,
    val status: PipelineStatus = PipelineStatus.PENDING,
    val warnings: List<String> = emptyList(),
    val errors: List<String> = emptyList(),
    val metadataSource: String = "LOCAL_PARSER",
    val isStaged: Boolean = false,
    val stagedCandidateId: Long? = null
)
