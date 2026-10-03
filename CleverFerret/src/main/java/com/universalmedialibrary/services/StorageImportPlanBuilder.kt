package com.universalmedialibrary.services

import android.content.Context
import android.net.Uri
import androidx.documentfile.provider.DocumentFile
import java.security.MessageDigest

internal fun computeSha256(context: Context, uri: Uri): String? {
    return try {
        val digest = MessageDigest.getInstance("SHA-256")
        context.contentResolver.openInputStream(uri).use { input ->
            if (input == null) return null
            val buf = ByteArray(1024 * 64)
            while (true) {
                val n = input.read(buf)
                if (n <= 0) break
                digest.update(buf, 0, n)
            }
        }
        digest.digest().joinToString("") { "%02x".format(it) }
    } catch (_: Exception) {
        null
    }
}

internal fun deleteEmptyDirectories(
    dir: DocumentFile,
    isRoot: Boolean,
    progressCallback: (String) -> Unit
): Int {
    if (!dir.isDirectory) return 0
    var deleted = 0
    dir.listFiles().forEach { child ->
        if (child.isDirectory) {
            deleted += deleteEmptyDirectories(child, isRoot = false, progressCallback = progressCallback)
        }
    }
    val nowEmpty = dir.listFiles().isEmpty()
    if (nowEmpty && !isRoot) {
        val name = dir.name ?: "folder"
        if (dir.delete()) {
            deleted += 1
            progressCallback("Removed empty folder: $name")
        }
    }
    return deleted
}

internal fun buildPlanRecursively(
    context: Context,
    input: DocumentFile,
    out: MutableList<ImportPlanItem>,
    progressCallback: (String) -> Unit,
    options: ImportSortOptions
) {
    if (!input.isDirectory) return
    input.listFiles().forEach { child ->
        if (child.isDirectory) {
            buildPlanRecursively(context, child, out, progressCallback, options)
            return@forEach
        }
        if (!child.isFile) return@forEach
        val srcName = child.name ?: return@forEach
        val mediaType = determineMediaTypeName(srcName)

        val (derived, metadataSource, confidenceBase) = when (mediaType) {
            "MUSIC" -> Triple(deriveMetadataForAudio(context, child.uri, srcName), "AUDIO_TAGS", 0.9f)
            "BOOK" -> {
                val byExt = if (srcName.lowercase().endsWith(".epub")) "EPUB_OPF" else if (srcName.lowercase().endsWith(".pdf")) "PDF_INFO" else "FILENAME"
                val d = deriveMetadataForBook(context, child.uri, srcName)
                val conf = when (byExt) {
                    "EPUB_OPF" -> if (d.authorOrArtist != null || d.title.isNotBlank()) 0.85f else 0.55f
                    "PDF_INFO" -> if (d.authorOrArtist != null) 0.75f else 0.55f
                    else -> 0.55f
                }
                Triple(d, byExt, conf)
            }
            "COMIC" -> {
                val lower = srcName.lowercase()
                val hasComicInfo = lower.endsWith(".cbz") || lower.endsWith(".cbr")
                val d = if (hasComicInfo) deriveMetadataForComicArchive(context, child.uri, srcName) else deriveMetadataFromName(srcName)
                Triple(d, if (hasComicInfo) "COMICINFO" else "FILENAME", if (hasComicInfo) 0.8f else 0.55f)
            }
            else -> Triple(deriveMetadataFromName(srcName), "FILENAME", 0.55f)
        }

        val reasons = mutableListOf<String>()
        var confidence = confidenceBase

        if (derived.title.replace(" ", "").length >= 18 && !derived.title.contains(" ")) {
            reasons += "Title has no spaces (may need manual spacing)"
            confidence = minOf(confidence, 0.5f)
        }
        if ((mediaType == "BOOK" || mediaType == "COMIC") && derived.authorOrArtist.isNullOrBlank()) {
            reasons += "Missing author/creator"
            confidence = minOf(confidence, 0.55f)
        }
        if (metadataSource == "FILENAME") {
            reasons += "Derived from filename"
            confidence = minOf(confidence, 0.55f)
        }

        val ext = srcName.substringAfterLast('.', "").lowercase()
        val safeTitle = fileNameSanitizer.sanitizeFileNamePermissive(derived.title).ifBlank { "Unknown" }
        val safeAuthor = derived.authorOrArtist?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
        val safeAlbum = derived.album?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }
        val safeSeries = derived.series?.let { fileNameSanitizer.sanitizeFileNamePermissive(it).ifBlank { "Unknown" } }

        val (destSegments, outputFileName) = when (mediaType) {
            "BOOK" -> {
                val segments = when (options.profile) {
                    ImportSortProfile.BOOKS_FLAT -> listOf("Books")
                    ImportSortProfile.BOOKS_AUTHOR_TITLE -> listOf("Books", safeAuthor ?: "Unknown Author")
                    else -> buildList {
                        add("Books")
                        add(safeAuthor ?: "Unknown Author")
                        safeSeries?.let { add(it) }
                    }
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
            "COMIC" -> {
                val segments = when (options.profile) {
                    ImportSortProfile.COMICS_ALWAYS_SERIES_FOLDER -> listOf("Comics", safeSeries ?: "Unknown Series")
                    ImportSortProfile.COMICS_SINGLETONS_TO_ROOT -> listOf("Comics", safeSeries ?: "Unknown Series") // singleton adjustment happens post-pass
                    else -> listOf("Comics", safeSeries ?: "Unknown Series")
                }
                segments to srcName
            }
            "DOCUMENT" -> listOf("Documents", ext.ifBlank { "unknown" }.uppercase(Locale.ROOT)) to srcName
            else -> listOf("Other") to srcName
        }

        out += ImportPlanItem(
            sourceUri = child.uri.toString(),
            sourceDisplayName = srcName,
            mediaType = mediaType,
            title = derived.title,
            authorOrArtist = derived.authorOrArtist,
            album = derived.album,
            series = derived.series,
            trackNumber = derived.trackNumber,
            durationMs = derived.durationMs,
            metadataSource = metadataSource,
            confidence = confidence,
            reasons = reasons,
            destSegments = destSegments,
            outputFileName = outputFileName,
            fileSize = child.length()
        )
    }
}

