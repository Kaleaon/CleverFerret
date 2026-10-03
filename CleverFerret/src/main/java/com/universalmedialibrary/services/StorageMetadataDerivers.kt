package com.universalmedialibrary.services

import android.content.Context
import android.net.Uri

internal fun determineMediaType(fileName: String): MediaType? {
    return importClassifier.determineMediaType(fileName)
}

internal fun determineMediaTypeName(fileName: String): String {
    return importClassifier.determineMediaTypeName(fileName)
}

internal fun deriveMetadataFromName(fileName: String): DerivedMetadata {
    val base = fileName.substringBeforeLast('.').trim()
    val cleanedByFilebot = filebotDataService.stripFilebotNoise(base)
    val normalized = cleanedByFilebot
        .replace("—", "-")
        .replace("–", "-")
        .replace("_", " ")
        .replace(Regex("\\s+"), " ")
        .trim()
    val cleaned = normalized
        .replace(Regex("\\s*\\[[^\\]]*]\\s*"), " ")
        .replace(Regex("\\s*\\([^)]*\\)\\s*"), " ")
        .replace(Regex("\\s+"), " ")
        .trim()

    // "Title by Author"
    Regex("^(.*)\\s+by\\s+(.+)$", RegexOption.IGNORE_CASE).find(cleaned)?.let { m ->
        val title = m.groupValues.getOrNull(1)?.trim().orEmpty()
        val author = m.groupValues.getOrNull(2)?.trim().orEmpty()
        if (title.isNotBlank() && author.isNotBlank()) {
            return DerivedMetadata(title = title, authorOrArtist = author)
        }
    }

    // Split on common separators
    val parts = cleaned.split(" - ").map { it.trim() }.filter { it.isNotBlank() }
    if (parts.size < 2) return DerivedMetadata(title = cleaned.ifBlank { base })

    val left = parts.first()
    val right = parts.drop(1).joinToString(" - ")

    val leftAuthorScore = scoreAsAuthor(left)
    val rightAuthorScore = scoreAsAuthor(right)
    val leftTitleScore = scoreAsTitle(left)
    val rightTitleScore = scoreAsTitle(right)

    val authorIsLeft = when {
        leftAuthorScore != rightAuthorScore -> leftAuthorScore > rightAuthorScore
        leftTitleScore != rightTitleScore -> leftTitleScore < rightTitleScore
        else -> true // default: "Author - Title"
    }

    return if (authorIsLeft) {
        DerivedMetadata(title = right, authorOrArtist = left)
    } else {
        DerivedMetadata(title = left, authorOrArtist = right)
    }
}

internal fun scoreAsAuthor(value: String): Int {
    var score = 0
    val v = value.trim()
    if (v.contains(",")) score += 2 // "Last, First"
    if (v.startsWith("by ", ignoreCase = true)) score += 2
    val words = v.split(" ").filter { it.isNotBlank() }
    if (words.size in 2..4 && words.all { it.firstOrNull()?.isUpperCase() == true }) score += 1
    if (v.any { it.isDigit() }) score -= 1
    if (Regex("\\b(vol|volume|book|chapter|part)\\b", RegexOption.IGNORE_CASE).containsMatchIn(v)) score -= 1
    return score
}

internal fun scoreAsTitle(value: String): Int {
    var score = 0
    val v = value.trim()
    val words = v.split(" ").filter { it.isNotBlank() }
    if (words.size >= 5) score += 1
    if (v.contains(":")) score += 1
    if (v.any { it.isDigit() }) score += 1
    if (Regex("\\b(vol|volume|book|chapter|part)\\b", RegexOption.IGNORE_CASE).containsMatchIn(v)) score += 1
    return score
}

internal fun deriveMetadataForAudio(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
    val retriever = MediaMetadataRetriever()
    return try {
        retriever.setDataSource(context, uri)
        val title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE)
            ?.takeIf { it.isNotBlank() }
            ?: fallbackName.substringBeforeLast('.')
        val artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST)
            ?.takeIf { it.isNotBlank() }
        val album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM)
            ?.takeIf { it.isNotBlank() }
        val track = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)
            ?.split("/", "-", "\\")?.firstOrNull()?.trim()?.toIntOrNull()
        val duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION)?.toLongOrNull()
        DerivedMetadata(title = title, authorOrArtist = artist, album = album, trackNumber = track, durationMs = duration)
    } catch (_: Exception) {
        deriveMetadataFromName(fallbackName)
    } finally {
        runCatching { retriever.release() }
    }
}

