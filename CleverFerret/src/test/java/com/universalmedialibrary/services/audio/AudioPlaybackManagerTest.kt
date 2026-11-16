package com.universalmedialibrary.services.audio

import androidx.media3.common.PlaybackException
import com.google.common.truth.Truth.assertThat
import org.junit.Test
import java.io.IOException

class AudioPlaybackManagerTest {

    @Test
    fun getReconnectDelayMs_exponentialProgression() {
        assertThat(AudioPlaybackManager.getReconnectDelayMs(1)).isEqualTo(1000L)
        assertThat(AudioPlaybackManager.getReconnectDelayMs(2)).isEqualTo(2000L)
        assertThat(AudioPlaybackManager.getReconnectDelayMs(3)).isEqualTo(4000L)
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

        // For streams:
        assertThat(AudioPlaybackManager.isTransientNetworkError(networkTimeout, isStream = true)).isTrue()
        assertThat(AudioPlaybackManager.isTransientNetworkError(networkFailed, isStream = true)).isTrue()
        assertThat(AudioPlaybackManager.isTransientNetworkError(badHttpStatus, isStream = true)).isTrue()
        assertThat(AudioPlaybackManager.isTransientNetworkError(unspecifiedWithIoCause, isStream = true)).isTrue()
        assertThat(AudioPlaybackManager.isTransientNetworkError(nonNetworkError, isStream = true)).isFalse()

        // For local files:
        assertThat(AudioPlaybackManager.isTransientNetworkError(networkTimeout, isStream = false)).isFalse()
        assertThat(AudioPlaybackManager.isTransientNetworkError(networkFailed, isStream = false)).isFalse()
    }
}
