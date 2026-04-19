package com.universalmedialibrary.ui.media.theme

import org.junit.Assert.assertTrue
import org.junit.Test

class MediaAccessibilityContrastTest {

    @Test
    fun bodyTextContrast_meetsWcagAaThreshold() {
        val ratio = calculateContrastRatio(MediaColors.TextPrimary, MediaColors.Background)

        assertTrue("Body text contrast must be >= 4.5:1, got $ratio", ratio >= 4.5f)
    }

    @Test
    fun largeTextContrast_meetsWcagAaThreshold() {
        val ratio = calculateContrastRatio(MediaColors.TextSecondary, MediaColors.Background)

        assertTrue("Large text contrast must be >= 3.0:1, got $ratio", ratio >= 3.0f)
    }

    @Test
    fun interactiveAccentContrast_meetsMinimumThreshold() {
        val ratio = calculateContrastRatio(MediaColors.AccentPrimary, MediaColors.Background)

        assertTrue("Interactive element contrast must be >= 3.0:1, got $ratio", ratio >= 3.0f)
    }
}
