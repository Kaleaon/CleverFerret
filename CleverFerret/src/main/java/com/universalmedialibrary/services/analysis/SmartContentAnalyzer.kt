package com.universalmedialibrary.services.analysis

import android.content.Context
import android.graphics.Bitmap
import android.net.Uri
import com.universalmedialibrary.services.analysis.ocr.OCRService
import com.universalmedialibrary.services.analysis.nlp.MetadataExtractor
import com.universalmedialibrary.services.analysis.fingerprint.ContentFingerprinter
import com.universalmedialibrary.services.analysis.classification.ContentClassifier
import com.universalmedialibrary.services.analysis.comparison.ArchiveComparator
import com.universalmedialibrary.ui.viewer.MediaViewerManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Smart Content Analyzer - The brain of CleverFerret's intelligent media library
 *
 * Capabilities:
 * - OCR text extraction from first few pages
 * - NLP-powered metadata extraction
 * - Content fingerprinting for duplicate detection
 * - AI-powered classification (genre, language, rating)
 * - Comparison against known archives
 * - Automatic library organization
 */
@Singleton
class SmartContentAnalyzer @Inject constructor(
    @ApplicationContext private val context: Context,
    private val mediaViewerManager: MediaViewerManager,
    private val ocrService: OCRService,
    private val metadataExtractor: MetadataExtractor,
    private val contentFingerprinter: ContentFingerprinter,
    private val contentClassifier: ContentClassifier,
    private val archiveComparator: ArchiveComparator
) {

    /**
     * Comprehensive analysis of media content
     */
    suspend fun analyzeContent(uri: Uri): SmartAnalysisResult {
        return withContext(Dispatchers.IO) {
            try {
                val mediaInfo = mediaViewerManager.analyzeMedia(context, uri)

                when (mediaInfo.type) {
                    MediaViewerManager.MediaType.EBOOK,
                    MediaViewerManager.MediaType.DOCUMENT -> {
                        analyzeDocument(uri, mediaInfo)
                    }
                    MediaViewerManager.MediaType.VIDEO -> {
                        analyzeVideo(uri, mediaInfo)
                    }
                    MediaViewerManager.MediaType.AUDIO -> {
                        analyzeAudio(uri, mediaInfo)
                    }
                    MediaViewerManager.MediaType.COMIC -> {
                        analyzeComic(uri, mediaInfo)
                    }
                    else -> {
                        ContentAnalysisResult.unsupported(uri.toString())
                    }
                }
            } catch (e: Exception) {
                ContentAnalysisResult.error(uri.toString(), e.message ?: "Analysis failed")
            }
        }
    }

    private suspend fun analyzeDocument(
        uri: Uri,
        mediaInfo: MediaViewerManager.MediaInfo
    ): SmartAnalysisResult {
        val analysisSteps = mutableListOf<String>()

        // Step 1: Extract text from first few pages
        analysisSteps.add("Extracting text content...")
        val extractedText = when (mediaInfo.documentFormat) {
            MediaViewerManager.DocumentFormat.PDF -> {
                ocrService.extractTextFromPDF(context, uri, maxPages = 5)
            }
            MediaViewerManager.DocumentFormat.EPUB -> {
                ocrService.extractTextFromEPUB(context, uri)
            }
            else -> {
                ocrService.extractTextFromDocument(context, uri)
            }
        }

        // Step 2: Create content fingerprint
        analysisSteps.add("Creating content fingerprint...")
        val fingerprint = contentFingerprinter.generateDocumentFingerprint(extractedText)

        // Step 3: Extract metadata using NLP
        analysisSteps.add("Analyzing metadata...")
        val extractedMetadata = metadataExtractor.extractMetadata(extractedText)

        // Step 4: Classify content
        analysisSteps.add("Classifying content...")
        val classification = contentClassifier.classifyDocument(extractedText)

        // Step 5: Compare against known archives
        analysisSteps.add("Comparing with known archives...")
        val archiveMatches = if (extractedMetadata.isbn != null) {
            archiveComparator.findByISBN(extractedMetadata.isbn!!)
        } else {
            archiveComparator.findByTitleAuthor(extractedMetadata.title, extractedMetadata.author)
        }

        // Step 6: Check for duplicates
        analysisSteps.add("Checking for duplicates...")
        val duplicates = contentFingerprinter.findDuplicates(fingerprint)

        return SmartAnalysisResult(
            uri = uri.toString(),
            mediaType = mediaInfo.type,
            success = true,
            extractedText = extractedText.take(2000), // First 2000 chars for preview
            extractedMetadata = extractedMetadata,
            contentFingerprint = fingerprint,
            classification = classification,
            archiveMatches = archiveMatches,
            duplicates = duplicates,
            analysisSteps = analysisSteps,
            confidence = calculateConfidence(extractedMetadata, archiveMatches),
            recommendedActions = generateRecommendations(extractedMetadata, archiveMatches, duplicates)
        )
    }

    private suspend fun analyzeVideo(
        uri: Uri,
        mediaInfo: MediaViewerManager.MediaInfo
    ): SmartAnalysisResult {
        val analysisSteps = mutableListOf<String>()

        // Step 1: Extract video metadata
        analysisSteps.add("Extracting video metadata...")
        val videoMetadata = metadataExtractor.extractVideoMetadata(context, uri)

        // Step 2: Create video fingerprint
        analysisSteps.add("Creating video fingerprint...")
        val fingerprint = contentFingerprinter.generateVideoFingerprint(context, uri)

        // Step 3: Classify video content
        analysisSteps.add("Classifying video content...")
        val classification = contentClassifier.classifyVideo(videoMetadata)

        // Step 4: Compare against video databases
        analysisSteps.add("Comparing with video databases...")
        val archiveMatches = archiveComparator.findVideoMatches(videoMetadata)

        return SmartAnalysisResult(
            uri = uri.toString(),
            mediaType = mediaInfo.type,
            success = true,
            extractedMetadata = videoMetadata,
            contentFingerprint = fingerprint,
            classification = classification,
            archiveMatches = archiveMatches,
            duplicates = contentFingerprinter.findDuplicates(fingerprint),
            analysisSteps = analysisSteps,
            confidence = calculateConfidence(videoMetadata, archiveMatches),
            recommendedActions = generateVideoRecommendations(videoMetadata, archiveMatches)
        )
    }

    private suspend fun analyzeAudio(
        uri: Uri,
        mediaInfo: MediaViewerManager.MediaInfo
    ): SmartAnalysisResult {
        val analysisSteps = mutableListOf<String>()

        // Step 1: Extract audio metadata
        analysisSteps.add("Extracting audio metadata...")
        val audioMetadata = metadataExtractor.extractAudioMetadata(context, uri)

        // Step 2: Create audio fingerprint
        analysisSteps.add("Creating audio fingerprint...")
        val fingerprint = contentFingerprinter.generateAudioFingerprint(context, uri)

        // Step 3: Classify audio content
        analysisSteps.add("Classifying audio content...")
        val classification = contentClassifier.classifyAudio(audioMetadata)

        // Step 4: Compare against music databases
        analysisSteps.add("Comparing with music databases...")
        val archiveMatches = archiveComparator.findAudioMatches(audioMetadata)

        return SmartAnalysisResult(
            uri = uri.toString(),
            mediaType = mediaInfo.type,
            success = true,
            extractedMetadata = audioMetadata,
            contentFingerprint = fingerprint,
            classification = classification,
            archiveMatches = archiveMatches,
            duplicates = contentFingerprinter.findDuplicates(fingerprint),
            analysisSteps = analysisSteps,
            confidence = calculateConfidence(audioMetadata, archiveMatches),
            recommendedActions = generateAudioRecommendations(audioMetadata, archiveMatches)
        )
    }

    private suspend fun analyzeComic(
        uri: Uri,
        mediaInfo: MediaViewerManager.MediaInfo
    ): SmartAnalysisResult {
        val analysisSteps = mutableListOf<String>()

        // Step 1: Extract comic metadata
        analysisSteps.add("Extracting comic metadata...")
        val comicMetadata = metadataExtractor.extractComicMetadata(context, uri)

        // Step 2: Analyze cover and first pages
        analysisSteps.add("Analyzing cover and content...")
        val coverAnalysis = contentClassifier.analyzeComicCover(context, uri)

        // Step 3: Create comic fingerprint
        analysisSteps.add("Creating comic fingerprint...")
        val fingerprint = contentFingerprinter.generateComicFingerprint(context, uri)

        // Step 4: Compare against comic databases
        analysisSteps.add("Comparing with comic databases...")
        val archiveMatches = archiveComparator.findComicMatches(comicMetadata)

        return SmartAnalysisResult(
            uri = uri.toString(),
            mediaType = mediaInfo.type,
            success = true,
            extractedMetadata = comicMetadata,
            contentFingerprint = fingerprint,
            classification = coverAnalysis,
            archiveMatches = archiveMatches,
            duplicates = contentFingerprinter.findDuplicates(fingerprint),
            analysisSteps = analysisSteps,
            confidence = calculateConfidence(comicMetadata, archiveMatches),
            recommendedActions = generateComicRecommendations(comicMetadata, archiveMatches)
        )
    }

    private fun calculateConfidence(
        metadata: ExtractedMetadata,
        archiveMatches: List<ArchiveMatch>
    ): Float {
        var confidence = 0.0f

        // Base confidence from extracted metadata quality
        if (metadata.title.isNotEmpty()) confidence += 0.3f
        if (metadata.author.isNotEmpty()) confidence += 0.2f
        if (metadata.isbn != null) confidence += 0.2f
        if (metadata.publishedDate != null) confidence += 0.1f
        if (metadata.publisher.isNotEmpty()) confidence += 0.1f

        // Boost confidence with archive matches
        if (archiveMatches.isNotEmpty()) {
            val bestMatch = archiveMatches.maxByOrNull { it.confidence }
            bestMatch?.let { confidence = (confidence + it.confidence) / 2 }
        }

        return confidence.coerceIn(0.0f, 1.0f)
    }

    private fun generateRecommendations(
        metadata: ExtractedMetadata,
        archiveMatches: List<ArchiveMatch>,
        duplicates: List<String>
    ): List<RecommendedAction> {
        val actions = mutableListOf<RecommendedAction>()

        // Metadata improvement suggestions
        if (metadata.title.isEmpty()) {
            actions.add(RecommendedAction.EXTRACT_TITLE_FROM_FILENAME)
        }

        if (metadata.author.isEmpty() && archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.USE_ARCHIVE_AUTHOR)
        }

        if (metadata.coverImageUrl.isEmpty() && archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.DOWNLOAD_COVER_IMAGE)
        }

        // Duplicate handling
        if (duplicates.isNotEmpty()) {
            actions.add(RecommendedAction.MERGE_DUPLICATES)
        }

        // Series detection
        if (archiveMatches.any { it.seriesName.isNotEmpty() }) {
            actions.add(RecommendedAction.CREATE_SERIES_COLLECTION)
        }

        // Genre classification
        if (metadata.genres.isEmpty() && archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.AUTO_CLASSIFY_GENRE)
        }

        return actions
    }

    private fun generateVideoRecommendations(
        metadata: ExtractedMetadata,
        archiveMatches: List<ArchiveMatch>
    ): List<RecommendedAction> {
        val actions = mutableListOf<RecommendedAction>()

        if (metadata.title.isEmpty()) {
            actions.add(RecommendedAction.EXTRACT_TITLE_FROM_FILENAME)
        }

        if (archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.DOWNLOAD_POSTER_IMAGE)
            actions.add(RecommendedAction.AUTO_CLASSIFY_GENRE)
        }

        return actions
    }

    private fun generateAudioRecommendations(
        metadata: ExtractedMetadata,
        archiveMatches: List<ArchiveMatch>
    ): List<RecommendedAction> {
        val actions = mutableListOf<RecommendedAction>()

        if (metadata.title.isEmpty()) {
            actions.add(RecommendedAction.EXTRACT_TITLE_FROM_FILENAME)
        }

        if (metadata.albumArt.isEmpty() && archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.DOWNLOAD_ALBUM_ART)
        }

        return actions
    }

    private fun generateComicRecommendations(
        metadata: ExtractedMetadata,
        archiveMatches: List<ArchiveMatch>
    ): List<RecommendedAction> {
        val actions = mutableListOf<RecommendedAction>()

        if (metadata.title.isEmpty()) {
            actions.add(RecommendedAction.EXTRACT_TITLE_FROM_FILENAME)
        }

        if (archiveMatches.isNotEmpty()) {
            actions.add(RecommendedAction.CREATE_SERIES_COLLECTION)
            actions.add(RecommendedAction.AUTO_CLASSIFY_GENRE)
        }

        return actions
    }

    /**
     * Apply recommended actions automatically
     */
    suspend fun applyRecommendedActions(
        result: SmartAnalysisResult,
        actions: List<RecommendedAction>
    ): SmartAnalysisResult {
        return withContext(Dispatchers.IO) {
            var updatedResult = result

            for (action in actions) {
                updatedResult = when (action) {
                    RecommendedAction.USE_ARCHIVE_AUTHOR -> {
                        val bestMatch = result.archiveMatches.maxByOrNull { it.confidence }
                        if (bestMatch != null) {
                            updatedResult.copy(
                                extractedMetadata = updatedResult.extractedMetadata.copy(
                                    author = bestMatch.author
                                )
                            )
                        } else updatedResult
                    }

                    RecommendedAction.DOWNLOAD_COVER_IMAGE -> {
                        val bestMatch = result.archiveMatches.maxByOrNull { it.confidence }
                        if (bestMatch?.coverImageUrl?.isNotEmpty() == true) {
                            updatedResult.copy(
                                extractedMetadata = updatedResult.extractedMetadata.copy(
                                    coverImageUrl = bestMatch.coverImageUrl
                                )
                            )
                        } else updatedResult
                    }

                    RecommendedAction.AUTO_CLASSIFY_GENRE -> {
                        val genres = result.archiveMatches.flatMap { it.genres }.distinct()
                        updatedResult.copy(
                            extractedMetadata = updatedResult.extractedMetadata.copy(
                                genres = genres
                            )
                        )
                    }

                    else -> updatedResult
                }
            }

            updatedResult
        }
    }
}

