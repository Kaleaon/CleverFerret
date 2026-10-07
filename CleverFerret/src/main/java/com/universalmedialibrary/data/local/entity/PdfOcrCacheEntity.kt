package com.universalmedialibrary.data.local.entity

import androidx.room.Entity

/**
 * Room entity storing extracted OCR page text for PDF documents,
 * keyed by deterministic file checksum and page index.
 */
@Entity(
    tableName = "pdf_ocr_cache",
    primaryKeys = ["fileHash", "pageIndex"]
)
data class PdfOcrCacheEntity(
    val fileHash: String,
    val pageIndex: Int,
    val text: String,
    val timestamp: Long = System.currentTimeMillis(),
    val fileSize: Long = 0L,
    val lastModified: Long = 0L
)
