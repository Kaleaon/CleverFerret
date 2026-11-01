package com.cleverferret.core.designsystem.theme

import androidx.compose.material3.ColorScheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.runtime.compositionLocalOf
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.composed
import androidx.compose.ui.draw.CacheDrawScope
import androidx.compose.ui.draw.DrawResult
import androidx.compose.ui.draw.drawBehind
import androidx.compose.ui.draw.drawWithCache
import androidx.compose.ui.draw.drawWithContent
import androidx.compose.ui.graphics.BlendMode
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.graphics.GraphicsLayerScope
import androidx.compose.ui.graphics.drawscope.ContentDrawScope
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.graphicsLayer

/**
 * Parses a hex color string (#RRGGBB or #AARRGGBB) into Compose [Color] without depending on android.graphics.Color.
 */
internal fun parseHexColor(hexString: String?): Color {
    if (hexString.isNullOrBlank()) return Color.Unspecified
    val clean = hexString.removePrefix("#")
    return try {
        when (clean.length) {
            6 -> {
                val rgb = clean.toLong(16)
                Color(0xFF000000 or rgb)
            }
            8 -> {
                val argb = clean.toLong(16)
                Color(argb)
            }
            else -> Color.Unspecified
        }
    } catch (_: Exception) {
        Color.Unspecified
    }
}

/**
 * ProxyTheme provides color tokens via getter lambdas (() -> Color).
 * Reading colors through getter lambdas inside graphics layer and draw modifiers
 * decouples visual color updates from Compose composition and layout passes.
 */
class ProxyTheme(
    val primary: () -> Color,
    val onPrimary: () -> Color,
    val primaryContainer: () -> Color = primary,
    val onPrimaryContainer: () -> Color = onPrimary,
    val inversePrimary: () -> Color = primary,
    val secondary: () -> Color = primary,
    val onSecondary: () -> Color = onPrimary,
    val secondaryContainer: () -> Color = secondary,
    val onSecondaryContainer: () -> Color = onSecondary,
    val tertiary: () -> Color = secondary,
    val onTertiary: () -> Color = onSecondary,
    val tertiaryContainer: () -> Color = tertiary,
    val onTertiaryContainer: () -> Color = onTertiary,
    val background: () -> Color,
    val onBackground: () -> Color,
    val surface: () -> Color,
    val onSurface: () -> Color,
    val surfaceVariant: () -> Color,
    val onSurfaceVariant: () -> Color,
    val surfaceTint: () -> Color = primary,
    val surfaceContainer: () -> Color = surfaceVariant,
    val surfaceContainerHigh: () -> Color = surfaceVariant,
    val surfaceContainerHighest: () -> Color = surfaceVariant,
    val surfaceContainerLow: () -> Color = surface,
    val surfaceContainerLowest: () -> Color = surface,
    val inverseSurface: () -> Color = onSurface,
    val inverseOnSurface: () -> Color = surface,
    val error: () -> Color,
    val onError: () -> Color,
    val errorContainer: () -> Color = error,
    val onErrorContainer: () -> Color = onError,
    val outline: () -> Color,
    val outlineVariant: () -> Color = outline,
    val scrim: () -> Color = { Color.Black },
    val semanticColorProvider: (String) -> (() -> Color) = { { Color.Unspecified } }
) {
    /**
     * Resolves a semantic role token to a functional getter lambda.
     */
    fun color(roleToken: String): () -> Color = semanticColorProvider(roleToken)

    /**
     * Resolves a [KthemeThemeAdapterV1.SemanticRole] to a functional getter lambda.
     */
    fun color(role: KthemeThemeAdapterV1.SemanticRole): () -> Color = semanticColorProvider(role.token)

    companion object {
        val Default: ProxyTheme by lazy {
            fromColorScheme(lightColorScheme())
        }

        fun fromColorScheme(
            colorScheme: ColorScheme,
            semanticTheme: KthemeThemeAdapterV1.SemanticTheme? = null
        ): ProxyTheme = fromProviders(
            colorSchemeProvider = { colorScheme },
            semanticThemeProvider = { semanticTheme }
        )

        fun fromProviders(
            colorSchemeProvider: () -> ColorScheme,
            semanticThemeProvider: () -> KthemeThemeAdapterV1.SemanticTheme? = { null }
        ): ProxyTheme {
            return ProxyTheme(
                primary = { colorSchemeProvider().primary },
                onPrimary = { colorSchemeProvider().onPrimary },
                primaryContainer = { colorSchemeProvider().primaryContainer },
                onPrimaryContainer = { colorSchemeProvider().onPrimaryContainer },
                inversePrimary = { colorSchemeProvider().inversePrimary },
                secondary = { colorSchemeProvider().secondary },
                onSecondary = { colorSchemeProvider().onSecondary },
                secondaryContainer = { colorSchemeProvider().secondaryContainer },
                onSecondaryContainer = { colorSchemeProvider().onSecondaryContainer },
                tertiary = { colorSchemeProvider().tertiary },
                onTertiary = { colorSchemeProvider().onTertiary },
                tertiaryContainer = { colorSchemeProvider().tertiaryContainer },
                onTertiaryContainer = { colorSchemeProvider().onTertiaryContainer },
                background = { colorSchemeProvider().background },
                onBackground = { colorSchemeProvider().onBackground },
                surface = { colorSchemeProvider().surface },
                onSurface = { colorSchemeProvider().onSurface },
                surfaceVariant = { colorSchemeProvider().surfaceVariant },
                onSurfaceVariant = { colorSchemeProvider().onSurfaceVariant },
                surfaceTint = { colorSchemeProvider().surfaceTint },
                surfaceContainer = { colorSchemeProvider().surfaceContainer },
                surfaceContainerHigh = { colorSchemeProvider().surfaceContainerHigh },
                surfaceContainerHighest = { colorSchemeProvider().surfaceContainerHighest },
                surfaceContainerLow = { colorSchemeProvider().surfaceContainerLow },
                surfaceContainerLowest = { colorSchemeProvider().surfaceContainerLowest },
                inverseSurface = { colorSchemeProvider().inverseSurface },
                inverseOnSurface = { colorSchemeProvider().inverseOnSurface },
                error = { colorSchemeProvider().error },
                onError = { colorSchemeProvider().onError },
                errorContainer = { colorSchemeProvider().errorContainer },
                onErrorContainer = { colorSchemeProvider().onErrorContainer },
                outline = { colorSchemeProvider().outline },
                outlineVariant = { colorSchemeProvider().outlineVariant },
                scrim = { colorSchemeProvider().scrim },
                semanticColorProvider = { roleToken ->
                    {
                        val sem = semanticThemeProvider()
                        if (sem != null) {
                            val hex = sem.semanticColors[roleToken] ?: sem.passthroughRoles[roleToken]
                            if (hex != null) parseHexColor(hex) else Color.Unspecified
                        } else {
                            Color.Unspecified
                        }
                    }
                }
            )
        }
    }
}

