package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical series/franchise descriptor.
 */
public record SeriesV1(
        String seriesId,
        String name,
        String normalizedName,
        String description,
        String mediaTypeHint,
        long createdAtEpochMs,
        long updatedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
