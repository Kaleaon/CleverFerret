package com.universalmedialibrary.data.local.model

import androidx.room.Entity
import androidx.room.ForeignKey
import androidx.room.PrimaryKey

/**
 * Represents metadata specific to a movie.
 *
 * @property itemId The ID of the media item this metadata belongs to.
 * @property tagline The tagline of the movie.
 * @property runtime The runtime of the movie in minutes.
 * @property director The director of the movie.
 * @property cast A comma-separated list of main actors.
 * @property rating The content rating of the movie (e.g., "PG-13").
 * @property releaseYear The year the movie was released.
 * @property productionCompany The production company of the movie.
 * @property budget The budget of the movie.
 * @property boxOffice The box office revenue of the movie.
 * @property imdbId The IMDb ID of the movie.
 * @property tmdbId The TMDB ID of the movie.
 * @property resolution The resolution of the video (e.g., "1920x1080").
 * @property videoCodec The video codec used (e.g., "H.264").
 * @property audioCodec The audio codec used (e.g., "AAC").
 * @property subtitles A list of available subtitle languages.
 */
@Entity(
    tableName = "metadata_movie",
    foreignKeys = [
        ForeignKey(
            entity = MediaItem::class,
            parentColumns = ["itemId"],
            childColumns = ["itemId"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class MetadataMovie(
    @PrimaryKey
    val itemId: Long,
    val tagline: String? = null,
    val runtime: Int? = null, // in minutes
    val director: String? = null,
    val cast: String? = null,
    val rating: String? = null,
    val releaseYear: Int? = null,
    val productionCompany: String? = null,
    val budget: Long? = null,
    val boxOffice: Long? = null,
    val imdbId: String? = null,
    val tmdbId: String? = null,
    val resolution: String? = null,
    val videoCodec: String? = null,
    val audioCodec: String? = null,
    val subtitles: String? = null
)
