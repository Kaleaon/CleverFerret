package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class ConsumptionStateV1(
    val consumptionStateId: String,
    val mediaItemId: String,
    val mediaVariantId: String,
    val profileId: String,
    val mode: ConsumptionModeV1,
    val progress: Double,
    val locator: String,
    val positionMillis: Long?,
    val pageNumber: Int?,
    val chapterNumber: Int?,
    val completed: Boolean,
    val firstConsumedAtEpochMs: Long,
    val lastConsumedAtEpochMs: Long,
    val updatedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
