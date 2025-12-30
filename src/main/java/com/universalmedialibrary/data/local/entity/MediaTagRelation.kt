package com.universalmedialibrary.data.local.entity

import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Index
import androidx.room.ColumnInfo
import androidx.room.ForeignKey

/**
 * Junction table for many-to-many relationship between media items and tags.
 * Supports all media types in the universal library.
 */
@Entity(
    tableName = "media_tag_relations",
    foreignKeys = [
        ForeignKey(
            entity = UniversalTag::class,
            parentColumns = ["id"],
            childColumns = ["tag_id"],
            onDelete = ForeignKey.CASCADE
        )
    ],
    indices = [
        Index(value = ["media_id", "media_type"]),
        Index(value = ["tag_id"]),
        Index(value = ["created_at"]),
        Index(value = ["confidence"]),
        Index(value = ["source"])
    ]
)
data class MediaTagRelation(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    
    @ColumnInfo(name = "media_id")
    val mediaId: String,
    
    @ColumnInfo(name = "media_type")
    val mediaType: MediaType,
    
    @ColumnInfo(name = "tag_id")
    val tagId: Long,
    
    @ColumnInfo(name = "confidence")
    val confidence: Float = 1.0f,
    
    @ColumnInfo(name = "source")
    val source: TagSource = TagSource.MANUAL,
    
    @ColumnInfo(name = "created_at")
    val createdAt: Long = System.currentTimeMillis(),
    
    @ColumnInfo(name = "created_by")
    val createdBy: String? = null, // User ID or system identifier
    
    @ColumnInfo(name = "weight")
    val weight: Float = 1.0f, // For search ranking
    
    @ColumnInfo(name = "is_verified")
    val isVerified: Boolean = false, // For AI-generated tags
    
    @ColumnInfo(name = "last_applied")
    val lastApplied: Long = System.currentTimeMillis()
)

/**
 * Media types supported by the universal tagging system.
 */
enum class MediaType(val displayName: String, val tableName: String) {
    BOOK("Book", "books"),
    AUDIO_BOOK("Audiobook", "audiobooks"),
    MUSIC("Music", "music_tracks"),
    PODCAST("Podcast", "podcasts"),
    VIDEO("Video", "videos"),
    COMIC("Comic", "comics"),
    DOCUMENT("Document", "documents"),
    IMAGE("Image", "images"),
    RADIO("Radio", "radio_stations"),
    PLAYLIST("Playlist", "playlists"),
    COLLECTION("Collection", "collections"),
    EPISODE("Episode", "episodes")
}

/**
 * Sources for tag assignment.
 */
enum class TagSource(val displayName: String) {
    MANUAL("Manual"),
    AI("AI Generated"),
    AUTO("Automatic"),
    IMPORTED("Imported"),
    SYNCED("Synchronized"),
    SYSTEM("System")
}