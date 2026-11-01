package com.universalmedialibrary.services.tagging

import android.media.MediaMetadataRetriever
import android.util.Log
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.parsers.ParserFactory
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.comic.ComicInfoHandler
import com.universalmedialibrary.services.metadata.EmbeddedTagExtractor
import com.universalmedialibrary.utils.media.AudioMetadataUtils
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.apache.tika.metadata.Metadata
import org.apache.tika.parser.AutoDetectParser
import org.apache.tika.parser.ParseContext
import org.apache.tika.sax.BodyContentHandler
import org.jsoup.Jsoup
import java.io.File
import java.io.FileInputStream
import java.util.Locale
import java.util.zip.ZipFile
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Extracts format-specific tags and genres from underlying media files (books, comics,
 * movies/videos, audio/music) and normalizes them for unified tag indexing.
 */
@Singleton
class MediaFormatTagExtractor @Inject constructor(
    private val comicInfoHandler: ComicInfoHandler,
    private val embeddedTagExtractor: EmbeddedTagExtractor
) {
    companion object {
        private const val TAG = "MediaFormatTagExtractor"
        const val MAX_TAG_LENGTH = 64
        private val DELIMITERS = charArrayOf(',', ';', '/', '|', '\n', '\r')
    }

    /**
     * Extracts raw genre and tag strings from the media item file and returns
     * normalized, deduplicated tag strings that do not exceed 64 characters.
     */
    suspend fun extractTags(mediaItem: MediaItem): List<String> = withContext(Dispatchers.IO) {
        val file = File(mediaItem.filePath)
        if (!file.exists() || !file.canRead()) {
            return@withContext emptyList()
        }

        val rawTags = try {
            when (mediaItem.mediaType.uppercase(Locale.ROOT)) {
                "BOOK", "DOCUMENT" -> extractBookTags(file)
                "COMIC" -> extractComicTags(file)
                "MOVIE", "VIDEO" -> extractVideoTags(file)
                "MUSIC", "MUSIC_TRACK", "AUDIO", "AUDIOBOOK" -> extractAudioTags(file)
                else -> extractGenericTags(file)
            }
        } catch (e: Exception) {
            Log.w(TAG, "Tag extraction error for ${file.name}: ${e.message}")
            emptyList()
        }

        normalizeTags(rawTags)
    }

    /**
     * Normalizes a collection of raw tag strings:
     * - Splits on delimiters (comma, semicolon, slash, pipe, newline)
     * - Trims whitespace
     * - Filters empty strings
     * - Restricts tag length to at most 64 characters
     * - Deduplicates tags case-insensitively while preserving original casing
     */
    fun normalizeTags(rawTags: List<String?>): List<String> {
        return rawTags
            .filterNotNull()
            .flatMap { it.split(*DELIMITERS) }
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .map { if (it.length > MAX_TAG_LENGTH) it.take(MAX_TAG_LENGTH).trim() else it }
            .filter { it.isNotEmpty() }
            .distinctBy { it.lowercase(Locale.getDefault()) }
    }

    private suspend fun extractBookTags(file: File): List<String> {
        val extension = file.extension.lowercase(Locale.ROOT)
        return when (extension) {
            "epub" -> extractEpubTags(file)
            "pdf" -> extractPdfTags(file)
            "cbz", "cbr", "cb7", "cbt" -> extractComicTags(file)
            else -> extractDocumentParserTags(file)
        }
    }

    private fun extractEpubTags(file: File): List<String> {
        val tags = mutableListOf<String>()
        try {
            ZipFile(file).use { zip ->
                val opfEntry = findEpubOpfEntry(zip) ?: return emptyList()
                val opfContent = zip.getInputStream(opfEntry).bufferedReader().readText()
                val opfDoc = Jsoup.parse(opfContent, "", org.jsoup.parser.Parser.xmlParser())

                // Dublin Core subjects
                val subjects = opfDoc.select("dc|subject, dc\\:subject, subject").map { it.text().trim() }
                tags.addAll(subjects.filter { it.isNotEmpty() })

                // Calibre metadata tags
                val calibreTags = opfDoc.select("meta[property=calibre:tags], meta[name=calibre:user_metadata:tags]")
                    .mapNotNull { it.attr("content").takeIf(String::isNotBlank) ?: it.text().takeIf(String::isNotBlank) }
                tags.addAll(calibreTags)
            }
        } catch (e: Exception) {
            Log.w(TAG, "EPUB tag extraction failed for ${file.name}: ${e.message}")
        }
        return tags
    }

    private fun findEpubOpfEntry(zip: ZipFile): java.util.zip.ZipEntry? {
        val containerEntry = zip.getEntry("META-INF/container.xml")
        if (containerEntry != null) {
            try {
                val containerContent = zip.getInputStream(containerEntry).bufferedReader().readText()
                val containerDoc = Jsoup.parse(containerContent, "", org.jsoup.parser.Parser.xmlParser())
                val opfPath = containerDoc.select("rootfile").attr("full-path")
                if (opfPath.isNotEmpty()) {
                    val entry = zip.getEntry(opfPath)
                    if (entry != null) return entry
                }
            } catch (_: Exception) {}
        }
        return zip.entries().asSequence().firstOrNull { it.name.endsWith(".opf", ignoreCase = true) }
    }

    private fun extractPdfTags(file: File): List<String> {
        val tags = mutableListOf<String>()
        try {
            val metadata = Metadata()
            val parser = AutoDetectParser()
            FileInputStream(file).use { fis ->
                parser.parse(fis, BodyContentHandler(-1), metadata, ParseContext())
            }
            metadata.get("subject")?.let { tags.add(it) }
            metadata.get("keywords")?.let { tags.add(it) }
            metadata.get("dc:subject")?.let { tags.add(it) }
            metadata.get("pdf:docinfo:keywords")?.let { tags.add(it) }
            metadata.get("meta:keyword")?.let { tags.add(it) }
        } catch (e: Exception) {
            Log.d(TAG, "PDF tag extraction failed for ${file.name}: ${e.message}")
        }
        return tags
    }

    private suspend fun extractDocumentParserTags(file: File): List<String> {
        return try {
            if (ParserFactory.isSupported(file.name)) {
                val selection = ParserFactory.selectParser(file.name)
                val doc = selection.parser.parse(file.absolutePath)
                listOfNotNull(doc.metadata.subject)
            } else {
                emptyList()
            }
        } catch (e: Exception) {
            emptyList()
        }
    }

    private fun extractComicTags(file: File): List<String> {
        val tags = mutableListOf<String>()
        val extension = file.extension.lowercase(Locale.ROOT)
        if (extension == "cbz" || extension == "zip") {
            try {
                val comicInfo = comicInfoHandler.readFromCBZ(file.absolutePath)
                if (comicInfo != null) {
                    comicInfo.genre?.let { tags.add(it) }
                    comicInfo.tags?.let { tags.add(it) }
                }
            } catch (e: Exception) {
                Log.w(TAG, "ComicInfo extraction failed for ${file.name}: ${e.message}")
            }

            if (tags.isEmpty()) {
                try {
                    ZipFile(file).use { zip ->
                        val entry = zip.entries().asSequence().firstOrNull {
                            it.name.equals("ComicInfo.xml", ignoreCase = true) ||
                                it.name.endsWith("/ComicInfo.xml", ignoreCase = true)
                        }
                        if (entry != null) {
                            val xml = zip.getInputStream(entry).bufferedReader().readText()
                            val doc = Jsoup.parse(xml, "", org.jsoup.parser.Parser.xmlParser())
                            doc.select("Genre").firstOrNull()?.text()?.takeIf { it.isNotBlank() }?.let { tags.add(it) }
                            doc.select("Tags").firstOrNull()?.text()?.takeIf { it.isNotBlank() }?.let { tags.add(it) }
                        }
                    }
                } catch (_: Exception) {}
            }
        }
        return tags
    }

    private suspend fun extractVideoTags(file: File): List<String> {
        val tags = mutableListOf<String>()
        // First try EmbeddedTagExtractor which handles FFmpeg with retriever fallback
        try {
            val universalMetadata = embeddedTagExtractor.extractMetadata(file.absolutePath)
            universalMetadata.genre?.let { tags.add(it) }
        } catch (e: Exception) {
            Log.d(TAG, "EmbeddedTagExtractor failed for video ${file.name}: ${e.message}")
        }

        // Secondary fallback via direct MediaMetadataRetriever if needed
        if (tags.isEmpty()) {
            val retriever = MediaMetadataRetriever()
            try {
                retriever.setDataSource(file.absolutePath)
                val genre = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE)
                if (!genre.isNullOrBlank()) {
                    tags.add(genre)
                }
            } catch (_: Exception) {
            } finally {
                try { retriever.release() } catch (_: Throwable) {}
            }
        }
        return tags
    }

    private fun extractAudioTags(file: File): List<String> {
        val tags = mutableListOf<String>()
        try {
            val audioMeta = AudioMetadataUtils.extractAudioMetadata(file)
            audioMeta.genre?.let { tags.add(it) }
        } catch (e: Exception) {
            Log.w(TAG, "Audio tag extraction failed for ${file.name}: ${e.message}")
        }
        return tags
    }

    private suspend fun extractGenericTags(file: File): List<String> {
        val extension = file.extension.lowercase(Locale.ROOT)
        return when {
            MediaScannerService.BOOK_EXTENSIONS.contains(extension) -> extractBookTags(file)
            MediaScannerService.COMIC_EXTENSIONS.contains(extension) -> extractComicTags(file)
            MediaScannerService.VIDEO_EXTENSIONS.contains(extension) -> extractVideoTags(file)
            MediaScannerService.AUDIO_EXTENSIONS.contains(extension) -> extractAudioTags(file)
            else -> emptyList()
        }
    }
}
