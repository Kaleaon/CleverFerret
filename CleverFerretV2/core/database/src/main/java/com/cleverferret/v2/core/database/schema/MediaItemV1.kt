package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract
import com.cleverferret.v2.core.data.contracts.MediaTypeV1

data class MediaItemV1(
    val mediaItemId: String,
    val libraryId: String,
    val mediaType: MediaTypeV1,
    val title: String,
    val normalizedTitle: String,
    val primaryCreator: String,
    val favorite: Boolean,
    val createdAtEpochMs: Long,
    val updatedAtEpochMs: Long,
    val lastAccessedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
