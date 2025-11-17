package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.Index
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import com.universalmedialibrary.data.local.converters.StringListConverter
import kotlinx.serialization.Serializable

/**
 * Enhanced annotation system with export and sharing capabilities
 * Inspired by Anx-reader's notes workspace
 */
@Serializable
@Entity(
    tableName = "enhanced_annotations",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["itemId"]),
        Index(value = ["createdAt"]),
        Index(value = ["colorTag"])
    ]
)
@TypeConverters(StringListConverter::class)
data class EnhancedAnnotation(
    @PrimaryKey(autoGenerate = true)
    val annotationId: Long = 0,
    
    val itemId: Long,
    
    // Content
    val text: String,
    val note: String? = null,
    val quote: String? = null,
    
    // Location
    val chapterId: Long? = null,
    val chapterName: String? = null,
    val pageNumber: Int? = null,
    val position: Float = 0f, // 0.0 to 1.0
    
    // Styling
    val colorTag: AnnotationColor = AnnotationColor.YELLOW,
    val stylePreset: AnnotationStyle = AnnotationStyle.HIGHLIGHT,
    
    // Metadata
    val createdAt: Long = System.currentTimeMillis(),
    val modifiedAt: Long = System.currentTimeMillis(),
    
    // AI Features
    val aiSummary: String? = null,
    val aiTranslation: String? = null,
    val aiInsights: String? = null,
    
    // Tags
    val tags: List<String> = emptyList()
)

enum class AnnotationColor {
    YELLOW,
    GREEN,
    BLUE,
    RED,
    PURPLE,
    ORANGE,
    PINK,
    GRAY
}

enum class AnnotationStyle {
    HIGHLIGHT,
    UNDERLINE,
    STRIKETHROUGH,
    NOTE,
    BOOKMARK
}

/**
 * Annotation export configuration
 */
@Serializable
data class AnnotationExportConfig(
    val format: ExportFormat,
    val includeNotes: Boolean = true,
    val includeQuotes: Boolean = true,
    val includeMetadata: Boolean = true,
    val groupByChapter: Boolean = true,
    val sortBy: AnnotationSortField = AnnotationSortField.POSITION,
    val colorFilter: List<AnnotationColor>? = null
)

enum class ExportFormat {
    TXT,
    MARKDOWN,
    CSV,
    JSON,
    PDF
}

enum class AnnotationSortField {
    POSITION,
    TIME,
    CHAPTER,
    COLOR
}

/**
 * Shareable annotation card
 */
@Serializable
@Entity(
    tableName = "annotation_cards",
    foreignKeys = [
        ForeignKey(
            entity = EnhancedAnnotation::class,
            parentColumns = ["annotationId"],
            childColumns = ["annotationId"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [Index(value = ["annotationId"])]
)
data class AnnotationCard(
    @PrimaryKey(autoGenerate = true)
    val cardId: Long = 0,
    
    val annotationId: Long,
    
    // Card Design
    val template: CardTemplate = CardTemplate.MODERN,
    val backgroundColor: Int = 0xFFFFFFFF.toInt(),
    val textColor: Int = 0xFF000000.toInt(),
    val accentColor: Int = 0xFF2196F3.toInt(),
    
    // Content
    val includeBookCover: Boolean = true,
    val includeBookTitle: Boolean = true,
    val includeAuthor: Boolean = true,
    val includeTimestamp: Boolean = false,
    
    // Generated Image
    val imageUrl: String? = null,
    val generatedAt: Long = System.currentTimeMillis()
)

enum class CardTemplate {
    MODERN,
    CLASSIC,
    MINIMAL,
    ELEGANT,
    COLORFUL
}