/**
 * Snapshot-backed proxy container.
 * Maintains mutable snapshot state internally while exposing a stable, referentially-identical
 * [ProxyTheme] instance whose getter lambdas read from the mutable state.
 */
class SnapshotThemeProxy(
    initialColorScheme: ColorScheme,
    initialSemanticTheme: KthemeThemeAdapterV1.SemanticTheme? = null
) {
    var colorScheme by mutableStateOf(initialColorScheme)
    var semanticTheme by mutableStateOf<KthemeThemeAdapterV1.SemanticTheme?>(initialSemanticTheme)

    val proxyTheme: ProxyTheme = ProxyTheme.fromProviders(
        colorSchemeProvider = { colorScheme },
        semanticThemeProvider = { semanticTheme }
    )

    fun update(
        newColorScheme: ColorScheme,
        newSemanticTheme: KthemeThemeAdapterV1.SemanticTheme? = null
    ) {
        if (colorScheme != newColorScheme) {
            colorScheme = newColorScheme
        }
        if (semanticTheme != newSemanticTheme) {
            semanticTheme = newSemanticTheme
        }
    }
}

/**
 * Remembers a stable [SnapshotThemeProxy] and updates its underlying snapshot state on recomposition.
 */
@Composable
fun rememberSnapshotThemeProxy(
    colorScheme: ColorScheme,
    semanticTheme: KthemeThemeAdapterV1.SemanticTheme? = null
): SnapshotThemeProxy {
    val proxy = remember { SnapshotThemeProxy(colorScheme, semanticTheme) }
    SideEffect {
        proxy.update(colorScheme, semanticTheme)
    }
    return proxy
}

/**
 * Non-static CompositionLocal providing the active [ProxyTheme].
 */
val LocalProxyTheme = compositionLocalOf {
    ProxyTheme.Default
}

// =============================================================================
// MODIFIER CONVENTIONS (Draw and GraphicsLayer Pipelines)
// =============================================================================

/**
 * Draws with theme colors directly in the Draw phase.
 * Theme changes invalidate only drawing operations on the GPU RenderNode,
 * bypassing composition and layout passes completely.
 */
fun Modifier.drawWithTheme(
    onDraw: DrawScope.(theme: ProxyTheme) -> Unit
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.drawBehind {
        onDraw(theme)
    }
}

/**
 * Convenience modifier to draw a solid theme color directly in the Draw phase.
 */
fun Modifier.drawWithTheme(
    color: () -> Color
): Modifier = this.drawBehind {
    drawRect(color())
}

/**
 * Convenience modifier to draw a solid theme color resolving against [ProxyTheme].
 */
fun Modifier.drawThemeColor(
    colorGetter: (ProxyTheme) -> Color
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.drawBehind {
        drawRect(colorGetter(theme))
    }
}

/**
 * Draws with theme caching inside [CacheDrawScope].
 */
fun Modifier.drawWithThemeCache(
    onBuildDrawCache: CacheDrawScope.(theme: ProxyTheme) -> DrawResult
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.drawWithCache {
        onBuildDrawCache(theme)
    }
}

/**
 * Draws content with theme inside [ContentDrawScope].
 */
fun Modifier.drawWithThemeContent(
    onDraw: ContentDrawScope.(theme: ProxyTheme) -> Unit
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.drawWithContent {
        onDraw(theme)
    }
}

/**
 * Applies a graphics layer block with direct access to [ProxyTheme].
 */
fun Modifier.themeGraphicsLayer(
    block: GraphicsLayerScope.(theme: ProxyTheme) -> Unit
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.graphicsLayer {
        block(theme)
    }
}

/**
 * Applies a dynamic GPU render node tint color filter without recomposition.
 */
fun Modifier.themeTint(
    color: () -> Color,
    blendMode: BlendMode = BlendMode.SrcIn
): Modifier = this.graphicsLayer {
    colorFilter = ColorFilter.tint(color(), blendMode)
}

/**
 * Applies a dynamic GPU render node tint color filter resolving against [ProxyTheme].
 */
fun Modifier.themeProxyTint(
    colorGetter: (ProxyTheme) -> Color,
    blendMode: BlendMode = BlendMode.SrcIn
): Modifier = composed {
    val theme = LocalProxyTheme.current
    this.graphicsLayer {
        colorFilter = ColorFilter.tint(colorGetter(theme), blendMode)
    }
}
