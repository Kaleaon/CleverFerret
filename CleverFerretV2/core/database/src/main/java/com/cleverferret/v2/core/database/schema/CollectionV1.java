package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical collection/list container across all media types.
 */
public record CollectionV1(
        String collectionId,
        String ownerProfileId,
        String name,
        String description,
        String collectionType,
        String visibility,
        long createdAtEpochMs,
        long updatedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
