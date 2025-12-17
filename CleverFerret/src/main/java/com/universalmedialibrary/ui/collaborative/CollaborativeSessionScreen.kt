package com.universalmedialibrary.ui.collaborative

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.*

/**
 * Screen for creating and managing collaborative playlist sessions
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CollaborativeSessionScreen(
    viewModel: CollaborativeSessionViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit = {}
) {
    val uiState by viewModel.uiState.collectAsState()
    val currentSession by viewModel.currentSession.collectAsState()
    val activeSessions by viewModel.activeSessions.collectAsState()
    val connectedClients by viewModel.connectedClients.collectAsState()
    val sessionQueue by viewModel.sessionQueue.collectAsState()
    val qrCodeBitmap by viewModel.qrCodeBitmap.collectAsState()

    var showCreateDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Collaborative Sessions") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    if (viewModel.isCasting()) {
                        Icon(
                            Icons.Default.Cast,
                            contentDescription = "Casting",
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            )
        },
        floatingActionButton = {
            if (currentSession == null) {
                FloatingActionButton(onClick = { showCreateDialog = true }) {
                    Icon(Icons.Default.Add, "Create Session")
                }
            }
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
        ) {
            when (uiState) {
                is CollaborativeUiState.Idle -> {
                    if (activeSessions.isEmpty()) {
                        EmptySessionsView()
                    } else {
                        ActiveSessionsList(activeSessions)
                    }
                }
                is CollaborativeUiState.Creating, is CollaborativeUiState.Starting -> {
                    LoadingView()
                }
                is CollaborativeUiState.SessionCreated -> {
                    currentSession?.let { session ->
                        SessionCreatedView(
                            session = session,
                            qrCode = qrCodeBitmap,
                            onStartSession = { viewModel.startSession(session.sessionId) }
                        )
                    }
                }
                is CollaborativeUiState.Active -> {
                    currentSession?.let { session ->
                        ActiveSessionView(
                            session = session,
                            clients = connectedClients,
                            queue = sessionQueue,
                            isCasting = viewModel.isCasting(),
                            castDeviceName = viewModel.getCurrentCastDeviceName(),
                            onEndSession = { viewModel.endSession(session.sessionId) },
                            onTogglePlayback = { viewModel.togglePlayback() },
                            onSkipNext = { viewModel.skipToNext() },
                            onSkipPrevious = { viewModel.skipToPrevious() }
                        )
                    }
                }
                is CollaborativeUiState.Error -> {
                    ErrorView((uiState as CollaborativeUiState.Error).message)
                }
            }
        }

        if (showCreateDialog) {
            CreateSessionDialog(
                onDismiss = { showCreateDialog = false },
                onCreate = { name, playlistId, sessionType ->
                    viewModel.createSession(name, playlistId, sessionType)
                    showCreateDialog = false
                }
            )
        }
    }
}

@Composable
private fun EmptySessionsView() {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.QrCode,
            contentDescription = null,
            modifier = Modifier.size(120.dp),
            tint = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            "No Active Sessions",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            "Create a session to share playlists\nwith friends via Chromecast or Android Auto",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
private fun SessionCreatedView(
    session: CollaborativeSession,
    qrCode: android.graphics.Bitmap?,
    onStartSession: () -> Unit
) {
    Column(
        modifier = Modifier.fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            "Session Created!",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            session.name,
            style = MaterialTheme.typography.titleMedium
        )
        Spacer(modifier = Modifier.height(24.dp))
        
        qrCode?.let { bitmap ->
            Card(
                modifier = Modifier.size(280.dp),
                elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
            ) {
                Image(
                    bitmap = bitmap.asImageBitmap(),
                    contentDescription = "QR Code to join session",
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            "Scan this QR code to join",
            style = MaterialTheme.typography.bodyMedium
        )
        
        Spacer(modifier = Modifier.height(32.dp))
        Button(
            onClick = onStartSession,
            modifier = Modifier.fillMaxWidth()
        ) {
            Icon(Icons.Default.PlayArrow, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("Start Session")
        }
    }
}

@Composable
private fun ActiveSessionView(
    session: CollaborativeSession,
    clients: List<SessionClient>,
    queue: List<SessionQueueItem>,
    isCasting: Boolean,
    castDeviceName: String?,
    onEndSession: () -> Unit,
    onTogglePlayback: () -> Unit,
    onSkipNext: () -> Unit,
    onSkipPrevious: () -> Unit
) {
    Column(modifier = Modifier.fillMaxSize()) {
        // Session header
        Card(
            modifier = Modifier.fillMaxWidth()
        ) {
            Column(modifier = Modifier.padding(16.dp)) {
                Text(
                    session.name,
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                if (isCasting && castDeviceName != null) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(Icons.Default.Cast, contentDescription = null, modifier = Modifier.size(16.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            "Casting to $castDeviceName",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
                }
                Text(
                    "${clients.size} connected clients",
                    style = MaterialTheme.typography.bodyMedium
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        // Playback controls
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly
        ) {
            IconButton(onClick = onSkipPrevious) {
                Icon(Icons.Default.SkipPrevious, "Previous")
            }
            IconButton(onClick = onTogglePlayback) {
                Icon(
                    if (session.isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    "Play/Pause"
                )
            }
            IconButton(onClick = onSkipNext) {
                Icon(Icons.Default.SkipNext, "Next")
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        // Queue
        Text(
            "Queue (${queue.size} tracks)",
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold
        )
        Spacer(modifier = Modifier.height(8.dp))
        
        LazyColumn(modifier = Modifier.weight(1f)) {
            items(queue) { item ->
                QueueItemCard(item)
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        // End session button
        OutlinedButton(
            onClick = onEndSession,
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.outlinedButtonColors(
                contentColor = MaterialTheme.colorScheme.error
            )
        ) {
            Icon(Icons.Default.Stop, contentDescription = null)
            Spacer(modifier = Modifier.width(8.dp))
            Text("End Session")
        }
    }
}

@Composable
private fun QueueItemCard(item: SessionQueueItem) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(Icons.Default.MusicNote, contentDescription = null)
            Spacer(modifier = Modifier.width(12.dp))
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    "Track ${item.position + 1}",
                    style = MaterialTheme.typography.bodyMedium
                )
                Text(
                    "Added by ${item.addedBy.take(8)}...",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            if (item.votes > 0) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        Icons.Default.ThumbUp,
                        contentDescription = null,
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(item.votes.toString())
                }
            }
        }
    }
}

@Composable
private fun ActiveSessionsList(sessions: List<CollaborativeSession>) {
    LazyColumn {
        items(sessions) { session ->
            SessionCard(session)
        }
    }
}

@Composable
private fun SessionCard(session: CollaborativeSession) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text(
                session.name,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            Text(
                "Host: ${session.hostDeviceName}",
                style = MaterialTheme.typography.bodySmall
            )
            Text(
                "Type: ${session.sessionType}",
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}

@Composable
private fun LoadingView() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        CircularProgressIndicator()
    }
}

@Composable
private fun ErrorView(message: String) {
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.Error,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.error
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            "Error",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.error
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            message,
            style = MaterialTheme.typography.bodyMedium,
            textAlign = TextAlign.Center
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun CreateSessionDialog(
    onDismiss: () -> Unit,
    onCreate: (String, Long, SessionType) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var playlistId by remember { mutableStateOf("1") }
    var selectedType by remember { mutableStateOf(SessionType.CHROMECAST) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create Collaborative Session") },
        text = {
            Column {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Session Name") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(modifier = Modifier.height(8.dp))
                OutlinedTextField(
                    value = playlistId,
                    onValueChange = { playlistId = it },
                    label = { Text("Playlist ID") },
                    modifier = Modifier.fillMaxWidth()
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text("Session Type:", style = MaterialTheme.typography.labelMedium)
                Spacer(modifier = Modifier.height(8.dp))
                SessionType.values().forEach { type ->
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        RadioButton(
                            selected = selectedType == type,
                            onClick = { selectedType = type }
                        )
                        Text(type.name)
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { 
                    val pId = playlistId.toLongOrNull() ?: 1L
                    onCreate(name, pId, selectedType) 
                },
                enabled = name.isNotBlank()
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
