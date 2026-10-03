// CleverFerret · Modern UI Design Tokens
// Generated from kaleaon/ktheme JSON palettes. The values here are the source
// of truth for the modernized UI surface — all "modern" screens read tokens
// from CFTheme via LocalCFTokens.
// Adding a new ktheme = drop another CFPalette below + register in CFThemes.

package com.universalmedialibrary.ui.modern.theme

import androidx.compose.material3.ColorScheme
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.staticCompositionLocalOf
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.unit.dp

// ─── Metal accent ─────────────────────────────────────────────────────────
// CleverFerret's signature: a 4-stop metallic brush used on the wordmark,
// big play button, mini-player progress, and Continue card progress bar.
// Mirrors the "metal" group in every ktheme JSON.
data class CFMetal(
    val shadow: Color,
    val base: Color,
    val highlight: Color,
    val shimmer: Color,
) {
    fun brush(): Brush = Brush.linearGradient(
        0f to shadow, 0.45f to base, 0.85f to highlight, 1f to shimmer
    )
}

// ─── LCARS-only swatches ──────────────────────────────────────────────────
data class CFLcars(
    val peach: Color, val sand: Color, val mauve: Color,
    val lilac: Color, val salmon: Color, val plum: Color, val rust: Color,
)

// ─── Metro-only swatches ──────────────────────────────────────────────────
data class CFMetro(
    val cyan: Color, val blue: Color, val teal: Color,
    val magenta: Color, val crimson: Color, val orange: Color,
    val lime: Color, val violet: Color,
)

enum class CFLayout { Compose, Lcars, Metro }

// Bundle of everything that isn't already in Material3's ColorScheme.
data class CFTokens(
    val id: String,
    val displayName: String,
    val layout: CFLayout,
    val metal: CFMetal,
    val lcars: CFLcars? = null,
    val metro: CFMetro? = null,
    val typography: FontFamily = FontFamily.Default,
)

val LocalCFTokens = staticCompositionLocalOf<CFTokens> {
    error("CFTokens not provided — wrap your composable in CFTheme")
}

// ─── Palettes (one per ktheme JSON) ──────────────────────────────────────

// Navy Gold — flagship
private val NavyGoldScheme = darkColorScheme(
    primary       = Color(0xFFFFD166),
    onPrimary     = Color(0xFF0E1D33),
    primaryContainer   = Color(0xFFB8924A),
    onPrimaryContainer = Color(0xFFFFF7E0),
    secondary     = Color(0xFFD4AF37),
    onSecondary   = Color(0xFF14233F),
    background    = Color(0xFF0E1D33),
    onBackground  = Color(0xFFF5EFD0),
    surface       = Color(0xFF14233F),
    onSurface     = Color(0xFFF5EFD0),
    surfaceVariant   = Color(0xFF1F2F4A),
    onSurfaceVariant = Color(0xFFC9C5A8),
    outline       = Color(0xFF7A6F3D),
    error         = Color(0xFFE57373),
    onError       = Color(0xFF14233F),
)
val NavyGoldTokens = CFTokens(
    id = "navy-gold",
    displayName = "Navy Gold",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF7A5B1E),
        base      = Color(0xFFD4AF37),
        highlight = Color(0xFFFFE680),
        shimmer   = Color(0xFFFFFCE0),
    ),
)

// Rose Gold
private val RoseGoldScheme = darkColorScheme(
    primary       = Color(0xFFE6B0A2),
    onPrimary     = Color(0xFF2A0E14),
    background    = Color(0xFF2A0E14),
    onBackground  = Color(0xFFF5DCD5),
    surface       = Color(0xFF3A1620),
    onSurface     = Color(0xFFF5DCD5),
    surfaceVariant   = Color(0xFF4A1F2A),
    onSurfaceVariant = Color(0xFFD9B5AB),
    outline       = Color(0xFF8C5060),
)
val RoseGoldTokens = CFTokens(
    id = "rose-gold",
    displayName = "Rose Gold",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF8C4F4A),
        base      = Color(0xFFE6B0A2),
        highlight = Color(0xFFF5D4C8),
        shimmer   = Color(0xFFFFEDE5),
    ),
)

