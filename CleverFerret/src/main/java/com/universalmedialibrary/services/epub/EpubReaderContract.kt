package com.universalmedialibrary.services.epub

import com.universalmedialibrary.services.media.DocumentContent
import com.universalmedialibrary.services.media.DocumentPage
import com.universalmedialibrary.services.media.DocumentType

data class EpubReaderState(
    val isLoading: Boolean = false,
    val isLoaded: Boolean = false,
    val bookTitle: String = "",
    val bookAuthor: String = "",
    val totalChapters: Int = 0,
    val currentChapter: Int = 0,
    val chapters: List<EpubChapter> = emptyList(),
    val currentContent: String = "",
    val error: String? = null
) {
    val hasError: Boolean get() = error != null
    val canGoNext: Boolean get() = isLoaded && currentChapter < totalChapters - 1
    val canGoPrevious: Boolean get() = isLoaded && currentChapter > 0
    val progress: Float get() = if (totalChapters > 0) (currentChapter + 1).toFloat() / totalChapters else 0f
}

data class EpubChapter(
    val index: Int,
    val title: String,
    val content: String,
    val resourceId: String
)



data class EpubBook(
    val metadata: SimpleEpubMetadata,
    val chapters: List<EpubChapter>
)

data class ManifestItem(
    val id: String,
    val href: String,
    val mediaType: String
)

data class SimpleTocItem(
    val title: String,
    val src: String
)

data class EpubSearchResult(
    val chapterIndex: Int,
    val chapterTitle: String,
    val context: String,
    val position: Int
)

data class SimpleEpubMetadata(
    val title: String,
    val authors: List<String>,
    val description: String,
    val language: String,
    val publisher: String,
    val publishDate: String,
    val isbn: String,
    val coverImageData: ByteArray?
)

fun EpubReaderState.toDocumentContent(): DocumentContent = DocumentContent(
    type = DocumentType.EPUB,
    pages = chapters.mapIndexed { index, chapter ->
        DocumentPage(
            pageNumber = index + 1,
            content = chapter.content,
            title = chapter.title
        )
    },
    title = bookTitle
)

object EpubChapterNavigator {
    fun nextIndex(state: EpubReaderState): Int? =
        if (state.currentChapter < state.totalChapters - 1) state.currentChapter + 1 else null

    fun previousIndex(state: EpubReaderState): Int? =
        if (state.currentChapter > 0) state.currentChapter - 1 else null

    fun validIndex(state: EpubReaderState, candidate: Int): Int? =
        if (candidate in 0 until state.totalChapters) candidate else null
}
