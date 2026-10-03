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

enum class ReaderThemePreset {
    WHITE, SEPIA, DARK, AMOLED, NIGHT;
    
    fun toTheme(): ReaderTheme = when (this) {
        WHITE -> ReaderTheme(
            backgroundColor = Color.White,
            textColor = Color.Black,
            linkColor = Color(0xFF1976D2)
        )
        SEPIA -> ReaderTheme(
            backgroundColor = Color(0xFFF4ECD8),
            textColor = Color(0xFF5B4636),
            linkColor = Color(0xFF8B5A2B)
        )
        DARK -> ReaderTheme(
            backgroundColor = Color(0xFF1F1F1F),
            textColor = Color(0xFFE0E0E0),
            linkColor = Color(0xFF66B2FF)
        )
        AMOLED -> ReaderTheme(
            backgroundColor = Color.Black,
            textColor = Color(0xFFCCCCCC),
            linkColor = Color(0xFF66B2FF)
        )
        NIGHT -> ReaderTheme(
            backgroundColor = Color(0xFF1A0A0A),
            textColor = Color(0xFFFFCCCC),
            linkColor = Color(0xFFFF9999)
        )
    }
}
