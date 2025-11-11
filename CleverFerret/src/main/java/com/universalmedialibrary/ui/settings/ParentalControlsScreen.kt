package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette

/**
 * Parental Controls Settings Screen
 * 
 * Features:
 * - Enable/disable parental controls
 * - Set/change PIN
 * - Block mature/explicit content
 * - Hide adult content
 * - Require PIN for adult content
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ParentalControlsScreen(
    navController: NavController,
    viewModel: ParentalControlsViewModel = hiltViewModel()
) {
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val scrollState = rememberScrollState()

        Scaffold(
            topBar = {
                TopAppBar(
                    title = {
                        Text(
                            "Parental Controls",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.surface,
                        titleContentColor = MaterialTheme.colorScheme.onSurface
                    )
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .verticalScroll(scrollState)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Header Card
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.FamilyRestroom,
                            contentDescription = null,
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Column {
                            Text(
                                "Family-Friendly Protection",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                "Control access to mature content",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }

                // Master Enable Switch
                Card(modifier = Modifier.fillMaxWidth()) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Enable Parental Controls",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Medium
                            )
                            Text(
                                if (uiState.state.enabled) "Protection active" else "No restrictions",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Switch(
                            checked = uiState.state.enabled,
                            onCheckedChange = { viewModel.toggleParentalControls() }
                        )
                    }
                }

                // PIN Setup
                if (uiState.state.enabled) {
                    PinSetupCard(
                        hasPinSet = uiState.state.hasPinSet,
                        onSetPin = { viewModel.showPinDialog(PinDialogType.SET) },
                        onChangePin = { viewModel.showPinDialog(PinDialogType.CHANGE) },
                        onClearPin = { viewModel.showPinDialog(PinDialogType.CLEAR) }
                    )
                }

                // Content Restrictions
                if (uiState.state.enabled) {
                    ContentRestrictionsCard(
                        blockMature = uiState.state.blockMature,
                        blockExplicit = uiState.state.blockExplicit,
                        hideAdultContent = uiState.state.hideAdultContent,
                        requirePinForAdult = uiState.state.requirePinForAdult && uiState.state.hasPinSet,
                        allowAdultSources = uiState.state.allowAdultSources,
                        canToggleAdultSources = !uiState.state.blockExplicit && !uiState.state.hideAdultContent,
                        hasPinSet = uiState.state.hasPinSet,
                        onBlockMatureChange = { viewModel.setBlockMature(it) },
                        onBlockExplicitChange = { viewModel.setBlockExplicit(it) },
                        onHideAdultContentChange = { viewModel.setHideAdultContent(it) },
                        onAllowAdultSourcesChange = { viewModel.setAllowAdultSources(it) },
                        onRequirePinChange = { viewModel.setRequirePinForAdult(it) }
                    )
                }

                // Additional Settings
                if (uiState.state.enabled) {
                    AdditionalSettingsCard(
                        lockSettings = uiState.state.lockSettings,
                        onLockSettingsChange = { viewModel.setLockSettings(it) }
                    )
                }

                // Info Card
                InfoCard()
            }
        }

        // PIN Dialog
        if (uiState.showPinDialog) {
            PinDialog(
                type = uiState.pinDialogType,
                onDismiss = { viewModel.dismissPinDialog() },
                onConfirm = { pin -> viewModel.handlePinDialog(pin) },
                error = uiState.pinError
            )
        }

        // Success Message
        uiState.successMessage?.let { message ->
            LaunchedEffect(message) {
                kotlinx.coroutines.delay(2000)
                viewModel.clearSuccess()
            }
            Snackbar(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(message)
            }
        }
    }
}

@Composable
private fun PinSetupCard(
    hasPinSet: Boolean,
    onSetPin: () -> Unit,
    onChangePin: () -> Unit,
    onClearPin: () -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    if (hasPinSet) Icons.Default.Lock else Icons.Default.LockOpen,
                    contentDescription = null,
                    tint = if (hasPinSet) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
                Text(
                    "PIN Protection",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            Text(
                if (hasPinSet) "PIN is set and protecting your content" else "Set a PIN to lock adult content and settings",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                if (!hasPinSet) {
                    Button(
                        onClick = onSetPin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Add, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Set PIN")
                    }
                } else {
                    OutlinedButton(
                        onClick = onChangePin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Edit, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Change")
                    }
                    OutlinedButton(
                        onClick = onClearPin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Delete, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Clear")
                    }
                }
            }
        }
    }
}

@Composable
private fun ContentRestrictionsCard(
    blockMature: Boolean,
    blockExplicit: Boolean,
    hideAdultContent: Boolean,
    requirePinForAdult: Boolean,
    allowAdultSources: Boolean,
    canToggleAdultSources: Boolean,
    hasPinSet: Boolean,
    onBlockMatureChange: (Boolean) -> Unit,
    onBlockExplicitChange: (Boolean) -> Unit,
    onHideAdultContentChange: (Boolean) -> Unit,
    onAllowAdultSourcesChange: (Boolean) -> Unit,
    onRequirePinChange: (Boolean) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Block,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.error
                )
                Text(
                    "Content Restrictions",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            // Block Explicit
            SwitchSettingItem(
                title = "Block Explicit Content",
                description = "Block stories rated Explicit/Adult/NC-17",
                checked = blockExplicit,
                onCheckedChange = onBlockExplicitChange,
                icon = Icons.Default.Warning
            )

            Divider()

            // Block Mature
            SwitchSettingItem(
                title = "Block Mature Content",
                description = "Block stories rated Mature/M/R",
                checked = blockMature,
                onCheckedChange = onBlockMatureChange,
                icon = Icons.Default.WarningAmber
            )

            Divider()

            // Hide Adult Content
            SwitchSettingItem(
                title = "Hide Adult Content",
                description = "Completely hide blocked content from library and searches",
                checked = hideAdultContent,
                onCheckedChange = onHideAdultContentChange,
                icon = Icons.Default.VisibilityOff
            )

            Divider()

            // Adult Content Sources toggle
            val adultDescription = if (canToggleAdultSources) {
                "Allow searching and downloading from adult-oriented fiction sites"
            } else {
                "Disabled while explicit content is blocked or hidden"
            }
            SwitchSettingItem(
                title = "Enable Adult Story Sources",
                description = adultDescription,
                checked = allowAdultSources && canToggleAdultSources,
                onCheckedChange = onAllowAdultSourcesChange,
                icon = Icons.Default.Explicit,
                enabled = canToggleAdultSources
            )

            if (!canToggleAdultSources) {
                Text(
                    text = "Unblock explicit content and show adult stories to enable adult site retrieval.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Divider()

            // Require PIN for Adult
            SwitchSettingItem(
                title = "Require PIN for Adult Content",
                description = if (hasPinSet) "PIN required to access mature/explicit content" else "Set a PIN first to enable",
                checked = requirePinForAdult,
                onCheckedChange = onRequirePinChange,
                icon = Icons.Default.Lock,
                enabled = hasPinSet
            )
        }
    }
}

@Composable
private fun AdditionalSettingsCard(
    lockSettings: Boolean,
    onLockSettingsChange: (Boolean) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Settings,
                    contentDescription = null
                )
                Text(
                    "Additional Settings",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            SwitchSettingItem(
                title = "Lock Settings",
                description = "Require PIN to change parental control settings",
                checked = lockSettings,
                onCheckedChange = onLockSettingsChange,
                icon = Icons.Default.Lock
            )
        }
    }
}

@Composable
private fun SwitchSettingItem(
    title: String,
    description: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    enabled: Boolean = true
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Row(
            modifier = Modifier.weight(1f),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp),
                tint = if (enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = 0.38f)
            )
            Column {
                Text(
                    title,
                    style = MaterialTheme.typography.bodyLarge,
                    color = if (enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = 0.38f)
                )
                Text(
                    description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            enabled = enabled
        )
    }
}

@Composable
private fun InfoCard() {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Info,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.tertiary
                )
                Text(
                    "How It Works",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
            }
            Text(
                "• Parental controls protect your family from inappropriate content\n" +
                        "• Set a 4-digit PIN to lock settings and adult content\n" +
                        "• Choose to hide or lock mature/explicit rated stories\n" +
                        "• Applies to all fanfiction sites and downloads\n" +
                        "• PIN uses secure encryption (SHA-256)",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun PinDialog(
    type: PinDialogType,
    onDismiss: () -> Unit,
    onConfirm: (String) -> Unit,
    error: String?
) {
    var pin by remember { mutableStateOf("") }
    var confirmPin by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(Icons.Default.Lock, contentDescription = null)
        },
        title = {
            Text(
                when (type) {
                    PinDialogType.SET -> "Set PIN"
                    PinDialogType.CHANGE -> "Change PIN"
                    PinDialogType.CLEAR -> "Clear PIN"
                    PinDialogType.VERIFY -> "Enter PIN"
                }
            )
        },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(
                    when (type) {
                        PinDialogType.SET -> "Enter a 4-digit PIN to protect parental controls"
                        PinDialogType.CHANGE -> "Enter your new 4-digit PIN"
                        PinDialogType.CLEAR -> "Enter your PIN to clear it"
                        PinDialogType.VERIFY -> "Enter your PIN to continue"
                    }
                )

                OutlinedTextField(
                    value = pin,
                    onValueChange = { if (it.length <= 4 && it.all { char -> char.isDigit() }) pin = it },
                    label = { Text("PIN") },
                    visualTransformation = PasswordVisualTransformation(),
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.NumberPassword),
                    singleLine = true,
                    isError = error != null
                )

                if (type == PinDialogType.SET || type == PinDialogType.CHANGE) {
                    OutlinedTextField(
                        value = confirmPin,
                        onValueChange = { if (it.length <= 4 && it.all { char -> char.isDigit() }) confirmPin = it },
                        label = { Text("Confirm PIN") },
                        visualTransformation = PasswordVisualTransformation(),
                        keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.NumberPassword),
                        singleLine = true,
                        isError = error != null
                    )
                }

                if (error != null) {
                    Text(
                        error,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.error
                    )
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    when (type) {
                        PinDialogType.SET, PinDialogType.CHANGE -> {
                            if (pin == confirmPin && pin.length == 4) {
                                onConfirm(pin)
                            }
                        }
                        PinDialogType.CLEAR, PinDialogType.VERIFY -> {
                            if (pin.length == 4) {
                                onConfirm(pin)
                            }
                        }
                    }
                },
                enabled = when (type) {
                    PinDialogType.SET, PinDialogType.CHANGE -> pin.length == 4 && pin == confirmPin
                    PinDialogType.CLEAR, PinDialogType.VERIFY -> pin.length == 4
                }
            ) {
                Text("Confirm")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

enum class PinDialogType {
    SET, CHANGE, CLEAR, VERIFY
}
