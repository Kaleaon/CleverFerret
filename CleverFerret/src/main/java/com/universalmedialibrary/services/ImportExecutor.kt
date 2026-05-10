package com.universalmedialibrary.services

import android.content.Context
import android.net.Uri
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.services.importer.ImportOperationLog
import com.universalmedialibrary.services.importer.ImportOperationStatus
import com.universalmedialibrary.services.importer.ImportTransactionLog
import com.universalmedialibrary.utils.ErrorLogger
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.currentCoroutineContext
import kotlinx.coroutines.isActive
import kotlinx.coroutines.withContext
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.text.SimpleDateFormat
import java.util.Locale

private val importExecutorJson = Json {
    prettyPrint = true
    ignoreUnknownKeys = true
}

internal suspend fun getOrCreateLibraryForTypeImpl(libraryDao: com.universalmedialibrary.data.local.dao.LibraryDao, rootName: String, rootPath: String, type: String): Library {
    // Try to find a library with this type under the same root path
    val existing = libraryDao.getLibrariesByType(type).firstOrNull { it.path == rootPath }
    if (existing != null) return existing

    val name = "$rootName - ${'$'}{type.lowercase().replaceFirstChar { it.uppercase() }}"
    var library = Library(
        name = name,
        type = type,
        path = rootPath,
        dateModified = System.currentTimeMillis()
    )
    val id = libraryDao.insertLibrary(library)
    library = library.copy(libraryId = id)
    return library
}

