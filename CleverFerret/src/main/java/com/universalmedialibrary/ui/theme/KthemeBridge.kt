package com.universalmedialibrary.ui.theme

import android.graphics.Color as AndroidColor
import androidx.compose.material3.ColorScheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.toArgb
import com.ktheme.core.ThemeEngine
import com.ktheme.models.ColorScheme as KthemeColorScheme
import com.ktheme.models.MetallicEffects
import com.ktheme.models.MetallicGradient as KthemeMetallicGradient
import com.ktheme.models.Theme
import com.ktheme.models.ThemeMetadata
import com.ktheme.models.VisualEffects

/**
 * Bridge adapter that replaces the legacy in-app theme registry with Ktheme's API.
 */
object KthemeBridge {
    private val engine = ThemeEngine().apply { registerBuiltInThemes() }

    fun resolveColorScheme(theme: CleverFerretTheme, darkTheme: Boolean): ColorScheme {
        val themeId = theme.toKthemeId()
        engine.setActiveTheme(themeId)
        val activeTheme = engine.getActiveTheme() ?: return legacyColorScheme(theme, darkTheme)
        return activeTheme.colorScheme.toComposeColorScheme(darkTheme)
    }

    fun resolveMetallicGradient(theme: CleverFerretTheme): com.universalmedialibrary.ui.theme.MetallicGradient {
        val themeId = theme.toKthemeId()
        engine.setActiveTheme(themeId)
        val activeTheme = engine.getActiveTheme()
        val metallic = activeTheme?.effects?.metallic?.gradient ?: return legacyMetallicGradient(theme)

        return com.universalmedialibrary.ui.theme.MetallicGradient(
            base = metallic.base.toComposeColor(),
            highlight = metallic.highlight.toComposeColor(),
            shadow = metallic.shadow.toComposeColor(),
            shimmer = metallic.shimmer.toComposeColor()
        )
    }

    private fun Theme.toComposeColorScheme(darkTheme: Boolean): ColorScheme =
        colorScheme.toComposeColorScheme(darkTheme)

    private fun KthemeColorScheme.toComposeColorScheme(darkTheme: Boolean): ColorScheme {
        val builder = if (darkTheme) ::darkColorScheme else ::lightColorScheme
        return builder(
            primary = primary.toComposeColor(),
            onPrimary = onPrimary.toComposeColor(),
            primaryContainer = primaryContainer.toComposeColor(),
            onPrimaryContainer = onPrimaryContainer.toComposeColor(),
            secondary = secondary.toComposeColor(),
            onSecondary = onSecondary.toComposeColor(),
            secondaryContainer = secondaryContainer.toComposeColor(),
            onSecondaryContainer = onSecondaryContainer.toComposeColor(),
            tertiary = tertiary.toComposeColor(),
            onTertiary = onTertiary.toComposeColor(),
            tertiaryContainer = tertiaryContainer.toComposeColor(),
            onTertiaryContainer = onTertiaryContainer.toComposeColor(),
            error = error.toComposeColor(),
            onError = onError.toComposeColor(),
            errorContainer = errorContainer.toComposeColor(),
            onErrorContainer = onErrorContainer.toComposeColor(),
            background = background.toComposeColor(),
            onBackground = onBackground.toComposeColor(),
            surface = surface.toComposeColor(),
            onSurface = onSurface.toComposeColor(),
            surfaceVariant = surfaceVariant.toComposeColor(),
            onSurfaceVariant = onSurfaceVariant.toComposeColor(),
            outline = outline.toComposeColor(),
            outlineVariant = outlineVariant.toComposeColor(),
            scrim = scrim.toComposeColor(),
            inverseSurface = inverseSurface.toComposeColor(),
            inverseOnSurface = inverseOnSurface.toComposeColor(),
            inversePrimary = inversePrimary.toComposeColor()
        )
    }

    private fun registerBuiltInThemes() {
        CleverFerretTheme.entries.forEach { theme ->
            val legacyScheme = legacyColorScheme(theme, darkTheme = theme != CleverFerretTheme.PAPER_INK)
            val metallic = legacyMetallicGradient(theme)

            engine.registerTheme(
                Theme(
                    metadata = ThemeMetadata(
                        id = theme.toKthemeId(),
                        name = theme.getConfig().displayName,
                        description = theme.getConfig().description,
                        author = "Kaleaon",
                        version = "1.0.0",
                        tags = listOf("cleverferret", "ktheme"),
                        createdAt = "2026-01-01",
                        updatedAt = "2026-01-01"
                    ),
                    darkMode = theme != CleverFerretTheme.PAPER_INK,
                    colorScheme = legacyScheme.toKthemeColorScheme(),
                    effects = VisualEffects(
                        metallic = MetallicEffects(
                            enabled = true,
                            variant = theme.name,
                            gradient = KthemeMetallicGradient(
                                base = metallic.base.toHex(),
                                highlight = metallic.highlight.toHex(),
                                shadow = metallic.shadow.toHex(),
                                shimmer = (metallic.shimmer ?: metallic.highlight).toHex()
                            ),
                            intensity = 0.9f
                        )
                    )
                )
            )
        }
    }

