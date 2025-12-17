package com.universalmedialibrary.ui.media.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.graphics.Color

/**
 * Clean Media-Centric Theme System
 * 
 * Comprehensive theme system with all CleverFerret themes in Plex styling:
 * - Dark themes (default)
 * - Light themes
 * - AMOLED/True Black
 * - E-ink optimized
 * - Custom accent colors
 * - Reading-specific themes (Sepia, Night)
 * - Accessibility themes
 */

// =============================================================================
// THEME PRESETS
// =============================================================================

enum class MediaThemePreset(
    val displayName: String,
    val description: String,
    val isDark: Boolean
) {
    // Dark themes
    CLASSIC_DARK("Classic Dark", "Classic elegant dark theme with orange accent", true),
    MIDNIGHT("Midnight", "Deep blue dark theme", true),
    AMOLED("AMOLED Black", "True black for OLED screens", true),
    DRACULA("Dracula", "Popular purple-tinted dark theme", true),
    NORD("Nord", "Arctic, bluish dark theme", true),
    MONOKAI("Monokai", "Warm coding-inspired theme", true),
    OCEAN("Ocean", "Deep sea blues", true),
    FOREST("Forest", "Nature-inspired greens", true),
    
    // Light themes
    CLASSIC_LIGHT("Classic Light", "Light theme with orange accent", false),
    PAPER("Paper", "Soft off-white like paper", false),
    CREAM("Cream", "Warm cream background", false),
    
    // Reading themes
    SEPIA("Sepia", "Warm sepia tones for comfortable reading", true),
    NIGHT_RED("Night Red", "Red-shifted for night reading", true),
    
    // E-ink themes
    EINK("E-Ink", "High contrast for e-ink displays", false),
    EINK_DARK("E-Ink Dark", "Inverted e-ink theme", true),
    
    // Accent color themes
    NETFLIX("Netflix Red", "Bold red accent theme", true),
    SPOTIFY("Spotify Green", "Vibrant green accent", true),
    PURPLE_HAZE("Purple Haze", "Rich purple accent", true),
    TEAL("Teal", "Calming teal accent", true),
    PINK("Pink", "Playful pink accent", true),
    GOLD("Gold", "Elegant gold accent", true)
}

// =============================================================================
// THEME COLORS
// =============================================================================

data class MediaThemeColors(
    val background: Color,
    val backgroundElevated: Color,
    val backgroundSurface: Color,
    val textPrimary: Color,
    val textSecondary: Color,
    val textTertiary: Color,
    val accentPrimary: Color,
    val accentSecondary: Color,
    val divider: Color,
    val overlay: Color,
    val error: Color,
    val success: Color,
    val warning: Color,
    val isDark: Boolean
)

