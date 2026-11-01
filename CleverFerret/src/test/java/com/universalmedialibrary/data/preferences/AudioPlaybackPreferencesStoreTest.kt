package com.universalmedialibrary.data.preferences

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import com.google.common.truth.Truth.assertThat
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.test.runTest
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(manifest = Config.NONE, sdk = [28])
class AudioPlaybackPreferencesStoreTest {

    companion object {
        private const val TEST_FORWARD_SEC = 45
        private const val TEST_BACKWARD_SEC = 60
        private const val NEGATIVE_INTERVAL = -10
    }

    private lateinit var context: Context
    private lateinit var store: AudioPlaybackPreferencesStore

    @Before
    fun setUp() = runTest {
        context = ApplicationProvider.getApplicationContext()
        store = AudioPlaybackPreferencesStore(context)
        store.clear()
    }

    @Test
    fun defaultPreferences_emitStandardSkipIntervals() = runTest {
        val prefs = store.preferences.first()
        assertThat(prefs.skipForwardIntervalSec).isEqualTo(AudioPlaybackPreferencesStore.DEFAULT_FORWARD_SKIP_SEC)
        assertThat(prefs.skipBackwardIntervalSec).isEqualTo(AudioPlaybackPreferencesStore.DEFAULT_BACKWARD_SKIP_SEC)
    }

    @Test
    fun setSkipForwardIntervalSec_updatesForwardInterval() = runTest {
        store.setSkipForwardIntervalSec(TEST_FORWARD_SEC)
        val prefs = store.preferences.first()
        assertThat(prefs.skipForwardIntervalSec).isEqualTo(TEST_FORWARD_SEC)
    }

    @Test
    fun setSkipBackwardIntervalSec_updatesBackwardInterval() = runTest {
        store.setSkipBackwardIntervalSec(TEST_BACKWARD_SEC)
        val prefs = store.preferences.first()
        assertThat(prefs.skipBackwardIntervalSec).isEqualTo(TEST_BACKWARD_SEC)
    }

    @Test
    fun nonPositiveForwardInterval_fallsBackToDefault() = runTest {
        store.setSkipForwardIntervalSec(NEGATIVE_INTERVAL)
        val prefs = store.preferences.first()
        assertThat(prefs.skipForwardIntervalSec).isEqualTo(AudioPlaybackPreferencesStore.DEFAULT_FORWARD_SKIP_SEC)
    }

    @Test
    fun nonPositiveBackwardInterval_fallsBackToDefault() = runTest {
        store.setSkipBackwardIntervalSec(0)
        val prefs = store.preferences.first()
        assertThat(prefs.skipBackwardIntervalSec).isEqualTo(AudioPlaybackPreferencesStore.DEFAULT_BACKWARD_SKIP_SEC)
    }
}
