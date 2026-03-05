package com.cleverferret.v2.core.database.schema

import com.cleverferret.v2.core.common.VersionedContract

data class MediaVariantV1(
    val mediaVariantId: String,
    val mediaItemId: String,
    val sourceType: String,
    val uri: String,
    val fileName: String,
    val mimeType: String,
    val format: String,
    val byteSize: Long?,
    val contentHash: String,
    val drmType: String,
    val downloadable: Boolean,
    val availableOffline: Boolean,
    val discoveredAtEpochMs: Long,
    val scannedAtEpochMs: Long
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
