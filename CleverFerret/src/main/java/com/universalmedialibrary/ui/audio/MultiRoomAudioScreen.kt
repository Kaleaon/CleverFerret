package com.universalmedialibrary.ui.audio

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.GroupAdd
import androidx.compose.material.icons.filled.VolumeOff
import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.Checkbox
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ExtendedFloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.ScrollableTabRow
import androidx.compose.material3.Slider
import androidx.compose.material3.Tab
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.ktheme.components.SelectableChip
import com.ktheme.components.SemanticState
import com.ktheme.components.StatCard
import com.universalmedialibrary.data.local.entity.AudioSyncClient
import com.universalmedialibrary.data.local.entity.AudioSyncGroup

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MultiRoomAudioScreen(
    onBack: () -> Unit,
    onOpenRoomChat: (String) -> Unit = {},
    viewModel: MultiRoomAudioViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showAddServerDialog by remember { mutableStateOf(false) }
    var showCreateGroupDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Room Sync") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showAddServerDialog = true }) {
                        Icon(Icons.Default.Add, "Add Server")
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
            if (uiState.servers.isNotEmpty()) {
                ScrollableTabRow(
                    selectedTabIndex = uiState.servers.indexOfFirst { it.serverId == uiState.selectedServerId }.coerceAtLeast(0),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    uiState.servers.forEach { server ->
                        Tab(selected = server.serverId == uiState.selectedServerId, onClick = { viewModel.selectServer(server.serverId) }, text = { Text(server.serverName) })
                    }
                }
            }

            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                item {
                    Row(horizontalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.fillMaxWidth()) {
                        StatCard(
                            title = "Fallback",
                            value = if (uiState.fallbackToLocalPlayback) "Local" else "Group",
                            state = if (uiState.fallbackToLocalPlayback) SemanticState.WARNING else SemanticState.NORMAL,
                            modifier = Modifier.weight(1f)
                        )
                        StatCard(
                            title = "Trusted Devices",
                            value = uiState.trustedDeviceIds.size.toString(),
                            state = SemanticState.NORMAL,
                            modifier = Modifier.weight(1f)
                        )
                    }
                }

                if (uiState.groups.isNotEmpty()) {
                    item { Text("Rooms", style = MaterialTheme.typography.titleMedium, color = MaterialTheme.colorScheme.primary) }
                    items(uiState.groups) { group ->
                        AudioGroupCard(group = group, onVolumeChange = { viewModel.setGroupVolume(group, it) })
                    }
                }

                item { Text("Devices", style = MaterialTheme.typography.titleMedium, color = MaterialTheme.colorScheme.primary) }
                items(uiState.clients) { client ->
                    val group = uiState.groups.firstOrNull { it.groupId == client.groupId }
                    AudioClientCard(
                        client = client,
                        groupName = group?.groupName,
                        driftMs = uiState.perDeviceDriftMs[client.clientId] ?: 0.0,
                        jitterMs = uiState.perDeviceJitterMs[client.clientId] ?: 0.0,
                        trusted = client.clientId in uiState.trustedDeviceIds,
                        onVolumeChange = { viewModel.setClientVolume(client, it) },
                        onToggleMute = { viewModel.toggleClientMute(client) },
                        onRecover = {
                            if (client.connected) viewModel.autoRejoin(client)
                            else viewModel.handleTransientDisconnect(client)
                        },
                        onMembershipClick = {
                            if (group != null) viewModel.leaveGroup(client, group)
                        }
                    )
                }
            }
        }
    }

    if (showAddServerDialog) {
        AddServerDialog(onDismiss = { showAddServerDialog = false }, onAdd = { name, host, port ->
            viewModel.addServer(name, host, port)
            showAddServerDialog = false
        })
    }

    if (showCreateGroupDialog) {
        CreateGroupDialog(clients = uiState.clients, onDismiss = { showCreateGroupDialog = false }, onCreate = { name, ids ->
            viewModel.createGroup(name, ids)
            showCreateGroupDialog = false
        })
    }
}

@Composable
fun AudioGroupCard(
    group: AudioSyncGroup,
    onVolumeChange: (Int) -> Unit,
    onDelete: () -> Unit,
    onOpenChat: () -> Unit
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
                    text = group.groupName,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                IconButton(onClick = onDelete) {
                    Icon(Icons.Default.Delete, "Delete Group")
                }
                IconButton(onClick = onOpenChat) {
                    Icon(Icons.Default.Chat, "Open Room Chat")
                }
            }
            Spacer(modifier = Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.AutoMirrored.Filled.VolumeUp, null)
                Slider(value = group.volume / 100f, onValueChange = { onVolumeChange((it * 100).toInt()) }, modifier = Modifier.weight(1f))
                Text("${group.volume}%")
            }
        }
    }
}

