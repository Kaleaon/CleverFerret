package com.universalmedialibrary.services.pipeline.processors

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.PipelineStage
import com.universalmedialibrary.services.pipeline.PipelineStatus
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Stage 4 Processor: Staging / Persistence
 *
 * Evaluates composite confidence scores. High-confidence items (>= 0.85f) are persisted
 * directly to primary library tables with `isVerified = true`. Low-confidence items (< 0.85f)
 * are routed to [MetadataStagingRepository] as pending candidates for manual review.
 */
@Singleton
class StagingPersistenceProcessor @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao,
    private val metadataStagingRepository: MetadataStagingRepository
) : MetadataPipelineProcessor {

    override val stage: PipelineStage = PipelineStage.STAGING_PERSISTENCE
    override val name: String = "StagingPersistenceProcessor"

    companion object {
        const val HIGH_CONFIDENCE_THRESHOLD = 0.85f
    }

    override suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext {
        val file = context.file

        // Ensure MediaItem exists in database
        val existingMediaItem = context.mediaItem ?: mediaItemDao.getItemByPath(file.absolutePath)
        val mediaItem = existingMediaItem ?: createAndSaveMediaItem(file, context)

        return if (context.confidenceScore >= HIGH_CONFIDENCE_THRESHOLD) {
            handleHighConfidence(context, mediaItem)
        } else {
            handleLowConfidence(context, mediaItem)
        }
    }

    private suspend fun createAndSaveMediaItem(
        file: java.io.File,
        context: CatalogingPipelineContext
    ): MediaItem {
        val newItem = MediaItem(
            libraryId = context.libraryId,
            filePath = file.absolutePath,
            fileName = file.name,
            fileExtension = file.extension.lowercase(),
            fileSize = file.length(),
            dateAdded = System.currentTimeMillis(),
            lastScanned = System.currentTimeMillis(),
            lastModified = file.lastModified(),
            mediaType = context.mediaType,
            isAvailable = true,
            hasMetadata = false,
            hasThumbnail = false,
            thumbnailPath = null
        )
        val newId = mediaItemDao.insertMediaItem(newItem)
        return newItem.copy(itemId = newId)
    }

    private suspend fun handleHighConfidence(
        context: CatalogingPipelineContext,
        mediaItem: MediaItem
    ): CatalogingPipelineContext {
        val itemId = mediaItem.itemId
        val finalCommon = (context.normalizedCommon ?: MetadataCommon(
            itemId = itemId,
            title = context.file.nameWithoutExtension
        )).copy(
            itemId = itemId,
            metadataSource = context.metadataSource,
            lastUpdated = System.currentTimeMillis(),
            isVerified = true
        )

        metadataDao.insertMetadataCommon(finalCommon)
        context.bookMetadata?.let { metadataDao.insertMetadataBook(it.copy(itemId = itemId)) }
        context.musicTrackMetadata?.let { metadataDao.insertMetadataMusicTrack(it.copy(itemId = itemId)) }
        context.movieMetadata?.let { metadataDao.insertMetadataMovie(it.copy(itemId = itemId)) }

        val updatedMediaItem = mediaItem.copy(
            hasMetadata = true,
            hasThumbnail = !finalCommon.coverImagePath.isNullOrBlank(),
            thumbnailPath = finalCommon.coverImagePath ?: mediaItem.thumbnailPath
        )
        mediaItemDao.updateMediaItem(updatedMediaItem)

        return context.copy(
            mediaItem = updatedMediaItem,
            normalizedCommon = finalCommon,
            status = PipelineStatus.COMPLETED,
            isStaged = false
        )
    }

    private suspend fun handleLowConfidence(
        context: CatalogingPipelineContext,
        mediaItem: MediaItem
    ): CatalogingPipelineContext {
        val itemId = mediaItem.itemId
        val commonToStage = (context.normalizedCommon ?: MetadataCommon(
            itemId = itemId,
            title = context.file.nameWithoutExtension
        )).copy(
            itemId = itemId,
            metadataSource = context.metadataSource,
            lastUpdated = System.currentTimeMillis(),
            isVerified = false
        )

        metadataDao.insertMetadataCommon(commonToStage)
        context.bookMetadata?.let { metadataDao.insertMetadataBook(it.copy(itemId = itemId)) }
        context.musicTrackMetadata?.let { metadataDao.insertMetadataMusicTrack(it.copy(itemId = itemId)) }
        context.movieMetadata?.let { metadataDao.insertMetadataMovie(it.copy(itemId = itemId)) }

        val candidateId = metadataStagingRepository.stageMetadataCommon(
            itemId = itemId,
            metadata = commonToStage,
            source = context.metadataSource,
            confidenceScore = context.confidenceScore
        )

        return context.copy(
            mediaItem = mediaItem,
            normalizedCommon = commonToStage,
            status = PipelineStatus.STAGED,
            isStaged = true,
            stagedCandidateId = candidateId
        )
    }
}
