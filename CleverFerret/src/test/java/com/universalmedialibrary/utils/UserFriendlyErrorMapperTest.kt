package com.universalmedialibrary.utils

import android.database.sqlite.SQLiteException
import androidx.media3.common.PlaybackException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Test
import java.io.FileNotFoundException
import java.io.IOException
import java.net.ConnectException
import java.net.SocketTimeoutException
import java.net.UnknownHostException

class UserFriendlyErrorMapperTest {

    private val mapper = UserFriendlyErrorMapper()

    @Test
    fun map_unknownHostException_returnsNetworkConnectionMessage() {
        val exception = UnknownHostException("Unable to resolve host radiobrowser.info: No address associated with hostname")
        val message = mapper.mapToMessage(exception)

        assertEquals("Unable to connect to the network. Please check your internet connection.", message)
        assertFalse(message.contains("UnknownHostException"))
        assertFalse(message.contains("radiobrowser.info"))
    }

    @Test
    fun map_socketTimeoutException_returnsNetworkTimeoutMessage() {
        val exception = SocketTimeoutException("Read timed out after 10000ms")
        val message = mapper.mapToMessage(exception)

        assertEquals("Network connection timed out. Please try again.", message)
        assertFalse(message.contains("10000ms"))
    }

    @Test
    fun map_fileNotFoundException_returnsFileNotFoundMessage() {
        val exception = FileNotFoundException("/storage/emulated/0/Podcasts/episode1.mp3 (No such file or directory)")
        val message = mapper.mapToMessage(exception)

        assertEquals("The system cannot find the selected media file.", message)
        assertFalse(message.contains("/storage/emulated/0/Podcasts/episode1.mp3"))
    }

    @Test
    fun map_securityException_returnsAccessDeniedMessage() {
        val exception = SecurityException("Permission Denial: reading com.android.providers.media.MediaProvider")
        val message = mapper.mapToMessage(exception)

        assertEquals("Access denied. The application lacks permission to perform this action.", message)
        assertFalse(message.contains("com.android.providers.media"))
    }

    @Test
    fun map_sqLiteException_returnsDatabaseErrorMessage() {
        val exception = SQLiteException("table radio_stations has no column named legacy_id (code 1 SQLITE_ERROR)")
        val message = mapper.mapToMessage(exception)

        assertEquals("Database operation failed. Please try again.", message)
        assertFalse(message.contains("SQLITE_ERROR"))
        assertFalse(message.contains("radio_stations"))
    }

    @Test
    fun map_genericIOException_returnsStorageOrNetworkMessage() {
        val exception = IOException("Disk I/O failure on block 0x82f")
        val message = mapper.mapToMessage(exception)

        assertEquals("An error occurred while accessing media storage or network.", message)
        assertFalse(message.contains("block 0x82f"))
    }

    @Test
    fun map_genericException_returnsFallbackMessage() {
        val exception = RuntimeException("NullPointerException at com.example.internal.ServiceEngine.compute(ServiceEngine.java:42)")
        val message = mapper.mapToMessage(exception)

        assertEquals(UserFriendlyErrorMapper.FALLBACK_ERROR_MESSAGE, message)
        assertFalse(message.contains("NullPointerException"))
        assertFalse(message.contains("ServiceEngine"))
    }

    @Test
    fun map_nestedWrappedException_extractsSpecificCauseMessage() {
        val cause = UnknownHostException("api.musicbrainz.org")
        val wrapper = RuntimeException("Failed to execute network job", cause)

        val message = mapper.mapToMessage(wrapper)

        assertEquals("Unable to connect to the network. Please check your internet connection.", message)
    }

    @Test
    fun map_nullThrowable_returnsFallbackOrDefaultContextMessage() {
        val defaultMessage = mapper.mapToMessage(null)
        assertEquals(UserFriendlyErrorMapper.FALLBACK_ERROR_MESSAGE, defaultMessage)

        val customContextMessage = mapper.mapToMessage(null, defaultContext = "Custom context error")
        assertEquals("Custom context error", customContextMessage)
    }
}
