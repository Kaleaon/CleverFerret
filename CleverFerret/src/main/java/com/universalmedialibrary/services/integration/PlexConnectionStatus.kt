package com.universalmedialibrary.services.integration

/**
 * Status of Plex connections
 */
data class PlexConnectionStatus(
    val connectedServers: List<String>,
    val hasActiveConnections: Boolean,
    val totalLibraries: Int
)
