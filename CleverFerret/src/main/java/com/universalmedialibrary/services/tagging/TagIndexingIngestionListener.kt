package com.universalmedialibrary.services.tagging

import com.universalmedialibrary.data.local.entity.MediaItem

/**
 * Listener interface for asynchronous ingestion events emitted when media items
 * have been cataloged by [com.universalmedialibrary.services.MediaScannerService].
 */
interface TagIndexingIngestionListener {

    /**
     * Non-blocking callback invoked when a MediaItem has finished cataloging.
     * Enqueues the item for asynchronous format-specific tag and genre extraction.
     */
    fun onMediaItemIngested(mediaItem: MediaItem)

    /**
     * Directly processes and indexes tags for a specific media item.
     *
     * @param mediaItem The media item to index tags for
     * @return List of persisted normalized tag names
     */
    suspend fun processItem(mediaItem: MediaItem): List<String>

    /**
     * Waits for any queued ingestion tasks to complete.
     */
    suspend fun flush()
}
