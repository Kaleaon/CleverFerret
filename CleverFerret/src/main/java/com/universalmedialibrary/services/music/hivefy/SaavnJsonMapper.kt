package com.universalmedialibrary.services.music.hivefy

import com.universalmedialibrary.data.music.hivefy.SaavnAlbum
import com.universalmedialibrary.data.music.hivefy.SaavnArtist
import com.universalmedialibrary.data.music.hivefy.SaavnAudioSource
import com.universalmedialibrary.data.music.hivefy.SaavnImage
import com.universalmedialibrary.data.music.hivefy.SaavnPlaylist
import com.universalmedialibrary.data.music.hivefy.SaavnSong
import kotlinx.serialization.json.JsonArray
import kotlinx.serialization.json.JsonElement
import kotlinx.serialization.json.JsonNull
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.booleanOrNull
import kotlinx.serialization.json.doubleOrNull
import kotlinx.serialization.json.intOrNull
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive

/**
 * Converts raw Saavn JSON payloads (mirroring Hivefy's API responses) into Kotlin data classes.
 * The API likes to mix string/numeric types, so we centralize the parsing quirks here.
 */
internal object SaavnJsonMapper {

    fun playlistFromJson(obj: JsonObject): SaavnPlaylist {
        val songs = obj["songs"]?.jsonArray?.mapNotNull { element ->
            element.jsonObjectOrNull()?.let { songFromJson(it) }
        } ?: emptyList()

        return SaavnPlaylist(
            id = obj.string("id").orEmpty(),
            title = obj.string("name") ?: obj.string("title").orEmpty(),
            description = obj.string("description"),
            url = obj.string("url").orEmpty(),
            language = obj.string("language"),
            songCount = obj.int("songCount") ?: songs.size,
            explicit = obj.boolean("explicitContent"),
            artworkUrl = bestImageUrl(obj["image"]),
            songs = songs,
            curator = obj.string("listname") ?: obj.string("userId")
        )
    }

    fun albumFromJson(obj: JsonObject): SaavnAlbum {
        val songs = obj["songs"]?.jsonArray?.mapNotNull { element ->
            element.jsonObjectOrNull()?.let { songFromJson(it) }
        } ?: emptyList()

        val artistNames = when {
            obj["artists"]?.jsonObject != null -> {
                val primary = obj["artists"]?.jsonObject
                    ?.get("primary")
                    ?.jsonArray
                    ?.mapNotNull { it.jsonObjectOrNull()?.string("name") }
                    ?: emptyList()
                if (primary.isNotEmpty()) primary.joinToString() else obj.string("artist")
            }
            else -> obj.string("artist")
        }

        return SaavnAlbum(
            id = obj.string("id").orEmpty(),
            title = obj.string("name") ?: obj.string("title").orEmpty(),
            url = obj.string("url").orEmpty(),
            artistNames = artistNames,
            language = obj.string("language"),
            year = obj.string("year"),
            description = obj.string("description"),
            explicit = obj.boolean("explicitContent"),
            artworkUrl = bestImageUrl(obj["image"]),
            songs = songs
        )
    }

    fun songFromJson(obj: JsonObject): SaavnSong {
        val primaryArtists = parseArtistArray(obj["primaryArtists"])
        val contributors = parseArtistObject(obj["artists"])
        val albumObj = obj["album"]?.jsonObjectOrNull()
        val downloadSources = obj["downloadUrl"]?.jsonArray?.mapNotNull { element ->
            val quality = element.jsonObjectOrNull()?.string("quality")
            val url = element.jsonObjectOrNull()?.string("url")
            if (quality != null && url != null) {
                SaavnAudioSource(quality = quality, url = url)
            } else null
        } ?: emptyList()

        return SaavnSong(
            id = obj.string("id").orEmpty(),
            title = obj.string("name") ?: obj.string("title").orEmpty(),
            url = obj.string("url").orEmpty(),
            durationSeconds = obj.int("duration"),
            language = obj.string("language"),
            albumId = albumObj?.string("id") ?: obj.string("albumid"),
            albumName = albumObj?.string("name") ?: obj.string("album"),
            albumUrl = albumObj?.string("url"),
            artworkUrl = bestImageUrl(obj["image"])
                ?: bestImageUrl(albumObj?.get("image")),
            primaryArtists = primaryArtists,
            contributors = contributors,
            downloadSources = downloadSources,
            explicit = obj.boolean("explicitContent")
        )
    }

    private fun parseArtistArray(element: JsonElement?): List<SaavnArtist> {
        val array: JsonArray = when {
            element == null || element is JsonNull -> return emptyList()
            element is JsonArray -> element
            element is JsonObject && element["artists"] is JsonArray -> element["artists"]!!.jsonArray
            else -> return emptyList()
        }

        return array.mapNotNull { entry ->
            entry.jsonObjectOrNull()?.let { json ->
                val id = json.string("id") ?: json.string("artistid")
                val name = json.string("name") ?: json.string("title")
                val role = json.string("role")
                val imageUrl = bestImageUrl(json["image"])
                if (id == null || name == null) null else SaavnArtist(
                    id = id,
                    name = name,
                    role = role,
                    imageUrl = imageUrl,
                    profileUrl = json.string("url")
                )
            }
        }
    }

    private fun parseArtistObject(element: JsonElement?): List<SaavnArtist> {
        val jsonObject = element?.jsonObjectOrNull() ?: return emptyList()
        val buckets = listOf("primary", "featured", "all")
        return buckets.flatMap { key ->
            jsonObject[key]?.jsonArray?.mapNotNull { entry ->
                entry.jsonObjectOrNull()?.let { artist ->
                    val id = artist.string("id") ?: artist.string("artistid")
                    val name = artist.string("name") ?: artist.string("title")
                    val role = artist.string("role") ?: key
                    val imageUrl = bestImageUrl(artist["image"])
                    if (id == null || name == null) null else SaavnArtist(
                        id = id,
                        name = name,
                        role = role,
                        imageUrl = imageUrl,
                        profileUrl = artist.string("url")
                    )
                }
            } ?: emptyList()
        }
    }

    private fun bestImageUrl(element: JsonElement?): String? {
        val images = element?.jsonArray?.mapNotNull { entry ->
            val json = entry.jsonObjectOrNull() ?: return@mapNotNull null
            val quality = json.string("quality") ?: return@mapNotNull null
            val url = json.string("url") ?: return@mapNotNull null
            SaavnImage(quality = quality, url = url)
        } ?: return null

        return images.maxByOrNull { it.sizeHint }?.url ?: images.firstOrNull()?.url
    }

    private fun JsonObject.string(key: String): String? =
        this[key]?.jsonPrimitive?.contentOrNull

    private fun JsonObject.int(key: String): Int? = this[key]?.let { element ->
        val primitive = element.jsonPrimitive
        primitive.intOrNull
            ?: primitive.doubleOrNull?.toInt()
            ?: primitive.contentOrNull?.filter { it.isDigit() }?.toIntOrNull()
    }

    private fun JsonObject.boolean(key: String): Boolean =
        this[key]?.jsonPrimitive?.booleanOrNull ?: false

    private fun JsonElement.jsonObjectOrNull(): JsonObject? =
        runCatching { jsonObject }.getOrNull()
}
