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
internal fun TocSheet(
    chapters: List<ChapterInfo>,
    currentChapterIndex: Int,
    onChapterSelect: (Int) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Table of Contents",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.MD)
        )
        
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 400.dp)
        ) {
            itemsIndexed(chapters) { index, chapter ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onChapterSelect(index) }
                        .background(
                            if (index == currentChapterIndex)
                                MediaColors.AccentPrimary.copy(alpha = 0.1f)
                            else
                                Color.Transparent
                        )
                        .padding(MediaSpacing.MD),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = chapter.title,
                            style = MediaTypography.BodyMedium,
                            color = if (index == currentChapterIndex)
                                MediaColors.AccentPrimary
                            else
                                MediaColors.TextPrimary,
                            fontWeight = if (index == currentChapterIndex)
                                FontWeight.SemiBold
                            else
                                FontWeight.Normal
                        )
                        
                        if (chapter.progress > 0) {
                            Spacer(modifier = Modifier.height(MediaSpacing.XS))
                            LinearProgressIndicator(
                                progress = { chapter.progress },
                                modifier = Modifier
                                    .fillMaxWidth(0.5f)
                                    .height(2.dp)
                                    .clip(RoundedCornerShape(MediaCorners.Full)),
                                color = MediaColors.AccentPrimary,
                                trackColor = MediaColors.ProgressBackground
                            )
                        }
                    }
                    
                    if (index == currentChapterIndex) {
                        Icon(
                            imageVector = Icons.Default.PlayArrow,
                            contentDescription = "Current",
                            tint = MediaColors.AccentPrimary,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
            }
        }
    }
}
