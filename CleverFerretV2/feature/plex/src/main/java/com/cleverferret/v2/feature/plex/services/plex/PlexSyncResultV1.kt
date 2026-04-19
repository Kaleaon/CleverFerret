package com.cleverferret.v2.feature.plex.services.plex


data class PlexSyncResultV1(
    val accountId: String,
    val syncedItems: Int,
    val syncedAtEpochMillis: Long,
    val checkpoint: String,
)
