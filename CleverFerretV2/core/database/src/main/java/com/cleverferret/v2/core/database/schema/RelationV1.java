package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical edge row joining media with collections/tags/series/other media.
 */
public record RelationV1(
        String relationId,
        RelationTypeV1 relationType,
        String fromEntityType,
        String fromEntityId,
        String toEntityType,
        String toEntityId,
        Integer ordinal,
        String role,
        String sourceSystem,
        long createdAtEpochMs,
        long updatedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
