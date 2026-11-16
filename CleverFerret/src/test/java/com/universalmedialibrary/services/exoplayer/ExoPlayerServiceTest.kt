package com.universalmedialibrary.services.exoplayer

import android.content.Context
import androidx.media3.common.PlaybackException
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import com.universalmedialibrary.services.media.MediaController
import io.mockk.mockk
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.IOException

@RunWith(RobolectricTestRunner::class)
@Config(application = android.app.Application::class, manifest = Config.NONE, sdk = [34])
class ExoPlayerServiceTest {

    private lateinit var context: Context
    private val mediaController = mockk<MediaController>(relaxed = true)
    private val exoPlayerCacheFactory = mockk<ExoPlayerCacheFactory>(relaxed = true)
    private lateinit var service: ExoPlayerService

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        service = ExoPlayerService(context, mediaController, exoPlayerCacheFactory)
    }

    @After
    fun tearDown() {
        service.release()
    }

    @Test
    fun getReconnectDelayMs_exponentialProgression() {
        assertThat(ExoPlayerService.getReconnectDelayMs(1)).isEqualTo(1000L)
        assertThat(ExoPlayerService.getReconnectDelayMs(2)).isEqualTo(2000L)
        assertThat(ExoPlayerService.getReconnectDelayMs(3)).isEqualTo(4000L)
    }

    @Test
    fun isNetworkUri_identifiesStreamSchemesCorrectly() {
        assertThat(ExoPlayerService.isNetworkUri("https://stream.example.com/audio.mp3")).isTrue()
        assertThat(ExoPlayerService.isNetworkUri("http://stream.example.com/audio.mp3")).isTrue()
        assertThat(ExoPlayerService.isNetworkUri("rtsp://stream.example.com/audio.mp3")).isTrue()
        assertThat(ExoPlayerService.isNetworkUri("file:///storage/emulated/0/track.mp3")).isFalse()
        assertThat(ExoPlayerService.isNetworkUri("/storage/emulated/0/track.mp3")).isFalse()
        assertThat(ExoPlayerService.isNetworkUri(null)).isFalse()
    }

    @Test
    fun isTransientNetworkError_matchesNetworkErrorsOnlyForStreams() {
        val networkTimeout = PlaybackException(
            "Timeout",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        val networkFailed = PlaybackException(
            "Connection failed",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED
        )
        val badHttpStatus = PlaybackException(
            "Bad HTTP",
            null,
            PlaybackException.ERROR_CODE_IO_BAD_HTTP_STATUS
        )
        val unspecifiedWithIoCause = PlaybackException(
            "I/O error",
            IOException("Socket reset"),
            PlaybackException.ERROR_CODE_IO_UNSPECIFIED
        )
        val nonNetworkError = PlaybackException(
            "Decoder init failed",
            null,
            PlaybackException.ERROR_CODE_DECODER_INIT_FAILED
        )

        // For network streams: transient network errors are true
        assertThat(ExoPlayerService.isTransientNetworkError(networkTimeout, isStream = true)).isTrue()
        assertThat(ExoPlayerService.isTransientNetworkError(networkFailed, isStream = true)).isTrue()
        assertThat(ExoPlayerService.isTransientNetworkError(badHttpStatus, isStream = true)).isTrue()
        assertThat(ExoPlayerService.isTransientNetworkError(unspecifiedWithIoCause, isStream = true)).isTrue()
        assertThat(ExoPlayerService.isTransientNetworkError(nonNetworkError, isStream = true)).isFalse()

        // For local files: must always return false
        assertThat(ExoPlayerService.isTransientNetworkError(networkTimeout, isStream = false)).isFalse()
        assertThat(ExoPlayerService.isTransientNetworkError(networkFailed, isStream = false)).isFalse()
    }

    @Test
    fun handlePlayerError_transientNetworkError_schedulesReconnectAndRetainsPosition() {
        service.currentMediaUri = "https://stream.example.com/podcast.mp3"
        service.lastPlaybackPosition = 42000L

        val error = PlaybackException(
            "Connection dropped",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        service.handlePlayerError(error)

        assertThat(service.reconnectAttempts).isEqualTo(1)
        assertThat(service.lastPlaybackPosition).isEqualTo(42000L)
        assertThat(service.isReconnecting).isTrue()
        assertThat(service.reconnectRunnable).isNotNull()

        val state = service.playerState.value
        assertThat(state.isBuffering).isTrue()
        assertThat(state.isReconnecting).isTrue()
        assertThat(state.error).isNull()
    }

    @Test
    fun handlePlayerError_localFile_bypassesRetryAndPropagatesError() {
        service.currentMediaUri = "file:///storage/emulated/0/music/track.mp3"
        service.lastPlaybackPosition = 12000L

        val error = PlaybackException(
            "Read error",
            null,
            PlaybackException.ERROR_CODE_IO_UNSPECIFIED
        )
        service.handlePlayerError(error)

        assertThat(service.reconnectAttempts).isEqualTo(0)
        assertThat(service.isReconnecting).isFalse()
        assertThat(service.reconnectRunnable).isNull()

        val state = service.playerState.value
        assertThat(state.isBuffering).isFalse()
        assertThat(state.isReconnecting).isFalse()
        assertThat(state.error).isEqualTo("Read error")
    }

    @Test
    fun handlePlayerError_exhaustedRetries_propagatesFinalError() {
        service.currentMediaUri = "https://stream.example.com/podcast.mp3"
        service.reconnectAttempts = 3

        val error = PlaybackException(
            "Network timeout",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_FAILED
        )
        service.handlePlayerError(error)

        assertThat(service.reconnectAttempts).isEqualTo(0)
        assertThat(service.isReconnecting).isFalse()
        assertThat(service.reconnectRunnable).isNull()

        val state = service.playerState.value
        assertThat(state.isBuffering).isFalse()
        assertThat(state.isReconnecting).isFalse()
        assertThat(state.error).isEqualTo("Network timeout")
    }

    @Test
    fun pause_cancelsScheduledReconnect() {
        service.currentMediaUri = "https://stream.example.com/podcast.mp3"
        val error = PlaybackException(
            "Connection dropped",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        service.handlePlayerError(error)
        assertThat(service.isReconnecting).isTrue()
        assertThat(service.reconnectRunnable).isNotNull()

        service.pause()

        assertThat(service.isReconnecting).isFalse()
        assertThat(service.reconnectRunnable).isNull()
    }

    @Test
    fun stop_cancelsScheduledReconnectAndResetsAttempts() {
        service.currentMediaUri = "https://stream.example.com/podcast.mp3"
        val error = PlaybackException(
            "Connection dropped",
            null,
            PlaybackException.ERROR_CODE_IO_NETWORK_CONNECTION_TIMEOUT
        )
        service.handlePlayerError(error)
        assertThat(service.isReconnecting).isTrue()

        service.stop()

        assertThat(service.isReconnecting).isFalse()
        assertThat(service.reconnectAttempts).isEqualTo(0)
        assertThat(service.reconnectRunnable).isNull()
    }
}
