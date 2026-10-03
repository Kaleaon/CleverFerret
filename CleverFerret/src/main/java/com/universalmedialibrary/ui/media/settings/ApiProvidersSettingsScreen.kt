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
fun ApiProvidersSettingsScreen(
    state: ApiProvidersState,
    onProviderClick: (ApiProvider) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
    ) {
        SettingsTopBar(
            title = "API Providers",
            onBackClick = onBackClick
        )
        
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Group providers by category
            val providersByCategory = state.allProviders.groupBy { provider ->
                when {
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.BOOK_METADATA, ApiCapability.AUDIOBOOK_METADATA) 
                    } -> "Books & Audiobooks"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.MOVIE_METADATA, ApiCapability.TV_METADATA) 
                    } -> "Movies & TV"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.MUSIC_METADATA, ApiCapability.SCROBBLING) 
                    } -> "Music"
                    provider.supportedCapabilities.any { 
                        it == ApiCapability.PODCAST_METADATA 
                    } -> "Podcasts"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.LIBRARY_SYNC, ApiCapability.VIDEO_STREAM) 
                    } -> "Media Servers"
                    provider.supportedCapabilities.any { 
                        it in listOf(ApiCapability.TTS, ApiCapability.TRANSLATION) 
                    } -> "AI & Cloud Services"
                    else -> "Other"
                }
            }
            
            providersByCategory.forEach { (category, providers) ->
                item {
                    SettingsSectionHeader(title = category)
                }
                
                item {
                    SettingsCard {
                        providers.forEachIndexed { index, provider ->
                            val isConfigured = provider.id in state.configuredProviderIds
                            
                            ApiProviderItem(
                                provider = provider,
                                isConfigured = isConfigured,
                                onClick = { onProviderClick(provider) }
                            )
                            
                            if (index < providers.size - 1) {
                                SettingsDivider()
                            }
                        }
                    }
                }
                
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.MD))
                }
            }
        }
    }
}
