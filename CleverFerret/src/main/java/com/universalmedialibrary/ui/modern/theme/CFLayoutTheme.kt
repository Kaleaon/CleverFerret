package com.universalmedialibrary.ui.modern.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.ProvideTextStyle
import androidx.compose.material3.Shapes
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.runtime.remember
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.luminance
import androidx.compose.ui.graphics.toArgb
import com.cleverferret.core.designsystem.theme.LocalSemanticTheme
import com.cleverferret.core.designsystem.theme.KthemeThemeAdapterV1
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.theme.LocalEnableCrystalGlow
import com.universalmedialibrary.ui.theme.LocalEnableGeometricPatterns
import com.universalmedialibrary.ui.theme.LocalEnableMetallicShimmer
import com.universalmedialibrary.ui.theme.LocalMetallicColors

val LocalCFLayout = staticCompositionLocalOf { CFLayout.Compose }
val LocalCFLayoutStandard = staticCompositionLocalOf<CFLayoutStandard?> { null }
private const val MINIMUM_BLACK_INK_LUMINANCE = 0.175f
private const val SWEEP_INK_STEP = 0.02f
private const val SWEEP_INK_STEPS = 50
private val SweepDisplayFont = FontFamily(Font(R.font.antonio_variable))
private val SweepBodyFont = FontFamily(Font(R.font.nunito_sans_variable))
private val TerminalFont = FontFamily(Font(R.font.jetbrains_mono_variable))
private val PressFont = FontFamily(Font(R.font.source_serif_variable))
private val RulesFont = FontFamily(Font(R.font.jost_variable))
private val MetroFont = FontFamily(Font(R.font.open_sans_variable))

/** Applies layouts to the production theme without changing the stored palette preference. */
@Composable
fun CFLayoutTheme(layout: CFLayout, baseTokens: CFTokens? = null, content: @Composable () -> Unit) {
    val context = LocalContext.current
    val standard = remember(context, layout) {
        context.assets.open(CFLayoutStandard.ASSET_PATH).bufferedReader().use { CFLayoutStandard.read(it, layout) }
    }
    val original = MaterialTheme.colorScheme
    val scheme = remember(original, layout) {
        if (layout == CFLayout.Lcars) sweepColorScheme(original) else original
    }
    val metal = LocalMetallicColors.current
    val tokens = baseTokens?.copy(layout = layout) ?: NavyGoldTokens.copy(layout = layout,
        metal = CFMetal(metal.shadow, metal.base, metal.highlight, metal.shimmer ?: metal.highlight))
    val semantic = layoutSemanticTheme(scheme)
    val typography = layoutTypography(layout, standard.minimumMetadata)
    val corners = standard.corners
    val shapes = Shapes(extraSmall = RoundedCornerShape(corners.cover.dp), small = RoundedCornerShape(corners.tile.dp),
        medium = RoundedCornerShape(corners.panel.dp), large = RoundedCornerShape(corners.large.dp),
        extraLarge = RoundedCornerShape(corners.large.dp))
    CompositionLocalProvider(LocalCFLayout provides layout, LocalCFLayoutStandard provides standard,
        LocalCFTokens provides tokens,
        LocalSemanticTheme provides semantic,
        LocalEnableMetallicShimmer provides (!standard.quiet && LocalEnableMetallicShimmer.current),
        LocalEnableCrystalGlow provides (!standard.quiet && LocalEnableCrystalGlow.current),
        LocalEnableGeometricPatterns provides (layout == CFLayout.Rules)) {
        MaterialTheme(colorScheme = scheme, typography = typography, shapes = shapes) {
            ProvideTextStyle(typography.bodyLarge, content)
        }
    }
}

private fun layoutTypography(layout: CFLayout, minimumMetadata: Float): androidx.compose.material3.Typography {
    val family = when (layout) {
        CFLayout.Terminal -> TerminalFont
        CFLayout.Press -> PressFont
        CFLayout.Lcars, CFLayout.Glass -> SweepBodyFont
        CFLayout.Rules -> RulesFont
        CFLayout.Metro -> MetroFont
        else -> FontFamily.SansSerif
    }
    val typography = cfTypography(family)
    val display = if (layout == CFLayout.Lcars) SweepDisplayFont else family
    val label = when (layout) {
        CFLayout.Press -> RulesFont
        CFLayout.Lcars -> SweepDisplayFont
        else -> family
    }
    return typography.copy(
        displayLarge = typography.displayLarge.copy(fontFamily = display),
        displayMedium = typography.displayMedium.copy(fontFamily = display),
        headlineLarge = typography.headlineLarge.copy(fontFamily = display),
        titleLarge = typography.titleLarge.copy(fontFamily = display),
        labelLarge = typography.labelLarge.copy(fontFamily = label),
        labelSmall = typography.labelSmall.copy(fontFamily = label, fontSize = minimumMetadata.sp),
        labelMedium = typography.labelMedium.copy(fontFamily = label,
            fontSize = maxOf(minimumMetadata, typography.labelMedium.fontSize.value).sp)
    )
}

/** An opaque black/white action label always clears 4.5:1 against a solid accent. */
fun cfContrastInk(background: Color): Color =
    if (background.luminance() >= MINIMUM_BLACK_INK_LUMINANCE) Color.Black else Color.White

@Composable
private fun layoutSemanticTheme(scheme: androidx.compose.material3.ColorScheme): KthemeThemeAdapterV1.SemanticTheme {
    val existing = LocalSemanticTheme.current
    return remember(existing, scheme) {
        KthemeThemeAdapterV1.adapt(KthemeThemeAdapterV1.KthemeSnapshot(
            id = existing.id, darkMode = scheme.background.luminance() < MINIMUM_BLACK_INK_LUMINANCE,
            primary = scheme.primary.hex(), onPrimary = scheme.onPrimary.hex(),
            background = scheme.background.hex(), onBackground = scheme.onBackground.hex(),
            surface = scheme.surface.hex(), onSurface = scheme.onSurface.hex(),
            outline = scheme.outline.hex(), error = scheme.error.hex(), onError = scheme.onError.hex(),
            liveRegion = existing.liveRegion, passthroughRoles = existing.passthroughRoles
        ))
    }
}

private fun Color.hex(): String = String.format(java.util.Locale.ROOT, "#%08X", toArgb())

private fun sweepColorScheme(original: androidx.compose.material3.ColorScheme): androidx.compose.material3.ColorScheme {
    val primary = sweepInk(original.primary)
    val secondary = sweepInk(original.secondary)
    val error = sweepInk(original.error)
    return original.copy(background = Color.Black, surface = Color.Black, surfaceVariant = Color.Black,
        onBackground = Color.White, onSurface = Color.White, onSurfaceVariant = Color.White,
        surfaceContainerLowest = Color.Black, surfaceContainerLow = Color.Black,
        surfaceContainer = Color.Black, surfaceContainerHigh = Color.Black, surfaceContainerHighest = Color.Black,
        surfaceBright = Color.Black, surfaceDim = Color.Black,
        primary = primary, onPrimary = cfContrastInk(primary), secondary = secondary, onSecondary = cfContrastInk(secondary),
        error = error, onError = cfContrastInk(error))
}

private fun sweepInk(color: Color): Color {
    if (color.luminance() >= MINIMUM_BLACK_INK_LUMINANCE) return color
    return (1..SWEEP_INK_STEPS).asSequence()
        .map { androidx.compose.ui.graphics.lerp(color, Color.White, it * SWEEP_INK_STEP) }
        .first { it.luminance() >= MINIMUM_BLACK_INK_LUMINANCE }
}