/**
 * Result of comprehensive content analysis (Smart Analyzer version with extended fields)
 */
data class SmartAnalysisResult(
    val uri: String,
    val mediaType: MediaViewerManager.MediaType,
    val success: Boolean,
    val error: String? = null,
    val extractedText: String = "",
    val extractedMetadata: DetailedExtractedMetadata = DetailedExtractedMetadata(),
    val contentFingerprint: String = "",
    val classification: DetailedContentClassification = DetailedContentClassification(),
    val archiveMatches: List<DetailedArchiveMatch> = emptyList(),
    val duplicates: List<String> = emptyList(),
    val analysisSteps: List<String> = emptyList(),
    val confidence: Float = 0.0f,
    val recommendedActions: List<RecommendedAction> = emptyList(),
    val processingTimeMs: Long = 0L
) {
    companion object {
        fun error(uri: String, error: String) = SmartAnalysisResult(
            uri = uri,
            mediaType = MediaViewerManager.MediaType.UNSUPPORTED,
            success = false,
            error = error
        )

        fun unsupported(uri: String) = SmartAnalysisResult(
            uri = uri,
            mediaType = MediaViewerManager.MediaType.UNSUPPORTED,
            success = false,
            error = "Unsupported media type"
        )
    }
}

/**
 * Detailed extracted metadata from content analysis
 */
