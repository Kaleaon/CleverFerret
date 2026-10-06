package com.universalmedialibrary.ui.theme

import androidx.compose.ui.graphics.toArgb
import com.cleverferret.core.designsystem.theme.KthemeThemeAdapterV1
import com.universalmedialibrary.ui.modern.theme.CFThemes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class KthemeBridgeTest {

    @Test
    fun resolveColorScheme_returnsDistinctDarkAndLightSchemesForNavyGold() {
        val darkScheme = KthemeBridge.resolveColorScheme(CleverFerretTheme.NAVY_GOLD, darkTheme = true)
        val lightScheme = KthemeBridge.resolveColorScheme(CleverFerretTheme.NAVY_GOLD, darkTheme = false)

        assertNotNull("Dark scheme must not be null", darkScheme)
        assertNotNull("Light scheme must not be null", lightScheme)
        assertNotEquals(
            "Navy Gold dark and light backgrounds must be distinct",
            darkScheme.background.toArgb(),
            lightScheme.background.toArgb()
        )
    }

    @Test
    fun resolveColorScheme_resolvesAllBuiltInThemes() {
        CleverFerretTheme.entries.forEach { theme ->
            val darkScheme = KthemeBridge.resolveColorScheme(theme, darkTheme = true)
            val lightScheme = KthemeBridge.resolveColorScheme(theme, darkTheme = false)

            assertNotNull("Dark scheme for $theme should resolve", darkScheme)
            assertNotNull("Light scheme for $theme should resolve", lightScheme)
        }
    }

    @Test
    fun resolveMetallicGradient_returnsValidGradient() {
        val gradient = KthemeBridge.resolveMetallicGradient(CleverFerretTheme.NAVY_GOLD)

        assertNotNull("Metallic gradient base must not be null", gradient.base)
        assertNotNull("Metallic gradient highlight must not be null", gradient.highlight)
        assertNotNull("Metallic gradient shadow must not be null", gradient.shadow)
        assertNotNull("Metallic gradient shimmer must not be null", gradient.shimmer)
    }

    @Test
    fun cfThemeAdapter_producesValidSemanticThemeForCFPalettes() {
        CFThemes.All.forEach { palette ->
            val snapshot = KthemeThemeAdapterV1.KthemeSnapshot(
                id = palette.tokens.id,
                darkMode = palette.tokens.id != "paper-ink",
                primary = String.format("#%08X", palette.scheme.primary.toArgb()),
                onPrimary = String.format("#%08X", palette.scheme.onPrimary.toArgb()),
                background = String.format("#%08X", palette.scheme.background.toArgb()),
                onBackground = String.format("#%08X", palette.scheme.onBackground.toArgb()),
                surface = String.format("#%08X", palette.scheme.surface.toArgb()),
                onSurface = String.format("#%08X", palette.scheme.onSurface.toArgb()),
                outline = String.format("#%08X", palette.scheme.outline.toArgb()),
                error = String.format("#%08X", palette.scheme.error.toArgb()),
                onError = String.format("#%08X", palette.scheme.onError.toArgb())
            )
            val semanticTheme = KthemeThemeAdapterV1.adapt(snapshot)

            assertEquals(palette.tokens.id, semanticTheme.id)
            assertNotNull(semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY))
            assertNotNull(semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_BACKGROUND))
        }
    }
}
