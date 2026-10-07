package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.dao.StagedMetadataCandidateDao
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MetadataStagingRepository @Inject constructor(
    private val stagedMetadataCandidateDao: StagedMetadataCandidateDao,
    private val metadataDao: MetadataDao,
    private val mediaItemDao: MediaItemDao,
    private val ioDispatcher: CoroutineDispatcher = Dispatchers.IO
) {

    /**
     * Observe all pending staged candidates
     */
    fun observePendingCandidates(): Flow<List<StagedMetadataCandidate>> {
        return stagedMetadataCandidateDao.observePendingCandidates()
    }

    /**
     * Get pending candidates list directly
     */
    suspend fun getPendingCandidates(): List<StagedMetadataCandidate> = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.getPendingCandidates()
    }

    /**
     * Save a generic staged metadata candidate
     */
    suspend fun stageCandidate(candidate: StagedMetadataCandidate): Long = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.insertCandidate(candidate)
    }

    /**
     * Stage structured MetadataCommon candidate
     */
    suspend fun stageMetadataCommon(
        itemId: Long,
        metadata: MetadataCommon,
        source: String = "AUTOMATED_INGESTION",
        confidenceScore: Float = 0.80f,
        tags: String? = null
    ): Long = withContext(ioDispatcher) {
        val candidate = StagedMetadataCandidate(
            itemId = itemId,
            title = metadata.title,
            sortTitle = metadata.sortTitle,
            originalTitle = metadata.originalTitle,
            year = metadata.year,
            releaseDate = metadata.releaseDate,
            rating = metadata.rating,
            summary = metadata.summary,
            plot = metadata.plot,
            tagline = metadata.tagline,
            coverImagePath = metadata.coverImagePath,
            backdropImagePath = metadata.backdropImagePath,
            language = metadata.language,
            country = metadata.country,
            tags = tags,
            confidenceScore = confidenceScore,
            source = source,
            status = "PENDING"
        )
        stagedMetadataCandidateDao.insertCandidate(candidate)
    }

    /**
     * Stage AI tag suggestions
     */
    suspend fun stageAITagSuggestions(
        itemId: Long,
        tags: List<String>,
        confidenceScore: Float = 0.85f,
        source: String = "AI:TagSuggestion"
    ): Long = withContext(ioDispatcher) {
        val candidate = StagedMetadataCandidate(
            itemId = itemId,
            tags = tags.joinToString(", "),
            confidenceScore = confidenceScore,
            source = source,
            status = "PENDING"
        )
        stagedMetadataCandidateDao.insertCandidate(candidate)
    }

    /**
     * Approve a candidate by ID: merges proposed values into MetadataCommon with isVerified = true,
     * updates media item status, and deletes the staged candidate entry.
     */
    suspend fun approveCandidate(candidateId: Long): Boolean = withContext(ioDispatcher) {
        val candidate = stagedMetadataCandidateDao.getCandidateById(candidateId) ?: return@withContext false
        val existing = metadataDao.getMetadataCommonByItemId(candidate.itemId)

        val updatedMetadata = if (existing != null) {
            existing.copy(
                title = candidate.title ?: existing.title,
                sortTitle = candidate.sortTitle ?: existing.sortTitle,
                originalTitle = candidate.originalTitle ?: existing.originalTitle,
                year = candidate.year ?: existing.year,
                releaseDate = candidate.releaseDate ?: existing.releaseDate,
                rating = candidate.rating ?: existing.rating,
                summary = candidate.summary ?: existing.summary,
                plot = candidate.plot ?: existing.plot,
                tagline = candidate.tagline ?: existing.tagline,
                coverImagePath = candidate.coverImagePath ?: existing.coverImagePath,
                backdropImagePath = candidate.backdropImagePath ?: existing.backdropImagePath,
                language = candidate.language ?: existing.language,
                country = candidate.country ?: existing.country,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = candidate.source,
                isVerified = true
            )
        } else {
            MetadataCommon(
                itemId = candidate.itemId,
                title = candidate.title ?: "Untitled Item",
                sortTitle = candidate.sortTitle,
                originalTitle = candidate.originalTitle,
                year = candidate.year,
                releaseDate = candidate.releaseDate,
                rating = candidate.rating,
                summary = candidate.summary,
                plot = candidate.plot,
                tagline = candidate.tagline,
                coverImagePath = candidate.coverImagePath,
                backdropImagePath = candidate.backdropImagePath,
                language = candidate.language,
                country = candidate.country,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = candidate.source,
                isVerified = true
            )
        }

        metadataDao.insertMetadataCommon(updatedMetadata)

        // Mark media item as having metadata
        val mediaItem = mediaItemDao.getMediaItemById(candidate.itemId)
        if (mediaItem != null && !mediaItem.hasMetadata) {
            mediaItemDao.updateMediaItem(mediaItem.copy(hasMetadata = true))
        }

        stagedMetadataCandidateDao.deleteCandidate(candidateId)
        true
    }

    /**
     * Edit candidate proposed values and approve
     */
    suspend fun editAndApproveCandidate(candidate: StagedMetadataCandidate): Boolean = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.updateCandidate(candidate)
        approveCandidate(candidate.candidateId)
    }

    /**
     * Batch approve candidates
     */
    suspend fun approveCandidates(candidateIds: List<Long>): Int = withContext(ioDispatcher) {
        var count = 0
        for (id in candidateIds) {
            if (approveCandidate(id)) count++
        }
        count
    }

    /**
     * Discard a pending candidate record without changing library metadata
     */
    suspend fun discardCandidate(candidateId: Long) = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.deleteCandidate(candidateId)
    }

    /**
     * Batch discard candidates
     */
    suspend fun discardCandidates(candidateIds: List<Long>) = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.deleteCandidates(candidateIds)
    }

    /**
     * Delete expired candidates to prevent unbounded storage growth
     */
    suspend fun cleanExpiredCandidates(): Int = withContext(ioDispatcher) {
        stagedMetadataCandidateDao.deleteExpiredCandidates()
    }
}
