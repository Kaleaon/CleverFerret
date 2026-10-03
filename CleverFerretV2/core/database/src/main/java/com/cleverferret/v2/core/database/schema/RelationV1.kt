package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class RelationV1(
    val relationId: String,
    val relationType: RelationTypeV1,
    val fromEntityType: String,
    val fromEntityId: String,
    val toEntityType: String,
    val toEntityId: String,
    val ordinal: Int?,
    val role: String,
    val sourceSystem: String,
    val createdAtEpochMs: Long,
    val updatedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
