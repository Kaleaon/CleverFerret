package com.universalmedialibrary.services.integration

data class PlexConnectionStatus(
    val connectedServers: List<String> = emptyList(),
    val totalLibraries: Int = 0,
    val hasActiveConnections: Boolean = false
)