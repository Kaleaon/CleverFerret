package com.universalmedialibrary.ui.player

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.graphics.toArgb
import androidx.core.graphics.ColorUtils
import androidx.core.graphics.drawable.toBitmap
import androidx.palette.graphics.Palette
import coil.imageLoader
import coil.request.ImageRequest
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class ArtworkColors(
    val primary: Color,
    val secondary: Color,
    val accent: Color,
    val isDark: Boolean
)

private val DefaultArtworkColors = ArtworkColors(
    primary = Color(0xFF1A1A2E),
    secondary = Color(0xFF16213E),
    accent = Color(0xFF0F3460),
    isDark = true
)

@Composable
fun rememberArtworkPalette(source: Any?): ArtworkColors {
    val context = LocalContext.current
    var artworkColors by remember(source) { mutableStateOf(DefaultArtworkColors) }

    LaunchedEffect(source) {
        if (source == null) {
            artworkColors = DefaultArtworkColors
            return@LaunchedEffect
        }

        val palette = withContext(Dispatchers.IO) {
            try {
                extractArtworkColors(context, source)
            } catch (_: Exception) {
                null
            }
        }

        artworkColors = palette ?: DefaultArtworkColors
    }

    return artworkColors
}

private suspend fun extractArtworkColors(context: Context, source: Any): ArtworkColors? {
    val request = ImageRequest.Builder(context)
        .data(source)
        .allowHardware(false)
        .build()

    val drawable = context.imageLoader.execute(request).drawable ?: return null
    val bitmap = drawable.toBitmap()
    val palette = Palette.from(bitmap).clearFilters().maximumColorCount(8).generate().also {
        if (!bitmap.isRecycled) {
            bitmap.recycle()
        }
    }

    val primaryInt = palette.getDarkVibrantColor(
        palette.getDominantColor(DefaultArtworkColors.primary.toArgb())
    )
    val secondaryInt = palette.getMutedColor(DefaultArtworkColors.secondary.toArgb())
    val accentInt = palette.getLightVibrantColor(DefaultArtworkColors.accent.toArgb())

    val isDark = ColorUtils.calculateLuminance(primaryInt) < 0.5

    return ArtworkColors(
        primary = Color(primaryInt),
        secondary = Color(secondaryInt),
        accent = Color(accentInt),
        isDark = isDark
    )
}