data class DetailedExtractedMetadata(
    val title: String = "",
    val author: String = "",
    val isbn: String? = null,
    val publisher: String = "",
    val publishedDate: String? = null,
    val language: String = "",
    val pageCount: Int? = null,
    val description: String = "",
    val genres: List<String> = emptyList(),
    val series: String = "",
    val seriesNumber: Int? = null,
    val coverImageUrl: String = "",
    val contentRating: String = "",
    val readingLevel: String = "",

    // Audio-specific
    val artist: String = "",
    val album: String = "",
    val trackNumber: Int? = null,
    val duration: Long? = null,
    val albumArt: String = "",

    // Video-specific
    val director: String = "",
    val cast: List<String> = emptyList(),
    val releaseYear: Int? = null,
    val runtime: Long? = null,
    val imdbId: String? = null,

    // Comic-specific
    val issue: String = "",
    val volume: String = "",
    val characters: List<String> = emptyList()
)

/**
 * Detailed AI-powered content classification
 */
data class DetailedContentClassification(
    val primaryGenre: String = "",
    val genres: List<String> = emptyList(),
    val language: String = "",
    val contentRating: String = "",
    val readingLevel: String = "",
    val topics: List<String> = emptyList(),
    val sentiment: String = "",
    val complexity: Float = 0.0f,
    val confidence: Float = 0.0f
)

/**
 * Detailed match from external archives/databases
 */
data class DetailedArchiveMatch(
    val source: String, // "Open Library", "Google Books", "TMDB", etc.
    val id: String,
    val title: String,
    val author: String = "",
    val isbn: String? = null,
    val coverImageUrl: String = "",
    val description: String = "",
    val genres: List<String> = emptyList(),
    val publishedDate: String? = null,
    val publisher: String = "",
    val seriesName: String = "",
    val seriesNumber: Int? = null,
    val confidence: Float = 0.0f,
    val metadata: Map<String, Any> = emptyMap()
)

/**
 * Recommended actions for improving metadata
 */
enum class RecommendedAction {
    EXTRACT_TITLE_FROM_FILENAME,
    USE_ARCHIVE_AUTHOR,
    DOWNLOAD_COVER_IMAGE,
    DOWNLOAD_POSTER_IMAGE,
    DOWNLOAD_ALBUM_ART,
    MERGE_DUPLICATES,
    CREATE_SERIES_COLLECTION,
    AUTO_CLASSIFY_GENRE,
    IMPROVE_DESCRIPTION,
    VALIDATE_ISBN,
    DETECT_LANGUAGE,
    EXTRACT_READING_LEVEL
}
