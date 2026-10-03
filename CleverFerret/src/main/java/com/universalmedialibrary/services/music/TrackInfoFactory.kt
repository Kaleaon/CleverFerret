package com.universalmedialibrary.services.music

import com.universalmedialibrary.data.local.entity.MediaItem

internal fun createTrackInfo(mediaItem: MediaItem, queuePosition: Int = 0): TrackInfo {
    return TrackInfo(
        id = mediaItem.itemId.toString(),
        title = mediaItem.fileName.substringBeforeLast('.'),
        artist = extractArtistFromMetadata(mediaItem),
        album = extractAlbumFromMetadata(mediaItem),
        duration = 0L, // Duration will be updated when media is loaded
        filePath = mediaItem.filePath,
        albumArtUrl = null, // Will be enhanced later
        queuePosition = queuePosition
    )
}

internal fun extractArtistFromMetadata(mediaItem: MediaItem): String? {
    // Extract artist from metadata or filename
    // This is a simplified version - would use actual metadata extraction
    return "Unknown Artist"
}

internal fun extractAlbumFromMetadata(mediaItem: MediaItem): String? {
    // Extract album from metadata or filename
    // This is a simplified version - would use actual metadata extraction
    return "Unknown Album"
}

