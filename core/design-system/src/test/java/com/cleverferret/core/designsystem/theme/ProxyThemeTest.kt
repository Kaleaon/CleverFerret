package com.cleverferret.core.designsystem.theme

import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertSame
import org.junit.Test

class ProxyThemeTest {

    @Test
    fun testParseHexColor() {
        assertEquals(Color(0xFFFF0000), parseHexColor("#FF0000"))
        assertEquals(Color(0x8000FF00), parseHexColor("#8000FF00"))
        assertEquals(Color.Unspecified, parseHexColor(null))
        assertEquals(Color.Unspecified, parseHexColor(""))
        assertEquals(Color.Unspecified, parseHexColor("invalid-hex"))
    }

    @Test
    fun testProxyThemeDefault() {
        val defaultProxy = ProxyTheme.Default
        assertNotEquals(Color.Unspecified, defaultProxy.primary())
        assertNotEquals(Color.Unspecified, defaultProxy.background())
        assertNotEquals(Color.Unspecified, defaultProxy.surface())
        assertEquals(Color.Black, defaultProxy.scrim())
    }

    @Test
    fun testProxyThemeFromColorScheme() {
        val customColors = lightColorScheme(
            primary = Color(0xFF112233),
            secondary = Color(0xFF445566),
            background = Color(0xFF778899)
        )
        val proxy = ProxyTheme.fromColorScheme(customColors)

        assertEquals(Color(0xFF112233), proxy.primary())
        assertEquals(Color(0xFF445566), proxy.secondary())
        assertEquals(Color(0xFF778899), proxy.background())
    }

    @Test
    fun testSnapshotThemeProxyMaintainsReferenceIdentityAcrossUpdates() {
        val light = lightColorScheme(
            primary = Color(0xFF0000FF),
            surfaceVariant = Color(0xFFE0E0E0)
        )
        val dark = darkColorScheme(
            primary = Color(0xFFFF0000),
            surfaceVariant = Color(0xFF303030)
        )

        val proxy = SnapshotThemeProxy(initialColorScheme = light)
        val proxyThemeInstance = proxy.proxyTheme
        val primaryLambda = proxyThemeInstance.primary
        val surfaceVariantLambda = proxyThemeInstance.surfaceVariant

        // Verify initial state
        assertEquals(Color(0xFF0000FF), proxyThemeInstance.primary())
        assertEquals(Color(0xFFE0E0E0), proxyThemeInstance.surfaceVariant())

        // Update with dark color scheme
        proxy.update(newColorScheme = dark)

        // Reference identity MUST be strictly preserved to avoid recompositions
        assertSame("ProxyTheme instance must be identical after update", proxyThemeInstance, proxy.proxyTheme)
        assertSame("Getter lambda reference must be identical after update", primaryLambda, proxy.proxyTheme.primary)
        assertSame("Getter lambda reference must be identical after update", surfaceVariantLambda, proxy.proxyTheme.surfaceVariant)

        // But the color evaluated by invoking the lambda MUST reflect the updated snapshot state
        assertEquals(Color(0xFFFF0000), proxyThemeInstance.primary())
        assertEquals(Color(0xFF303030), proxyThemeInstance.surfaceVariant())
    }

    @Test
    fun testSemanticRoleResolutionAndUpdates() {
        val semanticTheme1 = KthemeThemeAdapterV1.SemanticTheme(
            id = "test-theme-1",
            dark = false,
            semanticColors = mapOf(
                KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY.token to "#FF0000",
                KthemeThemeAdapterV1.SemanticRole.CONTENT_PRIMARY.token to "#00FF00"
            ),
            passthroughRoles = mapOf(
                "custom_passthrough" to "#0000FF"
            )
        )

        val semanticTheme2 = KthemeThemeAdapterV1.SemanticTheme(
            id = "test-theme-2",
            dark = true,
            semanticColors = mapOf(
                KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY.token to "#FFFF00",
                KthemeThemeAdapterV1.SemanticRole.CONTENT_PRIMARY.token to "#00FFFF"
            ),
            passthroughRoles = mapOf(
                "custom_passthrough" to "#FF00FF"
            )
        )

        val proxy = SnapshotThemeProxy(
            initialColorScheme = lightColorScheme(),
            initialSemanticTheme = semanticTheme1
        )
        val proxyTheme = proxy.proxyTheme

        // Test SemanticRole enum accessor
        val actionPrimaryGetter = proxyTheme.color(KthemeThemeAdapterV1.SemanticRole.ACTION_PRIMARY)
        val contentPrimaryGetter = proxyTheme.color(KthemeThemeAdapterV1.SemanticRole.CONTENT_PRIMARY)
        val passthroughGetter = proxyTheme.color("custom_passthrough")
        val unknownGetter = proxyTheme.color("unknown_role")

        assertEquals(Color(0xFFFF0000), actionPrimaryGetter())
        assertEquals(Color(0xFF00FF00), contentPrimaryGetter())
        assertEquals(Color(0xFF0000FF), passthroughGetter())
        assertEquals(Color.Unspecified, unknownGetter())

        // Update semantic theme
        proxy.update(
            newColorScheme = proxy.colorScheme,
            newSemanticTheme = semanticTheme2
        )

        assertSame(proxyTheme, proxy.proxyTheme)
        assertEquals(Color(0xFFFFFF00), actionPrimaryGetter())
        assertEquals(Color(0xFF00FFFF), contentPrimaryGetter())
        assertEquals(Color(0xFFFF00FF), passthroughGetter())
    }

    @Test
    fun testLocalSemanticThemeIsDynamicCompositionLocal() {
        val isStatic = LocalSemanticTheme.javaClass.name.contains("Static")
        assertFalse(
            "LocalSemanticTheme should be dynamic compositionLocalOf, not staticCompositionLocalOf",
            isStatic
        )
    }
}
