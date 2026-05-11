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

@Composable
internal fun ScrollContent(
    content: String,
    settings: ReaderSettings,
    highlights: List<HighlightInfo>,
    onScrollPosition: (Float) -> Unit
) {
    val scrollState = rememberScrollState()
    
    LaunchedEffect(scrollState.value) {
        if (scrollState.maxValue > 0) {
            onScrollPosition(scrollState.value.toFloat() / scrollState.maxValue)
        }
    }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .verticalScroll(scrollState)
            .padding(
                horizontal = settings.marginHorizontal.dp,
                vertical = settings.marginVertical.dp
            )
    ) {
        Text(
            text = content,
            style = TextStyle(
                fontFamily = getFontFamily(settings.fontFamily),
                fontSize = settings.fontSize.sp,
                lineHeight = (settings.fontSize * settings.lineHeight).sp,
                color = settings.theme.textColor,
                textAlign = when (settings.textAlign) {
                    ReaderTextAlign.LEFT -> TextAlign.Start
                    ReaderTextAlign.CENTER -> TextAlign.Center
                    ReaderTextAlign.RIGHT -> TextAlign.End
                    ReaderTextAlign.JUSTIFIED -> TextAlign.Justify
                }
            )
        )
    }
}
