package com.universalmedialibrary.ui.reader.components

import androidx.compose.ui.graphics.Color

/**
 * Enhanced color schemes for reading modes
 * Inspired by LibreraReader's day/night/sepia modes
 */
sealed class ReaderColorScheme(
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color,
    val name: String
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
        name = "OLED Black"
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
            
            // Sepia modes
            Sepia,
            DarkSepia,
            
            // Night modes
            ClassicNight,
            DarkGray,
            OLED,
            MidnightBlue,
            DarkGreen,
            Amber,
            
            // High contrast
            HighContrastDay,
            HighContrastNight
        )
        
        fun daySchemes(): List<ReaderColorScheme> = listOf(
            ClassicDay,
            WarmDay,
            PaperDay,
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
            MidnightBlue,
            DarkGreen,
            Amber,
            HighContrastNight
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
