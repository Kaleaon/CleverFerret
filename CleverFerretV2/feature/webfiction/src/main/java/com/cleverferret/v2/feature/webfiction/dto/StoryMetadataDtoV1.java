package com.cleverferret.v2.feature.webfiction.dto;

import com.cleverferret.v2.core.common.VersionedContract;

import java.util.List;

public record StoryMetadataDtoV1(
        String title,
        String author,
        String summary,
        String sourceUrl,
        String sourceSite,
        List<String> tags
) implements VersionedContract {
    @Override
    public String contractVersion() {
        return "v1";
    }
}