    private fun legacyColorScheme(theme: CleverFerretTheme, darkTheme: Boolean): ColorScheme {
        return when (theme) {
            CleverFerretTheme.NAVY_GOLD -> NavyGoldUnified.darkScheme
            CleverFerretTheme.EMERALD_SILVER -> EmeraldSilverUnified.darkScheme
            CleverFerretTheme.ROYAL_BRONZE -> RoyalBronzeUnified.darkScheme
            CleverFerretTheme.MIDNIGHT_AMBER -> MidnightAmberUnified.darkScheme
            CleverFerretTheme.OBSIDIAN_CRIMSON -> ObsidianCrimsonUnified.darkScheme
            CleverFerretTheme.SLATE_CYAN -> SlateCyanUnified.darkScheme
            CleverFerretTheme.ROYAL_SILVER -> RoyalSilverUnified.darkScheme
            CleverFerretTheme.FOREST_COPPER -> ForestCopperUnified.darkScheme
            CleverFerretTheme.BURGUNDY_ROSE_GOLD -> BurgundyRoseGoldUnified.darkScheme
            CleverFerretTheme.CHARCOAL_CHAMPAGNE -> CharcoalChampagneUnified.darkScheme
            CleverFerretTheme.SLATE_GUNMETAL -> SlateGunmetalUnified.darkScheme
            CleverFerretTheme.DEEP_PURPLE_PLATINUM -> DeepPurplePlatinumUnified.darkScheme
            CleverFerretTheme.PAPER_INK -> if (darkTheme) PaperInkUnified.darkScheme else PaperInkUnified.lightScheme
            else -> NavyGoldUnified.darkScheme
        }
    }

    private fun legacyMetallicGradient(theme: CleverFerretTheme): com.universalmedialibrary.ui.theme.MetallicGradient {
        return when (theme) {
            CleverFerretTheme.NAVY_GOLD -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFD4AF37), Color(0xFFFFD700), Color(0xFF856D34), Color(0xFFFFF8DC))
            CleverFerretTheme.EMERALD_SILVER -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFC0C0C0), Color(0xFFE0E0E0), Color(0xFF808080), Color(0xFFF5F5F5))
            CleverFerretTheme.ROYAL_BRONZE -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFCD7F32), Color(0xFFD99952), Color(0xFF8B5A2B), Color(0xFFF0D9C0))
            CleverFerretTheme.MIDNIGHT_AMBER -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFFFBF00), Color(0xFFFFD700), Color(0xFFCC9900), Color(0xFFFFF8DC))
            CleverFerretTheme.OBSIDIAN_CRIMSON -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFDC143C), Color(0xFFE5395F), Color(0xFFB00F30), Color(0xFFFFB3C1))
            CleverFerretTheme.SLATE_CYAN -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFF00D9FF), Color(0xFF4DE2FF), Color(0xFF00A8CC), Color(0xFFB3F5FF))
            CleverFerretTheme.ROYAL_SILVER -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFC0C0C0), Color(0xFFE0E0E0), Color(0xFF9A9A9A), Color(0xFFF5F5F5))
            CleverFerretTheme.FOREST_COPPER -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFB87333), Color(0xFFD4965A), Color(0xFF935E29), Color(0xFFF2D2B0))
            CleverFerretTheme.BURGUNDY_ROSE_GOLD -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFB76E79), Color(0xFFD4969E), Color(0xFF93575F), Color(0xFFF5D5D8))
            CleverFerretTheme.CHARCOAL_CHAMPAGNE -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFF7E7CE), Color(0xFFFFF5E6), Color(0xFFC5B8A5), Color(0xFFFFFFFF))
            CleverFerretTheme.SLATE_GUNMETAL -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFF8F9CA8), Color(0xFFB0BDC9), Color(0xFF6F7D87), Color(0xFFD0DFEB))
            CleverFerretTheme.DEEP_PURPLE_PLATINUM -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFE5E4E2), Color(0xFFF5F4F2), Color(0xFFB8B7B5), Color(0xFFFFFFFF))
            CleverFerretTheme.PAPER_INK -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFF2C2C2C), Color(0xFF454545), Color(0xFF1A1A1A), Color(0xFF595959))
            else -> com.universalmedialibrary.ui.theme.MetallicGradient(Color(0xFFD4AF37), Color(0xFFFFD700), Color(0xFF856D34), Color(0xFFFFF8DC))
        }
    }
}

private fun CleverFerretTheme.toKthemeId(): String = name.lowercase().replace('_', '-')

private fun ColorScheme.toKthemeColorScheme(): KthemeColorScheme = KthemeColorScheme(
    primary = primary.toHex(),
    onPrimary = onPrimary.toHex(),
    primaryContainer = primaryContainer.toHex(),
    onPrimaryContainer = onPrimaryContainer.toHex(),
    secondary = secondary.toHex(),
    onSecondary = onSecondary.toHex(),
    secondaryContainer = secondaryContainer.toHex(),
    onSecondaryContainer = onSecondaryContainer.toHex(),
    tertiary = tertiary.toHex(),
    onTertiary = onTertiary.toHex(),
    tertiaryContainer = tertiaryContainer.toHex(),
    onTertiaryContainer = onTertiaryContainer.toHex(),
    error = error.toHex(),
    onError = onError.toHex(),
    errorContainer = errorContainer.toHex(),
    onErrorContainer = onErrorContainer.toHex(),
    background = background.toHex(),
    onBackground = onBackground.toHex(),
    surface = surface.toHex(),
    onSurface = onSurface.toHex(),
    surfaceVariant = surfaceVariant.toHex(),
    onSurfaceVariant = onSurfaceVariant.toHex(),
    outline = outline.toHex(),
    outlineVariant = outlineVariant.toHex(),
    scrim = scrim.toHex(),
    inverseSurface = inverseSurface.toHex(),
    inverseOnSurface = inverseOnSurface.toHex(),
    inversePrimary = inversePrimary.toHex()
)

private fun String.toComposeColor(): Color = Color(AndroidColor.parseColor(this))

private fun Color.toHex(): String = String.format("#%08X", toArgb())
