package com.cleverferret.v2.feature.plex.services.plex;

public record PlexSyncResultV1(
        String accountId,
        int syncedItems,
        long syncedAtEpochMillis
) {}