internal suspend fun importRecursivelyImpl(
    context: Context,
    input: DocumentFile,
    outputRoot: DocumentFile,
    outputRootPath: String,
    options: ImportSortOptions,
    progressCallback: (String) -> Unit,
    summary: ImportSortSummary,
    fileNameSanitizer: com.universalmedialibrary.utils.FileNameSanitizer,
    mediaItemDao: com.universalmedialibrary.data.local.dao.MediaItemDao,
    metadataDao: com.universalmedialibrary.data.local.dao.MetadataDao,
    libraryDao: com.universalmedialibrary.data.local.dao.LibraryDao,
): ImportSortSummary {
    if (!input.isDirectory) return summary
    var currentSummary = summary

    input.listFiles().forEach { child ->
        if (child.isDirectory) {
            currentSummary = importRecursively(
                context = context,
                input = child,
                outputRoot = outputRoot,
                outputRootPath = outputRootPath,
                options = options,
                progressCallback = progressCallback,
                summary = currentSummary
            )
            return@forEach
        }

        val srcName = child.name ?: return@forEach
        if (!child.isFile) return@forEach

        val mediaType = determineMediaTypeName(srcName)
        val derived = when (mediaType) {
            "MUSIC" -> deriveMetadataForAudio(context, child.uri, srcName)
            "BOOK" -> deriveMetadataForBook(context, child.uri, srcName)
            "COMIC" -> {
                val lower = srcName.lowercase()
                if (lower.endsWith(".cbz") || lower.endsWith(".cbr")) deriveMetadataForComicArchive(context, child.uri, srcName)
                else deriveMetadataFromName(srcName)
            }
            else -> deriveMetadataFromName(srcName)
        }

        val safeTitle = fileNameSanitizer.sanitizeFileNamePermissive(derived.title).ifBlank { "Unknown" }
        val safeAuthor = derived.authorOrArtist?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
        val safeAlbum = derived.album?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
        val safeSeries = derived.series?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }

        val ext = srcName.substringAfterLast('.', "").lowercase()

        val (folderSegments, outputFileName) = when (mediaType) {
            "BOOK" -> {
                val segments = buildList {
                    add("Books")
                    add(safeAuthor ?: "Unknown Author")
                    safeSeries?.let { add(it) }
                }
                val name = "${safeTitle}.${ext.ifBlank { "bin" }}"
                segments to name
            }
            "MUSIC" -> {
                val segments = listOf("Music", safeAuthor ?: "Unknown Artist", safeAlbum ?: "Unknown Album")
                val prefix = derived.trackNumber?.let { tn -> tn.coerceAtLeast(0).toString().padStart(2, '0') + " - " } ?: ""
                val name = "${prefix}${safeTitle}.${ext.ifBlank { "bin" }}"
                segments to name
            }
            "MOVIE" -> listOf("Movies", safeTitle) to srcName
            "COMIC" -> listOf("Comics", safeSeries ?: "Unknown Series") to srcName
            "DOCUMENT" -> listOf("Documents", ext.ifBlank { "unknown" }.uppercase(Locale.ROOT)) to srcName
            else -> listOf("Other") to srcName
        }

        val destDir = getOrCreateNestedDirs(context, outputRoot, folderSegments)
        progressCallback("Importing: $srcName")

        val effectiveStrategy = options.conflictStrategy
        val effectiveDir = if (effectiveStrategy == ImportConflictStrategy.QUARANTINE) {
            getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
        } else destDir

        val copyResult = copyDocumentFileWithStrategy(
            context = context,
            src = child,
            dstDir = effectiveDir,
            desiredName = outputFileName,
            strategy = effectiveStrategy
        )
        val copied = when (copyResult) {
            is CopyResult.Copied -> copyResult.file
            is CopyResult.Skipped -> {
                currentSummary = currentSummary.copy(skipped = currentSummary.skipped + 1)
                return@forEach
            }
            is CopyResult.Failed -> {
                currentSummary = currentSummary.copy(errors = currentSummary.errors + 1)
                // Fallback: quarantine the original name to avoid losing track
                val qDir = getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
                val qResult = copyDocumentFileWithStrategy(context, child, qDir, srcName, ImportConflictStrategy.RENAME)
                if (qResult is CopyResult.Copied && options.moveFiles) runCatching { child.delete() }
                return@forEach
            }
        }

        if (options.moveFiles) {
            runCatching { child.delete() }
        }

        // Insert into DB (avoid duplicates by URI)
        if (!copied.isFile) {
            currentSummary = currentSummary.copy(errors = currentSummary.errors + 1)
            return@forEach
        }
        val destUriStr = copied.uri.toString()
        val existing = mediaItemDao.getItemByPath(destUriStr)
        if (existing == null) {
            val library = getOrCreateLibraryForTypeImpl(libraryDao, 
                rootName = outputRoot.name ?: "Output",
                rootPath = outputRootPath,
                type = mediaType
            )

            val computedHash = if (options.preventDuplicates || options.storeContentHash) {
                computeSha256(context, copied.uri)?.let { "sha256:$it" }
            } else null

            if (options.preventDuplicates && !computedHash.isNullOrBlank()) {
                val dup = mediaItemDao.findDuplicateByHash(library.libraryId, computedHash)
                if (dup != null) {
                    when (options.duplicateStrategy) {
                        ImportConflictStrategy.SKIP -> {
                            currentSummary = currentSummary.copy(skipped = currentSummary.skipped + 1)
                            runCatching { copied.delete() }
                            return@forEach
                        }
                        ImportConflictStrategy.QUARANTINE -> {
                            val qDir = getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
                            val movedToQ = runCatching { moveDocumentFile(context, copied, qDir) }.getOrNull() == true
                            if (!movedToQ) runCatching { copied.delete() }
                            currentSummary = currentSummary.copy(skipped = currentSummary.skipped + 1)
                            return@forEach
                        }
                        ImportConflictStrategy.REPLACE -> {
                            // Keep both (DB replace is not safe here). Proceed.
                        }
                        ImportConflictStrategy.RENAME -> {
                            // Keep both.
                        }
                    }
                }
            }

            val mediaItem = MediaItem(
                libraryId = library.libraryId,
                filePath = destUriStr,
                fileName = copied.name ?: outputFileName,
                fileExtension = (copied.name ?: outputFileName).substringAfterLast('.', "").lowercase(),
                fileSize = copied.length(),
                fileHash = if (options.storeContentHash) computedHash else null,
                dateAdded = System.currentTimeMillis(),
                lastScanned = System.currentTimeMillis(),
                lastModified = copied.lastModified(),
                mediaType = mediaType,
                mimeType = copied.type,
                isAvailable = true,
                hasMetadata = true,
                hasThumbnail = false,
                thumbnailPath = null
            )
            val itemId = mediaItemDao.insertMediaItem(mediaItem)

            val common = MetadataCommon(
                itemId = itemId,
                title = derived.title,
                sortTitle = null,
                originalTitle = null,
                year = null,
                releaseDate = null,
                rating = null,
                userRating = null,
                communityRating = null,
                summary = null,
                plot = null,
                tagline = null,
                coverImagePath = null,
                backdropImagePath = null,
                language = null,
                country = null,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = "IMPORT_SORTER",
                externalId = null
            )
            metadataDao.insertCommonMetadata(common)

            if (!derived.authorOrArtist.isNullOrBlank() && mediaType == "BOOK") {
                val person = People(personId = 0, name = derived.authorOrArtist, sortName = derived.authorOrArtist)
                val personId = metadataDao.findPersonByName(derived.authorOrArtist) ?: metadataDao.insertPerson(person)
                metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
            }

            if (!derived.series.isNullOrBlank() && mediaType == "BOOK") {
                val seriesId = metadataDao.findSeriesByName(derived.series)
                    ?: metadataDao.insertSeries(Series(seriesId = 0, name = derived.series, mediaType = "BOOK"))
                // Schema stores seriesId in metadata_book.series (string column in model).
                metadataDao.insertMetadataBook(
                    MetadataBook(
                        itemId = itemId,
                        series = seriesId.toString(),
                        format = ext.uppercase(Locale.ROOT)
                    )
                )
            } else if (mediaType == "BOOK") {
                metadataDao.insertMetadataBook(
                    MetadataBook(
                        itemId = itemId,
                        format = ext.uppercase(Locale.ROOT)
                    )
                )
            }

            if (mediaType == "MUSIC") {
                metadataDao.insertMetadataMusicTrack(
                    MetadataMusicTrack(
                        itemId = itemId,
                        album = derived.album,
                        artist = derived.authorOrArtist,
                        trackNumber = derived.trackNumber,
                        duration = derived.durationMs
                    )
                )
            }
            if (mediaType == "COMIC" && !derived.authorOrArtist.isNullOrBlank()) {
                val person = People(personId = 0, name = derived.authorOrArtist, sortName = derived.authorOrArtist)
                val personId = metadataDao.findPersonByName(derived.authorOrArtist) ?: metadataDao.insertPerson(person)
                metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
            }
        } else {
            currentSummary = currentSummary.copy(skipped = currentSummary.skipped + 1)
            // We already copied the file to output; count it as processed even if DB insert was skipped.
        }

        currentSummary = currentSummary.copy(imported = currentSummary.imported + 1)
    }

    return currentSummary
}