@Composable
fun AudioClientCard(
    client: AudioSyncClient,
    groupName: String?,
    driftMs: Double,
    jitterMs: Double,
    trusted: Boolean,
    onVolumeChange: (Int) -> Unit,
    onToggleMute: () -> Unit,
    onRecover: () -> Unit,
    onMembershipClick: () -> Unit
) {
    val state = when {
        !client.connected -> SemanticState.ERROR
        jitterMs > 12.0 -> SemanticState.WARNING
        else -> SemanticState.NORMAL
    }

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(containerColor = MaterialTheme.colorScheme.surfaceVariant)
    ) {
        Column(modifier = Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.SpaceBetween, verticalAlignment = Alignment.CenterVertically) {
                Column {
                    Text(text = client.clientName, style = MaterialTheme.typography.bodyLarge, fontWeight = FontWeight.Medium)
                    Text(text = if (client.connected) "Connected" else "Disconnected", color = if (client.connected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error)
                }
                IconButton(onClick = onToggleMute) {
                    Icon(imageVector = if (client.muted) Icons.Default.VolumeOff else Icons.AutoMirrored.Filled.VolumeUp, contentDescription = "Toggle Mute")
                }
            }
            Row(horizontalArrangement = Arrangement.spacedBy(8.dp), modifier = Modifier.fillMaxWidth()) {
                StatCard(title = "Latency", value = "${client.latencyMs}ms", state = state, modifier = Modifier.weight(1f))
                StatCard(title = "Drift/Jitter", value = "${driftMs.toInt()} / ${jitterMs.toInt()}ms", state = state, modifier = Modifier.weight(1f))
            }
            SelectableChip(
                text = groupName?.let { "In $it" } ?: "Not in room",
                selected = groupName != null,
                state = if (groupName == null) SemanticState.WARNING else SemanticState.NORMAL,
                onClick = onMembershipClick
            )
            SelectableChip(
                text = if (trusted) "Trusted device" else "Untrusted",
                selected = trusted,
                state = if (trusted) SemanticState.NORMAL else SemanticState.WARNING,
                onClick = { }
            )
            Row(verticalAlignment = Alignment.CenterVertically) {
                Slider(value = client.volume / 100f, onValueChange = { onVolumeChange((it * 100).toInt()) }, enabled = !client.muted, modifier = Modifier.weight(1f))
                Text("${client.volume}%")
            }
            Button(onClick = onRecover) { Text("Recover") }
        }
    }
}

@Composable
fun AddServerDialog(onDismiss: () -> Unit, onAdd: (String, String, Int) -> Unit) {
    var name by remember { mutableStateOf("") }
    var host by remember { mutableStateOf("") }
    var port by remember { mutableStateOf("1704") }

    AlertDialog(onDismissRequest = onDismiss, title = { Text("Add Sync Server") }, text = {
        Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
            OutlinedTextField(value = name, onValueChange = { name = it }, label = { Text("Server Name") })
            OutlinedTextField(value = host, onValueChange = { host = it }, label = { Text("Host / IP") })
            OutlinedTextField(value = port, onValueChange = { port = it }, label = { Text("Port") })
        }
    }, confirmButton = {
        Button(onClick = { onAdd(name, host, port.toIntOrNull() ?: 1704) }, enabled = name.isNotBlank() && host.isNotBlank()) { Text("Add") }
    }, dismissButton = { TextButton(onClick = onDismiss) { Text("Cancel") } })
}

@Composable
fun CreateGroupDialog(clients: List<AudioSyncClient>, onDismiss: () -> Unit, onCreate: (String, List<Long>) -> Unit) {
    var name by remember { mutableStateOf("") }
    val selectedClients = remember { mutableStateListOf<Long>() }

    AlertDialog(onDismissRequest = onDismiss, title = { Text("Create Audio Group") }, text = {
        Column {
            OutlinedTextField(value = name, onValueChange = { name = it }, label = { Text("Group Name") }, modifier = Modifier.fillMaxWidth())
            Spacer(modifier = Modifier.height(16.dp))
            Text("Select Clients:")
            LazyColumn(modifier = Modifier.height(150.dp)) {
                items(clients) { client ->
                    Row(verticalAlignment = Alignment.CenterVertically, modifier = Modifier.fillMaxWidth().padding(vertical = 4.dp)) {
                        Checkbox(checked = selectedClients.contains(client.id), onCheckedChange = { checked -> if (checked) selectedClients.add(client.id) else selectedClients.remove(client.id) })
                        Text(client.clientName)
                    }
                }
            }
        }
    }, confirmButton = {
        Button(onClick = { onCreate(name, selectedClients.toList()) }, enabled = name.isNotBlank() && selectedClients.isNotEmpty()) { Text("Create") }
    }, dismissButton = { TextButton(onClick = onDismiss) { Text("Cancel") } })
}
