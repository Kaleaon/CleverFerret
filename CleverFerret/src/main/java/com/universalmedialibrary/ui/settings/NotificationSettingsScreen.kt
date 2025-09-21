package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors

/**
 * Professional Notification Settings Screen
 * 
 * Features:
 * - Reading reminder notifications
 * - Sync and backup notifications
 * - System and app notifications
 * - Professional navy & gold theme
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NotificationSettingsScreen(
    navController: NavController
) {
    var readingReminders by remember { mutableStateOf(true) }
    var syncNotifications by remember { mutableStateOf(true) }
    var metadataUpdates by remember { mutableStateOf(false) }
    var systemUpdates by remember { mutableStateOf(true) }
    var quietHours by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Notification Settings",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = CleverFerretProfessionalColors.Navy,
                    titleContentColor = androidx.compose.ui.graphics.Color.White,
                    navigationIconContentColor = androidx.compose.ui.graphics.Color.White
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
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text(
                    text = "Configure notifications to enhance your reading experience",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            item {
                NotificationCategoryHeader("Reading & Progress")
            }

            item {
                NotificationOptionCard(
                    title = "Reading Reminders",
                    description = "Daily reading goals and streak notifications",
                    icon = Icons.Default.Schedule,
                    enabled = readingReminders,
                    onToggle = { readingReminders = it }
                )
            }

            item {
                NotificationOptionCard(
                    title = "Progress Tracking",
                    description = "Book completion and milestone notifications",
                    icon = Icons.Default.TrendingUp,
                    enabled = true,
                    onToggle = { }
                )
            }

            item {
                NotificationCategoryHeader("Library & Sync")
            }

            item {
                NotificationOptionCard(
                    title = "Sync Notifications",
                    description = "Cloud sync status and completion alerts",
                    icon = Icons.Default.CloudSync,
                    enabled = syncNotifications,
                    onToggle = { syncNotifications = it }
                )
            }

            item {
                NotificationOptionCard(
                    title = "Metadata Updates",
                    description = "New metadata and cover art discoveries",
                    icon = Icons.Default.AutoAwesome,
                    enabled = metadataUpdates,
                    onToggle = { metadataUpdates = it }
                )
            }

            item {
                NotificationCategoryHeader("System & App")
            }

            item {
                NotificationOptionCard(
                    title = "System Updates",
                    description = "App updates and important system messages",
                    icon = Icons.Default.SystemUpdate,
                    enabled = systemUpdates,
                    onToggle = { systemUpdates = it }
                )
            }

            item {
                NotificationOptionCard(
                    title = "Quiet Hours",
                    description = "Automatically silence notifications during set hours",
                    icon = Icons.Default.DoNotDisturb,
                    enabled = quietHours,
                    onToggle = { quietHours = it }
                )
            }

            if (quietHours) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.1f)
                        ),
                        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
                        shape = RoundedCornerShape(12.dp)
                    ) {
                        Column(
                            modifier = Modifier.padding(16.dp)
                        ) {
                            Text(
                                text = "Quiet Hours Schedule",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.SemiBold,
                                color = CleverFerretProfessionalColors.DeepNavy
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            Text(
                                text = "22:00 - 08:00 (Default)",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            OutlinedButton(
                                onClick = { /* Open time picker */ },
                                colors = ButtonDefaults.outlinedButtonColors(
                                    contentColor = CleverFerretProfessionalColors.DeepNavy
                                )
                            ) {
                                Icon(Icons.Default.Schedule, contentDescription = null)
                                Spacer(modifier = Modifier.width(8.dp))
                                Text("Customize Schedule")
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun NotificationCategoryHeader(title: String) {
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
fun NotificationOptionCard(
    title: String,
    description: String,
    icon: ImageVector,
    enabled: Boolean,
    onToggle: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 3.dp),
        shape = RoundedCornerShape(12.dp)
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
                        if (enabled) 
                            CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.15f)
                        else 
                            MaterialTheme.colorScheme.surfaceVariant
                    ),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier.size(24.dp),
                    tint = if (enabled) 
                        CleverFerretProfessionalColors.DeepNavy
                    else 
                        MaterialTheme.colorScheme.onSurfaceVariant
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
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Switch(
                checked = enabled,
                onCheckedChange = onToggle,
                colors = SwitchDefaults.colors(
                    checkedThumbColor = CleverFerretProfessionalColors.DeepGold,
                    checkedTrackColor = CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.5f),
                    uncheckedThumbColor = MaterialTheme.colorScheme.outline,
                    uncheckedTrackColor = MaterialTheme.colorScheme.surfaceVariant
                )
            )
        }
    }
}