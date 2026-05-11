// CFTheme — the single composable every modernized screen must be wrapped in.
// Provides Material3 ColorScheme + CFTokens + Typography in one shot.

package com.universalmedialibrary.ui.modern.theme

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Typography
import androidx.compose.runtime.Composable
import androidx.compose.runtime.CompositionLocalProvider
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

private fun cfTypography(family: FontFamily): Typography = Typography(
    displayLarge   = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 44.sp, letterSpacing = (-1.0).sp),
    displayMedium  = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 32.sp, letterSpacing = (-0.6).sp),
    headlineLarge  = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 26.sp, letterSpacing = (-0.4).sp),
    headlineMedium = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 22.sp, letterSpacing = (-0.3).sp),
    titleLarge     = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 17.sp),
    titleMedium    = TextStyle(fontFamily = family, fontWeight = FontWeight.SemiBold, fontSize = 15.sp),
    titleSmall     = TextStyle(fontFamily = family, fontWeight = FontWeight.SemiBold, fontSize = 13.sp),
    bodyLarge      = TextStyle(fontFamily = family, fontWeight = FontWeight.Normal,   fontSize = 16.sp, lineHeight = 24.sp),
    bodyMedium     = TextStyle(fontFamily = family, fontWeight = FontWeight.Normal,   fontSize = 14.sp, lineHeight = 20.sp),
    bodySmall      = TextStyle(fontFamily = family, fontWeight = FontWeight.Normal,   fontSize = 12.sp, lineHeight = 16.sp),
    labelLarge     = TextStyle(fontFamily = family, fontWeight = FontWeight.SemiBold, fontSize = 13.sp, letterSpacing = 0.2.sp),
    labelMedium    = TextStyle(fontFamily = family, fontWeight = FontWeight.SemiBold, fontSize = 11.sp, letterSpacing = 1.4.sp),
    labelSmall     = TextStyle(fontFamily = family, fontWeight = FontWeight.Bold,     fontSize = 10.sp, letterSpacing = 1.6.sp),
)

@Composable
fun CFTheme(
    palette: CFPalette = CFThemes.NavyGold,
    content: @Composable () -> Unit,
) {
    CompositionLocalProvider(LocalCFTokens provides palette.tokens) {
        MaterialTheme(
            colorScheme = palette.scheme,
            typography = cfTypography(palette.tokens.typography),
            content = content,
        )
    }
}
