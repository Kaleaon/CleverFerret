package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import androidx.room.ColumnInfo

/**
 * Search history entity for tracking user search queries and results.
 * Supports analytics and search suggestions.
 */
@Entity(
    tableName = "search_history",
    indices = [
        Index(value = ["query"]),
        Index(value = ["timestamp"]),
        Index(value = ["user_id"]),
        Index(value = ["media_types"]),
        Index(value = ["result_count"])
    ]
)
data class SearchHistory(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "query")
    val query: String,
    
    @ColumnInfo(name = "normalized_query")
    val normalizedQuery: String, // For better matching
    
    @ColumnInfo(name = "filters")
    val filters: String? = null, // JSON string of search filters
    
    @ColumnInfo(name = "media_types")
    val mediaTypes: String? = null, // Comma-separated list of media types
    
    @ColumnInfo(name = "result_count")
    val resultCount: Int = 0,
    
    @ColumnInfo(name = "timestamp")
    val timestamp: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "user_id")
    val userId: String? = null,
    
    @ColumnInfo(name = "session_id")
    val sessionId: String? = null,
    
    @ColumnInfo(name = "clicked_result_id")
    val clickedResultId: String? = null, // Which result was clicked
    
    @ColumnInfo(name = "clicked_result_type")
    val clickedResultType: String? = null,
    
    @ColumnInfo(name = "search_duration_ms")
    val searchDurationMs: Long = 0,
    
    @ColumnInfo(name = "is_favorite")
    val isFavorite: Boolean = false, // User marked as favorite search
    
    @ColumnInfo(name = "search_source")
    val searchSource: SearchSource = SearchSource.MANUAL,
    
    @ColumnInfo(name = "suggestion_clicked")
    val suggestionClicked: Boolean = false
)

/**
 * Sources of search queries.
 */
enum class SearchSource(val displayName: String) {
    MANUAL("Manual"),
    VOICE("Voice"),
    SUGGESTION("Suggestion"),
    RELATED("Related Content"),
    HISTORY("History"),
    DEEP_LINK("Deep Link"),
    WIDGET("Widget")
}