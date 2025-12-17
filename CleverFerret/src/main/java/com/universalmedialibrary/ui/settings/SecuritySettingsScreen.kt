package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.SecuritySettings
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SecuritySettingsScreen(
    navController: NavController,
    viewModel: SecuritySettingsViewModel = hiltViewModel()
) {
    val securitySettings by viewModel.securitySettings.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                    title = { Text("Security Settings") },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                        }
                    }
                )
            }
        ) { paddingValues ->
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                item {
                    SecurityOptionCard(
                        title = "PIN Lock",
                        description = "Require PIN to access the app",
                        icon = Icons.Default.Lock,
                        enabled = securitySettings.enablePinLock,
                        onToggle = { viewModel.togglePinLock() }
                    )
                }

                item {
                    SecurityOptionCard(
                        title = "Biometric Lock",
                        description = "Use fingerprint or face unlock",
                        icon = Icons.Default.Fingerprint,
                        enabled = securitySettings.enableBiometric,
                        onToggle = { viewModel.toggleBiometric() }
                    )
                }

                item {
                    SecurityOptionCard(
                        title = "Hide in Recents",
                        description = "Hide app content in recent apps",
                        icon = Icons.Default.VisibilityOff,
                        enabled = securitySettings.hideContentInRecents,
                        onToggle = { viewModel.toggleHideInRecents() }
                    )
                }
            }
        }
}

@Composable
private fun SecurityOptionCard(
    title: String,
    description: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    enabled: Boolean,
    onToggle: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(24.dp),
                tint = MaterialTheme.colorScheme.primary
            )

            Spacer(modifier = Modifier.width(16.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Switch(
                checked = enabled,
                onCheckedChange = { onToggle() }
            )
        }
    }
}