// Emerald Silver
private val EmeraldSilverScheme = darkColorScheme(
    primary       = Color(0xFFCDD3D6),
    onPrimary     = Color(0xFF0A1F18),
    background    = Color(0xFF0A1F18),
    onBackground  = Color(0xFFE0EAE5),
    surface       = Color(0xFF143028),
    onSurface     = Color(0xFFE0EAE5),
    surfaceVariant   = Color(0xFF1E4136),
    onSurfaceVariant = Color(0xFFB5C2BC),
    outline       = Color(0xFF5E7A70),
)
val EmeraldSilverTokens = CFTokens(
    id = "emerald-silver",
    displayName = "Emerald Silver",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF6E7478),
        base      = Color(0xFFB8BEC2),
        highlight = Color(0xFFE5E9EC),
        shimmer   = Color(0xFFFFFFFF),
    ),
)

// Midnight Amber
private val MidnightAmberScheme = darkColorScheme(
    primary       = Color(0xFFFFA94D),
    onPrimary     = Color(0xFF1A0E05),
    background    = Color(0xFF0A0608),
    onBackground  = Color(0xFFF0E5D8),
    surface       = Color(0xFF14100D),
    onSurface     = Color(0xFFF0E5D8),
    surfaceVariant   = Color(0xFF1F1814),
    onSurfaceVariant = Color(0xFFB8A795),
    outline       = Color(0xFF6B5640),
)
val MidnightAmberTokens = CFTokens(
    id = "midnight-amber",
    displayName = "Midnight Amber",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF8C5A1F),
        base      = Color(0xFFFFA94D),
        highlight = Color(0xFFFFCB80),
        shimmer   = Color(0xFFFFE6BF),
    ),
)

// Paper & Ink (light reader)
private val PaperInkScheme = lightColorScheme(
    primary       = Color(0xFF2C2C2C),
    onPrimary     = Color(0xFFFAF9F6),
    background    = Color(0xFFF0F0EB),
    onBackground  = Color(0xFF2C2C2C),
    surface       = Color(0xFFFAF9F6),
    onSurface     = Color(0xFF2C2C2C),
    surfaceVariant   = Color(0xFFEBEAE4),
    onSurfaceVariant = Color(0xFF595959),
    outline       = Color(0xFFC9C9C9),
)
val PaperInkTokens = CFTokens(
    id = "paper-ink",
    displayName = "Paper & Ink",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF454545),
        base      = Color(0xFF9A9A9A),
        highlight = Color(0xFFD6D6D6),
        shimmer   = Color(0xFFFFFFFF),
    ),
)

// Neo-Noir Neon
private val NeoNoirScheme = darkColorScheme(
    primary       = Color(0xFFFF2EAA),
    onPrimary     = Color(0xFF080014),
    background    = Color(0xFF080014),
    onBackground  = Color(0xFFE6E6FA),
    surface       = Color(0xFF120A24),
    onSurface     = Color(0xFFE6E6FA),
    surfaceVariant   = Color(0xFF1F1538),
    onSurfaceVariant = Color(0xFFA89FCC),
    outline       = Color(0xFF55438C),
)
val NeoNoirTokens = CFTokens(
    id = "neo-noir-neon",
    displayName = "Neo-Noir Neon",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color(0xFF6B0E66),
        base      = Color(0xFFFF2EAA),
        highlight = Color(0xFFFF80D4),
        shimmer   = Color(0xFF00F0FF),
    ),
)

