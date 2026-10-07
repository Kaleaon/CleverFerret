package com.universalmedialibrary.services.tagging

import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.music.MusicTagRepository
import kotlinx.coroutines.flow.firstOrNull
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to migrate legacy music database tags into the central Room tagging system
 * (unified_tags and item_tags).
 */
@Singleton
class LegacyMusicTagMigrator @Inject constructor(
    private val musicTagRepository: MusicTagRepository,
    private val unifiedTagDao: UnifiedTagDao
) {

    /**
     * Imports all legacy music database tags and track tag relations into unified_tags and item_tags.
     * @return Number of imported track-tag associations.
     */
    suspend fun migrateLegacyMusicTags(): Int {
        var migratedCount = 0
        try {
            val legacyTags = musicTagRepository.getAllTags().firstOrNull() ?: emptyList()
            for (legacyTag in legacyTags) {
                if (legacyTag.name.isBlank()) continue

                val normalizedName = legacyTag.name.trim()
                val tagId = unifiedTagDao.findOrCreateTag(
                    name = normalizedName,
                    type = TagType.USER_DEFINED,
                    color = legacyTag.color
                )

                val trackIds = musicTagRepository.getTrackIdsForTag(legacyTag.id)
                for (trackId in trackIds) {
                    unifiedTagDao.addTagToItem(
                        ItemTag(
                            itemId = trackId,
                            tagId = tagId,
                            appliedAt = System.currentTimeMillis()
                        )
                    )
                    migratedCount++
                }
                unifiedTagDao.recalculateUsageCount(tagId)
            }
        } catch (e: Exception) {
            // Safe fallback if music tag DB is unavailable or empty
        }
        return migratedCount
    }
}
