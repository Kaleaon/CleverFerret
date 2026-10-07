package com.universalmedialibrary.services.pipeline.processors

import com.universalmedialibrary.services.media.MetadataExtractionService
import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.PipelineStage
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Stage 1 Processor: Raw Extraction
 *
 * Extracts raw file metadata attributes and tags using [MetadataExtractionService] and
 * parser infrastructure.
 */
@Singleton
class RawExtractionProcessor @Inject constructor(
    private val metadataExtractionService: MetadataExtractionService
) : MetadataPipelineProcessor {

    override val stage: PipelineStage = PipelineStage.RAW_EXTRACTION
    override val name: String = "RawExtractionProcessor"

    override suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext {
        val file = context.file
        val mediaType = context.mediaType

        val rawMetadata = metadataExtractionService.extractRawMetadata(file, mediaType)

        return context.copy(
            rawMetadata = rawMetadata,
            confidenceScore = rawMetadata.confidenceScore,
            metadataSource = rawMetadata.source
        )
    }
}
