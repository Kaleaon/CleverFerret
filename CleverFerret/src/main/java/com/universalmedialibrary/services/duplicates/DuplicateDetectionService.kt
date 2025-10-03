package com.universalmedialibrary.services.duplicates

import com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.data.local.entity.MediaItem
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class DuplicateDetectionService @Inject constructor(
    private val fingerprinter: ContentFingerprinter,
    private val mediaRepository: MediaRepository
) {
    fun scanLibraryForDuplicates(libraryId: Long): Flow<DuplicateScanResult> = flow {
        emit(DuplicateScanResult.Scanning(0))
        val items = mediaRepository.getMediaItemsByLibrary(libraryId).firstOrNull() ?: emptyList()

        val total = items.size.coerceAtLeast(1)
        var processed = 0
        val groups = mutableListOf<DuplicateGroup>()

        items.chunked(50).forEach { batch ->
            val batchGroups = findDuplicates(batch)
            groups.addAll(batchGroups)
            processed += batch.size
            emit(DuplicateScanResult.Scanning((processed * 100) / total))
        }

        emit(DuplicateScanResult.Complete(groups))
    }

    private suspend fun findDuplicates(mediaItems: List<MediaItem>): List<DuplicateGroup> = withContext(Dispatchers.Default) {
        val map = mutableMapOf<String, MutableList<MediaItem>>()
        mediaItems.forEach { item ->
            val fp = try {
                when (item.mediaType) {
                    "BOOK" -> fingerprinter.generateDocumentFingerprint(item.filePath)
                    else -> item.fileHash ?: item.filePath
                }
            } catch (_: Exception) { null }

            if (fp != null) map.getOrPut(fp) { mutableListOf() }.add(item)
        }

        map.filter { it.value.size > 1 }
            .map { (fp, list) ->
                DuplicateGroup(
                    fingerprint = fp,
                    items = list,
                    wastedSpace = list.sumOf { it.fileSize } - (list.maxOfOrNull { it.fileSize } ?: 0L)
                )
            }
    }
}

sealed class DuplicateScanResult {
    data class Scanning(val progressPercent: Int) : DuplicateScanResult()
    data class Complete(val groups: List<DuplicateGroup>) : DuplicateScanResult()
    data class Error(val message: String) : DuplicateScanResult()
}

data class DuplicateGroup(
    val fingerprint: String,
    val items: List<MediaItem>,
    val wastedSpace: Long
)

// Using kotlinx.coroutines.flow.firstOrNull()

