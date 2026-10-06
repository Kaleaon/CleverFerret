package com.universalmedialibrary.ui.theme

import androidx.compose.ui.graphics.Color
import com.universalmedialibrary.ui.modern.theme.CFMetal
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertSame
import org.junit.Test

class BrushAndThemeCachingTest {

    @Test
    fun cfMetal_brush_returnsSameCachedInstance() {
        val metal = CFMetal(
            shadow = Color(0xFF7A5B1E),
            base = Color(0xFFD4AF37),
            highlight = Color(0xFFFFE680),
            shimmer = Color(0xFFFFFCE0)
        )

        val brush1 = metal.brush()
        val brush2 = metal.brush()
        val brush3 = metal.brush()

        assertNotNull("Brush should not be null", brush1)
        assertSame("brush() must return referentially identical cached instance on repeated calls", brush1, brush2)
        assertSame("brush() must return referentially identical cached instance on repeated calls", brush2, brush3)
    }

    @Test
    fun kthemeBridge_resolveColorScheme_returnsCachedInstance() {
        val theme = CleverFerretTheme.NAVY_GOLD
        val scheme1 = KthemeBridge.resolveColorScheme(theme, darkTheme = true)
        val scheme2 = KthemeBridge.resolveColorScheme(theme, darkTheme = true)

        assertNotNull("ColorScheme should not be null", scheme1)
        assertSame("resolveColorScheme must return cached ColorScheme instance", scheme1, scheme2)
    }

    @Test
    fun kthemeBridge_resolveMetallicGradient_returnsCachedInstance() {
        val theme = CleverFerretTheme.EMERALD_SILVER
        val metallic1 = KthemeBridge.resolveMetallicGradient(theme)
        val metallic2 = KthemeBridge.resolveMetallicGradient(theme)

        assertNotNull("MetallicGradient should not be null", metallic1)
        assertSame("resolveMetallicGradient must return cached MetallicGradient instance", metallic1, metallic2)
    }

    @Test
    fun kthemeBridge_invalidateCache_refreshesCachedInstances() {
        val theme = CleverFerretTheme.MIDNIGHT_AMBER
        val schemeBefore = KthemeBridge.resolveColorScheme(theme, darkTheme = true)
        val metallicBefore = KthemeBridge.resolveMetallicGradient(theme)

        KthemeBridge.invalidateCache()

        val schemeAfter = KthemeBridge.resolveColorScheme(theme, darkTheme = true)
        val metallicAfter = KthemeBridge.resolveMetallicGradient(theme)

        assertNotNull("New ColorScheme after invalidateCache must not be null", schemeAfter)
        assertNotNull("New MetallicGradient after invalidateCache must not be null", metallicAfter)

        // Values should match structurally
        assertEquals(schemeBefore.primary, schemeAfter.primary)
        assertEquals(metallicBefore.base, metallicAfter.base)
    }
}