internal fun deriveMetadataForBook(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
    val lower = fallbackName.lowercase()
    return when {
        lower.endsWith(".epub") -> deriveMetadataForEpub(context, uri, fallbackName)
        lower.endsWith(".pdf") -> deriveMetadataForPdf(context, uri, fallbackName)
        else -> deriveMetadataFromName(fallbackName)
    }
}

internal fun deriveMetadataForEpub(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
    // Parse META-INF/container.xml -> OPF -> dc:title + dc:creator + calibre series
    return try {
        val entries = mutableMapOf<String, ByteArray>()
        context.contentResolver.openInputStream(uri).use { input ->
            if (input == null) return@use
            ZipInputStream(input).use { zis ->
                while (true) {
                    val entry = zis.nextEntry ?: break
                    if (entry.isDirectory) continue
                    val name = entry.name
                    if (name.equals("META-INF/container.xml", ignoreCase = true) ||
                        name.endsWith(".opf", ignoreCase = true)
                    ) {
                        val baos = ByteArrayOutputStream()
                        val buf = ByteArray(8192)
                        var n: Int
                        while (zis.read(buf).also { n = it } > 0) {
                            baos.write(buf, 0, n)
                        }
                        entries[name] = baos.toByteArray()
                    }
                }
            }
        }

        val containerBytes = entries.entries.firstOrNull { it.key.equals("META-INF/container.xml", ignoreCase = true) }?.value
        val opfPath = containerBytes?.let { parseEpubOpfPath(it) }

        val opfBytes = when {
            opfPath != null -> entries[opfPath]
            else -> entries.entries.firstOrNull { it.key.endsWith(".opf", ignoreCase = true) }?.value
        }

        if (opfBytes != null) {
            val parsed = parseOpfMetadata(opfBytes)
            val title = parsed.title?.takeIf { it.isNotBlank() } ?: fallbackName.substringBeforeLast('.')
            val author = parsed.creator?.takeIf { it.isNotBlank() }
            val series = parsed.series?.takeIf { it.isNotBlank() }

            // If OPF is missing/odd, fall back to filename heuristics.
            val fallback = deriveMetadataFromName(fallbackName)
            return DerivedMetadata(
                title = title.ifBlank { fallback.title },
                authorOrArtist = author ?: fallback.authorOrArtist,
                series = series ?: fallback.series
            )
        }

        deriveMetadataFromName(fallbackName)
    } catch (_: Exception) {
        deriveMetadataFromName(fallbackName)
    }
}

internal fun parseEpubOpfPath(containerXml: ByteArray): String? {
    return try {
        val parser = Xml.newPullParser()
        parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false)
        parser.setInput(containerXml.inputStream(), null)
        var event = parser.eventType
        while (event != XmlPullParser.END_DOCUMENT) {
            if (event == XmlPullParser.START_TAG && parser.name.equals("rootfile", ignoreCase = true)) {
                val fullPath = parser.getAttributeValue(null, "full-path")
                if (!fullPath.isNullOrBlank()) return fullPath
            }
            event = parser.next()
        }
        null
    } catch (_: Exception) {
        null
    }
}

