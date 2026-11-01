package com.universalmedialibrary.services.tagging

import android.util.Log
import com.universalmedialibrary.data.local.dao.UnifiedTagDao
import com.universalmedialibrary.data.local.entity.ItemTag
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.TagType
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.isActive
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Unified tag indexing ingestion listener.
 *
 * Listens for completed media ingestion events emitted by [com.universalmedialibrary.services.MediaScannerService]
 * and asynchronously extracts, normalizes, and registers format-specific tags and genres
 * into [UnifiedTagDao] without blocking the scanner loop.
 */
@Singleton
class UnifiedTagIndexingListener @Inject constructor(
    private val unifiedTagDao: UnifiedTagDao,
    private val tagExtractor: MediaFormatTagExtractor,
    private val dispatcher: CoroutineDispatcher = Dispatchers.IO
) : TagIndexingIngestionListener {

    companion object {
        private const val TAG = "UnifiedTagIndexingListener"
        private const val BATCH_SIZE = 20
    }

    private val scope = CoroutineScope(dispatcher + SupervisorJob())
    private val itemChannel = Channel<MediaItem>(Channel.UNLIMITED)
    private val processingMutex = Mutex()

    init {
        scope.launch {
            processItemQueue()
        }
    }

    override fun onMediaItemIngested(mediaItem: MediaItem) {
        try {
            itemChannel.trySend(mediaItem)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to enqueue media item for tag indexing: ${mediaItem.itemId}", e)
        }
    }

    override suspend fun processItem(mediaItem: MediaItem): List<String> = withContext(dispatcher) {
        processingMutex.withLock {
            val tags = try {
                tagExtractor.extractTags(mediaItem)
            } catch (e: Exception) {
                Log.w(TAG, "Extraction error for item ${mediaItem.itemId}: ${e.message}")
                emptyList()
            }

            if (tags.isEmpty()) return@withLock emptyList()

            for (tagName in tags) {
                try {
                    val tagId = unifiedTagDao.findOrCreateTag(tagName, TagType.AUTO_GENERATED)
                    if (tagId > 0) {
                        unifiedTagDao.addTagToItem(ItemTag(itemId = mediaItem.itemId, tagId = tagId))
                        unifiedTagDao.recalculateUsageCount(tagId)
                    }
                } catch (e: Exception) {
                    Log.w(TAG, "Failed to persist tag '$tagName' for item ${mediaItem.itemId}: ${e.message}")
                }
            }
            tags
        }
    }

    override suspend fun flush(): Unit = withContext(dispatcher) {
        // Yield to allow queued tasks to be consumed
        while (!itemChannel.isEmpty) {
            kotlinx.coroutines.delay(10)
        }
        // Acquire mutex to ensure the in-flight batch is complete
        processingMutex.withLock {
            // Flushed
        }
    }

    private suspend fun processItemQueue() {
        while (scope.isActive) {
            try {
                val firstItem = itemChannel.receive()
                val batch = mutableListOf(firstItem)

                // Drain up to BATCH_SIZE items from the channel
                while (batch.size < BATCH_SIZE) {
                    val nextItem = itemChannel.tryReceive().getOrNull() ?: break
                    batch.add(nextItem)
                }

                processingMutex.withLock {
                    processBatch(batch)
                }
            } catch (e: Exception) {
                if (e is kotlinx.coroutines.CancellationException) break
                Log.e(TAG, "Error processing ingestion item queue", e)
            }
        }
    }

    internal suspend fun processBatch(items: List<MediaItem>) {
        if (items.isEmpty()) return
        val affectedTagIds = mutableSetOf<Long>()

        for (item in items) {
            try {
                val tagIds = indexSingleItem(item, updateUsageCountsDirectly = false)
                affectedTagIds.addAll(tagIds)
            } catch (e: Exception) {
                Log.w(TAG, "Tag indexing failed for item ${item.itemId}: ${e.message}")
            }
        }

        // Update tag usage counts asynchronously after the batch
        for (tagId in affectedTagIds) {
            try {
                unifiedTagDao.recalculateUsageCount(tagId)
            } catch (e: Exception) {
                Log.w(TAG, "Failed to recalculate usage count for tag $tagId: ${e.message}")
            }
        }
    }

    /**
     * Extracts and links tags for a single item. Returns the IDs of the tags that were linked.
     */
    private suspend fun indexSingleItem(
        mediaItem: MediaItem,
        updateUsageCountsDirectly: Boolean
    ): List<Long> {
        val tags = try {
            tagExtractor.extractTags(mediaItem)
        } catch (e: Exception) {
            Log.w(TAG, "Extraction error for item ${mediaItem.itemId}: ${e.message}")
            emptyList()
        }

        if (tags.isEmpty()) return emptyList()

        val linkedTagIds = mutableListOf<Long>()
        for (tagName in tags) {
            try {
                val tagId = unifiedTagDao.findOrCreateTag(tagName, TagType.AUTO_GENERATED)
                if (tagId > 0) {
                    unifiedTagDao.addTagToItem(ItemTag(itemId = mediaItem.itemId, tagId = tagId))
                    linkedTagIds.add(tagId)
                    if (updateUsageCountsDirectly) {
                        unifiedTagDao.recalculateUsageCount(tagId)
                    }
                }
            } catch (e: Exception) {
                Log.w(TAG, "Failed to persist tag '$tagName' for item ${mediaItem.itemId}: ${e.message}")
            }
        }

        return linkedTagIds
    }
}
