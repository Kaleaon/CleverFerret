package com.universalmedialibrary.ui.theme

import androidx.compose.ui.graphics.Color

/**
 * Metallic color palette for CleverFerret
 * True metallic colors with proper RGB values for shimmer effect
 */

// GOLD (Metallic) - For Navy/Royal Blue palettes
object MetallicGold {
    val Primary = Color(0xFFD4AF37)        // Rich gold
    val Light = Color(0xFFFFD700)          // Bright gold
    val Medium = Color(0xFFDAA520)         // Goldenrod
    val Dark = Color(0xFFB8860B)           // Dark goldenrod
    val Burnished = Color(0xFFC5A572)      // Burnished gold
    val Rose = Color(0xFFE5BE8A)           // Rose gold hint
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFFFFF8DC)      // Cornsilk highlight
    val Shadow = Color(0xFF856D34)         // Gold shadow
}

// COPPER (Metallic) - For warm palettes (brown, orange, red)
object MetallicCopper {
    val Primary = Color(0xFFB87333)        // Copper
    val Light = Color(0xFFE77C56)          // Bright copper
    val Medium = Color(0xFFCD7F32)         // Bronze
    val Dark = Color(0xFF964B00)           // Dark copper/bronze
    val Burnished = Color(0xFFC46210)      // Burnished copper
    val Rose = Color(0xFFECC5C0)           // Rose copper
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFFFFA07A)      // Light salmon highlight
    val Shadow = Color(0xFF8B4513)         // Saddle brown shadow
}

// SILVER (Metallic) - For cool palettes (gray, purple, cyan)
object MetallicSilver {
    val Primary = Color(0xFFC0C0C0)        // Silver
    val Light = Color(0xFFE8E8E8)          // Bright silver
    val Medium = Color(0xFFAAA9AD)         // Medium silver
    val Dark = Color(0xFF71706E)           // Dark silver
    val Burnished = Color(0xFFA8A9AD)      // Burnished silver
    val Platinum = Color(0xFFE5E4E2)       // Platinum
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFFF5F5F5)      // White smoke highlight
    val Shadow = Color(0xFF505050)         // Gray shadow
}

// ROSE GOLD (Metallic) - For pink/purple palettes
object MetallicRoseGold {
    val Primary = Color(0xFFB76E79)        // Rose gold
    val Light = Color(0xFFE8B4BC)          // Light rose gold
    val Medium = Color(0xFFD4A5A5)         // Medium rose gold
    val Dark = Color(0xFF9B6B6F)           // Dark rose gold
    val Burnished = Color(0xFFC9ADA7)      // Burnished rose gold
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFFFFE4E1)      // Misty rose highlight
    val Shadow = Color(0xFF8B4A5A)         // Deep rose shadow
}

// CHAMPAGNE (Metallic) - For beige/cream palettes
object MetallicChampagne {
    val Primary = Color(0xFFF7E7CE)        // Champagne
    val Light = Color(0xFFFAEBD7)          // Antique white
    val Medium = Color(0xFFE8D5C4)         // Medium champagne
    val Dark = Color(0xFFD4C5B0)           // Dark champagne
    val Burnished = Color(0xFFDDD0B4)      // Burnished champagne
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFFFFFAF0)      // Floral white highlight
    val Shadow = Color(0xFFB8A68F)         // Khaki shadow
}

// GUNMETAL (Metallic) - For dark themes
object MetallicGunmetal {
    val Primary = Color(0xFF2C3539)        // Gunmetal
    val Light = Color(0xFF52616B)          // Light gunmetal
    val Medium = Color(0xFF3E4E57)         // Medium gunmetal
    val Dark = Color(0xFF1E2427)           // Dark gunmetal
    val Burnished = Color(0xFF474B4E)      // Burnished gunmetal
    
    // Gradient colors for metallic effect
    val Highlight = Color(0xFF6B7F8A)      // Steel blue highlight
    val Shadow = Color(0xFF0F1113)         // Almost black shadow
}

// Helper function to create metallic gradient effect
data class MetallicGradient(
    val base: Color,
    val highlight: Color,
    val shadow: Color,
    val shimmer: Color? = null
)

object MetallicEffects {
    val Gold = MetallicGradient(
        base = MetallicGold.Primary,
        highlight = MetallicGold.Highlight,
        shadow = MetallicGold.Shadow,
        shimmer = MetallicGold.Light
    )
    
    val Copper = MetallicGradient(
        base = MetallicCopper.Primary,
        highlight = MetallicCopper.Highlight,
        shadow = MetallicCopper.Shadow,
        shimmer = MetallicCopper.Light
    )
    
    val Silver = MetallicGradient(
        base = MetallicSilver.Primary,
        highlight = MetallicSilver.Highlight,
        shadow = MetallicSilver.Shadow,
        shimmer = MetallicSilver.Platinum
    )
    
    val RoseGold = MetallicGradient(
        base = MetallicRoseGold.Primary,
        highlight = MetallicRoseGold.Highlight,
        shadow = MetallicRoseGold.Shadow,
        shimmer = MetallicRoseGold.Light
    )
    
    val Champagne = MetallicGradient(
        base = MetallicChampagne.Primary,
        highlight = MetallicChampagne.Highlight,
        shadow = MetallicChampagne.Shadow,
        shimmer = MetallicChampagne.Light
    )
    
    val Gunmetal = MetallicGradient(
        base = MetallicGunmetal.Primary,
        highlight = MetallicGunmetal.Highlight,
        shadow = MetallicGunmetal.Shadow,
        shimmer = MetallicGunmetal.Light
    )
}