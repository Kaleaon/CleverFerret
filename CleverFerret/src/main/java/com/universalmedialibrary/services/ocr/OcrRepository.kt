package com.universalmedialibrary.services.ocr

import android.graphics.Bitmap
import android.graphics.Rect
import com.universalmedialibrary.data.local.dao.OcrCacheDao
import com.universalmedialibrary.data.local.entity.OcrCacheEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.security.MessageDigest
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for OCR operations with caching support
 */
@Singleton
class OcrRepository @Inject constructor(
    private val ocrService: OcrService,
    private val ocrCacheDao: OcrCacheDao,
    private val json: Json
) {

    /**
     * Recognize text from bitmap with caching
     */
    suspend fun recognizeText(
        bitmap: Bitmap,
        mediaItemId: String,
        pageNumber: Int = 0,
        useCache: Boolean = true
    ): Result<OcrResult> = withContext(Dispatchers.IO) {
        try {
            val cacheId = generateCacheId(bitmap, mediaItemId, pageNumber)
            
            // Try to get from cache first
            if (useCache) {
                val cached = ocrCacheDao.getById(cacheId)
                if (cached != null) {
                    return@withContext Result.success(deserializeOcrResult(cached))
                }
            }
            
            // Perform OCR
            val result = ocrService.recognizeText(bitmap)
            
            // Cache result if successful
            result.onSuccess { ocrResult ->
                val cacheEntity = OcrCacheEntity(
                    id = cacheId,
                    mediaItemId = mediaItemId,
                    pageNumber = pageNumber,
                    text = ocrResult.text,
                    blocksJson = serializeBlocks(ocrResult.blocks),
                    confidence = ocrResult.confidence
                )
                ocrCacheDao.insert(cacheEntity)
            }
            
            result
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Recognize text from a region with caching
     */
    suspend fun recognizeTextInRegion(
        bitmap: Bitmap,
        region: Rect,
        mediaItemId: String,
        pageNumber: Int = 0,
        useCache: Boolean = true
    ): Result<OcrResult> = withContext(Dispatchers.IO) {
        try {
            val cacheId = generateCacheId(bitmap, mediaItemId, pageNumber, region)
            
            // Try to get from cache first
            if (useCache) {
                val cached = ocrCacheDao.getById(cacheId)
                if (cached != null) {
                    return@withContext Result.success(deserializeOcrResult(cached))
                }
            }
            
            // Perform OCR on region
            val result = ocrService.recognizeTextInRegion(bitmap, region)
            
            // Cache result if successful
            result.onSuccess { ocrResult ->
                val cacheEntity = OcrCacheEntity(
                    id = cacheId,
                    mediaItemId = mediaItemId,
                    pageNumber = pageNumber,
                    text = ocrResult.text,
                    blocksJson = serializeBlocks(ocrResult.blocks),
                    confidence = ocrResult.confidence
                )
                ocrCacheDao.insert(cacheEntity)
            }
            
            result
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    /**
     * Get cached OCR results for a media item
     */
    fun getOcrResultsForMediaItem(mediaItemId: String): Flow<List<OcrResult>> {
        return ocrCacheDao.getByMediaItemFlow(mediaItemId).map { entities ->
            entities.map { deserializeOcrResult(it) }
        }
    }

    /**
     * Clear OCR cache for a specific media item
     */
    suspend fun clearCacheForMediaItem(mediaItemId: String) {
        ocrCacheDao.deleteByMediaItem(mediaItemId)
    }

    /**
     * Clear old cache entries
     */
    suspend fun clearOldCache(maxAgeMillis: Long = 30L * 24 * 60 * 60 * 1000) { // 30 days default
        val cutoffTime = System.currentTimeMillis() - maxAgeMillis
        ocrCacheDao.deleteOlderThan(cutoffTime)
    }

    private fun generateCacheId(
        bitmap: Bitmap,
        mediaItemId: String,
        pageNumber: Int,
        region: Rect? = null
    ): String {
        val data = buildString {
            append(mediaItemId)
            append(pageNumber)
            append(bitmap.width)
            append(bitmap.height)
            region?.let {
                append(it.left)
                append(it.top)
                append(it.right)
                append(it.bottom)
            }
        }
        
        val digest = MessageDigest.getInstance("MD5")
        val hash = digest.digest(data.toByteArray())
        return hash.joinToString("") { "%02x".format(it) }
    }

    private fun serializeBlocks(blocks: List<TextBlock>): String {
        return json.encodeToString(blocks.map { block ->
            mapOf(
                "text" to block.text,
                "confidence" to block.confidence,
                "left" to block.boundingBox.left,
                "top" to block.boundingBox.top,
                "right" to block.boundingBox.right,
                "bottom" to block.boundingBox.bottom
            )
        })
    }

    private fun deserializeOcrResult(entity: OcrCacheEntity): OcrResult {
        // Deserialize blocks from JSON for complete result
        val blocks = try {
            val blockMaps = json.decodeFromString<List<Map<String, Any>>>(entity.blocksJson)
            blockMaps.map { blockMap ->
                TextBlock(
                    text = blockMap["text"] as? String ?: "",
                    boundingBox = Rect(
                        (blockMap["left"] as? Number)?.toInt() ?: 0,
                        (blockMap["top"] as? Number)?.toInt() ?: 0,
                        (blockMap["right"] as? Number)?.toInt() ?: 0,
                        (blockMap["bottom"] as? Number)?.toInt() ?: 0
                    ),
                    confidence = (blockMap["confidence"] as? Number)?.toFloat() ?: 0f,
                    lines = emptyList() // Lines not serialized for cache efficiency
                )
            }
        } catch (e: Exception) {
            emptyList() // Fallback to empty list on deserialization error
        }

        return OcrResult(
            text = entity.text,
            blocks = blocks,
            confidence = entity.confidence
        )
    }
}
