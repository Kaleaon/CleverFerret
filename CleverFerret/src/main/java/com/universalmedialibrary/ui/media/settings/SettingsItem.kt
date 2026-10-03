package com.universalmedialibrary.ui.media.settings

import androidx.compose.animation.*
import androidx.compose.foundation.*
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
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.api.plugin.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Settings Screen
 * 
 * A beautiful, modular settings interface that allows users to:
 * - Configure API providers and their capabilities
 * - Manage integrations (Plex, Jellyfin, Calibre, etc.)
 * - Customize appearance and themes
 * - Configure playback preferences
 * - Manage parental controls
 * - View storage and cache
 */

@Composable
internal fun SettingsItem(
    icon: ImageVector,
    iconColor: Color,
    title: String,
    subtitle: String,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Surface(
            shape = CircleShape,
            color = iconColor.copy(alpha = 0.15f),
            modifier = Modifier.size(40.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = "Media image",
                modifier = Modifier.padding(MediaSpacing.SM),
                tint = iconColor
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MediaTypography.BodyLarge,
                color = MediaColors.TextPrimary
            )
            Text(
                text = subtitle,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextSecondary
            )
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary
        )
    }
}
