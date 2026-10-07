package com.universalmedialibrary.services.pipeline

import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Interface for the multi-stage Cataloging Pipeline Engine.
 */
interface CatalogingPipelineEngine {
    /**
     * Executes the 4-stage pipeline for a given media file.
     */
    suspend fun execute(
        file: File,
        mediaType: String,
        libraryId: Long,
        existingMediaItem: MediaItem? = null
    ): CatalogingPipelineResult

    /**
     * Executes the 4-stage pipeline starting with an existing pipeline context.
     */
    suspend fun processContext(context: CatalogingPipelineContext): CatalogingPipelineResult
}

/**
 * Primary implementation of [CatalogingPipelineEngine] executing four sequential processing phases:
 * 1. Raw Extraction
 * 2. Schema Normalization
 * 3. Remote Provider Enrichment
 * 4. Staging / Persistence
 */
@Singleton
class CatalogingPipelineEngineImpl @Inject constructor(
    private val processors: List<@JvmSuppressWildcards MetadataPipelineProcessor>
) : CatalogingPipelineEngine {

    override suspend fun execute(
        file: File,
        mediaType: String,
        libraryId: Long,
        existingMediaItem: MediaItem?
    ): CatalogingPipelineResult {
        val initialContext = CatalogingPipelineContext(
            file = file,
            mediaType = mediaType,
            libraryId = libraryId,
            mediaItem = existingMediaItem,
            status = PipelineStatus.PENDING
        )
        return processContext(initialContext)
    }

    override suspend fun processContext(context: CatalogingPipelineContext): CatalogingPipelineResult =
        withContext(Dispatchers.IO) {
            var currentContext = context.copy(status = PipelineStatus.PROCESSING)

            // Sort processors by PipelineStage ordinal to guarantee sequential execution order
            val sortedProcessors = processors.sortedBy { it.stage.ordinal }

            try {
                for (processor in sortedProcessors) {
                    currentContext = processor.process(currentContext)
                    if (currentContext.status == PipelineStatus.FAILED) {
                        break
                    }
                }

                val finalStatus = currentContext.status
                val isSuccess = finalStatus == PipelineStatus.COMPLETED || finalStatus == PipelineStatus.STAGED
                val isStaged = currentContext.isStaged

                val message = when {
                    isStaged -> "Media item staged for candidate review with confidence score ${currentContext.confidenceScore}"
                    isSuccess -> "Cataloging pipeline completed successfully for ${currentContext.file.name}"
                    else -> "Cataloging pipeline failed: ${currentContext.errors.joinToString("; ")}"
                }

                CatalogingPipelineResult(
                    context = currentContext,
                    isSuccess = isSuccess,
                    isStaged = isStaged,
                    message = message
                )
            } catch (e: Exception) {
                val failedContext = currentContext.copy(
                    status = PipelineStatus.FAILED,
                    errors = currentContext.errors + (e.message ?: "Pipeline execution failed unexpectedly")
                )
                CatalogingPipelineResult(
                    context = failedContext,
                    isSuccess = false,
                    isStaged = false,
                    message = "Pipeline error: ${e.message}"
                )
            }
        }
}
