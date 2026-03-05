package com.cleverferret.v2.core.data.contracts

import com.cleverferret.v2.core.common.VersionedContract

data class UnifiedMediaItemV1(
    val itemId: String,
    val libraryId: String,
    val title: String,
    val mediaType: MediaTypeV1,
    val filePath: String
) : VersionedContract {
    override fun contractVersion(): String = "v1"
}
