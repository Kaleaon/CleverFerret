package com.universalmedialibrary.ui.audio

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
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.AudioSyncClient
import com.universalmedialibrary.data.local.entity.AudioSyncGroup
import com.universalmedialibrary.data.local.entity.AudioSyncServer

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MultiRoomAudioScreen(
    onBack: () -> Unit,
    viewModel: MultiRoomAudioViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showAddServerDialog by remember { mutableStateOf(false) }
    var showCreateGroupDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Multi-Room Audio") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showAddServerDialog = true }) {
                        Icon(Icons.Default.AddHost, "Add Server")
                    }
                }
            )
        },
        floatingActionButton = {
            if (uiState.selectedServerId != null) {
                ExtendedFloatingActionButton(
                    onClick = { showCreateGroupDialog = true },
                    icon = { Icon(Icons.Default.GroupAdd, null) },
                    text = { Text("Create Group") }
                )
            }
        }
    ) { padding ->
        Column(modifier = Modifier.padding(padding)) {
            // Server Selector
            if (uiState.servers.isNotEmpty()) {
                ScrollableTabRow(
                    selectedTabIndex = uiState.servers.indexOfFirst { it.id == uiState.selectedServerId }.coerceAtLeast(0),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    uiState.servers.forEach { server ->
                        Tab(
                            selected = server.id == uiState.selectedServerId,
                            onClick = { viewModel.selectServer(server.id) },
                            text = { Text(server.name) }
                        )
                    }
                }
            } else {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(100.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text("No audio servers configured.")
                }
            }

            if (uiState.selectedServerId != null) {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    // Groups Section
                    if (uiState.groups.isNotEmpty()) {
                        item {
                            Text(
                                "Groups",
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                        items(uiState.groups) { group ->
                            AudioGroupCard(
                                group = group,
                                onVolumeChange = { viewModel.setGroupVolume(group, it) },
                                onDelete = { viewModel.deleteGroup(group) }
                            )
                        }
                    }

                    // Clients Section
                    item {
                        Text(
                            "Devices",
                            style = MaterialTheme.typography.titleMedium,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                    
                    val unassignedClients = uiState.clients.filter { client ->
                        uiState.groups.none { it.groupId == client.groupId }
                    }
                    
                    if (unassignedClients.isEmpty() && uiState.groups.isEmpty()) {
                         item {
                             Text("No devices connected.")
                         }
                    }

                    items(unassignedClients) { client ->
                        AudioClientCard(
                            client = client,
                            onVolumeChange = { viewModel.setClientVolume(client, it) },
                            onToggleMute = { viewModel.toggleClientMute(client) }
                        )
                    }
                }
            }
        }
    }

    if (showAddServerDialog) {
        AddServerDialog(
            onDismiss = { showAddServerDialog = false },
            onAdd = { name, host, port ->
                viewModel.addServer(name, host, port)
                showAddServerDialog = false
            }
        )
    }
    
    if (showCreateGroupDialog) {
        CreateGroupDialog(
            clients = uiState.clients,
            onDismiss = { showCreateGroupDialog = false },
            onCreate = { name, selectedClientIds ->
                viewModel.createGroup(name, selectedClientIds)
                showCreateGroupDialog = false
            }
        )
    }
}

@Composable
fun AudioGroupCard(
    group: AudioSyncGroup,
    onVolumeChange: (Int) -> Unit,
    onDelete: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = group.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                IconButton(onClick = onDelete) {
                    Icon(Icons.Default.Delete, "Delete Group")
                }
            }
            Spacer(modifier = Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Default.VolumeUp, null)
                Slider(
                    value = group.volume / 100f,
                    onValueChange = { onVolumeChange((it * 100).toInt()) },
                    modifier = Modifier.weight(1f)
                )
                Text("${group.volume}%")
            }
        }
    }
}

@Composable
fun AudioClientCard(
    client: AudioSyncClient,
    onVolumeChange: (Int) -> Unit,
    onToggleMute: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = client.name,
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = if (client.isConnected) "Connected" else "Disconnected",
                        style = MaterialTheme.typography.bodySmall,
                        color = if (client.isConnected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                    )
                }
                IconButton(onClick = onToggleMute) {
                    Icon(
                        imageVector = if (client.isMuted) Icons.Default.VolumeOff else Icons.Default.VolumeUp,
                        contentDescription = "Toggle Mute"
                    )
                }
            }
            Spacer(modifier = Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically) {
                Slider(
                    value = client.volume / 100f,
                    onValueChange = { onVolumeChange((it * 100).toInt()) },
                    enabled = !client.isMuted,
                    modifier = Modifier.weight(1f)
                )
                Text("${client.volume}%")
            }
        }
    }
}

@Composable
fun AddServerDialog(
    onDismiss: () -> Unit,
    onAdd: (String, String, Int) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var host by remember { mutableStateOf("") }
    var port by remember { mutableStateOf("1704") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Sync Server") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Server Name") }
                )
                OutlinedTextField(
                    value = host,
                    onValueChange = { host = it },
                    label = { Text("Host / IP") }
                )
                OutlinedTextField(
                    value = port,
                    onValueChange = { port = it },
                    label = { Text("Port") }
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { 
                    onAdd(name, host, port.toIntOrNull() ?: 1704) 
                },
                enabled = name.isNotBlank() && host.isNotBlank()
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

@Composable
fun CreateGroupDialog(
    clients: List<AudioSyncClient>,
    onDismiss: () -> Unit,
    onCreate: (String, List<Long>) -> Unit
) {
    var name by remember { mutableStateOf("") }
    val selectedClients = remember { mutableStateListOf<Long>() }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create Audio Group") },
        text = {
            Column {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Group Name") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text("Select Clients:")
                LazyColumn(modifier = Modifier.height(150.dp)) {
                    items(clients) { client ->
                        Row(
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp)
                        ) {
                            Checkbox(
                                checked = selectedClients.contains(client.id),
                                onCheckedChange = { checked ->
                                    if (checked) selectedClients.add(client.id)
                                    else selectedClients.remove(client.id)
                                }
                            )
                            Text(client.name)
                        }
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onCreate(name, selectedClients.toList()) },
                enabled = name.isNotBlank() && selectedClients.isNotEmpty()
            ) {
                Text("Create")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