internal fun parseOpfMetadata(opfXml: ByteArray): OpfParsed {
    var title: String? = null
    var creator: String? = null
    var series: String? = null
    return try {
        val parser = Xml.newPullParser()
        parser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false)
        parser.setInput(opfXml.inputStream(), null)
        var event = parser.eventType
        var currentTag: String? = null
        while (event != XmlPullParser.END_DOCUMENT) {
            when (event) {
                XmlPullParser.START_TAG -> {
                    currentTag = parser.name
                    // calibre series is often stored as <meta name="calibre:series" content="X"/>
                    if (parser.name.equals("meta", ignoreCase = true)) {
                        val nameAttr = parser.getAttributeValue(null, "name")
                        if (nameAttr.equals("calibre:series", ignoreCase = true)) {
                            series = parser.getAttributeValue(null, "content")
                        }
                    }
                }
                XmlPullParser.TEXT -> {
                    val text = parser.text?.trim().orEmpty()
                    if (text.isNotBlank() && currentTag != null) {
                        val tag = currentTag!!.lowercase()
                        if (title.isNullOrBlank() && tag.endsWith("title")) title = text
                        if (creator.isNullOrBlank() && (tag.endsWith("creator") || tag.endsWith("author"))) creator = text
                    }
                }
                XmlPullParser.END_TAG -> currentTag = null
            }
            event = parser.next()
        }
        OpfParsed(title = title, creator = creator, series = series)
    } catch (_: Exception) {
        OpfParsed()
    }
}

internal fun deriveMetadataForPdf(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
    // Best-effort: PDFs often store /Title(...) and /Author(...) in the info dictionary.
    // This is not guaranteed (may be compressed/encoded), but it's a useful heuristic.
    return try {
        val maxBytes = 512 * 1024 // 512KB
        val buf = ByteArray(8192)
        val baos = ByteArrayOutputStream()
        context.contentResolver.openInputStream(uri).use { input ->
            if (input == null) return@use
            var remaining = maxBytes
            while (remaining > 0) {
                val toRead = minOf(buf.size, remaining)
                val n = input.read(buf, 0, toRead)
                if (n <= 0) break
                baos.write(buf, 0, n)
                remaining -= n
            }
        }
        val text = baos.toByteArray().toString(Charsets.ISO_8859_1)
        val title = extractPdfInfoField(text, "Title")
        val author = extractPdfInfoField(text, "Author")
        val fallback = deriveMetadataFromName(fallbackName)
        DerivedMetadata(
            title = title?.ifBlank { null } ?: fallback.title,
            authorOrArtist = author?.ifBlank { null } ?: fallback.authorOrArtist
        )
    } catch (_: Exception) {
        deriveMetadataFromName(fallbackName)
    }
}

internal fun extractPdfInfoField(pdfText: String, key: String): String? {
    // Matches: /Title (value) or /Title(value)
    val regex = Regex("/$key\\s*\\(([^)]*)\\)")
    val raw = regex.find(pdfText)?.groupValues?.getOrNull(1) ?: return null
    return raw
        .replace("\\\\", "\\")
        .replace("\\(", "(")
        .replace("\\)", ")")
        .trim()
        .takeIf { it.isNotBlank() }
}

internal fun deriveMetadataForComicArchive(context: Context, uri: Uri, fallbackName: String): DerivedMetadata {
    // Prefer shared utility which supports CBZ and CBR.
    val info = runCatching { ComicArchiveUtils.extractComicInfo(context, uri, fallbackName) }.getOrNull()
    if (info != null) {
        val title = info.title?.takeIf { it.isNotBlank() } ?: fallbackName.substringBeforeLast('.')
        return DerivedMetadata(
            title = title,
            authorOrArtist = info.writer,
            series = info.series
        )
    }
    // Fallback: CBZ stream scan (kept for resilience)
    return try {
        context.contentResolver.openInputStream(uri).use { input ->
            if (input == null) return@use null
            ZipInputStream(input).use { zis ->
                var entry = zis.nextEntry
                while (entry != null) {
                    if (!entry.isDirectory && entry.name.endsWith("ComicInfo.xml", ignoreCase = true)) {
                        val parsed = ComicInfoParser.parse(zis)
                        val title = parsed.title?.takeIf { it.isNotBlank() } ?: fallbackName.substringBeforeLast('.')
                        return DerivedMetadata(
                            title = title,
                            authorOrArtist = parsed.writer,
                            series = parsed.series,
                        )
                    }
                    entry = zis.nextEntry
                }
                null
            }
        } ?: deriveMetadataFromName(fallbackName)
    } catch (_: Exception) {
        deriveMetadataFromName(fallbackName)
    }
}

