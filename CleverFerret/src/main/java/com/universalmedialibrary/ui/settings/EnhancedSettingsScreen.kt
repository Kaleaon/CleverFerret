package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors

/**
 * Enhanced Settings Screen with Professional Navy & Gold Theme
 * 
 * Features:
 * - Professional color scheme with deep navy blue and gold accents
 * - Comprehensive settings organization
 * - Modern Material Design 3 implementation
 * - Elegant card-based layout
 * - Intuitive navigation structure
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedSettingsScreen(
    onNavigateBack: () -> Unit = {},
    onNavigateToApiSettings: () -> Unit = {},
    onNavigateToReaderSettings: () -> Unit = {},
    onNavigateToSecuritySettings: () -> Unit = {},
    onNavigateToGeneralSettings: () -> Unit = {},
    onNavigateToIntegrationSettings: () -> Unit = {},
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Settings",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            Icons.AutoMirrored.Filled.ArrowBack, 
                            contentDescription = "Back",
                            tint = MaterialTheme.colorScheme.onSurface
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer,
                    navigationIconContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .background(MaterialTheme.colorScheme.background),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                // Header description
                Text(
                    text = "Customize your CleverFerret experience with professional-grade settings",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(bottom = 8.dp)
                )
            }

            // API & Metadata Settings Section
            item {
                SettingsCategoryHeader("API & Metadata")
            }

            items(getApiMetadataSettingsItems()) { item ->
                ProfessionalSettingsCard(
                    title = item.title,
                    subtitle = item.subtitle,
                    icon = item.icon,
                    gradientColors = listOf(
                        CleverFerretProfessionalColors.NavyMedium.copy(alpha = 0.1f),
                        CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.05f)
                    ),
                    onClick = when (item.title) {
                        "API Keys Manager" -> onNavigateToApiSettings
                        else -> onNavigateToApiSettings
                    }
                )
            }

            // Reader & Media Settings Section
            item {
                SettingsCategoryHeader("Reader & Media")
            }

            items(getReaderMediaSettingsItems()) { item ->
                ProfessionalSettingsCard(
                    title = item.title,
                    subtitle = item.subtitle,
                    icon = item.icon,
                    gradientColors = listOf(
                        CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.1f),
                        CleverFerretProfessionalColors.NavyLight.copy(alpha = 0.05f)
                    ),
                    onClick = when (item.title) {
                        "Reading Experience" -> onNavigateToReaderSettings
                        "Media Library" -> onNavigateToGeneralSettings
                        else -> onNavigateToReaderSettings
                    }
                )
            }

            // Integration & Cloud Section
            item {
                SettingsCategoryHeader("Integration & Cloud")
            }

            items(getIntegrationCloudSettingsItems()) { item ->
                ProfessionalSettingsCard(
                    title = item.title,
                    subtitle = item.subtitle,
                    icon = item.icon,
                    gradientColors = listOf(
                        CleverFerretProfessionalColors.Navy.copy(alpha = 0.1f),
                        CleverFerretProfessionalColors.Gold.copy(alpha = 0.08f)
                    ),
                    onClick = when (item.title) {
                        "Plex Integration" -> onNavigateToIntegrationSettings
                        "Cloud Sync" -> onNavigateToGeneralSettings
                        else -> onNavigateToIntegrationSettings
                    }
                )
            }

            // Security & Privacy Section
            item {
                SettingsCategoryHeader("Security & Privacy")
            }

            items(getSecurityPrivacySettingsItems()) { item ->
                ProfessionalSettingsCard(
                    title = item.title,
                    subtitle = item.subtitle,
                    icon = item.icon,
                    gradientColors = listOf(
                        CleverFerretProfessionalColors.DeepNavy.copy(alpha = 0.1f),
                        CleverFerretProfessionalColors.GoldDark.copy(alpha = 0.05f)
                    ),
                    onClick = when (item.title) {
                        "Security Settings" -> onNavigateToSecuritySettings
                        "Privacy Controls" -> onNavigateToSecuritySettings
                        else -> onNavigateToSecuritySettings
                    }
                )
            }

            // System & About Section
            item {
                SettingsCategoryHeader("System & About")
            }

            items(getSystemAboutSettingsItems()) { item ->
                ProfessionalSettingsCard(
                    title = item.title,
                    subtitle = item.subtitle,
                    icon = item.icon,
                    gradientColors = listOf(
                        MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f),
                        MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
                    ),
                    onClick = onNavigateToGeneralSettings
                )
            }
        }

        // Error handling
        uiState.error?.let { error ->
            LaunchedEffect(error) {
                viewModel.clearError()
            }
        }
    }
}

@Composable
fun SettingsCategoryHeader(title: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Box(
            modifier = Modifier
                .height(2.dp)
                .width(4.dp)
                .background(
                    CleverFerretProfessionalColors.DeepGold,
                    RoundedCornerShape(1.dp)
                )
        )
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            text = title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold,
            color = CleverFerretProfessionalColors.DeepNavy
        )
    }
}

@Composable
fun ProfessionalSettingsCard(
    title: String,
    subtitle: String,
    icon: ImageVector,
    gradientColors: List<Color>,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 3.dp),
        shape = RoundedCornerShape(12.dp)
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .background(
                    brush = Brush.horizontalGradient(gradientColors),
                    shape = RoundedCornerShape(12.dp)
                )
        ) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(20.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Box(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(RoundedCornerShape(12.dp))
                        .background(
                            brush = Brush.radialGradient(
                                listOf(
                                    CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.2f),
                                    CleverFerretProfessionalColors.Navy.copy(alpha = 0.1f)
                                )
                            )
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = icon,
                        contentDescription = null,
                        tint = CleverFerretProfessionalColors.DeepNavy,
                        modifier = Modifier.size(24.dp)
                    )
                }
                
                Spacer(modifier = Modifier.width(16.dp))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = MaterialTheme.colorScheme.onSurface
                    )
                    Spacer(modifier = Modifier.height(4.dp))
                    Text(
                        text = subtitle,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        lineHeight = MaterialTheme.typography.bodySmall.lineHeight
                    )
                }
                
                Icon(
                    imageVector = Icons.Default.ChevronRight,
                    contentDescription = null,
                    tint = CleverFerretProfessionalColors.DeepGold,
                    modifier = Modifier.size(20.dp)
                )
            }
        }
    }
}

data class EnhancedSettingsMenuItem(
    val title: String,
    val subtitle: String,
    val icon: ImageVector
)

private fun getApiMetadataSettingsItems(): List<EnhancedSettingsMenuItem> = listOf(
    EnhancedSettingsMenuItem(
        title = "API Keys Manager",
        subtitle = "Configure 16+ metadata providers (TMDB, Google Books, MusicBrainz, etc.)",
        icon = Icons.Default.Key
    ),
    EnhancedSettingsMenuItem(
        title = "Metadata Quality",
        subtitle = "Set quality preferences and confidence thresholds",
        icon = Icons.Default.HighQuality
    ),
    EnhancedSettingsMenuItem(
        title = "Source Priority",
        subtitle = "Customize metadata source priority and fallback options",
        icon = Icons.Default.Sort
    )
)

private fun getReaderMediaSettingsItems(): List<EnhancedSettingsMenuItem> = listOf(
    EnhancedSettingsMenuItem(
        title = "Reading Experience",
        subtitle = "Fonts, themes, page animations, and reading controls",
        icon = Icons.Default.MenuBook
    ),
    EnhancedSettingsMenuItem(
        title = "Media Library",
        subtitle = "Library organization, scan settings, and file management",
        icon = Icons.Default.LibraryBooks
    ),
    EnhancedSettingsMenuItem(
        title = "Player Settings",
        subtitle = "Audio/video player preferences and quality settings",
        icon = Icons.Default.PlayArrow
    ),
    EnhancedSettingsMenuItem(
        title = "Display & Interface",
        subtitle = "App theme, layout options, and visual customizations",
        icon = Icons.Default.Palette
    )
)

private fun getIntegrationCloudSettingsItems(): List<EnhancedSettingsMenuItem> = listOf(
    EnhancedSettingsMenuItem(
        title = "Plex Integration",
        subtitle = "Connect to Plex servers for enhanced media management",
        icon = Icons.Default.Cloud
    ),
    EnhancedSettingsMenuItem(
        title = "Calibre Integration", 
        subtitle = "OPDS feeds, Content Server, and library synchronization",
        icon = Icons.Default.Sync
    ),
    EnhancedSettingsMenuItem(
        title = "Cloud Sync",
        subtitle = "Backup settings, reading progress, and cross-device sync",
        icon = Icons.Default.CloudSync
    ),
    EnhancedSettingsMenuItem(
        title = "Import & Export",
        subtitle = "Library backup, restore, and migration tools",
        icon = Icons.Default.ImportExport
    )
)

private fun getSecurityPrivacySettingsItems(): List<EnhancedSettingsMenuItem> = listOf(
    EnhancedSettingsMenuItem(
        title = "Security Settings",
        subtitle = "PIN lock, biometric authentication, and app protection",
        icon = Icons.Default.Security
    ),
    EnhancedSettingsMenuItem(
        title = "Privacy Controls",
        subtitle = "Data collection, analytics, and privacy preferences",
        icon = Icons.Default.PrivacyTip
    ),
    EnhancedSettingsMenuItem(
        title = "Parental Controls",
        subtitle = "Content filtering and access restrictions",
        icon = Icons.Default.FamilyRestroom
    )
)

private fun getSystemAboutSettingsItems(): List<EnhancedSettingsMenuItem> = listOf(
    EnhancedSettingsMenuItem(
        title = "Notifications",
        subtitle = "Reading reminders, sync alerts, and system notifications",
        icon = Icons.Default.Notifications
    ),
    EnhancedSettingsMenuItem(
        title = "Performance",
        subtitle = "Cache management, optimization, and storage settings",
        icon = Icons.Default.Speed
    ),
    EnhancedSettingsMenuItem(
        title = "Advanced",
        subtitle = "Debug options, experimental features, and developer tools",
        icon = Icons.Default.DeveloperMode
    ),
    EnhancedSettingsMenuItem(
        title = "About",
        subtitle = "Version info, licenses, support, and acknowledgments",
        icon = Icons.Default.Info
    )
)