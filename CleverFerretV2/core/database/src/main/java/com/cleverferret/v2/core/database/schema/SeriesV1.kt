package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class SeriesV1(
    val seriesId: String,
    val name: String,
    val normalizedName: String,
    val description: String,
    val mediaTypeHint: String,
    val createdAtEpochMs: Long,
    val updatedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
