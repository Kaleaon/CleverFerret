package com.cleverferret.v2.core.data.contracts;

import com.cleverferret.v2.core.common.VersionedContract;

public record UnifiedMediaItemV1(
        String itemId,
        String libraryId,
        String title,
        MediaTypeV1 mediaType,
        String filePath
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
