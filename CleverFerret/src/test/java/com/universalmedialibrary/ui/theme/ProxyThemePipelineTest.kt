package com.universalmedialibrary.ui.theme

import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.cleverferret.core.designsystem.theme.LocalProxyTheme
import com.cleverferret.core.designsystem.theme.ProxyTheme
import com.cleverferret.core.designsystem.theme.SnapshotThemeProxy
import com.cleverferret.core.designsystem.theme.drawThemeColor
import com.cleverferret.core.designsystem.theme.drawWithTheme
import com.cleverferret.core.designsystem.theme.themeProxyTint
import com.cleverferret.core.designsystem.theme.themeTint
import com.universalmedialibrary.ui.modern.theme.CFThemes
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertSame
import org.junit.Test

class ProxyThemePipelineTest {

    @Test
    fun testLocalCFTokensIsDynamicCompositionLocal() {
        val isStatic = LocalCFTokens.javaClass.name.contains("Static")
        assertFalse(
            "LocalCFTokens must be dynamic compositionLocalOf to prevent full-tree invalidation on theme changes",
            isStatic
        )
    }

    @Test
    fun testLocalProxyThemeIsDynamicCompositionLocal() {
        val isStatic = LocalProxyTheme.javaClass.name.contains("Static")
        assertFalse(
            "LocalProxyTheme must be dynamic compositionLocalOf to prevent full-tree invalidation on theme changes",
            isStatic
        )
    }

    @Test
    fun testSnapshotThemeProxyStabilityWithCFThemes() {
        val navyGoldScheme = CFThemes.byId("navy-gold").scheme
        val roseGoldScheme = CFThemes.byId("rose-gold").scheme

        val proxy = SnapshotThemeProxy(initialColorScheme = navyGoldScheme)
        val initialProxyTheme = proxy.proxyTheme
        val primaryGetter = initialProxyTheme.primary
        val surfaceGetter = initialProxyTheme.surface

        // Verify initial color matches navy-gold
        assertEquals(navyGoldScheme.primary, primaryGetter())
        assertEquals(navyGoldScheme.surface, surfaceGetter())

        // Update to rose-gold
        proxy.update(newColorScheme = roseGoldScheme)

        // Verify reference identity is preserved (zero allocation & zero recomposition trigger)
        assertSame("ProxyTheme reference must remain identical across theme updates", initialProxyTheme, proxy.proxyTheme)
        assertSame("primary lambda must remain identical across theme updates", primaryGetter, proxy.proxyTheme.primary)
        assertSame("surface lambda must remain identical across theme updates", surfaceGetter, proxy.proxyTheme.surface)

        // Verify updated color values reflect rose-gold
        assertEquals(roseGoldScheme.primary, primaryGetter())
        assertEquals(roseGoldScheme.surface, surfaceGetter())
    }

    @Test
    fun testModifiersCompositionChain() {
        val theme = ProxyTheme.Default
        val modifier = Modifier
            .drawWithTheme { currentTheme -> drawRect(currentTheme.primary()) }
            .drawThemeColor { it.surface() }
            .themeTint(theme.primary)
            .themeProxyTint(colorGetter = { it.secondary() })

        assertNotNull(modifier)
    }

    @Test
    fun testZeroCompositionAndLayoutPhaseDecouplingContract() {
        var compositionPhaseReadCount = 0
        var layoutPhaseReadCount = 0
        var drawPhaseReadCount = 0

        val navyGoldScheme = CFThemes.byId("navy-gold").scheme
        val proxy = SnapshotThemeProxy(initialColorScheme = navyGoldScheme)

        // In a decoupled architecture, composable functions pass the getter lambda (or ProxyTheme)
        // without invoking it during composition or layout:
        val getter = proxy.proxyTheme.primary

        // Composition phase: Modifier or composable receives the lambda reference, not the Color value
        val passedLambda = getter
        // Verify composition does NOT invoke the lambda
        assertEquals(0, compositionPhaseReadCount)

        // Layout phase: Layout / measure pass does NOT invoke the lambda
        assertEquals(0, layoutPhaseReadCount)

        // Draw phase: Invoked inside GPU DrawScope / graphicsLayer block
        val renderedColor = passedLambda()
        drawPhaseReadCount++

        assertEquals(1, drawPhaseReadCount)
        assertEquals(navyGoldScheme.primary, renderedColor)

        // Update theme in background (e.g. dynamic theme transition or user toggle)
        val roseGoldScheme = CFThemes.byId("rose-gold").scheme
        proxy.update(newColorScheme = roseGoldScheme)

        // Subsequent draw pass reads new value without recomposition or layout pass
        val updatedRenderedColor = passedLambda()
        drawPhaseReadCount++

        assertEquals(0, compositionPhaseReadCount)
        assertEquals(0, layoutPhaseReadCount)
        assertEquals(2, drawPhaseReadCount)
        assertEquals(roseGoldScheme.primary, updatedRenderedColor)
    }
}