// LCARS — overrides layout
private val LcarsScheme = darkColorScheme(
    primary       = Color(0xFFF2A65A),
    onPrimary     = Color(0xFF000000),
    background    = Color(0xFF000000),
    onBackground  = Color(0xFFF3E9FF),
    surface       = Color(0xFF000000),
    onSurface     = Color(0xFFFFCC99),
    surfaceVariant   = Color(0xFF1C132A),
    onSurfaceVariant = Color(0xFFD0B3E6),
    outline       = Color(0xFF3D2F5C),
)
val LcarsTokens = CFTokens(
    id = "lcars",
    displayName = "LCARS",
    layout = CFLayout.Lcars,
    metal = CFMetal(
        shadow    = Color(0xFFA85C2E),
        base      = Color(0xFFF2A65A),
        highlight = Color(0xFFFFCB80),
        shimmer   = Color(0xFFFFE6BF),
    ),
    lcars = CFLcars(
        peach  = Color(0xFFF2A65A),
        sand   = Color(0xFFFFCC66),
        mauve  = Color(0xFFC5678D),
        lilac  = Color(0xFFCC99CC),
        salmon = Color(0xFFFF6B6B),
        plum   = Color(0xFF9966CC),
        rust   = Color(0xFFCC6600),
    ),
)

// Metro
private val MetroScheme = darkColorScheme(
    primary       = Color(0xFF00B7C3),
    onPrimary     = Color(0xFFFFFFFF),
    background    = Color(0xFF000000),
    onBackground  = Color(0xFFFFFFFF),
    surface       = Color(0xFF000000),
    onSurface     = Color(0xFFFFFFFF),
    surfaceVariant   = Color(0xFF1A1A1A),
    onSurfaceVariant = Color(0xFFB3B3B3),
    outline       = Color(0xFF333333),
)
val MetroTokens = CFTokens(
    id = "metro",
    displayName = "Windows Phone Metro",
    layout = CFLayout.Metro,
    metal = CFMetal(
        shadow    = Color(0xFF4A4A48),
        base      = Color(0xFF878681),
        highlight = Color(0xFFBDBBB8),
        shimmer   = Color(0xFFD0CFCC),
    ),
    metro = CFMetro(
        cyan    = Color(0xFF00B7C3),
        blue    = Color(0xFF0078D7),
        teal    = Color(0xFF00B294),
        magenta = Color(0xFFEC008C),
        crimson = Color(0xFFE81123),
        orange  = Color(0xFFFA6800),
        lime    = Color(0xFFA4C400),
        violet  = Color(0xFF6B69D6),
    ),
)

// ─── Theme registry ──────────────────────────────────────────────────────
data class CFPalette(val scheme: ColorScheme, val tokens: CFTokens)

object CFThemes {
    val NavyGold       = CFPalette(NavyGoldScheme,       NavyGoldTokens)
    val RoseGold       = CFPalette(RoseGoldScheme,       RoseGoldTokens)
    val EmeraldSilver  = CFPalette(EmeraldSilverScheme,  EmeraldSilverTokens)
    val MidnightAmber  = CFPalette(MidnightAmberScheme,  MidnightAmberTokens)
    val PaperInk       = CFPalette(PaperInkScheme,       PaperInkTokens)
    val NeoNoirNeon    = CFPalette(NeoNoirScheme,        NeoNoirTokens)
    val Lcars          = CFPalette(LcarsScheme,          LcarsTokens)
    val Metro          = CFPalette(MetroScheme,          MetroTokens)

    val All = listOf(NavyGold, RoseGold, EmeraldSilver, MidnightAmber,
                     PaperInk, NeoNoirNeon, Lcars, Metro)

    fun byId(id: String): CFPalette = All.first { it.tokens.id == id }
}

// ─── Spacing & shape ─────────────────────────────────────────────────────
object CFSpacing {
    val xs = 4.dp;  val sm = 8.dp;  val md = 12.dp
    val lg = 16.dp; val xl = 24.dp; val xxl = 32.dp
    val lcarsGutter = 6.dp
    val metroGutter = 10.dp
}
