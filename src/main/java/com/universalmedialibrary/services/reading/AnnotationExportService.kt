package com.universalmedialibrary.services.reading

import com.universalmedialibrary.data.local.dao.EnhancedAnnotationDao
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.first
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for exporting annotations in various formats
 * Inspired by Anx-reader's note export capabilities
 */
@Singleton
class AnnotationExportService @Inject constructor(
    private val annotationDao: EnhancedAnnotationDao
) {
    
    /**
     * Export annotations to specified format
     */
    suspend fun exportAnnotations(
        itemId: Long,
        config: AnnotationExportConfig,
        outputPath: String
    ): Result<File> {
        return try {
            val annotations = getFilteredAnnotations(itemId, config)
            
            val content = when (config.format) {
                ExportFormat.TXT -> exportToText(annotations, config)
                ExportFormat.MARKDOWN -> exportToMarkdown(annotations, config)
                ExportFormat.CSV -> exportToCSV(annotations, config)
                ExportFormat.JSON -> exportToJSON(annotations, config)
                ExportFormat.PDF -> exportToPDF(annotations, config)
            }
            
            val file = File(outputPath)
            file.writeText(content)
            Result.success(file)
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
    
    private suspend fun getFilteredAnnotations(
        itemId: Long,
        config: AnnotationExportConfig
    ): List<EnhancedAnnotation> {
        var annotations = annotationDao.getAnnotationsByItemId(itemId).first()
        
        // Apply color filter if specified
        config.colorFilter?.let { colors ->
            annotations = annotations.filter { it.colorTag in colors }
        }
        
        // Sort annotations
        annotations = when (config.sortBy) {
            AnnotationSortField.POSITION -> annotations.sortedBy { it.position }
            AnnotationSortField.TIME -> annotations.sortedBy { it.createdAt }
            AnnotationSortField.CHAPTER -> annotations.sortedBy { it.chapterId ?: 0 }
            AnnotationSortField.COLOR -> annotations.sortedBy { it.colorTag }
        }
        
        return annotations
    }
    
    private fun exportToText(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String {
        val builder = StringBuilder()
        
        if (config.groupByChapter) {
            val grouped = annotations.groupBy { it.chapterName ?: "Unknown Chapter" }
            grouped.forEach { (chapter, chapterAnnotations) ->
                builder.append("=== $chapter ===\n\n")
                chapterAnnotations.forEach { annotation ->
                    appendAnnotationText(builder, annotation, config)
                }
                builder.append("\n")
            }
        } else {
            annotations.forEach { annotation ->
                appendAnnotationText(builder, annotation, config)
            }
        }
        
        return builder.toString()
    }
    
    private fun appendAnnotationText(
        builder: StringBuilder,
        annotation: EnhancedAnnotation,
        config: AnnotationExportConfig
    ) {
        if (config.includeQuotes && annotation.quote != null) {
            builder.append("&quot;${annotation.quote}&quot;\n")
        }
        
        if (config.includeNotes && annotation.note != null) {
            builder.append("Note: ${annotation.note}\n")
        }
        
        if (config.includeMetadata) {
            builder.append("Color: ${annotation.colorTag}\n")
            builder.append("Page: ${annotation.pageNumber ?: "N/A"}\n")
        }
        
        builder.append("\n")
    }
    
    private fun exportToMarkdown(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String {
        val builder = StringBuilder()
        builder.append("# Annotations\n\n")
        
        if (config.groupByChapter) {
            val grouped = annotations.groupBy { it.chapterName ?: "Unknown Chapter" }
            grouped.forEach { (chapter, chapterAnnotations) ->
                builder.append("## $chapter\n\n")
                chapterAnnotations.forEach { annotation ->
                    appendAnnotationMarkdown(builder, annotation, config)
                }
            }
        } else {
            annotations.forEach { annotation ->
                appendAnnotationMarkdown(builder, annotation, config)
            }
        }
        
        return builder.toString()
    }
    
    private fun appendAnnotationMarkdown(
        builder: StringBuilder,
        annotation: EnhancedAnnotation,
        config: AnnotationExportConfig
    ) {
        if (config.includeQuotes && annotation.quote != null) {
            builder.append("> ${annotation.quote}\n\n")
        }
        
        if (config.includeNotes && annotation.note != null) {
            builder.append("**Note:** ${annotation.note}\n\n")
        }
        
        if (config.includeMetadata) {
            builder.append("*Color: ${annotation.colorTag} | Page: ${annotation.pageNumber ?: "N/A"}*\n\n")
        }
        
        builder.append("---\n\n")
    }
    
    private fun exportToCSV(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String {
        val builder = StringBuilder()
        
        // Header
        builder.append("Chapter,Page,Quote,Note,Color,Created\n")
        
        annotations.forEach { annotation ->
            builder.append("&quot;${annotation.chapterName ?: ""}&quot;,")
            builder.append("&quot;${annotation.pageNumber ?: ""}&quot;,")
            builder.append("&quot;${annotation.quote?.replace("&quot;", "&quot;&quot;") ?: ""}&quot;,")
            builder.append("&quot;${annotation.note?.replace("&quot;", "&quot;&quot;") ?: ""}&quot;,")
            builder.append("&quot;${annotation.colorTag}&quot;,")
            builder.append("&quot;${annotation.createdAt}&quot;\n")
        }
        
        return builder.toString()
    }
    
    private fun exportToJSON(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String {
        // Simple JSON export (in production, use a proper JSON library)
        val builder = StringBuilder()
        builder.append("{\n  &quot;annotations&quot;: [\n")
        
        annotations.forEachIndexed { index, annotation ->
            builder.append("    {\n")
            builder.append("      &quot;chapter&quot;: &quot;${annotation.chapterName ?: ""}&quot;,\n")
            builder.append("      &quot;page&quot;: ${annotation.pageNumber ?: "null"},\n")
            builder.append("      &quot;quote&quot;: &quot;${annotation.quote?.replace("&quot;", "\\&quot;") ?: ""}&quot;,\n")
            builder.append("      &quot;note&quot;: &quot;${annotation.note?.replace("&quot;", "\\&quot;") ?: ""}&quot;,\n")
            builder.append("      &quot;color&quot;: &quot;${annotation.colorTag}&quot;,\n")
            builder.append("      &quot;created&quot;: ${annotation.createdAt}\n")
            builder.append("    }")
            if (index < annotations.size - 1) builder.append(",")
            builder.append("\n")
        }
        
        builder.append("  ]\n}")
        return builder.toString()
    }
    
    private fun exportToPDF(
        annotations: List<EnhancedAnnotation>,
        config: AnnotationExportConfig
    ): String {
        // PDF export would require a PDF library
        // For now, return markdown that can be converted to PDF
        return exportToMarkdown(annotations, config)
    }
    
    /**
     * Create shareable annotation card
     */
    suspend fun createAnnotationCard(
        annotationId: Long,
        template: CardTemplate = CardTemplate.MODERN
    ): Result<AnnotationCard> {
        return try {
            val annotation = annotationDao.getAnnotationById(annotationId)
                ?: return Result.failure(Exception("Annotation not found"))
            
            val card = AnnotationCard(
                annotationId = annotationId,
                template = template
            )
            
            val cardId = annotationDao.insertCard(card)
            Result.success(card.copy(cardId = cardId))
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}