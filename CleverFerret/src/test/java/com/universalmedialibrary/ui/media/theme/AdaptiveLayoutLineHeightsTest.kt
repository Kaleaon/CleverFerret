package com.universalmedialibrary.ui.media.theme

import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.isSpecified
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.modern.theme.cfTypography
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class AdaptiveLayoutLineHeightsTest {

    @Test
    fun cfTypography_allStylesHaveExplicitLineHeights() {
        val typography = cfTypography()

        val styles = listOf(
            "displayLarge" to typography.displayLarge,
            "displayMedium" to typography.displayMedium,
            "headlineLarge" to typography.headlineLarge,
            "headlineMedium" to typography.headlineMedium,
            "titleLarge" to typography.titleLarge,
            "titleMedium" to typography.titleMedium,
            "titleSmall" to typography.titleSmall,
            "bodyLarge" to typography.bodyLarge,
            "bodyMedium" to typography.bodyMedium,
            "bodySmall" to typography.bodySmall,
            "labelLarge" to typography.labelLarge,
            "labelMedium" to typography.labelMedium,
            "labelSmall" to typography.labelSmall
        )

        for ((name, style) in styles) {
            assertTrue("Typography style $name must have explicit lineHeight", style.lineHeight.isSpecified)
            assertTrue("Line height must be greater than font size for $name", style.lineHeight.value > style.fontSize.value)
        }
    }

    @Test
    fun cfTypography_explicitLineHeightsMatchRequirements() {
        val typography = cfTypography()

        assertEquals(44.sp, typography.displayLarge.fontSize)
        assertEquals(52.sp, typography.displayLarge.lineHeight)

        assertEquals(32.sp, typography.displayMedium.fontSize)
        assertEquals(40.sp, typography.displayMedium.lineHeight)

        assertEquals(26.sp, typography.headlineLarge.fontSize)
        assertEquals(32.sp, typography.headlineLarge.lineHeight)

        assertEquals(22.sp, typography.headlineMedium.fontSize)
        assertEquals(28.sp, typography.headlineMedium.lineHeight)

        assertEquals(17.sp, typography.titleLarge.fontSize)
        assertEquals(24.sp, typography.titleLarge.lineHeight)

        assertEquals(15.sp, typography.titleMedium.fontSize)
        assertEquals(20.sp, typography.titleMedium.lineHeight)

        assertEquals(13.sp, typography.titleSmall.fontSize)
        assertEquals(18.sp, typography.titleSmall.lineHeight)

        assertEquals(13.sp, typography.labelLarge.fontSize)
        assertEquals(18.sp, typography.labelLarge.lineHeight)

        assertEquals(11.sp, typography.labelMedium.fontSize)
        assertEquals(16.sp, typography.labelMedium.lineHeight)

        assertEquals(10.sp, typography.labelSmall.fontSize)
        assertEquals(14.sp, typography.labelSmall.lineHeight)
    }

    @Test
    fun wcag21_sc144_resizeText200Percent_maintainsProportionalLineHeights() {
        val typography = cfTypography()
        val fontScale = 2.0f

        val styles = listOf(
            typography.displayLarge, typography.displayMedium,
            typography.headlineLarge, typography.headlineMedium,
            typography.titleLarge, typography.titleMedium, typography.titleSmall,
            typography.bodyLarge, typography.bodyMedium, typography.bodySmall,
            typography.labelLarge, typography.labelMedium, typography.labelSmall
        )

        for (style in styles) {
            val scaledFontSize = style.fontSize.value * fontScale
            val scaledLineHeight = style.lineHeight.value * fontScale
            val lineSpacingMargin = scaledLineHeight - scaledFontSize

            assertTrue("Scaled line height must exceed scaled font size to prevent overlap", scaledLineHeight > scaledFontSize)
            assertTrue("Scaled line spacing margin must be at least 4.0sp under 200% scale", lineSpacingMargin >= 4.0f)
        }
    }
}
