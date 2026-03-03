package com.cleverferret.v2.core.database.schema;

import com.cleverferret.v2.core.common.VersionedContract;

/**
 * Canonical position/progress row for reading/listening/watching.
 */
public record ConsumptionStateV1(
        String consumptionStateId,
        String mediaItemId,
        String mediaVariantId,
        String profileId,
        ConsumptionModeV1 mode,
        double progress,
        String locator,
        Long positionMillis,
        Integer pageNumber,
        Integer chapterNumber,
        boolean completed,
        long firstConsumedAtEpochMs,
        long lastConsumedAtEpochMs,
        long updatedAtEpochMs
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
