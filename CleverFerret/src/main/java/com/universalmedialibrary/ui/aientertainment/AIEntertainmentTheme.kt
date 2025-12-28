package com.universalmedialibrary.ui.aientertainment

import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color

/**
 * SynthChat color palette - SillyTavern-inspired dark theme
 */
object SynthColors {
    // Primary colors
    val primary = Color(0xFF6366F1)
    val primaryLight = Color(0xFF8B5CF6)
    val primaryDark = Color(0xFF4F46E5)
    val accent = Color(0xFF10B981)
    
    // Background colors
    val background = Color(0xFF1A1A2E)
    val backgroundSecondary = Color(0xFF16213E)
    val backgroundTertiary = Color(0xFF0F3460)
    val surface = Color(0xFF1F2937)
    val surfaceLight = Color(0xFF2D3748)
    
    // Text colors
    val textPrimary = Color(0xFFF3F4F6)
    val textSecondary = Color(0xFF9CA3AF)
    val textMuted = Color(0xFF6B7280)
    
    // Status colors
    val success = Color(0xFF10B981)
    val warning = Color(0xFFF59E0B)
    val error = Color(0xFFEF4444)
    val info = Color(0xFF3B82F6)
    
    // Border
    val border = Color(0xFF374151)
    
    // Gradients
    val primaryGradient = Brush.linearGradient(
        colors = listOf(primary, primaryLight)
    )
    
    // Avatar colors
    val avatarColors = listOf(
        primary,
        primaryLight,
        Color(0xFF10B981),
        Color(0xFFF59E0B),
        Color(0xFFEF4444),
        Color(0xFFEC4899),
        Color(0xFF14B8A6)
    )
    
    fun getAvatarColor(name: String): Color {
        var hash = 0
        for (char in name) {
            hash = char.code + ((hash shl 5) - hash)
        }
        return avatarColors[kotlin.math.abs(hash) % avatarColors.size]
    }
}

/**
 * Helper to get initials from a name
 */
fun getInitials(name: String): String {
    val words = name.trim().split(" ").filter { it.isNotEmpty() }
    return when {
        words.size >= 2 -> "${words[0].first()}${words[1].first()}".uppercase()
        words.isNotEmpty() -> words[0].first().uppercase().toString()
        else -> "?"
    }
}