fun getThemeColors(preset: MediaThemePreset): MediaThemeColors {
    return when (preset) {
        // ===================== DARK THEMES =====================
        MediaThemePreset.CLASSIC_DARK -> MediaThemeColors(
            background = Color(0xFF1F1F1F),
            backgroundElevated = Color(0xFF2A2A2A),
            backgroundSurface = Color(0xFF3A3A3A),
            textPrimary = Color(0xFFFFFFFF),
            textSecondary = Color(0xFFB0B0B0),
            textTertiary = Color(0xFF808080),
            accentPrimary = Color(0xFFE5A00D),
            accentSecondary = Color(0xFFCC8800),
            divider = Color(0xFF404040),
            overlay = Color(0xCC000000),
            error = Color(0xFFE53935),
            success = Color(0xFF43A047),
            warning = Color(0xFFFFA000),
            isDark = true
        )
        
        MediaThemePreset.MIDNIGHT -> MediaThemeColors(
            background = Color(0xFF0D1117),
            backgroundElevated = Color(0xFF161B22),
            backgroundSurface = Color(0xFF21262D),
            textPrimary = Color(0xFFF0F6FC),
            textSecondary = Color(0xFF8B949E),
            textTertiary = Color(0xFF6E7681),
            accentPrimary = Color(0xFF58A6FF),
            accentSecondary = Color(0xFF1F6FEB),
            divider = Color(0xFF30363D),
            overlay = Color(0xCC000000),
            error = Color(0xFFF85149),
            success = Color(0xFF3FB950),
            warning = Color(0xFFD29922),
            isDark = true
        )
        
        MediaThemePreset.AMOLED -> MediaThemeColors(
            background = Color(0xFF000000),
            backgroundElevated = Color(0xFF0D0D0D),
            backgroundSurface = Color(0xFF1A1A1A),
            textPrimary = Color(0xFFFFFFFF),
            textSecondary = Color(0xFFA0A0A0),
            textTertiary = Color(0xFF707070),
            accentPrimary = Color(0xFFE5A00D),
            accentSecondary = Color(0xFFCC8800),
            divider = Color(0xFF2A2A2A),
            overlay = Color(0xE6000000),
            error = Color(0xFFE53935),
            success = Color(0xFF43A047),
            warning = Color(0xFFFFA000),
            isDark = true
        )
        
        MediaThemePreset.DRACULA -> MediaThemeColors(
            background = Color(0xFF282A36),
            backgroundElevated = Color(0xFF343746),
            backgroundSurface = Color(0xFF44475A),
            textPrimary = Color(0xFFF8F8F2),
            textSecondary = Color(0xFFBDBDBD),
            textTertiary = Color(0xFF6272A4),
            accentPrimary = Color(0xFFBD93F9),
            accentSecondary = Color(0xFFFF79C6),
            divider = Color(0xFF44475A),
            overlay = Color(0xCC21222C),
            error = Color(0xFFFF5555),
            success = Color(0xFF50FA7B),
            warning = Color(0xFFFFB86C),
            isDark = true
        )
        
        MediaThemePreset.NORD -> MediaThemeColors(
            background = Color(0xFF2E3440),
            backgroundElevated = Color(0xFF3B4252),
            backgroundSurface = Color(0xFF434C5E),
            textPrimary = Color(0xFFECEFF4),
            textSecondary = Color(0xFFD8DEE9),
            textTertiary = Color(0xFF81A1C1),
            accentPrimary = Color(0xFF88C0D0),
            accentSecondary = Color(0xFF81A1C1),
            divider = Color(0xFF4C566A),
            overlay = Color(0xCC2E3440),
            error = Color(0xFFBF616A),
            success = Color(0xFFA3BE8C),
            warning = Color(0xFFEBCB8B),
            isDark = true
        )
        
        MediaThemePreset.MONOKAI -> MediaThemeColors(
            background = Color(0xFF272822),
            backgroundElevated = Color(0xFF3E3D32),
            backgroundSurface = Color(0xFF49483E),
            textPrimary = Color(0xFFF8F8F2),
            textSecondary = Color(0xFFCFD0C2),
            textTertiary = Color(0xFF75715E),
            accentPrimary = Color(0xFFA6E22E),
            accentSecondary = Color(0xFFF92672),
            divider = Color(0xFF49483E),
            overlay = Color(0xCC1E1F1C),
            error = Color(0xFFF92672),
            success = Color(0xFFA6E22E),
            warning = Color(0xFFE6DB74),
            isDark = true
        )
        
        MediaThemePreset.OCEAN -> MediaThemeColors(
            background = Color(0xFF0A1929),
            backgroundElevated = Color(0xFF132F4C),
            backgroundSurface = Color(0xFF1E4976),
            textPrimary = Color(0xFFF3F6F9),
            textSecondary = Color(0xFFB2BAC2),
            textTertiary = Color(0xFF5090D3),
            accentPrimary = Color(0xFF66B2FF),
            accentSecondary = Color(0xFF0059B2),
            divider = Color(0xFF265D97),
            overlay = Color(0xCC0A1929),
            error = Color(0xFFFF6B6B),
            success = Color(0xFF69DB7C),
            warning = Color(0xFFFFD43B),
            isDark = true
        )
        
        MediaThemePreset.FOREST -> MediaThemeColors(
            background = Color(0xFF1A2F23),
            backgroundElevated = Color(0xFF243D2D),
            backgroundSurface = Color(0xFF2E4D38),
            textPrimary = Color(0xFFE8F5E9),
            textSecondary = Color(0xFFA5D6A7),
            textTertiary = Color(0xFF66BB6A),
            accentPrimary = Color(0xFF81C784),
            accentSecondary = Color(0xFF4CAF50),
            divider = Color(0xFF388E3C),
            overlay = Color(0xCC1A2F23),
            error = Color(0xFFE57373),
            success = Color(0xFF81C784),
            warning = Color(0xFFFFD54F),
            isDark = true
        )
        
        // ===================== LIGHT THEMES =====================
        MediaThemePreset.CLASSIC_LIGHT -> MediaThemeColors(
            background = Color(0xFFF5F5F5),
            backgroundElevated = Color(0xFFFFFFFF),
            backgroundSurface = Color(0xFFE8E8E8),
            textPrimary = Color(0xFF1A1A1A),
            textSecondary = Color(0xFF5A5A5A),
            textTertiary = Color(0xFF8A8A8A),
            accentPrimary = Color(0xFFCC7A00),
            accentSecondary = Color(0xFFE5A00D),
            divider = Color(0xFFD0D0D0),
            overlay = Color(0x66000000),
            error = Color(0xFFC62828),
            success = Color(0xFF2E7D32),
            warning = Color(0xFFFF8F00),
            isDark = false
        )
        
        MediaThemePreset.PAPER -> MediaThemeColors(
            background = Color(0xFFFAFAFA),
            backgroundElevated = Color(0xFFFFFFFF),
            backgroundSurface = Color(0xFFF0F0F0),
            textPrimary = Color(0xFF212121),
            textSecondary = Color(0xFF616161),
            textTertiary = Color(0xFF9E9E9E),
            accentPrimary = Color(0xFF1976D2),
            accentSecondary = Color(0xFF42A5F5),
            divider = Color(0xFFE0E0E0),
            overlay = Color(0x66000000),
            error = Color(0xFFD32F2F),
            success = Color(0xFF388E3C),
            warning = Color(0xFFF57C00),
            isDark = false
        )
        
        MediaThemePreset.CREAM -> MediaThemeColors(
            background = Color(0xFFFFFBF5),
            backgroundElevated = Color(0xFFFFFFFF),
            backgroundSurface = Color(0xFFF5EFE6),
            textPrimary = Color(0xFF3E2723),
            textSecondary = Color(0xFF5D4037),
            textTertiary = Color(0xFF8D6E63),
            accentPrimary = Color(0xFF6D4C41),
            accentSecondary = Color(0xFF8D6E63),
            divider = Color(0xFFD7CCC8),
            overlay = Color(0x66000000),
            error = Color(0xFFC62828),
            success = Color(0xFF558B2F),
            warning = Color(0xFFEF6C00),
            isDark = false
        )
        
        // ===================== READING THEMES =====================
        MediaThemePreset.SEPIA -> MediaThemeColors(
            background = Color(0xFFF4ECD8),
            backgroundElevated = Color(0xFFEAE0CC),
            backgroundSurface = Color(0xFFDED4C0),
            textPrimary = Color(0xFF5B4636),
            textSecondary = Color(0xFF7D6B5D),
            textTertiary = Color(0xFF9E8E7E),
            accentPrimary = Color(0xFF8B5A2B),
            accentSecondary = Color(0xFFA0522D),
            divider = Color(0xFFCABFA8),
            overlay = Color(0x66000000),
            error = Color(0xFFB71C1C),
            success = Color(0xFF33691E),
            warning = Color(0xFFE65100),
            isDark = false
        )
        
        MediaThemePreset.NIGHT_RED -> MediaThemeColors(
            background = Color(0xFF1A0A0A),
            backgroundElevated = Color(0xFF2A1515),
            backgroundSurface = Color(0xFF3A2020),
            textPrimary = Color(0xFFFFCCCC),
            textSecondary = Color(0xFFCC9999),
            textTertiary = Color(0xFF996666),
            accentPrimary = Color(0xFFFF6666),
            accentSecondary = Color(0xFFCC4444),
            divider = Color(0xFF4A2A2A),
            overlay = Color(0xE61A0A0A),
            error = Color(0xFFFF4444),
            success = Color(0xFF66AA66),
            warning = Color(0xFFFFAA66),
            isDark = true
        )
        
        // ===================== E-INK THEMES =====================
        MediaThemePreset.EINK -> MediaThemeColors(
            background = Color(0xFFFFFFFF),
            backgroundElevated = Color(0xFFF5F5F5),
            backgroundSurface = Color(0xFFEEEEEE),
            textPrimary = Color(0xFF000000),
            textSecondary = Color(0xFF333333),
            textTertiary = Color(0xFF666666),
            accentPrimary = Color(0xFF000000),
            accentSecondary = Color(0xFF333333),
            divider = Color(0xFFCCCCCC),
            overlay = Color(0x66000000),
            error = Color(0xFF000000),
            success = Color(0xFF333333),
            warning = Color(0xFF666666),
            isDark = false
        )
        
        MediaThemePreset.EINK_DARK -> MediaThemeColors(
            background = Color(0xFF000000),
            backgroundElevated = Color(0xFF111111),
            backgroundSurface = Color(0xFF222222),
            textPrimary = Color(0xFFFFFFFF),
            textSecondary = Color(0xFFCCCCCC),
            textTertiary = Color(0xFF999999),
            accentPrimary = Color(0xFFFFFFFF),
            accentSecondary = Color(0xFFCCCCCC),
            divider = Color(0xFF444444),
            overlay = Color(0xE6000000),
            error = Color(0xFFFFFFFF),
            success = Color(0xFFCCCCCC),
            warning = Color(0xFF999999),
            isDark = true
        )
        
        // ===================== ACCENT COLOR THEMES =====================
        MediaThemePreset.NETFLIX -> MediaThemeColors(
            background = Color(0xFF141414),
            backgroundElevated = Color(0xFF1F1F1F),
            backgroundSurface = Color(0xFF2A2A2A),
            textPrimary = Color(0xFFFFFFFF),
            textSecondary = Color(0xFFB3B3B3),
            textTertiary = Color(0xFF808080),
            accentPrimary = Color(0xFFE50914),
            accentSecondary = Color(0xFFB81D24),
            divider = Color(0xFF404040),
            overlay = Color(0xCC000000),
            error = Color(0xFFE50914),
            success = Color(0xFF46D369),
            warning = Color(0xFFF9A825),
            isDark = true
        )
        
        MediaThemePreset.SPOTIFY -> MediaThemeColors(
            background = Color(0xFF121212),
            backgroundElevated = Color(0xFF181818),
            backgroundSurface = Color(0xFF282828),
            textPrimary = Color(0xFFFFFFFF),
            textSecondary = Color(0xFFB3B3B3),
            textTertiary = Color(0xFF6A6A6A),
            accentPrimary = Color(0xFF1DB954),
            accentSecondary = Color(0xFF1ED760),
            divider = Color(0xFF404040),
            overlay = Color(0xCC000000),
            error = Color(0xFFFF5252),
            success = Color(0xFF1DB954),
            warning = Color(0xFFFFA000),
            isDark = true
        )
        
        MediaThemePreset.PURPLE_HAZE -> MediaThemeColors(
            background = Color(0xFF1A1625),
            backgroundElevated = Color(0xFF251E33),
            backgroundSurface = Color(0xFF352D45),
            textPrimary = Color(0xFFF5F5F5),
            textSecondary = Color(0xFFBBAACC),
            textTertiary = Color(0xFF8877AA),
            accentPrimary = Color(0xFF9C27B0),
            accentSecondary = Color(0xFFBA68C8),
            divider = Color(0xFF453D55),
            overlay = Color(0xCC1A1625),
            error = Color(0xFFE91E63),
            success = Color(0xFF8BC34A),
            warning = Color(0xFFFFCA28),
            isDark = true
        )
        
        MediaThemePreset.TEAL -> MediaThemeColors(
            background = Color(0xFF0D1F22),
            backgroundElevated = Color(0xFF152C30),
            backgroundSurface = Color(0xFF1E3A40),
            textPrimary = Color(0xFFE0F2F1),
            textSecondary = Color(0xFF80CBC4),
            textTertiary = Color(0xFF4DB6AC),
            accentPrimary = Color(0xFF00BCD4),
            accentSecondary = Color(0xFF26C6DA),
            divider = Color(0xFF26484E),
            overlay = Color(0xCC0D1F22),
            error = Color(0xFFFF5252),
            success = Color(0xFF69F0AE),
            warning = Color(0xFFFFD740),
            isDark = true
        )
        
        MediaThemePreset.PINK -> MediaThemeColors(
            background = Color(0xFF1F1520),
            backgroundElevated = Color(0xFF2A1E2C),
            backgroundSurface = Color(0xFF3A2A3C),
            textPrimary = Color(0xFFFCE4EC),
            textSecondary = Color(0xFFF8BBD9),
            textTertiary = Color(0xFFCE93D8),
            accentPrimary = Color(0xFFE91E63),
            accentSecondary = Color(0xFFF06292),
            divider = Color(0xFF4A3A4C),
            overlay = Color(0xCC1F1520),
            error = Color(0xFFFF1744),
            success = Color(0xFF76FF03),
            warning = Color(0xFFFFEA00),
            isDark = true
        )
        
        MediaThemePreset.GOLD -> MediaThemeColors(
            background = Color(0xFF1A1814),
            backgroundElevated = Color(0xFF2A261E),
            backgroundSurface = Color(0xFF3A342A),
            textPrimary = Color(0xFFFFF8E1),
            textSecondary = Color(0xFFFFE082),
            textTertiary = Color(0xFFFFCA28),
            accentPrimary = Color(0xFFFFD700),
            accentSecondary = Color(0xFFFFC107),
            divider = Color(0xFF4A4438),
            overlay = Color(0xCC1A1814),
            error = Color(0xFFFF5252),
            success = Color(0xFF00E676),
            warning = Color(0xFFFFC107),
            isDark = true
        )
    }
}

