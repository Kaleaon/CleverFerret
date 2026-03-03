package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical format/storage variant row that hangs off a MediaItem identity.
 */
public record MediaVariantV1(
        String mediaVariantId,
        String mediaItemId,
        String sourceType,
        String uri,
        String fileName,
        String mimeType,
        String format,
        Long byteSize,
        String contentHash,
        String drmType,
        boolean downloadable,
        boolean availableOffline,
        long discoveredAtEpochMs,
        long scannedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
