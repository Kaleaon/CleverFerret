package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical reconciliation state between local DB and external/cloud providers.
 */
public record SyncStateV1(
        String syncStateId,
        String entityType,
        String entityId,
        String provider,
        String remoteId,
        String deviceId,
        long localVersion,
        long remoteVersion,
        SyncStatusV1 status,
        String conflictStrategy,
        Long lastSyncedAtEpochMs,
        long updatedAtEpochMs,
        String errorMessage
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
