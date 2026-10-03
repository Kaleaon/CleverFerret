package com.universalmedialibrary.ui.media.player

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.gestures.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalDensity
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.media.theme.*
import androidx.compose.ui.viewinterop.AndroidView
import android.webkit.WebView
import android.webkit.WebViewClient

@Composable
internal fun ReaderBottomBar(
    currentPage: Int,
    totalPages: Int,
    chapterProgress: Float,
    currentChapterIndex: Int,
    totalChapters: Int,
    onPageChange: (Int) -> Unit,
    onPreviousChapter: () -> Unit,
    onNextChapter: () -> Unit,
    theme: ReaderTheme
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.Background.copy(alpha = 0.95f),
        tonalElevation = MediaElevation.SM
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .navigationBarsPadding()
                .padding(MediaSpacing.MD)
        ) {
            // Page slider
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = currentPage.toString(),
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.width(40.dp)
                )
                
                Slider(
                    value = currentPage.toFloat(),
                    onValueChange = { onPageChange(it.toInt()) },
                    valueRange = 1f..totalPages.toFloat(),
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MediaColors.AccentPrimary,
                        activeTrackColor = MediaColors.AccentPrimary,
                        inactiveTrackColor = MediaColors.ProgressBackground
                    )
                )
                
                Text(
                    text = totalPages.toString(),
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.width(40.dp),
                    textAlign = TextAlign.End
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            // Chapter navigation
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Previous chapter
                TextButton(
                    onClick = onPreviousChapter,
                    enabled = currentChapterIndex > 0
                ) {
                    Icon(
                        imageVector = Icons.Default.ChevronLeft,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                    Text("Prev")
                }
                
                // Chapter info
                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                    Text(
                        text = "Chapter ${currentChapterIndex + 1} of $totalChapters",
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.TextSecondary
                    )
                    LinearProgressIndicator(
                        progress = { chapterProgress },
                        modifier = Modifier
                            .width(100.dp)
                            .height(4.dp)
                            .clip(RoundedCornerShape(MediaCorners.Full)),
                        color = MediaColors.AccentPrimary,
                        trackColor = MediaColors.ProgressBackground
                    )
                }
                
                // Next chapter
                TextButton(
                    onClick = onNextChapter,
                    enabled = currentChapterIndex < totalChapters - 1
                ) {
                    Text("Next")
                    Icon(
                        imageVector = Icons.Default.ChevronRight,
                        contentDescription = "Media image",
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}
