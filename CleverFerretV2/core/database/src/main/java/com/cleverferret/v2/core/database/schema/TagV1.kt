package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class TagV1(
    val tagId: String,
    val name: String,
    val normalizedName: String,
    val tagType: String,
    val sourceSystem: String,
    val color: String,
    val description: String,
    val createdAtEpochMs: Long,
    val lastUsedAtEpochMs: Long,
    val usageCount: Int
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
