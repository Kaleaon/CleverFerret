package com.universalmedialibrary.ui.reader.components

import androidx.compose.ui.graphics.Color

/**
 * Enhanced color schemes for reading modes
 * Inspired by Moonreader and LibreraReader's day/night/sepia modes
 * Supports background images for enhanced reading experience
 */
sealed class ReaderColorScheme(
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color,
    val name: String,
    val backgroundImageName: String? = null, // Optional background image resource name
    val useBackgroundImage: Boolean = false,
    val isAMOLED: Boolean = false // True black for AMOLED displays
) {
    // Day modes
    object ClassicDay : ReaderColorScheme(
        backgroundColor = Color.White,
        textColor = Color.Black,
        linkColor = Color(0xFF0066CC),
        name = "Classic Day"
    )
    
    object WarmDay : ReaderColorScheme(
        backgroundColor = Color(0xFFFFF8DC), // Cornsilk
        textColor = Color(0xFF2C2C2C),
        linkColor = Color(0xFF9F0600),
        name = "Warm Day"
    )
    
    object PaperDay : ReaderColorScheme(
        backgroundColor = Color(0xFFFFFBF0), // Ivory
        textColor = Color(0xFF1A1A1A),
        linkColor = Color(0xFF4169E1), // Royal Blue
        name = "Paper Day"
    )
    
    // Moonreader-inspired day themes with background images
    object NatureDay : ReaderColorScheme(
        backgroundColor = Color(0xFFF5F5DC), // Beige
        textColor = Color(0xFF2C2C2C),
        linkColor = Color(0xFF228B22), // Forest Green
        name = "Nature Day",
        backgroundImageName = "readbg_11", // Paper texture
        useBackgroundImage = true
    )
    
    object ProDay1 : ReaderColorScheme(
        backgroundColor = Color(0xFFFFFEF7), // Off-white
        textColor = Color(0xFF1A1A1A),
        linkColor = Color(0xFF4169E1),
        name = "Pro Day 1",
        backgroundImageName = "readbg_12",
        useBackgroundImage = true
    )

    // Sepia modes
    object Sepia : ReaderColorScheme(
        backgroundColor = Color(0xFFF4ECD8),
        textColor = Color(0xFF5C4B37),
        linkColor = Color(0xFF8B4513),
        name = "Sepia"
    )
    
    object DarkSepia : ReaderColorScheme(
        backgroundColor = Color(0xFFE8DCC0),
        textColor = Color(0xFF3D2E1F),
        linkColor = Color(0xFF8B4513),
        name = "Dark Sepia"
    )

    // Night modes
    object ClassicNight : ReaderColorScheme(
        backgroundColor = Color(0xFF000000),
        textColor = Color(0xFFE0E0E0),
        linkColor = Color(0xFF7494B2),
        name = "Classic Night"
    )
    
    object DarkGray : ReaderColorScheme(
        backgroundColor = Color(0xFF1E1E1E),
        textColor = Color(0xFFD4D4D4),
        linkColor = Color(0xFF6CA0DC),
        name = "Dark Gray"
    )
    
    object OLED : ReaderColorScheme(
        backgroundColor = Color(0xFF000000),
        textColor = Color(0xFFFFFFFF),
        linkColor = Color(0xFF7494B2),
        name = "OLED Black",
        isAMOLED = true
    )
    
    // Moonreader-inspired AMOLED modes
    object AMOLEDBlack : ReaderColorScheme(
        backgroundColor = Color(0xFF000000), // True black
        textColor = Color(0xFFFFFFFF),
        linkColor = Color(0xFF90CAF9),
        name = "AMOLED Black",
        isAMOLED = true
    )
    
    object AMOLEDBlack2 : ReaderColorScheme(
        backgroundColor = Color(0xFF141414), // Slightly lighter for contrast
        textColor = Color(0xFFEEEEEE),
        linkColor = Color(0xFF90CAF9),
        name = "AMOLED Black 2",
        isAMOLED = true
    )
    
    object AMOLEDBlack3 : ReaderColorScheme(
        backgroundColor = Color(0xFF171717),
        textColor = Color(0xFFEEEEEE),
        linkColor = Color(0xFF90CAF9),
        name = "AMOLED Black 3",
        isAMOLED = true
    )
    
    // Moonreader-inspired night themes with background images
    object NatureNight : ReaderColorScheme(
        backgroundColor = Color(0xFF1A1A1A),
        textColor = Color(0xFFE0E0E0),
        linkColor = Color(0xFF81C784),
        name = "Nature Night",
        backgroundImageName = "readbg_05",
        useBackgroundImage = true
    )
    
    object ProNight1 : ReaderColorScheme(
        backgroundColor = Color(0xFF0A0A0A),
        textColor = Color(0xFFE8E8E8),
        linkColor = Color(0xFF90CAF9),
        name = "Pro Night 1",
        backgroundImageName = "readbg_06",
        useBackgroundImage = true
    )
    
    object MidnightBlue : ReaderColorScheme(
        backgroundColor = Color(0xFF0A1929),
        textColor = Color(0xFFE3F2FD),
        linkColor = Color(0xFF90CAF9),
        name = "Midnight Blue"
    )
    
    object DarkGreen : ReaderColorScheme(
        backgroundColor = Color(0xFF0D1B0D),
        textColor = Color(0xFFE8F5E9),
        linkColor = Color(0xFF81C784),
        name = "Dark Green"
    )
    
    object Amber : ReaderColorScheme(
        backgroundColor = Color(0xFF1A0F00),
        textColor = Color(0xFFFFE082),
        linkColor = Color(0xFFFFB74D),
        name = "Amber Night"
    )

    // High contrast modes
    object HighContrastDay : ReaderColorScheme(
        backgroundColor = Color.White,
        textColor = Color.Black,
        linkColor = Color(0xFF0000FF), // Pure blue
        name = "High Contrast Day"
    )
    
    object HighContrastNight : ReaderColorScheme(
        backgroundColor = Color.Black,
        textColor = Color.White,
        linkColor = Color(0xFF00FF00), // Pure green
        name = "High Contrast Night"
    )

    companion object {
        fun allSchemes(): List<ReaderColorScheme> = listOf(
            // Day modes
            ClassicDay,
            WarmDay,
            PaperDay,
            NatureDay,
            ProDay1,
            
            // Sepia modes
            Sepia,
            DarkSepia,
            
            // Night modes
            ClassicNight,
            DarkGray,
            OLED,
            AMOLEDBlack,
            AMOLEDBlack2,
            AMOLEDBlack3,
            MidnightBlue,
            DarkGreen,
            Amber,
            NatureNight,
            ProNight1,
            
            // High contrast
            HighContrastDay,
            HighContrastNight
        )
        
        fun daySchemes(): List<ReaderColorScheme> = listOf(
            ClassicDay,
            WarmDay,
            PaperDay,
            NatureDay,
            ProDay1,
            HighContrastDay
        )
        
        fun sepiaSchemes(): List<ReaderColorScheme> = listOf(
            Sepia,
            DarkSepia
        )
        
        fun nightSchemes(): List<ReaderColorScheme> = listOf(
            ClassicNight,
            DarkGray,
            OLED,
            AMOLEDBlack,
            AMOLEDBlack2,
            AMOLEDBlack3,
            MidnightBlue,
            DarkGreen,
            Amber,
            NatureNight,
            ProNight1,
            HighContrastNight
        )
        
        fun amoledSchemes(): List<ReaderColorScheme> = listOf(
            AMOLEDBlack,
            AMOLEDBlack2,
            AMOLEDBlack3,
            OLED
        )
        
        fun schemesWithBackgroundImages(): List<ReaderColorScheme> = listOf(
            NatureDay,
            ProDay1,
            NatureNight,
            ProNight1
        )
        
        fun fromName(name: String): ReaderColorScheme {
            return allSchemes().find { it.name == name } ?: ClassicDay
        }
    }
}

/**
 * Reader theme mode for quick selection
 */
enum class ReaderThemeMode {
    DAY,
    SEPIA,
    NIGHT;
    
    fun getDefaultScheme(): ReaderColorScheme = when (this) {
        DAY -> ReaderColorScheme.ClassicDay
        SEPIA -> ReaderColorScheme.Sepia
        NIGHT -> ReaderColorScheme.ClassicNight
    }
    
    fun getSchemes(): List<ReaderColorScheme> = when (this) {
        DAY -> ReaderColorScheme.daySchemes()
        SEPIA -> ReaderColorScheme.sepiaSchemes()
        NIGHT -> ReaderColorScheme.nightSchemes()
    }
}
