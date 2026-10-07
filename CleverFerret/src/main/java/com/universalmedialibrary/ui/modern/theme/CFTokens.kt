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
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.manga.source.MangaState
import com.universalmedialibrary.services.webfiction.DownloadStatus
import com.universalmedialibrary.services.webfiction.StoryStatus

// ─── Domain status & player control tokens ─────────────────────────────
data class CFStatusColors(
    val completed: Color = Color(0xFF4CAF50),
    val ongoing: Color = Color(0xFF2196F3),
    val hiatus: Color = Color(0xFFFF9800),
    val cancelled: Color = Color(0xFFE57373),
    val downloading: Color = Color(0xFF00E5FF),
    val outdated: Color = Color(0xFFFFB74D),
    val failed: Color = Color(0xFFEF5350),
    val neutral: Color = Color(0xFFC9C5A8),
) {
    fun forStoryStatus(status: StoryStatus): Color = when (status) {
        StoryStatus.COMPLETED -> completed
        StoryStatus.ONGOING -> ongoing
        StoryStatus.HIATUS -> hiatus
        StoryStatus.CANCELLED -> cancelled
        StoryStatus.UNKNOWN -> neutral
        else -> neutral
    }

    fun forDownloadStatus(status: DownloadStatus): Color = when (status) {
        DownloadStatus.DOWNLOADED -> completed
        DownloadStatus.DOWNLOADING -> downloading
        DownloadStatus.OUTDATED -> outdated
        DownloadStatus.FAILED -> failed
        DownloadStatus.NOT_DOWNLOADED -> neutral
        else -> neutral
    }

    fun forMangaState(state: MangaState): Color = when (state) {
        MangaState.ONGOING -> ongoing
        MangaState.FINISHED -> completed
        MangaState.ABANDONED -> cancelled
        MangaState.PAUSED -> hiatus
        MangaState.UPCOMING -> ongoing
        MangaState.UNKNOWN -> neutral
        else -> neutral
    }
}

data class CFPlayerControls(
    val playButtonContainer: Color = Color(0xFFFFD166),
    val playButtonIcon: Color = Color(0xFF0E1D33),
    val controlIcon: Color = Color(0xFFF5EFD0),
    val secondaryControlContainer: Color = Color(0x33FFD166),
    val activeTrack: Color = Color(0xFFFFD166),
    val inactiveTrack: Color = Color(0x40F5EFD0),
    val thumb: Color = Color(0xFFFFD166),
    val activeAccent: Color = Color(0xFFFFD166),
    val surfaceOverlay: Color = Color(0xFF0E1D33),
    val sheetBackground: Color = Color(0xFF14233F),
)

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
    private val cachedBrush: Brush = Brush.linearGradient(
        0f to shadow, 0.45f to base, 0.85f to highlight, 1f to shimmer
    )

    fun brush(): Brush = cachedBrush
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

data class CFGridMinItemWidth(
    val quickAction: Dp = 100.dp,
    val poster: Dp = 160.dp,
    val squareCard: Dp = 140.dp,
    val dialogChip: Dp = 120.dp,
)

