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
internal fun ReaderContent(
    content: ReaderContent,
    theme: ReaderTheme,
    typography: ReaderTypography,
    isComic: Boolean,
    currentPage: Int,
    degradedWarning: String?
) {
    if (isComic) {
        // Comic/manga page view
        ComicPageView(
            imageUrl = content.imageUrls.getOrNull(currentPage - 1) ?: content.imageUrl,
            modifier = Modifier.fillMaxSize()
        )
    } else {
        if (!content.htmlContent.isNullOrBlank()) {
            HtmlReaderContent(
                htmlContent = content.htmlContent,
                theme = theme,
                typography = typography
            )
        } else {
            // Text content
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = typography.marginHorizontal.dp),
                contentPadding = PaddingValues(vertical = typography.marginVertical.dp)
            ) {
                if (!degradedWarning.isNullOrBlank()) {
                    item {
                        Surface(
                            shape = RoundedCornerShape(999.dp),
                            color = MediaColors.Warning.copy(alpha = 0.2f),
                            tonalElevation = 0.dp,
                            modifier = Modifier.padding(bottom = 12.dp)
                        ) {
                            Text(
                                text = "⚠ $degradedWarning",
                                style = MaterialTheme.typography.labelMedium,
                                color = MediaColors.Warning,
                                modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp)
                            )
                        }
                    }
                }
                item {
                    Text(
                        text = content.text,
                        color = theme.textColor,
                        fontSize = typography.fontSize.sp,
                        lineHeight = (typography.fontSize * typography.lineHeight).sp,
                        fontFamily = typography.fontFamily,
                        letterSpacing = typography.letterSpacing.sp,
                        textAlign = when (typography.textAlign) {
                            TextAlignment.LEFT -> TextAlign.Start
                            TextAlignment.CENTER -> TextAlign.Center
                            TextAlignment.RIGHT -> TextAlign.End
                            TextAlignment.JUSTIFY -> TextAlign.Justify
                        },
                        style = MaterialTheme.typography.bodyLarge
                    )
                }
            }
        }
    }
}
