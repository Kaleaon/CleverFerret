package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class CollectionV1(
    val collectionId: String,
    val ownerProfileId: String,
    val name: String,
    val description: String,
    val collectionType: String,
    val visibility: String,
    val createdAtEpochMs: Long,
    val updatedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
