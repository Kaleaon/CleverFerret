package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to an academic paper.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property journalName The name of the journal where the paper was published.
 * @property doi The Digital Object Identifier (DOI) of the paper.
 * @property abstractText The abstract or summary of the paper.
 * @property publicationYear The year the paper was published.
 * @property citationCount The number of times the paper has been cited.
 * @property keywords A comma-separated list of keywords.
 * @property researchField The field of research the paper belongs to.
 * @property peerReviewed Whether the paper was peer-reviewed.
 * @property arxivId The arXiv identifier for the paper, if applicable.
 */
@Entity(
    tableName = "metadata_academic_paper",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataAcademicPaper(
    @PrimaryKey
    val itemId: Long,
    val journalName: String? = null,
    val doi: String? = null,
    val abstractText: String? = null, // Changed from 'abstract' to avoid keyword conflict
    val publicationYear: Int? = null,
    val citationCount: Int? = null,
    val keywords: String? = null,
    val researchField: String? = null,
    val peerReviewed: Boolean = false,
    val arxivId: String? = null
)