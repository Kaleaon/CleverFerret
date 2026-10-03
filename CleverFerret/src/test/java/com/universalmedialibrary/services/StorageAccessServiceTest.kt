package com.universalmedialibrary.services

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.UriPermission
import android.net.Uri
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.utils.FileNameSanitizer
import com.universalmedialibrary.utils.FilebotDataService
import io.mockk.every
import io.mockk.just
import io.mockk.mockk
import io.mockk.runs
import io.mockk.verify
import org.junit.Before
import org.junit.Test

class StorageAccessServiceTest {

    private lateinit var service: StorageAccessService

    @Before
    fun setUp() {
        service = StorageAccessService(
            libraryDao = mockk(relaxed = true),
            mediaItemDao = mockk(relaxed = true),
            metadataDao = mockk(relaxed = true),
            fileNameSanitizer = mockk<FileNameSanitizer>(relaxed = true),
            filebotDataService = mockk<FilebotDataService>(relaxed = true)
        )
    }

    @Test
    fun `createDirectoryPickerIntent sets required SAF permission flags`() {
        val intent = service.createDirectoryPickerIntent()

        assertThat(intent.action).isEqualTo(Intent.ACTION_OPEN_DOCUMENT_TREE)
        assertThat(intent.flags and Intent.FLAG_GRANT_READ_URI_PERMISSION).isNotEqualTo(0)
        assertThat(intent.flags and Intent.FLAG_GRANT_WRITE_URI_PERMISSION).isNotEqualTo(0)
        assertThat(intent.flags and Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION).isNotEqualTo(0)
    }

    @Test
    fun `persistUriPermission stores URI in shared preferences`() {
        val context = mockk<Context>()
        val resolver = mockk<ContentResolver>(relaxed = true)
        val prefs = mockk<SharedPreferences>()
        val editor = mockk<SharedPreferences.Editor>()
        val uri = Uri.parse("content://example/tree/123")
        val existing = mutableSetOf("content://already/here")

        every { context.contentResolver } returns resolver
        every { context.getSharedPreferences(StorageAccessService.PREF_PERSISTED_URIS, Context.MODE_PRIVATE) } returns prefs
        every { prefs.getStringSet("uris", any()) } returns existing
        every { prefs.edit() } returns editor
        every { editor.putStringSet("uris", any()) } returns editor
        every { editor.apply() } just runs
        every { resolver.takePersistableUriPermission(uri, any()) } just runs

        service.persistUriPermission(context, uri)

        verify { resolver.takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION) }
        verify { editor.putStringSet("uris", match { it.contains(uri.toString()) && it.contains("content://already/here") }) }
    }

    @Test
    fun `hasUriPermission returns false when resolver throws`() {
        val context = mockk<Context>()
        val resolver = mockk<ContentResolver>()
        every { context.contentResolver } returns resolver
        every { resolver.persistedUriPermissions } throws RuntimeException("resolver not available")

        val result = service.hasUriPermission(context, Uri.parse("content://example/tree/abc"))

        assertThat(result).isFalse()
    }

    @Test
    fun `releaseUriPermission removes URI from preferences and releases resolver permission`() {
        val context = mockk<Context>()
        val resolver = mockk<ContentResolver>(relaxed = true)
        val prefs = mockk<SharedPreferences>()
        val editor = mockk<SharedPreferences.Editor>()
        val uri = Uri.parse("content://example/tree/remove")

        every { context.contentResolver } returns resolver
        every { context.getSharedPreferences(StorageAccessService.PREF_PERSISTED_URIS, Context.MODE_PRIVATE) } returns prefs
        every { prefs.getStringSet("uris", any()) } returns mutableSetOf(uri.toString(), "content://other")
        every { prefs.edit() } returns editor
        every { editor.putStringSet("uris", any()) } returns editor
        every { editor.apply() } just runs

        service.releaseUriPermission(context, uri)

        verify { resolver.releasePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION) }
        verify { editor.putStringSet("uris", match { !it.contains(uri.toString()) && it.contains("content://other") }) }
    }

    @Test
    fun `hasUriPermission returns true when matching read permission exists`() {
        val context = mockk<Context>()
        val resolver = mockk<ContentResolver>()
        val permission = mockk<UriPermission>()
        val uri = Uri.parse("content://example/tree/match")

        every { context.contentResolver } returns resolver
        every { resolver.persistedUriPermissions } returns listOf(permission)
        every { permission.uri } returns uri
        every { permission.isReadPermission } returns true

        val result = service.hasUriPermission(context, uri)

        assertThat(result).isTrue()
    }
}
