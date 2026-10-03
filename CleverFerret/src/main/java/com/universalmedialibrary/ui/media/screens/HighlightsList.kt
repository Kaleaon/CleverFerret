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
internal fun HighlightsList(highlights: List<HighlightInfo>) {
    if (highlights.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.XL),
            contentAlignment = Alignment.Center
        ) {
            Text("No highlights yet", color = MediaColors.TextSecondary)
        }
    } else {
        LazyColumn {
            items(items = highlights, key = { it.id }) { highlight ->
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(MediaSpacing.MD)
                ) {
                    Surface(
                        color = highlight.color.copy(alpha = 0.3f),
                        shape = RoundedCornerShape(MediaCorners.XS)
                    ) {
                        Text(
                            highlight.text,
                            style = MediaTypography.BodySmall,
                            color = MediaColors.TextPrimary,
                            modifier = Modifier.padding(MediaSpacing.SM)
                        )
                    }
                    Text(
                        "Page ${highlight.pageNumber + 1}",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        modifier = Modifier.padding(top = MediaSpacing.XS)
                    )
                }
            }
        }
    }
}
