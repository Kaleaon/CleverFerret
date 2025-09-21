package com.universalmedialibrary.services.integration

import com.universalmedialibrary.services.integration.plex.PlexMediaItem
import com.universalmedialibrary.services.integration.plex.PlexServerConnection

data class PlexConnectionStatus(
    val connectedServers: List<String> = emptyList(),
    val totalLibraries: Int = 0,
    val hasActiveConnections: Boolean = false
)

sealed class PlexConnectionResult {
    data class Success(val connection: PlexServerConnection) : PlexConnectionResult()
    data class Error(val message: String) : PlexConnectionResult()
}

sealed class MetadataEnhancementResult {
    data class Success(val enhanced: Int, val failed: Int, val details: List<ItemEnhancementResult>) : MetadataEnhancementResult()
    data class Error(val message: String) : MetadataEnhancementResult()
}

sealed class DuplicateAnalysisResult {
    data class Success(val duplicateGroups: List<DuplicateGroup>) : DuplicateAnalysisResult()
    data class Error(val message: String) : DuplicateAnalysisResult()
}

sealed class SmartCollectionResult {
    data class Success(val collections: List<SmartCollection>) : SmartCollectionResult()
    data class Error(val message: String) : SmartCollectionResult()
}

data class ItemEnhancementResult(
    val ratingKey: String,
    val successful: Boolean,
    val details: String
)

data class DuplicateGroup(
    val id: String,
    val title: String,
    val items: List<PlexMediaItem>,
    val similarity: Float,
    val reason: String
)

data class SmartCollection(
    val name: String,
    val type: String,
    val items: List<String>,
    val description: String
)

data class PlexServerInfo(
    val friendlyName: String,
    val machineIdentifier: String,
    val version: String,
    val platform: String,
    val platformVersion: String,
    val updatedAt: Long,
    val myPlex: Boolean
)
