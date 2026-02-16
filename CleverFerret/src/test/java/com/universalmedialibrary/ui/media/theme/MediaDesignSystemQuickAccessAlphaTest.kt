package com.universalmedialibrary.ui.media.theme

import androidx.compose.ui.graphics.Color
import org.junit.Assert.assertTrue
import org.junit.Test

class MediaDesignSystemQuickAccessAlphaTest {

    @Test
    fun quickAccessAlphas_meetMinimumContrast_onDarkSurface() {
        val surface = Color(0xFF1E1E1E)
        val primary = Color(0xFFF2DF0D)

        val ratios = computeQuickAccessContrastRatios(surface = surface, primary = primary)

        assertTrue("Border contrast should be >= 1.3 on dark surface", ratios.borderToSurface >= 1.3f)
        assertTrue("Chip contrast should be >= 1.6 on dark surface", ratios.chipToSurface >= 1.6f)
    }

    @Test
    fun quickAccessAlphas_meetMinimumContrast_onLightSurface() {
        val surface = Color(0xFFFFFFFF)
        val primary = Color(0xFFCC7A00)

        val ratios = computeQuickAccessContrastRatios(surface = surface, primary = primary)

        assertTrue("Border contrast should be >= 1.3 on light surface", ratios.borderToSurface >= 1.3f)
        assertTrue("Chip contrast should be >= 1.6 on light surface", ratios.chipToSurface >= 1.6f)
    }
}
