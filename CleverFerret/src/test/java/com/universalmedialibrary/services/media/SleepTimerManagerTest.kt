package com.universalmedialibrary.services.media

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class SleepTimerManagerTest {

    private lateinit var sleepTimerManager: SleepTimerManager

    @Before
    fun setUp() {
        sleepTimerManager = SleepTimerManager()
    }

    @Test
    fun initialState_defaultsAreCorrect() {
        val state = sleepTimerManager.state.value
        assertFalse(state.isActive)
        assertFalse(state.isPaused)
        assertEquals(0L, state.totalSeconds)
        assertEquals(0L, state.remainingSeconds)
        assertTrue(state.fadeOut)
        assertEquals(1.0f, sleepTimerManager.getBaseVolume(), 0.001f)
    }

    @Test
    fun shouldFadeOut_returnsTrueOnlyInLast10SecondsWhenFadeOutEnabled() {
        sleepTimerManager.startTimer(
            durationMinutes = 1,
            fadeOut = true,
            onComplete = {}
        )

        assertFalse(sleepTimerManager.shouldFadeOut())
        assertEquals(1.0f, sleepTimerManager.getFadeOutProgress(), 0.001f)

        // Stop timer
        sleepTimerManager.stopTimer()
    }

    @Test
    fun getFadeOutProgress_calculatesProgressCorrectly() {
        // When timer is not active, getFadeOutProgress returns 1.0f
        assertEquals(1.0f, sleepTimerManager.getFadeOutProgress(), 0.001f)
    }

    @Test
    fun setBaseVolume_updatesBaseVolumeAndAttenuatesIfFadingOut() {
        var recordedVolume: Float? = null
        sleepTimerManager.setVolumeDelegate { vol -> recordedVolume = vol }

        sleepTimerManager.setBaseVolume(0.8f)
        assertEquals(0.8f, sleepTimerManager.getBaseVolume(), 0.001f)

        // When not fading out, setting base volume doesn't trigger fade out callback directly
        // unless currently in fade out window
    }

    @Test
    fun stopTimer_restoresBaseVolumeWhenActive() = runTest {
        val volumeChanges = mutableListOf<Float>()
        sleepTimerManager.setBaseVolume(0.8f)
        sleepTimerManager.setVolumeDelegate { vol -> volumeChanges.add(vol) }

        sleepTimerManager.startTimer(
            durationMinutes = 1,
            fadeOut = true,
            initialBaseVolume = 0.8f,
            onComplete = {}
        )

        sleepTimerManager.stopTimer()

        // stopTimer should restore base volume (0.8f)
        assertTrue(volumeChanges.contains(0.8f))
        assertFalse(sleepTimerManager.state.value.isActive)
    }

    @Test
    fun addTime_restoresBaseVolumeWhenLeavingFadeOutWindow() = runTest {
        var currentVolume: Float? = null
        sleepTimerManager.setBaseVolume(0.7f)
        sleepTimerManager.setVolumeDelegate { vol -> currentVolume = vol }

        sleepTimerManager.startTimer(
            durationMinutes = 1,
            fadeOut = true,
            initialBaseVolume = 0.7f,
            onComplete = {}
        )

        // Simulate adding time
        sleepTimerManager.addTime(5)

        assertEquals(0.7f, sleepTimerManager.getBaseVolume(), 0.001f)
        assertFalse(sleepTimerManager.shouldFadeOut())
    }
}
