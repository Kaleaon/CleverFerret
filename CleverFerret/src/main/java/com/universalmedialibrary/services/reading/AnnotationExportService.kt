package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.EnhancedAnnotationDao
import com.universalmedialibrary.data.local.entity.AnnotationCard
import com.universalmedialibrary.data.local.entity.AnnotationExportConfig
import com.universalmedialibrary.data.local.entity.AnnotationSortField
import com.universalmedialibrary.data.local.entity.CardTemplate
import com.universalmedialibrary.data.local.entity.EnhancedAnnotation
import com.universalmedialibrary.data.local.entity.ExportFormat
import kotlinx.coroutines.flow.first
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Exports enhanced annotations in multiple formats and creates sharable cards.
 */
@Singleton
class AnnotationExportService @Inject constructor(
    private val annotationDao: EnhancedAnnotationDao
) {

    private val json = Json { prettyPrint = true }

    suspend fun exportAnnotations(
        itemId: Long,
        config: AnnotationExportConfig,
        outputPath: String
    ): Result<File> = runCatching {
        val annotations = getFilteredAnnotations(itemId, config)
        val content = when (config.format) {
            ExportFormat.TXT -> exportToText(annotations, config)
            ExportFormat.MARKDOWN -> exportToMarkdown(annotations, config)
            ExportFormat.CSV -> exportToCsv(annotations, config)
            ExportFormat.JSON -> exportToJson(annotations, config)
            ExportFormat.PDF -> exportToMarkdown(annotations, config) // Placeholder
        }

        val file = File(outputPath)
        file.writeText(content)
        file
    }

    suspend fun createAnnotationCard(
        annotationId: Long,
        template: CardTemplate = CardTemplate.MODERN
    ): Result<AnnotationCard> = runCatching {
        val annotation = annotationDao.getAnnotationById(annotationId)
            ?: error("Annotation not found")

        val card = AnnotationCard(
            annotationId = annotationId,
            template = template
        )
        val cardId = annotationDao.insertCard(card)
        card.copy(cardId = cardId)
    }

    private suspend fun getFilteredAnnotations(
        itemId: Long,
        config: AnnotationExportConfig
    ): List<EnhancedAnnotation> {
        var annotations = annotationDao.getAnnotationsByItemId(itemId).first()

        config.colorFilter?.let { colors ->
            annotations = annotations.filter { it.colorTag in colors }
        }

        return when (config.sortBy) {
            AnnotationSortField.POSITION -> annotations.sortedBy { it.position }
            AnnotationSortField.TIME -> annotations.sortedBy { it.createdAt }
            AnnotationSortField.CHAPTER -> annotations.sortedBy { it.chapterId ?: 0 }
            AnnotationSortField.COLOR -> annotations.sortedBy { it.colorTag }
        }
    }

    private fun exportToText(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String = buildString {
        if (config.groupByChapter) {
            annotations.groupBy { it.chapterName ?: "Unknown Chapter" }
                .forEach { (chapter, chapterAnnotations) ->
                    appendLine("=== $chapter ===")
                    appendLine()
                    chapterAnnotations.forEach { appendAnnotationText(it, config) }
                    appendLine()
                }
        } else {
            annotations.forEach { appendAnnotationText(it, config) }
        }
    }

    private fun StringBuilder.appendAnnotationText(
        annotation: EnhancedAnnotation,
        config: AnnotationExportConfig
    ) {
        if (config.includeQuotes && annotation.quote != null) {
            appendLine("\"${annotation.quote}\"")
        }
        if (config.includeNotes && annotation.note != null) {
            appendLine("Note: ${annotation.note}")
        }
        if (config.includeMetadata) {
            appendLine("Color: ${annotation.colorTag}")
            appendLine("Page: ${annotation.pageNumber ?: "N/A"}")
            appendLine("Created: ${annotation.createdAt}")
        }
        appendLine()
    }

    private fun exportToMarkdown(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String = buildString {
        appendLine("# Annotations")
        appendLine()

        val grouped = if (config.groupByChapter) {
            annotations.groupBy { it.chapterName ?: "Unknown Chapter" }
        } else {
            mapOf("Annotations" to annotations)
        }

        grouped.forEach { (chapter, chapterAnnotations) ->
            appendLine("## $chapter")
            appendLine()
            chapterAnnotations.forEach { annotation ->
                if (config.includeQuotes && annotation.quote != null) {
                    appendLine("> ${annotation.quote}")
                    appendLine()
                }
                if (config.includeNotes && annotation.note != null) {
                    appendLine("**Note:** ${annotation.note}")
                    appendLine()
                }
                if (config.includeMetadata) {
                    appendLine("*Color:* ${annotation.colorTag}  ")
                    appendLine("*Page:* ${annotation.pageNumber ?: "N/A"}  ")
                    appendLine("*Created:* ${annotation.createdAt}")
                }
                appendLine()
                appendLine("---")
                appendLine()
            }
        }
    }

    private fun exportToCsv(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String = buildString {
        appendLine("Chapter,Page,Quote,Note,Color,Created")
        annotations.forEach { annotation ->
            appendLine(
                listOf(
                    annotation.chapterName,
                    annotation.pageNumber?.toString(),
                    annotation.quote,
                    annotation.note,
                    annotation.colorTag.name,
                    annotation.createdAt.toString()
                ).joinToString(",") { it?.escapeCsv() ?: "" }
            )
        }
    }

    private fun exportToJson(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String = json.encodeToString(
        annotations.map { annotation ->
            AnnotationJson(
                chapter = annotation.chapterName,
                page = annotation.pageNumber,
                quote = annotation.quote,
                note = annotation.note,
                color = annotation.colorTag.name,
                created = annotation.createdAt,
                metadataIncluded = config.includeMetadata
            )
        }
    )

    private fun String.escapeCsv(): String =
        if (contains(",") || contains("\"") || contains("\n")) {
            "\"${replace("\"", "\"\"")}\""
        } else {
            this
        }

    @kotlinx.serialization.Serializable
    private data class AnnotationJson(
        val chapter: String?,
        val page: Int?,
        val quote: String?,
        val note: String?,
        val color: String,
        val created: Long,
        val metadataIncluded: Boolean
    )
}