internal suspend fun executeImportPlanAdvancedImpl(
    context: Context,
    plan: ImportPlan,
    options: ImportSortOptions = ImportSortOptions(),
    startIndex: Int = 0,
    progressCallback: (String) -> Unit = {},
    checkpointCallback: ((Int) -> Unit)? = null,
    mediaItemDao: com.universalmedialibrary.data.local.dao.MediaItemDao,
    metadataDao: com.universalmedialibrary.data.local.dao.MetadataDao,
): ImportSortSummary = withContext(Dispatchers.IO) {
    var summary = ImportSortSummary()
    val startedAt = System.currentTimeMillis()
    val importId = SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(java.util.Date(startedAt))
    val operations = mutableListOf<ImportOperationLog>()
    val errors = mutableListOf<String>()
    try {
        val outputRoot = DocumentFile.fromTreeUri(context, Uri.parse(plan.outputTreeUri))
            ?: return@withContext summary.copy(errors = summary.errors + 1)

        for (index in startIndex until plan.items.size) {
            if (!currentCoroutineContext().isActive) throw kotlinx.coroutines.CancellationException("Import cancelled")
            checkpointCallback?.invoke(index)

            val item = plan.items[index]
            progressCallback("Importing (${index + 1}/${plan.items.size}): ${item.sourceDisplayName}")
            val srcDoc = DocumentFile.fromSingleUri(context, Uri.parse(item.sourceUri))
            if (srcDoc == null || !srcDoc.isFile) {
                summary = summary.copy(errors = summary.errors + 1)
                operations += ImportOperationLog(
                    index = index,
                    sourceUri = item.sourceUri,
                    sourceDisplayName = item.sourceDisplayName,
                    mediaType = item.mediaType,
                    status = ImportOperationStatus.FAILED,
                    message = "Source not accessible"
                )
                continue
            }
            val srcParentUri = runCatching { srcDoc.parentFile?.uri?.toString() }.getOrNull()

            val baseDestDir = getOrCreateNestedDirs(context, outputRoot, item.destSegments)
            val effectiveStrategy = item.conflictStrategy ?: options.conflictStrategy
            val destDir = if (effectiveStrategy == ImportConflictStrategy.QUARANTINE) {
                getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
            } else baseDestDir

            val copyResult = copyDocumentFileWithStrategy(
                context = context,
                src = srcDoc,
                dstDir = destDir,
                desiredName = item.outputFileName,
                strategy = effectiveStrategy
            )

            val copied = when (copyResult) {
                is CopyResult.Copied -> copyResult.file
                is CopyResult.Skipped -> {
                    summary = summary.copy(skipped = summary.skipped + 1)
                    operations += ImportOperationLog(
                        index = index,
                        sourceUri = item.sourceUri,
                        sourceDisplayName = item.sourceDisplayName,
                        sourceParentUri = srcParentUri,
                        destinationUri = null,
                        destinationDisplayName = null,
                        mediaType = item.mediaType,
                        status = ImportOperationStatus.SKIPPED,
                        message = copyResult.reason
                    )
                    continue
                }
                is CopyResult.Failed -> {
                    summary = summary.copy(errors = summary.errors + 1)
                    if (effectiveStrategy != ImportConflictStrategy.QUARANTINE) {
                        val qDir = getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
                        val qResult = copyDocumentFileWithStrategy(context, srcDoc, qDir, item.sourceDisplayName, ImportConflictStrategy.RENAME)
                        if (qResult is CopyResult.Copied && options.moveFiles) runCatching { srcDoc.delete() }
                    }
                    errors += "Failed to copy ${item.sourceDisplayName}: ${copyResult.reason}"
                    operations += ImportOperationLog(
                        index = index,
                        sourceUri = item.sourceUri,
                        sourceDisplayName = item.sourceDisplayName,
                        sourceParentUri = srcParentUri,
                        destinationUri = null,
                        destinationDisplayName = null,
                        mediaType = item.mediaType,
                        status = ImportOperationStatus.FAILED,
                        message = copyResult.reason
                    )
                    continue
                }
            }

            if (!copied.isFile) {
                summary = summary.copy(errors = summary.errors + 1)
                errors += "Copied result not a file: ${item.sourceDisplayName}"
                operations += ImportOperationLog(
                    index = index,
                    sourceUri = item.sourceUri,
                    sourceDisplayName = item.sourceDisplayName,
                    sourceParentUri = srcParentUri,
                    destinationUri = null,
                    destinationDisplayName = null,
                    mediaType = item.mediaType,
                    status = ImportOperationStatus.FAILED,
                    message = "Destination not a file"
                )
                continue
            }

            if (options.moveFiles) {
                runCatching { srcDoc.delete() }
            }

            summary = summary.copy(imported = summary.imported + 1)

            val destUriStr = copied.uri.toString()
            val existing = mediaItemDao.getItemByPath(destUriStr)
            if (existing != null) {
                summary = summary.copy(skipped = summary.skipped + 1)
                operations += ImportOperationLog(
                    index = index,
                    sourceUri = item.sourceUri,
                    sourceDisplayName = item.sourceDisplayName,
                    sourceParentUri = srcParentUri,
                    destinationUri = destUriStr,
                    destinationDisplayName = copied.name,
                    mediaType = item.mediaType,
                    status = if (options.moveFiles) ImportOperationStatus.MOVED else ImportOperationStatus.COPIED,
                    message = "DB item already exists for destination URI"
                )
                continue
            }

            val library = getOrCreateLibraryForType(
                rootName = outputRoot.name ?: "Output",
                rootPath = plan.outputTreeUri,
                type = item.mediaType
            )

            val computedHash = if (options.preventDuplicates || options.storeContentHash) {
                computeSha256(context, copied.uri)?.let { "sha256:$it" }
            } else null

            if (options.preventDuplicates && !computedHash.isNullOrBlank()) {
                val dup = mediaItemDao.findDuplicateByHash(library.libraryId, computedHash)
                if (dup != null) {
                    when (options.duplicateStrategy) {
                        ImportConflictStrategy.SKIP -> {
                            summary = summary.copy(skipped = summary.skipped + 1)
                            runCatching { copied.delete() }
                            operations += ImportOperationLog(
                                index = index,
                                sourceUri = item.sourceUri,
                                sourceDisplayName = item.sourceDisplayName,
                                sourceParentUri = srcParentUri,
                                destinationUri = destUriStr,
                                destinationDisplayName = copied.name,
                                mediaType = item.mediaType,
                                status = ImportOperationStatus.SKIPPED,
                                message = "Duplicate detected by hash"
                            )
                            continue
                        }
                        ImportConflictStrategy.QUARANTINE -> {
                            val qDir = getOrCreateNestedDirs(context, outputRoot, listOf("Quarantine"))
                            val movedToQ = runCatching { moveDocumentFile(context, copied, qDir) }.getOrNull() == true
                            if (!movedToQ) runCatching { copied.delete() }
                            summary = summary.copy(skipped = summary.skipped + 1)
                            operations += ImportOperationLog(
                                index = index,
                                sourceUri = item.sourceUri,
                                sourceDisplayName = item.sourceDisplayName,
                                sourceParentUri = srcParentUri,
                                destinationUri = destUriStr,
                                destinationDisplayName = copied.name,
                                mediaType = item.mediaType,
                                status = ImportOperationStatus.QUARANTINED,
                                message = "Duplicate detected by hash"
                            )
                            continue
                        }
                        else -> Unit
                    }
                }
            }

            val mediaItem = MediaItem(
                libraryId = library.libraryId,
                filePath = destUriStr,
                fileName = copied.name ?: item.outputFileName,
                fileExtension = (copied.name ?: item.outputFileName).substringAfterLast('.', "").lowercase(),
                fileSize = copied.length(),
                fileHash = if (options.storeContentHash) computedHash else null,
                dateAdded = System.currentTimeMillis(),
                lastScanned = System.currentTimeMillis(),
                lastModified = copied.lastModified(),
                mediaType = item.mediaType,
                mimeType = copied.type,
                isAvailable = true,
                hasMetadata = true,
                hasThumbnail = false,
                thumbnailPath = null
            )
            val itemId = mediaItemDao.insertMediaItem(mediaItem)

            val common = MetadataCommon(
                itemId = itemId,
                title = item.title,
                sortTitle = null,
                originalTitle = null,
                year = null,
                releaseDate = null,
                rating = null,
                userRating = null,
                communityRating = null,
                summary = null,
                plot = null,
                tagline = null,
                coverImagePath = null,
                backdropImagePath = null,
                language = null,
                country = null,
                lastUpdated = System.currentTimeMillis(),
                metadataSource = item.metadataSource,
                externalId = null
            )
            metadataDao.insertCommonMetadata(common)

            if (!item.authorOrArtist.isNullOrBlank() && item.mediaType in setOf("BOOK", "COMIC")) {
                val person = People(personId = 0, name = item.authorOrArtist, sortName = item.authorOrArtist)
                val personId = metadataDao.findPersonByName(item.authorOrArtist) ?: metadataDao.insertPerson(person)
                metadataDao.insertItemPersonRole(ItemPersonRole(itemId = itemId, personId = personId, role = "AUTHOR"))
            }

            if (item.mediaType == "BOOK") {
                val ext = item.outputFileName.substringAfterLast('.', "").uppercase(Locale.ROOT)
                val seriesId = if (!item.series.isNullOrBlank()) {
                    metadataDao.findSeriesByName(item.series)
                        ?: metadataDao.insertSeries(Series(seriesId = 0, name = item.series, mediaType = "BOOK"))
                } else null
                metadataDao.insertMetadataBook(
                    MetadataBook(
                        itemId = itemId,
                        series = seriesId?.toString(),
                        format = ext
                    )
                )
            }

            if (item.mediaType == "MUSIC") {
                metadataDao.insertMetadataMusicTrack(
                    MetadataMusicTrack(
                        itemId = itemId,
                        album = item.album,
                        artist = item.authorOrArtist,
                        trackNumber = item.trackNumber,
                        duration = item.durationMs
                    )
                )
            }

            operations += ImportOperationLog(
                index = index,
                sourceUri = item.sourceUri,
                sourceDisplayName = item.sourceDisplayName,
                sourceParentUri = srcParentUri,
                destinationUri = destUriStr,
                destinationDisplayName = copied.name,
                mediaType = item.mediaType,
                insertedItemId = itemId,
                status = if (options.moveFiles) ImportOperationStatus.MOVED else ImportOperationStatus.COPIED,
                message = null
            )
        }

        if (options.moveFiles && options.removeEmptyFolders) {
            val inputRoot = DocumentFile.fromTreeUri(context, Uri.parse(plan.inputTreeUri))
            if (inputRoot != null) {
                progressCallback("Removing empty folders…")
                val deleted = deleteEmptyDirectories(inputRoot, isRoot = true, progressCallback = progressCallback)
                summary = summary.copy(deletedFolders = summary.deletedFolders + deleted)
            }
        }

        writeImportLog(
            context = context,
            log = ImportTransactionLog(
                importId = importId,
                startedAt = startedAt,
                finishedAt = System.currentTimeMillis(),
                inputTreeUri = plan.inputTreeUri,
                outputTreeUri = plan.outputTreeUri,
                moveFiles = options.moveFiles,
                conflictStrategy = options.conflictStrategy.name,
                preventDuplicates = options.preventDuplicates,
                duplicateStrategy = options.duplicateStrategy.name,
                operations = operations,
                errors = errors
            )
        )
        summary
    } catch (e: Exception) {
        if (e is CancellationException) throw e
        ErrorLogger.logError("StorageAccessService", "Error executing import plan", e)
        runCatching {
            writeImportLog(
                context = context,
                log = ImportTransactionLog(
                    importId = importId,
                    startedAt = startedAt,
                    finishedAt = System.currentTimeMillis(),
                    inputTreeUri = plan.inputTreeUri,
                    outputTreeUri = plan.outputTreeUri,
                    moveFiles = options.moveFiles,
                    conflictStrategy = options.conflictStrategy.name,
                    preventDuplicates = options.preventDuplicates,
                    duplicateStrategy = options.duplicateStrategy.name,
                    operations = operations,
                    errors = errors + (e.message ?: "Unknown error")
                )
            )
        }
        summary.copy(errors = summary.errors + 1)
    }
}