// =============================================================================
// THEME PROVIDER
// =============================================================================

/**
 * Local composition for current theme
 */
val LocalMediaTheme = compositionLocalOf { getThemeColors(MediaThemePreset.CLASSIC_DARK) }

/**
 * Plex Theme Provider
 */
@Composable
fun MediaTheme(
    preset: MediaThemePreset = MediaThemePreset.CLASSIC_DARK,
    customColors: MediaThemeColors? = null,
    content: @Composable () -> Unit
) {
    val colors = customColors ?: getThemeColors(preset)
    
    CompositionLocalProvider(LocalMediaTheme provides colors) {
        MaterialTheme(
            colorScheme = if (colors.isDark) {
                darkColorScheme(
                    primary = colors.accentPrimary,
                    secondary = colors.accentSecondary,
                    background = colors.background,
                    surface = colors.backgroundElevated,
                    surfaceVariant = colors.backgroundSurface,
                    onPrimary = Color.Black,
                    onSecondary = Color.Black,
                    onBackground = colors.textPrimary,
                    onSurface = colors.textPrimary,
                    error = colors.error
                )
            } else {
                lightColorScheme(
                    primary = colors.accentPrimary,
                    secondary = colors.accentSecondary,
                    background = colors.background,
                    surface = colors.backgroundElevated,
                    surfaceVariant = colors.backgroundSurface,
                    onPrimary = Color.White,
                    onSecondary = Color.White,
                    onBackground = colors.textPrimary,
                    onSurface = colors.textPrimary,
                    error = colors.error
                )
            },
            content = content
        )
    }
}

