package com.universalmedialibrary.services.plex

import com.universalmedialibrary.data.local.entity.PlexServer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class PlexUrlUtilsTest {

    private val server = PlexServer(
        serverId = 1L,
        name = "MyPlexServer",
        host = "plex.local",
        port = 32400,
        token = "secret-plex-token-12345",
        machineIdentifier = "server-machine-id-xyz"
    )

    @Test
    fun `buildMediaStreamPartUrl generates correct part endpoint`() {
        val streamUrl = PlexUrlUtils.buildMediaStreamPartUrl(server, "10492")
        val expected = "${server.url}/library/parts/10492/file?X-Plex-Token=secret-plex-token-12345"
        assertEquals(expected, streamUrl)
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl resolves relative path with leading slash`() {
        val thumbPath = "/library/metadata/10492/thumb/1700000000"
        val resolved = PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, thumbPath)
        val expected = "${server.url}/library/metadata/10492/thumb/1700000000?X-Plex-Token=secret-plex-token-12345"
        assertEquals(expected, resolved)
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl resolves relative path without leading slash`() {
        val thumbPath = "library/metadata/10492/thumb/1700000000"
        val resolved = PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, thumbPath)
        val expected = "${server.url}/library/metadata/10492/thumb/1700000000?X-Plex-Token=secret-plex-token-12345"
        assertEquals(expected, resolved)
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl handles existing query parameters with ampersand`() {
        val thumbPath = "/library/metadata/10492/thumb?width=300"
        val resolved = PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, thumbPath)
        val expected = "${server.url}/library/metadata/10492/thumb?width=300&X-Plex-Token=secret-plex-token-12345"
        assertEquals(expected, resolved)
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl does not duplicate token if already present`() {
        val existingUrl = "${server.url}/library/metadata/10492/thumb?X-Plex-Token=secret-plex-token-12345"
        val resolved = PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, existingUrl)
        assertEquals(existingUrl, resolved)
    }

    @Test
    fun `buildAuthenticatedThumbnailUrl returns null for null or blank input`() {
        assertNull(PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, null))
        assertNull(PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, ""))
        assertNull(PlexUrlUtils.buildAuthenticatedThumbnailUrl(server, "   "))
    }

    @Test
    fun `sanitizeUrl masks X-Plex-Token and api_key`() {
        val rawPlexUrl = "https://plex.local:32400/library/parts/42/file?X-Plex-Token=super-secret-token&mode=stream"
        val sanitized = PlexUrlUtils.sanitizeUrl(rawPlexUrl)
        assertEquals("https://plex.local:32400/library/parts/42/file?X-Plex-Token=[REDACTED]&mode=stream", sanitized)

        val rawApiKeyUrl = "https://emby.local:8096/Items/123/Download?api_key=secret_key_999"
        val sanitizedApiKey = PlexUrlUtils.sanitizeUrl(rawApiKeyUrl)
        assertEquals("https://emby.local:8096/Items/123/Download?api_key=[REDACTED]", sanitizedApiKey)
    }
}
