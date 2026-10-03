package com.cleverferret.v2.feature.webfiction.dto

import com.cleverferret.v2.core.common.VersionedContract
import java.util.List

data class StoryMetadataDtoV1(
    val title: String,
    val author: String,
    val summary: String,
    val sourceUrl: String,
    val sourceSite: String,
    val tags: List<String>
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
