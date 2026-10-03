package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*
import kotlinx.coroutines.launch

data class ReaderSettings(
    val fontSize: Float = 18f,
    val fontFamily: ReaderFontFamily = ReaderFontFamily.SYSTEM,
    val lineHeight: Float = 1.5f,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 24f,
    val textAlign: ReaderTextAlign = ReaderTextAlign.JUSTIFIED,
    val themePreset: ReaderThemePreset = ReaderThemePreset.DARK,
    val theme: ReaderTheme = ReaderThemePreset.DARK.toTheme(),
    val readingMode: ReadingMode = ReadingMode.PAGINATED,
    val pageAnimation: PageAnimation = PageAnimation.SLIDE,
    val showPageNumber: Boolean = true,
    val keepScreenOn: Boolean = true,
    val volumePageTurn: Boolean = false,
    val brightness: Float = 1f,
    val warmth: Float = 0f
)

data class ReaderTheme(
    val backgroundColor: Color,
    val textColor: Color,
    val linkColor: Color
)

enum class ReaderFontFamily(val displayName: String) {
    SYSTEM("System"),
    SERIF("Serif"),
    SANS_SERIF("Sans Serif"),
    MONOSPACE("Mono"),
    GEORGIA("Georgia"),
    TIMES("Times"),
    PALATINO("Palatino"),
    BOOKERLY("Bookerly"),
    LITERATA("Literata"),
    OPEN_DYSLEXIC("OpenDyslexic")
}
