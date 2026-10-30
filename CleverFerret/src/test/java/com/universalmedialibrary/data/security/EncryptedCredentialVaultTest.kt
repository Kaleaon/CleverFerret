package com.universalmedialibrary.data.security

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class EncryptedCredentialVaultTest {

    private lateinit var context: Context
    private lateinit var vault: EncryptedCredentialVault

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        vault = EncryptedCredentialVault(context)
    }

    @Test
    fun `save and retrieve API key`() {
        vault.saveApiKey("tmdb", "test_api_key_123")
        assertEquals("test_api_key_123", vault.getApiKey("tmdb"))

        vault.deleteApiKey("tmdb")
        assertNull(vault.getApiKey("tmdb"))
    }

    @Test
    fun `save and retrieve WebDAV credentials`() {
        vault.saveWebDavCredentials("https://webdav.example.com", "user1", "pass123")
        val creds = vault.getWebDavCredentials()
        assertEquals("https://webdav.example.com", creds?.serverUrl)
        assertEquals("user1", creds?.username)
        assertEquals("pass123", creds?.password)

        vault.clearWebDavCredentials()
        assertNull(vault.getWebDavCredentials())
    }

    @Test
    fun `save and retrieve Google Drive details`() {
        vault.saveGoogleDriveAccountName("user@gmail.com")
        vault.saveGoogleDriveAccessToken("gdrive_token_xyz")

        assertEquals("user@gmail.com", vault.getGoogleDriveAccountName())
        assertEquals("gdrive_token_xyz", vault.getGoogleDriveAccessToken())

        vault.clearGoogleDriveAccountName()
        vault.clearGoogleDriveAccessToken()

        assertNull(vault.getGoogleDriveAccountName())
        assertNull(vault.getGoogleDriveAccessToken())
    }

    @Test
    fun `save and retrieve OneDrive token`() {
        vault.saveOneDriveAccessToken("onedrive_token_abc")
        assertEquals("onedrive_token_abc", vault.getOneDriveAccessToken())

        vault.clearOneDriveAccessToken()
        assertNull(vault.getOneDriveAccessToken())
    }

    @Test
    fun `save and retrieve Plex token`() {
        vault.savePlexToken(1001L, "plex_token_999")
        assertEquals("plex_token_999", vault.getPlexToken(1001L))

        vault.clearPlexToken(1001L)
        assertNull(vault.getPlexToken(1001L))
    }
}