/**
 * Access current theme colors
 */
object MediaThemeProvider {
    val current: MediaThemeColors
        @Composable
        @ReadOnlyComposable
        get() = LocalMediaTheme.current
}

// =============================================================================
// READING THEME SETTINGS
// =============================================================================

data class ReadingThemeSettings(
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color,
    val fontFamily: String = "Default",
    val fontSize: Float = 16f,
    val lineHeight: Float = 1.5f,
    val paragraphSpacing: Float = 16f,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 24f,
    val textAlign: TextAlign = TextAlign.JUSTIFIED,
    val hyphenation: Boolean = true,
    val brightness: Float = 1f,
    val warmth: Float = 0f // 0 = normal, 1 = full sepia/warm
)

enum class TextAlign {
    LEFT, CENTER, RIGHT, JUSTIFIED
}

/**
 * Pre-defined reading theme presets
 */
object ReadingThemePresets {
    val WHITE = ReadingThemeSettings(
        backgroundColor = Color.White,
        textColor = Color.Black,
        linkColor = Color(0xFF1976D2)
    )
    
    val SEPIA = ReadingThemeSettings(
        backgroundColor = Color(0xFFF4ECD8),
        textColor = Color(0xFF5B4636),
        linkColor = Color(0xFF8B5A2B),
        warmth = 0.5f
    )
    
    val DARK = ReadingThemeSettings(
        backgroundColor = Color(0xFF1F1F1F),
        textColor = Color(0xFFE0E0E0),
        linkColor = Color(0xFF66B2FF)
    )
    
    val AMOLED = ReadingThemeSettings(
        backgroundColor = Color.Black,
        textColor = Color(0xFFCCCCCC),
        linkColor = Color(0xFF66B2FF)
    )
    
    val NIGHT = ReadingThemeSettings(
        backgroundColor = Color(0xFF1A0A0A),
        textColor = Color(0xFFFFCCCC),
        linkColor = Color(0xFFFF9999),
        warmth = 1f
    )
    
    val MINT = ReadingThemeSettings(
        backgroundColor = Color(0xFFE8F5E9),
        textColor = Color(0xFF1B5E20),
        linkColor = Color(0xFF2E7D32)
    )
    
    val BLUE = ReadingThemeSettings(
        backgroundColor = Color(0xFFE3F2FD),
        textColor = Color(0xFF0D47A1),
        linkColor = Color(0xFF1565C2)
    )
}
