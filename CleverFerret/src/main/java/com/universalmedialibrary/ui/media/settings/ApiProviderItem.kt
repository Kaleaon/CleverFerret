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
internal fun ApiProviderItem(
    provider: ApiProvider,
    isConfigured: Boolean,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(MediaSpacing.MD),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Provider icon placeholder
        Surface(
            shape = RoundedCornerShape(MediaCorners.SM),
            color = if (isConfigured) MediaColors.Success.copy(alpha = 0.15f) 
                   else MediaColors.BackgroundSurface,
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = if (isConfigured) Icons.Filled.CheckCircle else Icons.Outlined.Api,
                contentDescription = "Media image",
                modifier = Modifier.padding(MediaSpacing.SM),
                tint = if (isConfigured) MediaColors.Success else MediaColors.TextSecondary
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(
                    text = provider.name,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                
                if (provider.requiresApiKey || provider.requiresOAuth) {
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.Warning.copy(alpha = 0.15f)
                    ) {
                        Text(
                            text = if (provider.requiresOAuth) "OAuth" else "API Key",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.Warning,
                            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                        )
                    }
                }
                
                if (!provider.isFree) {
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.AccentPrimary.copy(alpha = 0.15f)
                    ) {
                        Text(
                            text = "Premium",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.AccentPrimary,
                            modifier = Modifier.padding(horizontal = MediaSpacing.XS, vertical = 2.dp)
                        )
                    }
                }
            }
            
            Text(
                text = provider.description,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextSecondary
            )
            
            // Show capabilities count
            Text(
                text = "${provider.supportedCapabilities.size} capabilities",
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
        }
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = "Media image",
            tint = MediaColors.TextTertiary
        )
    }
}
