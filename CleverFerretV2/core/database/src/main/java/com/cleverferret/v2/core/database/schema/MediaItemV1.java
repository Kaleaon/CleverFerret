package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;
import com.cleverferret.v2.core.data.contracts.MediaTypeV1;

/**
 * Canonical media identity row shared by all format-specific variants.
 */
public record MediaItemV1(
        String mediaItemId,
        String libraryId,
        MediaTypeV1 mediaType,
        String title,
        String normalizedTitle,
        String primaryCreator,
        boolean favorite,
        long createdAtEpochMs,
        long updatedAtEpochMs,
        long lastAccessedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
