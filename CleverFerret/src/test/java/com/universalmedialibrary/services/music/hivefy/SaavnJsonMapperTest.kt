package com.universalmedialibrary.services.music.hivefy

import com.universalmedialibrary.data.music.hivefy.bestAudioSource
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.jsonObject
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Test

class SaavnJsonMapperTest {

    private val json = Json { ignoreUnknownKeys = true }

    @Test
    fun `playlist parsing extracts songs and metadata`() {
        val payload = """
            {
              "id": "123",
              "name": "Test Playlist",
              "description": "A mix from Hivefy",
              "url": "https://www.jiosaavn.com/featured/test",
              "language": "english",
              "songCount": 2,
              "explicitContent": false,
              "image": [
                {"quality": "50x50", "url": "https://cdn/50.jpg"},
                {"quality": "500x500", "url": "https://cdn/500.jpg"}
              ],
              "songs": [
                {
                  "id": "song1",
                  "name": "Alpha",
                  "url": "https://www.jiosaavn.com/song/alpha",
                  "duration": 180,
                  "primaryArtists": [
                    {"id": "artist1", "name": "Artist One", "role": "singer"}
                  ],
                  "downloadUrl": [
                    {"quality": "96kbps", "url": "https://cdn/96.mp4"},
                    {"quality": "320kbps", "url": "https://cdn/320.mp4"}
                  ],
                  "image": [
                    {"quality": "150x150", "url": "https://cdn/song.jpg"}
                  ]
                }
              ]
            }
        """.trimIndent()

        val playlist = SaavnJsonMapper.playlistFromJson(
            json.parseToJsonElement(payload).jsonObject
        )

        assertEquals("Test Playlist", playlist.title)
        assertEquals("https://www.jiosaavn.com/featured/test", playlist.url)
        assertEquals(2, playlist.songCount)
        assertEquals("https://cdn/500.jpg", playlist.artworkUrl)
        assertFalse(playlist.songs.isEmpty())
        val song = playlist.songs.first()
        assertEquals("Alpha", song.title)
        assertEquals("Artist One", song.primaryArtists.first().name)
        assertEquals("https://cdn/320.mp4", song.bestAudioSource()!!.url)
    }
}
