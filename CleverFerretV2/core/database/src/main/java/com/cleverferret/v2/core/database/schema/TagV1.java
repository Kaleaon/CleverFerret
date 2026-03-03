package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical tag row including source and hierarchy context.
 */
public record TagV1(
        String tagId,
        String name,
        String normalizedName,
        String tagType,
        String sourceSystem,
        String color,
        String description,
        long createdAtEpochMs,
        long lastUsedAtEpochMs,
        int usageCount
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
