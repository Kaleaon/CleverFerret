package com.universalmedialibrary.services.music

import com.universalmedialibrary.data.LocalMediaItem

internal fun createTrackInfo(mediaItem: LocalMediaItem, queuePosition: Int = 0): TrackInfo {
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

internal fun extractArtistFromMetadata(mediaItem: LocalMediaItem): String? {
    // Extract artist from metadata or filename
    // This is a simplified version - would use actual metadata extraction
    return "Unknown Artist"
}

internal fun extractAlbumFromMetadata(mediaItem: LocalMediaItem): String? {
    // Extract album from metadata or filename
    // This is a simplified version - would use actual metadata extraction
    return "Unknown Album"
}

