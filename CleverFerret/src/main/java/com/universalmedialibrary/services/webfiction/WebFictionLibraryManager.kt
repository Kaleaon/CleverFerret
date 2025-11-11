package com.universalmedialibrary.services.webfiction

import android.content.Context
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.repository.MediaRepository
import com.universalmedialibrary.services.contentcreation.SimpleEpubCreator
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.withContext
import java.io.File
import java.text.Normalizer
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Handles converting downloaded web fiction stories into EPUBs and importing them
 * into the CleverFerret media library.
 */
@Singleton
class WebFictionLibraryManager @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaRepository: MediaRepository,
    private val libraryRepository: LibraryRepository
) {

    companion object {
        private const val DEFAULT_LIBRARY_NAME = "Web Fiction"
        private const val LIBRARY_TYPE_BOOK = "BOOK"
        private const val DEFAULT_LANGUAGE = "en"
    }

    data class ImportResult(
        val success: Boolean,
        val message: String,
        val mediaItemId: Long? = null,
        val epubPath: String? = null,
        val alreadyExists: Boolean = false
    )

    /**
     * Convert the provided story and chapters into an EPUB file and import it into the user's
     * Web Fiction library. When a story with the same generated filename already exists we
     * update the EPUB contents and metadata instead of creating a duplicate entry.
     */
    suspend fun importStory(story: WebFictionStory): ImportResult = withContext(Dispatchers.IO) {
        try {
            if (story.chapters.isEmpty()) {
                return@withContext ImportResult(
                    success = false,
                    message = "No chapters returned for ${story.title}. Unable to create EPUB."
                )
            }

            val library = ensureLibrary()
            val libraryDir = File(library.path).apply { if (!exists()) mkdirs() }

            val sanitizedTitle = sanitizeFilename("${story.title}-${story.id.ifEmpty { story.url }}")
            val epubFile = File(libraryDir, "$sanitizedTitle.epub")

            // Build EPUB metadata and chapters
            val epubCreator = SimpleEpubCreator()
            val metadata = SimpleEpubCreator.EpubMetadata(
                title = story.title,
                author = story.author ?: "Unknown Author",
                description = buildDescription(story),
                language = story.language ?: DEFAULT_LANGUAGE,
                publisher = story.site ?: "CleverFerret",
                identifier = "urn:cf:webfiction:${story.id.ifEmpty { story.url.hashCode().toString() }}"
            )

            val chapterList = story.chapters.mapIndexed { index, chapter ->
                val chapterTitle = chapter.title?.takeIf { it.isNotBlank() }
                    ?: "Chapter ${index + 1}"
                SimpleEpubCreator.Chapter(
                    title = chapterTitle,
                    id = sanitizeFilename("${story.id}-${index + 1}"),
                    content = """
                        <div class="chapter-content">
                            ${chapter.content}
                        </div>
                    """.trimIndent()
                )
            }

            // Always regenerate the EPUB so updates are reflected.
            epubCreator.createEpub(
                outputFile = epubFile,
                metadata = metadata,
                chapters = chapterList
            )

            val existingItem = mediaRepository.getMediaItemByPath(epubFile.absolutePath)
            val summary = story.description?.takeIf { it.isNotBlank() }
                ?: buildDefaultSummary(story)
            val metadataSource = story.site ?: "Web Fiction"
            val externalId = story.id.ifEmpty { story.url }

            if (existingItem != null) {
                // Update the existing media item metadata
                val updatedItem = existingItem.copy(
                    fileSize = epubFile.length(),
                    lastModified = System.currentTimeMillis(),
                    hasMetadata = true
                )
                mediaRepository.updateMediaItem(updatedItem)

                mediaRepository.saveCommonMetadata(
                    MetadataCommon(
                        itemId = existingItem.itemId,
                        title = story.title,
                        sortTitle = story.title,
                        summary = summary,
                        language = story.language ?: DEFAULT_LANGUAGE,
                        metadataSource = metadataSource,
                        externalId = externalId,
                        isDownloaded = true
                    )
                )

                return@withContext ImportResult(
                    success = true,
                    message = "Updated ${story.title} in ${library.name}.",
                    mediaItemId = existingItem.itemId,
                    epubPath = epubFile.absolutePath,
                    alreadyExists = true
                )
            }

            val mediaItemId = mediaRepository.createMediaItem(
                MediaItem(
                    libraryId = library.libraryId,
                    filePath = epubFile.absolutePath,
                    fileName = epubFile.name,
                    fileExtension = "epub",
                    fileSize = epubFile.length(),
                    mediaType = LIBRARY_TYPE_BOOK,
                    mimeType = "application/epub+zip",
                    hasMetadata = true
                )
            )

            mediaRepository.saveCommonMetadata(
                MetadataCommon(
                    itemId = mediaItemId,
                    title = story.title,
                    sortTitle = story.title,
                    summary = summary,
                    language = story.language ?: DEFAULT_LANGUAGE,
                    metadataSource = metadataSource,
                    externalId = externalId,
                    isDownloaded = true
                )
            )

            ImportResult(
                success = true,
                message = "Added ${story.title} to ${library.name}.",
                mediaItemId = mediaItemId,
                epubPath = epubFile.absolutePath,
                alreadyExists = false
            )
        } catch (t: Throwable) {
            ImportResult(
                success = false,
                message = t.message ?: "Failed to import story."
            )
        }
    }

    private suspend fun ensureLibrary(): Library {
        val existing = libraryRepository
            .getLibrariesByType(LIBRARY_TYPE_BOOK)
            .first()
            .firstOrNull { it.name == DEFAULT_LIBRARY_NAME }

        if (existing != null) {
            val dir = File(existing.path)
            if (!dir.exists()) {
                dir.mkdirs()
            }
            return existing
        }

        val baseDir = context.getExternalFilesDir(null) ?: context.filesDir
        val libraryDir = File(baseDir, "webfiction_library").apply {
            if (!exists()) mkdirs()
        }

        val library = Library(
            name = DEFAULT_LIBRARY_NAME,
            type = LIBRARY_TYPE_BOOK,
            path = libraryDir.absolutePath,
            isActive = true,
            lastScanned = System.currentTimeMillis()
        )

        val libraryId = libraryRepository.createLibrary(library)
        return library.copy(libraryId = libraryId)
    }

    private fun buildDescription(story: WebFictionStory): String {
        val sb = StringBuilder()
        if (!story.description.isNullOrBlank()) {
            sb.append(story.description.trim())
        }
        if (story.tags.isNotEmpty()) {
            if (sb.isNotEmpty()) sb.append("\n\n")
            sb.append("Tags: ${story.tags.joinToString(", ")}")
        }
        if (!story.site.isNullOrBlank()) {
            if (sb.isNotEmpty()) sb.append("\n")
            sb.append("Source: ${story.site}")
        }
        if (sb.isNotEmpty()) {
            return sb.toString()
        }
        return "Imported via CleverFerret universal tag browser from ${story.url}"
    }

    private fun buildDefaultSummary(story: WebFictionStory): String {
        val summaryParts = mutableListOf<String>()
        story.genre?.let { summaryParts.add("Genre: $it") }
        if (story.tags.isNotEmpty()) {
            summaryParts.add("Tags: ${story.tags.joinToString(", ")}")
        }
        summaryParts.add("Source: ${story.site ?: story.url}")
        return summaryParts.joinToString(" • ")
    }

    private fun sanitizeFilename(value: String): String {
        var sanitized = Normalizer.normalize(value, Normalizer.Form.NFKD)
            .replace("[^a-zA-Z0-9._-]".toRegex(), "_")
            .replace("_+".toRegex(), "_")
        if (sanitized.length > 120) {
            sanitized = sanitized.takeLast(120)
        }
        return sanitized.trim('_')
    }
}