// Bundle of everything that isn't already in Material3's ColorScheme.
data class CFTokens(
    val id: String,
    val displayName: String,
    val layout: CFLayout,
    val metal: CFMetal,
    val lcars: CFLcars? = null,
    val metro: CFMetro? = null,
    val typography: FontFamily = FontFamily.Default,
    val status: CFStatusColors = CFStatusColors(),
    val playerControls: CFPlayerControls = CFPlayerControls(),
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
    status = CFStatusColors(
        completed   = Color(0xFF4CAF50),
        ongoing     = Color(0xFF2196F3),
        hiatus      = Color(0xFFFF9800),
        cancelled   = Color(0xFFE57373),
        downloading = Color(0xFF00E5FF),
        outdated    = Color(0xFFFFB74D),
        failed      = Color(0xFFEF5350),
        neutral     = Color(0xFFC9C5A8),
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color(0xFFFFD166),
        playButtonIcon            = Color(0xFF0E1D33),
        controlIcon               = Color(0xFFF5EFD0),
        secondaryControlContainer = Color(0x33FFD166),
        activeTrack               = Color(0xFFFFD166),
        inactiveTrack             = Color(0x40F5EFD0),
        thumb                     = Color(0xFFFFD166),
        activeAccent              = Color(0xFFFFD166),
        surfaceOverlay            = Color(0xFF0E1D33),
        sheetBackground           = Color(0xFF14233F),
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
    status = CFStatusColors(
        completed   = Color(0xFF81C784),
        ongoing     = Color(0xFFE6B0A2),
        hiatus      = Color(0xFFFFB74D),
        cancelled   = Color(0xFFE57373),
        downloading = Color(0xFF4DD0E1),
        outdated    = Color(0xFFFFB74D),
        failed      = Color(0xFFE57373),
        neutral     = Color(0xFFD9B5AB),
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color(0xFFE6B0A2),
        playButtonIcon            = Color(0xFF2A0E14),
        controlIcon               = Color(0xFFF5DCD5),
        secondaryControlContainer = Color(0x33E6B0A2),
        activeTrack               = Color(0xFFE6B0A2),
        inactiveTrack             = Color(0x40F5DCD5),
        thumb                     = Color(0xFFE6B0A2),
        activeAccent              = Color(0xFFE6B0A2),
        surfaceOverlay            = Color(0xFF2A0E14),
        sheetBackground           = Color(0xFF3A1620),
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
    status = CFStatusColors(
        completed   = Color(0xFF66BB6A),
        ongoing     = Color(0xFF4FC3F7),
        hiatus      = Color(0xFFFFB74D),
        cancelled   = Color(0xFFEF5350),
        downloading = Color(0xFF26C6DA),
        outdated    = Color(0xFFFFB74D),
        failed      = Color(0xFFEF5350),
        neutral     = Color(0xFFB5C2BC),
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color(0xFFCDD3D6),
        playButtonIcon            = Color(0xFF0A1F18),
        controlIcon               = Color(0xFFE0EAE5),
        secondaryControlContainer = Color(0x33CDD3D6),
        activeTrack               = Color(0xFFCDD3D6),
        inactiveTrack             = Color(0x40E0EAE5),
        thumb                     = Color(0xFFCDD3D6),
        activeAccent              = Color(0xFFCDD3D6),
        surfaceOverlay            = Color(0xFF0A1F18),
        sheetBackground           = Color(0xFF143028),
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
    status = CFStatusColors(
        completed   = Color(0xFF81C784),
        ongoing     = Color(0xFFFFA94D),
        hiatus      = Color(0xFFFFB74D),
        cancelled   = Color(0xFFE57373),
        downloading = Color(0xFFFFA94D),
        outdated    = Color(0xFFFFB74D),
        failed      = Color(0xFFE57373),
        neutral     = Color(0xFFB8A795),
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color(0xFFFFA94D),
        playButtonIcon            = Color(0xFF1A0E05),
        controlIcon               = Color(0xFFF0E5D8),
        secondaryControlContainer = Color(0x33FFA94D),
        activeTrack               = Color(0xFFFFA94D),
        inactiveTrack             = Color(0x40F0E5D8),
        thumb                     = Color(0xFFFFA94D),
        activeAccent              = Color(0xFFFFA94D),
        surfaceOverlay            = Color(0xFF0A0608),
        sheetBackground           = Color(0xFF14100D),
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
    status = CFStatusColors(
        completed   = Color(0xFF2E7D32),
        ongoing     = Color(0xFF1565C0),
        hiatus      = Color(0xFFEF6C00),
        cancelled   = Color(0xFFC62828),
        downloading = Color(0xFF00838F),
        outdated    = Color(0xFFEF6C00),
        failed      = Color(0xFFC62828),
        neutral     = Color(0xFF595959),
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color(0xFF2C2C2C),
        playButtonIcon            = Color(0xFFFAF9F6),
        controlIcon               = Color(0xFF2C2C2C),
        secondaryControlContainer = Color(0x1F2C2C2C),
        activeTrack               = Color(0xFF2C2C2C),
        inactiveTrack             = Color(0x332C2C2C),
        thumb                     = Color(0xFF2C2C2C),
        activeAccent              = Color(0xFF2C2C2C),
        surfaceOverlay            = Color(0xFFF0F0EB),
        sheetBackground           = Color(0xFFFAF9F6),
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

// E-Ink (Monochrome)
private val EInkScheme = lightColorScheme(
    primary          = Color.Black,
    onPrimary        = Color.White,
    background       = Color.White,
    onBackground     = Color.Black,
    surface          = Color.White,
    onSurface        = Color.Black,
    surfaceVariant   = Color(0xFFE0E0E0),
    onSurfaceVariant = Color.Black,
    outline          = Color.Black,
)
val EInkTokens = CFTokens(
    id = "e-ink",
    displayName = "E-Ink Monochrome",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color.DarkGray,
        base      = Color.Black,
        highlight = Color.Gray,
        shimmer   = Color.LightGray,
    ),
    status = CFStatusColors(
        completed   = Color.Black,
        ongoing     = Color.Black,
        hiatus      = Color.Black,
        cancelled   = Color.Black,
        downloading = Color.Black,
        outdated    = Color.Black,
        failed      = Color.Black,
        neutral     = Color.Black,
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color.Black,
        playButtonIcon            = Color.White,
        controlIcon               = Color.Black,
        secondaryControlContainer = Color(0x22000000),
        activeTrack               = Color.Black,
        inactiveTrack             = Color.Gray,
        thumb                     = Color.Black,
        activeAccent              = Color.Black,
        surfaceOverlay            = Color.White,
        sheetBackground           = Color.White,
    ),
)

// High Contrast
private val HighContrastScheme = darkColorScheme(
    primary          = Color.Yellow,
    onPrimary        = Color.Black,
    background       = Color.Black,
    onBackground     = Color.White,
    surface          = Color.Black,
    onSurface        = Color.White,
    surfaceVariant   = Color(0xFF1C1C1C),
    onSurfaceVariant = Color.White,
    outline          = Color.Yellow,
)
val HighContrastTokens = CFTokens(
    id = "high-contrast",
    displayName = "High Contrast",
    layout = CFLayout.Compose,
    metal = CFMetal(
        shadow    = Color.Yellow,
        base      = Color.Yellow,
        highlight = Color.White,
        shimmer   = Color.White,
    ),
    status = CFStatusColors(
        completed   = Color(0xFF00FF00),
        ongoing     = Color(0xFF00FFFF),
        hiatus      = Color(0xFFFFFF00),
        cancelled   = Color(0xFFFF0000),
        downloading = Color(0xFF00FFFF),
        outdated    = Color(0xFFFFFF00),
        failed      = Color(0xFFFF0000),
        neutral     = Color.White,
    ),
    playerControls = CFPlayerControls(
        playButtonContainer       = Color.Yellow,
        playButtonIcon            = Color.Black,
        controlIcon               = Color.White,
        secondaryControlContainer = Color(0x44FFFFFF),
        activeTrack               = Color.Yellow,
        inactiveTrack             = Color.Gray,
        thumb                     = Color.Yellow,
        activeAccent              = Color.Yellow,
        surfaceOverlay            = Color.Black,
        sheetBackground           = Color.Black,
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
    val EInk           = CFPalette(EInkScheme,           EInkTokens)
    val HighContrast   = CFPalette(HighContrastScheme,   HighContrastTokens)

    val All = listOf(NavyGold, RoseGold, EmeraldSilver, MidnightAmber,
                     PaperInk, NeoNoirNeon, Lcars, Metro, EInk, HighContrast)

    fun byId(id: String): CFPalette = All.first { it.tokens.id == id }
}

// ─── Spacing & shape ─────────────────────────────────────────────────────
object CFSpacing {
    val xs = 4.dp;  val sm = 8.dp;  val md = 12.dp
    val lg = 16.dp; val xl = 24.dp; val xxl = 32.dp
    val lcarsGutter = 6.dp
    val metroGutter = 10.dp

    // Adaptive grid minimum item width tokens
    val quickActionMinWidth: Dp = 100.dp
    val posterMinWidth: Dp = 160.dp
    val squareCardMinWidth: Dp = 140.dp
    val dialogChipMinWidth: Dp = 120.dp
}
