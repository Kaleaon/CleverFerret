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
internal fun ReaderSettingsSheet(
    theme: ReaderTheme,
    typography: ReaderTypography,
    onThemeChange: (ReaderTheme) -> Unit,
    onTypographyChange: (ReaderTypography) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD)
    ) {
        Text(
            text = "Reading Settings",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.padding(bottom = MediaSpacing.LG)
        )
        
        // Theme selector
        Text(
            text = "Theme",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            ReaderTheme.presets.forEach { preset ->
                ThemeButton(
                    theme = preset,
                    isSelected = theme.name == preset.name,
                    onClick = { onThemeChange(preset) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Font size
        Text(
            text = "Font Size",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            IconButton(onClick = {
                if (typography.fontSize > 12) {
                    onTypographyChange(typography.copy(fontSize = typography.fontSize - 1))
                }
            }) {
                Icon(
                    imageVector = Icons.Default.TextDecrease,
                    contentDescription = "Decrease",
                    tint = MediaColors.TextSecondary
                )
            }
            
            Text(
                text = "${typography.fontSize}sp",
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary
            )
            
            IconButton(onClick = {
                if (typography.fontSize < 32) {
                    onTypographyChange(typography.copy(fontSize = typography.fontSize + 1))
                }
            }) {
                Icon(
                    imageVector = Icons.Default.TextIncrease,
                    contentDescription = "Increase",
                    tint = MediaColors.TextSecondary
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Line height
        Text(
            text = "Line Spacing",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Slider(
            value = typography.lineHeight,
            onValueChange = { onTypographyChange(typography.copy(lineHeight = it)) },
            valueRange = 1.0f..2.5f,
            steps = 5,
            colors = SliderDefaults.colors(
                thumbColor = MediaColors.AccentPrimary,
                activeTrackColor = MediaColors.AccentPrimary
            )
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Margins
        Text(
            text = "Margins",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            listOf(8, 16, 24, 32).forEach { margin ->
                FilterChip(
                    selected = typography.marginHorizontal == margin,
                    onClick = { onTypographyChange(typography.copy(marginHorizontal = margin)) },
                    label = { Text("${margin}dp") },
                    colors = FilterChipDefaults.filterChipColors(
                        selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                        selectedLabelColor = MediaColors.AccentPrimary
                    )
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        // Text alignment
        Text(
            text = "Text Align",
            style = MediaTypography.LabelMedium,
            color = MediaColors.TextSecondary,
            modifier = Modifier.padding(bottom = MediaSpacing.SM)
        )
        
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            TextAlignment.entries.forEach { align ->
                FilterChip(
                    selected = typography.textAlign == align,
                    onClick = { onTypographyChange(typography.copy(textAlign = align)) },
                    label = { 
                        Icon(
                            imageVector = when (align) {
                                TextAlignment.LEFT -> Icons.Default.FormatAlignLeft
                                TextAlignment.CENTER -> Icons.Default.FormatAlignCenter
                                TextAlignment.RIGHT -> Icons.Default.FormatAlignRight
                                TextAlignment.JUSTIFY -> Icons.Default.FormatAlignJustify
                            },
                            contentDescription = align.name,
                            modifier = Modifier.size(18.dp)
                        )
                    },
                    colors = FilterChipDefaults.filterChipColors(
                        selectedContainerColor = MediaColors.AccentPrimary.copy(alpha = 0.2f),
                        selectedLabelColor = MediaColors.AccentPrimary
                    )
                )
            }
        }
        
        Spacer(modifier = Modifier.height(MediaSpacing.XL))
    }
}
