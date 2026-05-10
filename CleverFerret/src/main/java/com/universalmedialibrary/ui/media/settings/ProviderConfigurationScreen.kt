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
fun ProviderConfigurationScreen(
    provider: ApiProvider,
    configuration: ApiConfiguration?,
    onSave: (ApiConfiguration) -> Unit,
    onDelete: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var apiKey by remember { mutableStateOf(configuration?.apiKey ?: "") }
    var serverUrl by remember { mutableStateOf(configuration?.serverUrl ?: "") }
    var enabledCapabilities by remember { 
        mutableStateOf(configuration?.enabledCapabilities ?: provider.supportedCapabilities) 
    }
    var isEnabled by remember { mutableStateOf(configuration?.isEnabled ?: true) }
    var showApiKey by remember { mutableStateOf(false) }
    
    Column(
        modifier = modifier
            .fillMaxSize()
            .background(MediaColors.Background)
    ) {
        SettingsTopBar(
            title = provider.name,
            onBackClick = onBackClick,
            actions = {
                if (configuration != null) {
                    IconButton(onClick = onDelete) {
                        Icon(
                            imageVector = Icons.Default.Delete,
                            contentDescription = "Delete",
                            tint = MediaColors.Error
                        )
                    }
                }
            }
        )
        
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Provider info
            item {
                Surface(
                    shape = RoundedCornerShape(MediaCorners.Card),
                    color = MediaColors.BackgroundElevated
                ) {
                    Column(
                        modifier = Modifier.padding(MediaSpacing.MD)
                    ) {
                        Text(
                            text = provider.description,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextSecondary
                        )
                        
                        Spacer(modifier = Modifier.height(MediaSpacing.SM))
                        
                        Text(
                            text = provider.website,
                            style = MediaTypography.BodySmall,
                            color = MediaColors.AccentPrimary
                        )
                    }
                }
            }
            
            // Enable/Disable toggle
            item {
                SettingsCard {
                    SettingsToggleItem(
                        title = "Enable ${provider.name}",
                        subtitle = "Use this provider for configured capabilities",
                        isChecked = isEnabled,
                        onCheckedChange = { isEnabled = it }
                    )
                }
            }
            
            // Credentials section
            if (provider.requiresApiKey || provider.requiresOAuth || provider.id in listOf("plex", "jellyfin", "emby", "calibre")) {
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.MD))
                    SettingsSectionHeader(title = "Credentials")
                }
                
                item {
                    SettingsCard {
                        if (provider.requiresApiKey) {
                            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                                Text(
                                    text = "API Key",
                                    style = MediaTypography.LabelMedium,
                                    color = MediaColors.TextSecondary
                                )
                                
                                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                                
                                OutlinedTextField(
                                    value = apiKey,
                                    onValueChange = { apiKey = it },
                                    modifier = Modifier.fillMaxWidth(),
                                    placeholder = { Text("Enter your API key") },
                                    visualTransformation = if (showApiKey) 
                                        VisualTransformation.None 
                                    else 
                                        PasswordVisualTransformation(),
                                    trailingIcon = {
                                        IconButton(onClick = { showApiKey = !showApiKey }) {
                                            Icon(
                                                imageVector = if (showApiKey) 
                                                    Icons.Default.VisibilityOff 
                                                else 
                                                    Icons.Default.Visibility,
                                                contentDescription = "Media image"
                                            )
                                        }
                                    },
                                    colors = OutlinedTextFieldDefaults.colors(
                                        focusedBorderColor = MediaColors.AccentPrimary,
                                        unfocusedBorderColor = MediaColors.Border
                                    ),
                                    shape = RoundedCornerShape(MediaCorners.SM)
                                )
                            }
                        }
                        
                        if (provider.id in listOf("plex", "jellyfin", "emby", "calibre")) {
                            if (provider.requiresApiKey) {
                                SettingsDivider()
                            }
                            
                            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                                Text(
                                    text = "Server URL",
                                    style = MediaTypography.LabelMedium,
                                    color = MediaColors.TextSecondary
                                )
                                
                                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                                
                                OutlinedTextField(
                                    value = serverUrl,
                                    onValueChange = { serverUrl = it },
                                    modifier = Modifier.fillMaxWidth(),
                                    placeholder = { Text("https://your-server.com") },
                                    colors = OutlinedTextFieldDefaults.colors(
                                        focusedBorderColor = MediaColors.AccentPrimary,
                                        unfocusedBorderColor = MediaColors.Border
                                    ),
                                    shape = RoundedCornerShape(MediaCorners.SM)
                                )
                            }
                        }
                    }
                }
            }
            
            // Capabilities section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                SettingsSectionHeader(title = "Capabilities")
                
                Text(
                    text = "Select which features to use from ${provider.name}",
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextTertiary,
                    modifier = Modifier.padding(top = MediaSpacing.XS)
                )
            }
            
            // Group capabilities by category
            val capabilitiesByCategory = provider.supportedCapabilities.groupBy { it.category }
            
            capabilitiesByCategory.forEach { (category, capabilities) ->
                item {
                    Text(
                        text = category.displayName,
                        style = MediaTypography.LabelMedium,
                        color = MediaColors.TextSecondary,
                        modifier = Modifier.padding(top = MediaSpacing.MD, bottom = MediaSpacing.XS)
                    )
                }
                
                item {
                    SettingsCard {
                        capabilities.forEachIndexed { index, capability ->
                            SettingsToggleItem(
                                title = capability.displayName,
                                subtitle = capability.description,
                                isChecked = capability in enabledCapabilities,
                                onCheckedChange = { checked ->
                                    enabledCapabilities = if (checked) {
                                        enabledCapabilities + capability
                                    } else {
                                        enabledCapabilities - capability
                                    }
                                }
                            )
                            
                            if (index < capabilities.size - 1) {
                                SettingsDivider()
                            }
                        }
                    }
                }
            }
            
            // Save button
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.LG))
                
                Button(
                    onClick = {
                        onSave(
                            ApiConfiguration(
                                providerId = provider.id,
                                apiKey = apiKey.takeIf { it.isNotBlank() },
                                serverUrl = serverUrl.takeIf { it.isNotBlank() },
                                enabledCapabilities = enabledCapabilities,
                                isEnabled = isEnabled
                            )
                        )
                    },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MediaColors.AccentPrimary
                    ),
                    shape = RoundedCornerShape(MediaCorners.Button)
                ) {
                    Text(
                        text = "Save Configuration",
                        style = MediaTypography.LabelLarge,
                        modifier = Modifier.padding(vertical = MediaSpacing.SM)
                    )
                }
            }
            
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge))
            }
        }
    }
}
