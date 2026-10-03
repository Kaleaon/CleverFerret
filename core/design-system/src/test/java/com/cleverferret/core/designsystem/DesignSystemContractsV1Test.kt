package com.cleverferret.core.designsystem

import com.cleverferret.core.designsystem.theme.DefaultBaseThemes
import com.cleverferret.core.designsystem.theme.KthemeThemeAdapterV1
import com.cleverferret.core.designsystem.tokens.DesignTokensV1
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

class DesignSystemContractsV1Test {

    @Test
    fun testSpacingContracts() {
        assertEquals(0, DesignTokensV1.spacing("space.0"))
        assertEquals(4, DesignTokensV1.spacing("space.1"))
        assertEquals(16, DesignTokensV1.spacing("space.4"))
        assertEquals(24, DesignTokensV1.spacing("space.6"))
        assertEquals(64, DesignTokensV1.spacing("space.16"))
    }

    @Test
    fun testRadiusContracts() {
        assertEquals(4, DesignTokensV1.radius("radius.s"))
        assertEquals(8, DesignTokensV1.radius("radius.m"))
        assertEquals(12, DesignTokensV1.radius("radius.l"))
        assertEquals(16, DesignTokensV1.radius("radius.xl"))
        assertEquals(999, DesignTokensV1.radius("radius.full"))
    }

    @Test
    fun testFullSnapshotAdaptation() {
        val snapshot = KthemeThemeAdapterV1.KthemeSnapshot(
            id = "test-theme",
            darkMode = false,
            primary = "#112233",
            onPrimary = "#445566",
            background = "#778899",
            onBackground = "#AABBCC",
            surface = "#DDEEFF",
            onSurface = "#001122",
            outline = "#334455",
            error = "#FF0000",
            onError = "#FFFFFF"
        )

        val semanticTheme = KthemeThemeAdapterV1.adapt(snapshot)

        assertEquals("test-theme", semanticTheme.id)
        assertFalse(semanticTheme.dark)
        assertEquals("#112233", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY))
        assertEquals("#445566", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_INVERSE))
        assertEquals("#778899", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_BACKGROUND))
        assertEquals("#AABBCC", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_PRIMARY))
        assertEquals("#DDEEFF", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_ELEVATED))
        assertEquals("#001122", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_SECONDARY))
        assertEquals("#334455", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.BORDER_DEFAULT))
        assertEquals("#FF0000", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.STATE_ERROR))
        assertEquals("#FFFFFF", semanticTheme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_ERROR))
    }

    @Test
    fun testJsonParsing() {
        val json = """
            {
              "metadata": {
                "id": "paper-ink",
                "name": "Paper & Ink"
              },
              "darkMode": false,
              "colorScheme": {
                "primary": "#2C2C2C",
                "onPrimary": "#FAF9F6",
                "background": "#F0F0EB",
                "onBackground": "#2C2C2C",
                "surface": "#FAF9F6",
                "onSurface": "#2C2C2C",
                "outline": "#7A7A7A",
                "error": "#BA1A1A",
                "onError": "#FFFFFF"
              }
            }
        """.trimIndent()

        val theme = KthemeThemeAdapterV1.fromJson(json)

        assertEquals("paper-ink", theme.id)
        assertFalse(theme.dark)
        assertEquals("#2C2C2C", theme.color(KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY))
        assertEquals("#FAF9F6", theme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_INVERSE))
        assertEquals("#F0F0EB", theme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_BACKGROUND))
    }

    @Test
    fun testIncompleteSnapshotAutomaticFallbackInheritance() {
        // Missing primary and background; darkMode = true
        val incompleteSnapshot = KthemeThemeAdapterV1.KthemeSnapshot(
            id = "incomplete-dark",
            darkMode = true,
            primary = "", // blank -> should inherit from DARK_BASE
            surface = "#222222"
        )

        val theme = KthemeThemeAdapterV1.adapt(incompleteSnapshot)

        assertEquals("incomplete-dark", theme.id)
        assertTrue(theme.dark)
        // Primary was blank, so it inherited from DefaultBaseThemes.DARK_BASE.primary
        assertEquals(DefaultBaseThemes.DARK_BASE.primary, theme.color(KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY))
        // Surface was explicitly provided
        assertEquals("#222222", theme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_ELEVATED))
        // Background was null/blank, so it inherited from DefaultBaseThemes.DARK_BASE.background
        assertEquals(DefaultBaseThemes.DARK_BASE.background, theme.color(KthemeThemeAdapterV1.SemanticRole.SURFACE_BACKGROUND))
    }
}
