package com.universalmedialibrary.services.integration.plex

/**
 * Result classes for Plex integration service operations
 */

sealed class PlexConnectionResult {
    data class Success(val message: String, val serverInfo: PlexServerInfo? = null) : PlexConnectionResult()
    data class Error(val message: String, val exception: Throwable? = null) : PlexConnectionResult()
}

sealed class MetadataEnhancementResult {
    data class Success(val itemsProcessed: Int, val itemsEnhanced: Int) : MetadataEnhancementResult()
    data class Error(val message: String, val exception: Throwable? = null) : MetadataEnhancementResult()
}

sealed class DuplicateAnalysisResult {
    data class Success(val duplicateGroups: List<DuplicateGroup>, val totalDuplicates: Int) : DuplicateAnalysisResult()
    data class Error(val message: String, val exception: Throwable? = null) : DuplicateAnalysisResult()
}

sealed class SmartCollectionResult {
    data class Success(val collectionsCreated: List<String>, val totalCollections: Int) : SmartCollectionResult()
    data class Error(val message: String, val exception: Throwable? = null) : SmartCollectionResult()
}

data class PlexServerInfo(
    val name: String,
    val url: String,
    val version: String,
    val platform: String,
    val machineIdentifier: String,
    val libraryCount: Int
)

data class DuplicateGroup(
    val items: List<MediaItem>,
    val similarity: Float,
    val reason: String
)

/**
 * Status of Plex connections
 * Single source of truth for connection status
 */
data class PlexConnectionStatus(
    val connectedServers: List<String>,
    val hasActiveConnections: Boolean,
    val totalLibraries: Int
)
