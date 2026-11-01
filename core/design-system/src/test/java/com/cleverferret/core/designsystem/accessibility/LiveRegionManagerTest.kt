package com.cleverferret.core.designsystem.accessibility

import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.TestScope
import kotlinx.coroutines.test.advanceTimeBy
import kotlinx.coroutines.test.advanceUntilIdle
import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class LiveRegionManagerTest {

    data class DispatchedEvent(val message: String, val isAssertive: Boolean)

    @Test
    fun isAccessibilityActive_gatesAnnouncementsWhenDisabled() = runTest {
        val dispatched = mutableListOf<DispatchedEvent>()
        val manager = DefaultLiveRegionManager(
            scope = this,
            isAccessibilityActiveProvider = { false },
            dispatcher = { msg, assertive -> dispatched.add(DispatchedEvent(msg, assertive)) }
        )

        assertFalse(manager.isAccessibilityActive)

        manager.announcePolite("Polite test")
        manager.announceAssertive("Assertive test")
        manager.announceProgress(50, "Syncing")
        advanceUntilIdle()

        assertTrue(dispatched.isEmpty())
    }

    @Test
    fun announcePolite_debouncesConsecutiveMessages() = runTest {
        val dispatched = mutableListOf<DispatchedEvent>()
        val config = LiveRegionThrottleConfig(politeDebounceMs = 300L)
        val manager = DefaultLiveRegionManager(
            scope = this,
            config = config,
            isAccessibilityActiveProvider = { true },
            dispatcher = { msg, assertive -> dispatched.add(DispatchedEvent(msg, assertive)) }
        )

        manager.announcePolite("First update")
        advanceTimeBy(100L)
        manager.announcePolite("Second update")
        advanceTimeBy(100L)
        manager.announcePolite("Final update")

        // Before 300ms completes from final update, nothing dispatched
        advanceTimeBy(200L)
        assertTrue(dispatched.isEmpty())

        // After debounce time completes
        advanceTimeBy(150L)
        assertEquals(1, dispatched.size)
        assertEquals("Final update", dispatched[0].message)
        assertFalse(dispatched[0].isAssertive)
    }

    @Test
    fun announceAssertive_bypassesDebounceAndClearsPendingPolite() = runTest {
        val dispatched = mutableListOf<DispatchedEvent>()
        val config = LiveRegionThrottleConfig(politeDebounceMs = 300L)
        val manager = DefaultLiveRegionManager(
            scope = this,
            config = config,
            isAccessibilityActiveProvider = { true },
            dispatcher = { msg, assertive -> dispatched.add(DispatchedEvent(msg, assertive)) }
        )

        manager.announcePolite("Pending polite status")
        advanceTimeBy(100L)

        // Assertive error triggers immediately
        manager.announceAssertive("Sync failed: Network timeout")

        assertEquals(1, dispatched.size)
        assertEquals("Sync failed: Network timeout", dispatched[0].message)
        assertTrue(dispatched[0].isAssertive)

        // Advance beyond polite debounce interval to ensure polite message was cancelled
        advanceUntilIdle()
        assertEquals(1, dispatched.size)
    }

    @Test
    fun announceProgress_filtersBelowThresholdAndThrottlesInterval() = runTest {
        val dispatched = mutableListOf<DispatchedEvent>()
        var virtualTime = 1000L
        val config = LiveRegionThrottleConfig(
            minProgressIntervalMs = 500L,
            minProgressStep = 10
        )
        val manager = DefaultLiveRegionManager(
            scope = this,
            config = config,
            isAccessibilityActiveProvider = { true },
            dispatcher = { msg, assertive -> dispatched.add(DispatchedEvent(msg, assertive)) },
            timeProvider = { virtualTime }
        )

        // First progress announcement triggers immediately
        manager.announceProgress(10, "Syncing")
        advanceUntilIdle()
        assertEquals(1, dispatched.size)
        assertEquals("Syncing: 10%", dispatched[0].message)

        // Minor step change (<10%) within interval -> filtered out
        virtualTime += 100L
        manager.announceProgress(14, "Syncing")
        advanceUntilIdle()
        assertEquals(1, dispatched.size)

        // Substantial step change (>=10%) but within 500ms interval -> scheduled trailing update
        virtualTime += 100L // virtualTime = 1200L (200ms elapsed since last)
        manager.announceProgress(25, "Syncing")

        // Before 500ms elapsed
        advanceTimeBy(200L)
        assertEquals(1, dispatched.size)

        // Another update before trailing fires updates the pending percent
        virtualTime += 150L // virtualTime = 1350L
        manager.announceProgress(35, "Syncing")

        // When interval completes (500ms elapsed since 1000L = at 1500L)
        virtualTime = 1550L
        advanceTimeBy(200L)
        advanceUntilIdle()

        assertEquals(2, dispatched.size)
        assertEquals("Syncing: 35%", dispatched[1].message)
    }

    @Test
    fun announceProgress_announcesMilestonesImmediately() = runTest {
        val dispatched = mutableListOf<DispatchedEvent>()
        var virtualTime = 1000L
        val config = LiveRegionThrottleConfig(
            minProgressIntervalMs = 500L,
            minProgressStep = 10
        )
        val manager = DefaultLiveRegionManager(
            scope = this,
            config = config,
            isAccessibilityActiveProvider = { true },
            dispatcher = { msg, assertive -> dispatched.add(DispatchedEvent(msg, assertive)) },
            timeProvider = { virtualTime }
        )

        // 0% milestone
        manager.announceProgress(0, "Download")
        advanceUntilIdle()
        assertEquals(1, dispatched.size)
        assertEquals("Download: 0%", dispatched[0].message)

        // Rapid progress to 100% milestone triggers immediately even without interval
        virtualTime += 50L
        manager.announceProgress(100, "Download")
        advanceUntilIdle()
        assertEquals(2, dispatched.size)
        assertEquals("Download: 100%", dispatched[1].message)
    }

    @Test
    fun noOpLiveRegionManager_safelyDoesNothing() {
        NoOpLiveRegionManager.announcePolite("Test")
        NoOpLiveRegionManager.announceAssertive("Test")
        NoOpLiveRegionManager.announceProgress(50, "Test")
        NoOpLiveRegionManager.cancelPendingAnnouncements()
        assertFalse(NoOpLiveRegionManager.isAccessibilityActive)
    }
}
