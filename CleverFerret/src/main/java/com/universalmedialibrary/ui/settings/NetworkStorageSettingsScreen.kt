package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.theme.*

/**
 * Network Storage Settings Screen
 * Configure SMB/CIFS and WebDAV connections
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun NetworkStorageSettingsScreen(
    onBack: () -> Unit,
    viewModel: NetworkStorageSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val selectedTheme by viewModel.selectedTheme.collectAsState()
    val darkMode by viewModel.darkMode.collectAsState()
    var showAddStorageDialog by remember { mutableStateOf(false) }
    var selectedStorageType by remember { mutableStateOf(StorageType.SMB) }

    CleverFerretTheme(palette = selectedTheme, darkTheme = darkMode) {
        Scaffold(
        topBar = {
            MetallicTopAppBar(
                title = {
                    Text(
                        "Network Storage",
                        fontWeight = FontWeight.Bold
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                }
            )
        },
        floatingActionButton = {
            FloatingActionButton(
                onClick = { showAddStorageDialog = true },
                containerColor = MaterialTheme.colorScheme.primary
            ) {
                Icon(Icons.Default.Add, "Add Storage")
            }
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            // SMB/CIFS Shares
            item {
                MetallicText(
                    text = "SMB/CIFS Network Shares",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.smbShares) { share ->
                NetworkStorageCard(
                    storageName = share.name,
                    storageUrl = share.url,
                    storageType = "SMB/CIFS",
                    isConnected = share.isConnected,
                    onTest = { viewModel.testConnection(share) },
                    onBrowse = { viewModel.browseStorage(share) },
                    onDelete = { viewModel.deleteStorage(share) }
                )
            }

            if (uiState.smbShares.isEmpty()) {
                item {
                    EmptyStorageCard("No SMB/CIFS shares configured")
                }
            }

            // WebDAV Storage
            item {
                MetallicText(
                    text = "WebDAV Storage",
                    style = MaterialTheme.typography.titleMedium,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }

            items(uiState.webdavStorage) { storage ->
                NetworkStorageCard(
                    storageName = storage.name,
                    storageUrl = storage.url,
                    storageType = "WebDAV",
                    isConnected = storage.isConnected,
                    onTest = { viewModel.testConnection(storage) },
                    onBrowse = { viewModel.browseStorage(storage) },
                    onDelete = { viewModel.deleteStorage(storage) }
                )
            }

            if (uiState.webdavStorage.isEmpty()) {
                item {
                    EmptyStorageCard("No WebDAV storage configured")
                }
            }
        }
    }

        if (showAddStorageDialog) {
            AddNetworkStorageDialog(
                storageType = selectedStorageType,
                onStorageTypeChange = { selectedStorageType = it },
                onDismiss = { showAddStorageDialog = false },
                onAdd = { name, server, share, domain, username, password, port ->
                    viewModel.addStorage(selectedStorageType, name, server, share, domain, username, password, port)
                    showAddStorageDialog = false
                }
            )
        }
    }
}

@Composable
private fun NetworkStorageCard(
    storageName: String,
    storageUrl: String,
    storageType: String,
    isConnected: Boolean,
    onTest: () -> Unit,
    onBrowse: () -> Unit,
    onDelete: () -> Unit
) {
    MetallicCard {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = storageName,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Surface(
                            color = MaterialTheme.colorScheme.secondaryContainer,
                            shape = MaterialTheme.shapes.small
                        ) {
                            Text(
                                text = storageType,
                                style = MaterialTheme.typography.labelSmall,
                                modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp)
                            )
                        }
                    }
                    Text(
                        text = storageUrl,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Icon(
                    imageVector = if (isConnected) Icons.Default.CheckCircle else Icons.Default.Error,
                    contentDescription = if (isConnected) "Connected" else "Disconnected",
                    tint = if (isConnected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
            }

            Spacer(modifier = Modifier.height(12.dp))

            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                MetallicButton(
                    text = "Test",
                    onClick = onTest,
                    modifier = Modifier.weight(1f)
                )
                MetallicButton(
                    text = "Browse",
                    onClick = onBrowse,
                    modifier = Modifier.weight(1f)
                )
                MetallicButton(
                    text = "Delete",
                    onClick = onDelete,
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun EmptyStorageCard(message: String) {
    MetallicCard {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(32.dp),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = message,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddNetworkStorageDialog(
    storageType: StorageType,
    onStorageTypeChange: (StorageType) -> Unit,
    onDismiss: () -> Unit,
    onAdd: (name: String, server: String, share: String, domain: String, username: String, password: String, port: Int) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var server by remember { mutableStateOf("") }
    var share by remember { mutableStateOf("") }
    var domain by remember { mutableStateOf("") }
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var port by remember { mutableStateOf(if (storageType == StorageType.SMB) "445" else "443") }
    var showPassword by remember { mutableStateOf(false) }
    var expanded by remember { mutableStateOf(false) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Network Storage") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp),
                modifier = Modifier.fillMaxWidth()
            ) {
                // Storage Type Dropdown
                ExposedDropdownMenuBox(
                    expanded = expanded,
                    onExpandedChange = { expanded = !expanded }
                ) {
                    OutlinedTextField(
                        value = storageType.displayName,
                        onValueChange = {},
                        readOnly = true,
                        label = { Text("Storage Type") },
                        trailingIcon = {
                            ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded)
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor()
                    )

                    ExposedDropdownMenu(
                        expanded = expanded,
                        onDismissRequest = { expanded = false }
                    ) {
                        StorageType.values().forEach { type ->
                            DropdownMenuItem(
                                text = { Text(type.displayName) },
                                onClick = {
                                    onStorageTypeChange(type)
                                    port = if (type == StorageType.SMB) "445" else "443"
                                    expanded = false
                                }
                            )
                        }
                    }
                }

                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Storage Name") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = server,
                    onValueChange = { server = it },
                    label = { Text("Server Address") },
                    placeholder = { Text("192.168.1.100") },
                    modifier = Modifier.fillMaxWidth()
                )

                if (storageType == StorageType.SMB) {
                    OutlinedTextField(
                        value = share,
                        onValueChange = { share = it },
                        label = { Text("Share Name") },
                        placeholder = { Text("media") },
                        modifier = Modifier.fillMaxWidth()
                    )

                    OutlinedTextField(
                        value = domain,
                        onValueChange = { domain = it },
                        label = { Text("Domain (optional)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                }

                OutlinedTextField(
                    value = username,
                    onValueChange = { username = it },
                    label = { Text("Username") },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = { Text("Password") },
                    visualTransformation = if (showPassword) VisualTransformation.None else PasswordVisualTransformation(),
                    trailingIcon = {
                        IconButton(onClick = { showPassword = !showPassword }) {
                            Icon(
                                imageVector = if (showPassword) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                                contentDescription = if (showPassword) "Hide password" else "Show password"
                            )
                        }
                    },
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = port,
                    onValueChange = { port = it },
                    label = { Text("Port") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && server.isNotBlank() && username.isNotBlank()) {
                        onAdd(name, server, share, domain, username, password, port.toIntOrNull() ?: 445)
                    }
                }
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

enum class StorageType(val displayName: String) {
    SMB("SMB/CIFS"),
    WEBDAV("WebDAV")
}