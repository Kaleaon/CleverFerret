package com.universalmedialibrary.services.reading

import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Typeface
import android.graphics.pdf.PdfDocument
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
import java.io.FileOutputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
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
        val file = File(outputPath)

        if (config.format == ExportFormat.PDF) {
            exportToPdf(annotations, config, outputPath)
        } else {
            val content = when (config.format) {
                ExportFormat.TXT -> exportToText(annotations, config)
                ExportFormat.MARKDOWN -> exportToMarkdown(annotations, config)
                ExportFormat.CSV -> exportToCsv(annotations, config)
                ExportFormat.JSON -> exportToJson(annotations, config)
                ExportFormat.PDF -> error("Unreachable")
            }
            file.writeText(content)
        }

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

    private fun exportToPdf(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig,
        outputPath: String
    ) {
        val pageWidth = 595  // A4 width in points
        val pageHeight = 842 // A4 height in points
        val marginLeft = 50f
        val marginTop = 60f
        val marginBottom = 60f
        val contentWidth = pageWidth - marginLeft - 50f

        val titlePaint = Paint().apply {
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
            textSize = 24f
            isAntiAlias = true
            color = 0xFF000000.toInt()
        }

        val chapterPaint = Paint().apply {
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
            textSize = 16f
            isAntiAlias = true
            color = 0xFF333333.toInt()
        }

        val quotePaint = Paint().apply {
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.ITALIC)
            textSize = 12f
            isAntiAlias = true
            color = 0xFF444444.toInt()
        }

        val notePaint = Paint().apply {
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.NORMAL)
            textSize = 12f
            isAntiAlias = true
            color = 0xFF000000.toInt()
        }

        val metadataPaint = Paint().apply {
            typeface = Typeface.create(Typeface.DEFAULT, Typeface.NORMAL)
            textSize = 10f
            isAntiAlias = true
            color = 0xFF888888.toInt()
        }

        val linePaint = Paint().apply {
            color = 0xFFCCCCCC.toInt()
            strokeWidth = 1f
        }

        val dateFormat = SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.getDefault())

        val document = PdfDocument()
        var pageNumber = 1
        var pageInfo = PdfDocument.PageInfo.Builder(pageWidth, pageHeight, pageNumber).create()
        var page = document.startPage(pageInfo)
        var canvas: Canvas = page.canvas
        var yPosition = marginTop

        fun availableHeight(): Float = pageHeight - marginBottom

        fun startNewPage() {
            document.finishPage(page)
            pageNumber++
            pageInfo = PdfDocument.PageInfo.Builder(pageWidth, pageHeight, pageNumber).create()
            page = document.startPage(pageInfo)
            canvas = page.canvas
            yPosition = marginTop
        }

        fun ensureSpace(needed: Float) {
            if (yPosition + needed > availableHeight()) {
                startNewPage()
            }
        }

        fun wrapText(text: String, paint: Paint, maxWidth: Float): List<String> {
            val lines = mutableListOf<String>()
            for (paragraph in text.split("\n")) {
                if (paragraph.isEmpty()) {
                    lines.add("")
                    continue
                }
                val words = paragraph.split(" ")
                var currentLine = StringBuilder()
                for (word in words) {
                    val testLine = if (currentLine.isEmpty()) word
                    else "$currentLine $word"
                    if (paint.measureText(testLine) <= maxWidth) {
                        currentLine = StringBuilder(testLine)
                    } else {
                        if (currentLine.isNotEmpty()) {
                            lines.add(currentLine.toString())
                        }
                        currentLine = StringBuilder(word)
                    }
                }
                if (currentLine.isNotEmpty()) {
                    lines.add(currentLine.toString())
                }
            }
            return lines
        }

        fun drawWrappedText(text: String, paint: Paint, indent: Float = 0f): Float {
            val lines = wrapText(text, paint, contentWidth - indent)
            val lineHeight = paint.textSize * 1.4f
            for (line in lines) {
                ensureSpace(lineHeight)
                yPosition += lineHeight
                canvas.drawText(line, marginLeft + indent, yPosition, paint)
            }
            return lines.size * lineHeight
        }

        fun drawHorizontalLine() {
            ensureSpace(20f)
            yPosition += 10f
            canvas.drawLine(marginLeft, yPosition, pageWidth - 50f, yPosition, linePaint)
            yPosition += 10f
        }

        // Draw title
        ensureSpace(titlePaint.textSize * 2f)
        yPosition += titlePaint.textSize * 1.5f
        canvas.drawText("Annotations", marginLeft, yPosition, titlePaint)
        yPosition += titlePaint.textSize * 0.8f

        val grouped = if (config.groupByChapter) {
            annotations.groupBy { it.chapterName ?: "Unknown Chapter" }
        } else {
            mapOf("Annotations" to annotations)
        }

        grouped.forEach { (chapter, chapterAnnotations) ->
            // Chapter heading
            ensureSpace(chapterPaint.textSize * 3f)
            yPosition += chapterPaint.textSize * 1.8f
            canvas.drawText(chapter, marginLeft, yPosition, chapterPaint)
            yPosition += chapterPaint.textSize * 0.6f

            chapterAnnotations.forEachIndexed { index, annotation ->
                // Estimate space needed for this annotation
                val estimatedHeight = 40f +
                    (if (config.includeQuotes && annotation.quote != null) 30f else 0f) +
                    (if (config.includeNotes && annotation.note != null) 30f else 0f) +
                    (if (config.includeMetadata) 50f else 0f)
                ensureSpace(estimatedHeight.coerceAtMost(availableHeight() - marginTop))

                if (config.includeQuotes && annotation.quote != null) {
                    yPosition += 6f
                    drawWrappedText("\u201C${annotation.quote}\u201D", quotePaint, indent = 10f)
                    yPosition += 4f
                }

                if (config.includeNotes && annotation.note != null) {
                    yPosition += 4f
                    drawWrappedText("Note: ${annotation.note}", notePaint)
                    yPosition += 4f
                }

                if (config.includeMetadata) {
                    yPosition += 4f
                    val formattedDate = dateFormat.format(Date(annotation.createdAt))
                    drawWrappedText(
                        "Color: ${annotation.colorTag.name}  |  " +
                            "Page: ${annotation.pageNumber ?: "N/A"}  |  " +
                            "Created: $formattedDate",
                        metadataPaint
                    )
                }

                // Draw separator between annotations (but not after the last one)
                if (index < chapterAnnotations.size - 1) {
                    drawHorizontalLine()
                }
            }
        }

        // Finish the last page and write the document
        document.finishPage(page)

        try {
            FileOutputStream(outputPath).use { outputStream ->
                document.writeTo(outputStream)
            }
        } finally {
            document.close()
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
