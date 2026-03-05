package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class SyncStateV1(
    val syncStateId: String,
    val entityType: String,
    val entityId: String,
    val provider: String,
    val remoteId: String,
    val deviceId: String,
    val localVersion: Long,
    val remoteVersion: Long,
    val status: SyncStatusV1,
    val conflictStrategy: String,
    val lastSyncedAtEpochMs: Long?,
    val updatedAtEpochMs: Long,
    val errorMessage: String
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
