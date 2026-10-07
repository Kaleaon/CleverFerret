package com.universalmedialibrary.ui.media.theme

import androidx.compose.animation.EnterTransition
import androidx.compose.animation.ExitTransition
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class MediaReduceMotionTest {

    @Test
    fun testSectionEnter_whenReducedMotion_returnsNone() {
        val transition = MediaMotion.sectionEnter(sectionIndex = 0, reducedMotionEnabled = true)
        assertEquals(EnterTransition.None, transition)
    }

    @Test
    fun testSectionExit_whenReducedMotion_returnsNone() {
        val transition = MediaMotion.sectionExit(reducedMotionEnabled = true)
        assertEquals(ExitTransition.None, transition)
    }

    @Test
    fun testLocalReduceMotionKeyExists() {
        assertNotNull(LocalReduceMotion)
    }

    @Test
    fun testIsReducedMotionEnabled_fallbackInTestEnvironment_doesNotCrash() {
        val result = MediaMotion.isReducedMotionEnabled()
        assertEquals(false, result)
    }
}
