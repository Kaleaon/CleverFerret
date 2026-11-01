package com.universalmedialibrary.ui.media.theme

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.luminance
import com.universalmedialibrary.ui.folderimport.ScannedFileType
import com.universalmedialibrary.ui.modern.theme.CFMediaCategoryDefaults
import com.universalmedialibrary.ui.modern.theme.CFThemes
import org.junit.Assert.assertTrue
import org.junit.Test

private const val WCAG_AA_BODY_CONTRAST_THRESHOLD = 4.5f
private const val WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD = 3.0f
private const val LUMINANCE_MIDPOINT_THRESHOLD = 0.2f

class MediaAccessibilityContrastTest {

    @Test
    fun bodyTextContrast_meetsWcagAaThreshold() {
        val ratio = calculateContrastRatio(MediaColors.TextPrimary, MediaColors.Background)
        assertTrue(
            "Body text contrast must be >= $WCAG_AA_BODY_CONTRAST_THRESHOLD:1, got $ratio",
            ratio >= WCAG_AA_BODY_CONTRAST_THRESHOLD
        )
    }

    @Test
    fun largeTextContrast_meetsWcagAaThreshold() {
        val ratio = calculateContrastRatio(MediaColors.TextSecondary, MediaColors.Background)
        assertTrue(
            "Large text contrast must be >= $WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD:1, got $ratio",
            ratio >= WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD
        )
    }

    @Test
    fun interactiveAccentContrast_meetsMinimumThreshold() {
        val ratio = calculateContrastRatio(MediaColors.AccentPrimary, MediaColors.Background)
        assertTrue(
            "Interactive element contrast must be >= $WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD:1, got $ratio",
            ratio >= WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD
        )
    }

    @Test
    fun darkMediaCategories_contrastAgainstDarkBackground_meetsWcagAaThreshold() {
        val darkPalette = CFMediaCategoryDefaults.darkPalette()
        val darkBackground = CFThemes.NavyGold.scheme.background

        ScannedFileType.values().forEach { fileType ->
            val color = darkPalette.forScannedFileType(fileType)
            val ratio = calculateContrastRatio(color, darkBackground)
            assertTrue(
                "Dark category color for $fileType ($color) against background ($darkBackground) " +
                    "must meet >= $WCAG_AA_BODY_CONTRAST_THRESHOLD:1, got $ratio",
                ratio >= WCAG_AA_BODY_CONTRAST_THRESHOLD
            )
        }
    }

    @Test
    fun lightMediaCategories_contrastAgainstLightBackground_meetsWcagAaThreshold() {
        val lightPalette = CFMediaCategoryDefaults.lightPalette()
        val lightBackground = CFThemes.PaperInk.scheme.background

        ScannedFileType.values().forEach { fileType ->
            val color = lightPalette.forScannedFileType(fileType)
            val ratio = calculateContrastRatio(color, lightBackground)
            assertTrue(
                "Light category color for $fileType ($color) against background ($lightBackground) " +
                    "must meet >= $WCAG_AA_BODY_CONTRAST_THRESHOLD:1, got $ratio",
                ratio >= WCAG_AA_BODY_CONTRAST_THRESHOLD
            )
        }
    }

    @Test
    fun highContrastMediaCategories_contrastAgainstBackground_meetsWcagAaThreshold() {
        val highContrastPalette = CFMediaCategoryDefaults.highContrastPalette()
        val highContrastBackground = CFThemes.HighContrast.scheme.background

        ScannedFileType.values().forEach { fileType ->
            val color = highContrastPalette.forScannedFileType(fileType)
            val ratio = calculateContrastRatio(color, highContrastBackground)
            assertTrue(
                "High contrast category color for $fileType ($color) against background ($highContrastBackground) " +
                    "must meet >= $WCAG_AA_BODY_CONTRAST_THRESHOLD:1, got $ratio",
                ratio >= WCAG_AA_BODY_CONTRAST_THRESHOLD
            )
        }
    }

    @Test
    fun allThemes_onBackgroundContrast_meetsWcagAaThreshold() {
        val palettes = listOf(
            CFThemes.NavyGold,
            CFThemes.RoseGold,
            CFThemes.EmeraldSilver,
            CFThemes.MidnightAmber,
            CFThemes.PaperInk,
            CFThemes.NeoNoirNeon,
            CFThemes.Lcars,
            CFThemes.Metro,
            CFThemes.EInk,
            CFThemes.HighContrast
        )

        palettes.forEach { palette ->
            val ratio = calculateContrastRatio(palette.scheme.onBackground, palette.scheme.background)
            assertTrue(
                "Theme ${palette.tokens.id} onBackground must meet >= $WCAG_AA_BODY_CONTRAST_THRESHOLD:1, got $ratio",
                ratio >= WCAG_AA_BODY_CONTRAST_THRESHOLD
            )
        }
    }

    @Test
    fun placeholderCoverColors_contrastWithCalculatedContentColor() {
        val palettes = listOf(
            CFThemes.NavyGold,
            CFThemes.PaperInk,
            CFThemes.HighContrast
        )

        palettes.forEach { palette ->
            palette.tokens.placeholderCoverColors.forEach { bgColor ->
                val bgLuminance = bgColor.luminance()
                val contentColor = if (bgLuminance < LUMINANCE_MIDPOINT_THRESHOLD) {
                    Color.White
                } else {
                    palette.scheme.onSurface
                }
                val ratio = calculateContrastRatio(contentColor, bgColor)
                assertTrue(
                    "Theme ${palette.tokens.id} placeholder color $bgColor must have content contrast >= " +
                        "$WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD:1, got $ratio",
                    ratio >= WCAG_AA_LARGE_TEXT_CONTRAST_THRESHOLD
                )
            }
        }
    }
}
