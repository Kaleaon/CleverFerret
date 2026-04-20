package com.universalmedialibrary.feature.audio

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class PlaybackSynchronizationEngineSimulationTest {

    @Test
    fun `drift correction is bounded while converging`() {
        val engine = PlaybackSynchronizationEngine(maxCorrectionPerTickMs = 15.0, jitterToleranceMs = 4.0)
        val start = 1_000L

        var offset = 90.0
        repeat(8) { tick ->
            engine.reportOffset("speaker-1", offsetMs = offset, observedJitterMs = 3.0, nowMs = start + tick * 100)
            val correction = engine.state.value.devices.getValue("speaker-1").correctionMs
            assertTrue("Correction should be bounded", kotlin.math.abs(correction) <= 15.0)
            offset -= correction
        }

        assertTrue(offset < 10.0)
    }

    @Test
    fun `disconnect fallback then auto-rejoin`() {
        val engine = PlaybackSynchronizationEngine(disconnectTimeoutMs = 500)
        engine.reportOffset("speaker-2", offsetMs = 2.0, observedJitterMs = 1.0, nowMs = 10_000)
        engine.onDisconnect("speaker-2", nowMs = 11_000)

        assertTrue(engine.state.value.fallbackToLocalPlayback)

        engine.autoRejoin("speaker-2")

        assertFalse(engine.state.value.fallbackToLocalPlayback)
        assertTrue(engine.state.value.devices.getValue("speaker-2").isConnected)
    }
}
