package com.universalmedialibrary.ui.aientertainment

import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.Send
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.*

/**
 * Rooms Screen - V2: Collaborative character interactions
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RoomsScreen(
    onNavigateBack: () -> Unit,
    viewModel: RoomsViewModel = hiltViewModel()
) {
    val rooms by viewModel.rooms.collectAsState()
    val pendingInvitations by viewModel.pendingInvitations.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    val currentRoom by viewModel.currentRoom.collectAsState()
    val currentParticipants by viewModel.currentParticipants.collectAsState()
    val characters by viewModel.characters.collectAsState()
    
    var selectedTab by remember { mutableStateOf(0) }
    var showCreateDialog by remember { mutableStateOf(false) }
    var showRoomDetails by remember { mutableStateOf(false) }
    var showInviteDialog by remember { mutableStateOf(false) }
    var showAddCharacterDialog by remember { mutableStateOf(false) }
    
    LaunchedEffect(Unit) {
        viewModel.loadData()
    }
    
    // Handle messages
    LaunchedEffect(uiState.message, uiState.error) {
        // Messages are shown via snackbar (handled below)
    }
    
    val snackbarHostState = remember { SnackbarHostState() }
    
    LaunchedEffect(uiState.message) {
        uiState.message?.let {
            snackbarHostState.showSnackbar(it)
            viewModel.clearMessage()
        }
    }
    
    LaunchedEffect(uiState.error) {
        uiState.error?.let {
            snackbarHostState.showSnackbar(it)
            viewModel.clearMessage()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null, tint = SynthColors.textPrimary)
                    }
                },
                title = { Text("Rooms") },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary,
                    titleContentColor = SynthColors.textPrimary
                ),
                actions = {
                    IconButton(onClick = { viewModel.loadData() }) {
                        Icon(Icons.Default.Refresh, "Refresh", tint = SynthColors.textPrimary)
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { showCreateDialog = true },
                containerColor = SynthColors.primary,
                contentColor = Color.White
            ) {
                Icon(Icons.Default.Add, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Create Room")
            }
        },
        snackbarHost = { SnackbarHost(snackbarHostState) },
        containerColor = SynthColors.background
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Tabs
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = SynthColors.backgroundSecondary,
                contentColor = SynthColors.primary
            ) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    icon = { Icon(Icons.Outlined.MeetingRoom, null) },
                    text = { Text("My Rooms") }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    icon = {
                        if (pendingInvitations.isNotEmpty()) {
                            BadgedBox(
                                badge = {
                                    Badge { Text("${pendingInvitations.size}") }
                                }
                            ) {
                                Icon(Icons.Outlined.Mail, null)
                            }
                        } else {
                            Icon(Icons.Outlined.Mail, null)
                        }
                    },
                    text = { Text("Invitations") }
                )
            }
            
            when (selectedTab) {
                0 -> RoomsTab(
                    rooms = rooms,
                    isLoading = isLoading,
                    onRoomClick = { room ->
                        viewModel.selectRoom(room.room.id)
                        showRoomDetails = true
                    }
                )
                1 -> InvitationsTab(
                    invitations = pendingInvitations,
                    onAccept = { viewModel.acceptInvitation(it.invitation.id) },
                    onReject = { viewModel.rejectInvitation(it.invitation.id) }
                )
            }
        }
    }
    
    // Create Room Dialog
    if (showCreateDialog) {
        CreateRoomDialog(
            onDismiss = { showCreateDialog = false },
            onCreate = { name, isPublic ->
                viewModel.createRoom(name, isPublic)
                showCreateDialog = false
            },
            isCreating = uiState.isCreating
        )
    }
    
    // Room Details Bottom Sheet
    if (showRoomDetails && currentRoom != null) {
        val room = currentRoom!!
        val currentUser by viewModel.currentUser.collectAsState()
        val isOwner = currentUser?.id == room.ownerId
        
        ModalBottomSheet(
            onDismissRequest = {
                showRoomDetails = false
                viewModel.clearCurrentRoom()
            },
            containerColor = SynthColors.surface
        ) {
            RoomDetailsContent(
                room = room,
                participants = currentParticipants,
                isOwner = isOwner,
                onInvite = { showInviteDialog = true },
                onAddCharacter = { showAddCharacterDialog = true },
                onEnterRoom = {
                    showRoomDetails = false
                    // TODO: Navigate to room chat
                }
            )
        }
    }
    
    // Invite User Dialog
    if (showInviteDialog && currentRoom != null) {
        InviteUserDialog(
            roomName = currentRoom!!.name,
            onDismiss = { showInviteDialog = false },
            onInvite = { username, message ->
                viewModel.inviteUser(currentRoom!!.id, username, message)
                showInviteDialog = false
            },
            isInviting = uiState.isInviting
        )
    }
    
    // Add Character Dialog
    if (showAddCharacterDialog && currentRoom != null) {
        AddCharacterDialog(
            characters = characters.map { it.character },
            onDismiss = { showAddCharacterDialog = false },
            onSelect = { character ->
                viewModel.joinRoom(currentRoom!!.id, character.id)
                showAddCharacterDialog = false
            }
        )
    }
}

@Composable
private fun RoomsTab(
    rooms: List<RoomWithParticipantCount>,
    isLoading: Boolean,
    onRoomClick: (RoomWithParticipantCount) -> Unit
) {
    if (isLoading) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            CircularProgressIndicator(color = SynthColors.primary)
        }
    } else if (rooms.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    Icons.Outlined.MeetingRoom,
                    null,
                    modifier = Modifier.size(80.dp),
                    tint = SynthColors.textMuted.copy(alpha = 0.3f)
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    "No Rooms Yet",
                    style = MaterialTheme.typography.titleLarge,
                    color = SynthColors.textSecondary
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    "Create a room to start collaborative interactions",
                    color = SynthColors.textMuted
                )
            }
        }
    } else {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(rooms) { roomWithCount ->
                RoomCard(
                    room = roomWithCount.room,
                    participantCount = roomWithCount.participantCount,
                    onClick = { onRoomClick(roomWithCount) }
                )
            }
        }
    }
}

@Composable
private fun RoomCard(
    room: SynthRoom,
    participantCount: Int,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(CircleShape)
                    .background(if (room.isPublic) SynthColors.accent else SynthColors.primary),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    if (room.isPublic) Icons.Default.Public else Icons.Default.Lock,
                    null,
                    tint = Color.White
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    room.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = SynthColors.textPrimary
                )
                Text(
                    "$participantCount participant${if (participantCount != 1) "s" else ""}",
                    style = MaterialTheme.typography.bodySmall,
                    color = SynthColors.textSecondary
                )
            }
            
            Icon(
                Icons.Default.ChevronRight,
                null,
                tint = SynthColors.textMuted
            )
        }
    }
}

@Composable
private fun InvitationsTab(
    invitations: List<InvitationWithDetails>,
    onAccept: (InvitationWithDetails) -> Unit,
    onReject: (InvitationWithDetails) -> Unit
) {
    if (invitations.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Icon(
                    Icons.Outlined.Mail,
                    null,
                    modifier = Modifier.size(80.dp),
                    tint = SynthColors.textMuted.copy(alpha = 0.3f)
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    "No Pending Invitations",
                    style = MaterialTheme.typography.titleLarge,
                    color = SynthColors.textSecondary
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    "When someone invites you to a room, it will appear here",
                    textAlign = TextAlign.Center,
                    color = SynthColors.textMuted
                )
            }
        }
    } else {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(invitations) { invitation ->
                InvitationCard(
                    invitation = invitation,
                    onAccept = { onAccept(invitation) },
                    onReject = { onReject(invitation) }
                )
            }
        }
    }
}

@Composable
private fun InvitationCard(
    invitation: InvitationWithDetails,
    onAccept: () -> Unit,
    onReject: () -> Unit
) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(12.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Box(
                    modifier = Modifier
                        .size(48.dp)
                        .clip(CircleShape)
                        .background(SynthColors.accent),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(Icons.Default.Mail, null, tint = Color.White)
                }
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        invitation.roomName ?: "Room",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = SynthColors.textPrimary
                    )
                    Text(
                        "Invited by ${invitation.inviterUsername ?: "Unknown"}",
                        style = MaterialTheme.typography.bodySmall,
                        color = SynthColors.textSecondary
                    )
                }
            }
            
            if (invitation.invitation.message.isNotEmpty()) {
                Spacer(modifier = Modifier.height(12.dp))
                
                Surface(
                    color = SynthColors.backgroundSecondary,
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Text(
                        "\"${invitation.invitation.message}\"",
                        modifier = Modifier.padding(12.dp),
                        style = MaterialTheme.typography.bodyMedium,
                        color = SynthColors.textSecondary,
                        fontStyle = androidx.compose.ui.text.font.FontStyle.Italic
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Row {
                OutlinedButton(
                    onClick = onReject,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.outlinedButtonColors(contentColor = SynthColors.error)
                ) {
                    Text("Decline")
                }
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Button(
                    onClick = onAccept,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(containerColor = SynthColors.success)
                ) {
                    Text("Accept")
                }
            }
        }
    }
}

@Composable
private fun CreateRoomDialog(
    onDismiss: () -> Unit,
    onCreate: (String, Boolean) -> Unit,
    isCreating: Boolean
) {
    var name by remember { mutableStateOf("") }
    var isPublic by remember { mutableStateOf(false) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create Room") },
        text = {
            Column {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Room Name") },
                    placeholder = { Text("Enter a name for your room") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text("Public Room", style = MaterialTheme.typography.bodyLarge)
                        Text(
                            "Anyone can join",
                            style = MaterialTheme.typography.bodySmall,
                            color = SynthColors.textSecondary
                        )
                    }
                    Switch(
                        checked = isPublic,
                        onCheckedChange = { isPublic = it }
                    )
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onCreate(name, isPublic) },
                enabled = name.isNotBlank() && !isCreating
            ) {
                if (isCreating) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Text("Create")
                }
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = SynthColors.surface
    )
}

@Composable
private fun RoomDetailsContent(
    room: SynthRoom,
    participants: List<ParticipantWithDetails>,
    isOwner: Boolean,
    onInvite: () -> Unit,
    onAddCharacter: () -> Unit,
    onEnterRoom: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(24.dp)
    ) {
        // Room header
        Row(verticalAlignment = Alignment.CenterVertically) {
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(CircleShape)
                    .background(if (room.isPublic) SynthColors.accent else SynthColors.primary),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    if (room.isPublic) Icons.Default.Public else Icons.Default.Lock,
                    null,
                    tint = Color.White,
                    modifier = Modifier.size(28.dp)
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    room.name,
                    style = MaterialTheme.typography.titleLarge,
                    color = SynthColors.textPrimary
                )
                Text(
                    if (room.isPublic) "Public Room" else "Private Room",
                    color = SynthColors.textSecondary
                )
            }
            
            if (isOwner) {
                IconButton(onClick = onInvite) {
                    Icon(Icons.Outlined.PersonAdd, "Invite", tint = SynthColors.primary)
                }
            }
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        // Participants
        Text(
            "Participants",
            style = MaterialTheme.typography.titleMedium,
            color = SynthColors.textPrimary
        )
        
        Spacer(modifier = Modifier.height(8.dp))
        
        if (participants.isEmpty()) {
            Text(
                "No participants yet",
                color = SynthColors.textMuted
            )
        } else {
            FlowRow(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                participants.forEach { participant ->
                    val displayName = participant.username ?: "U"
                    
                    AssistChip(
                        onClick = { },
                        leadingIcon = {
                            Box(
                                modifier = Modifier
                                    .size(24.dp)
                                    .clip(CircleShape)
                                    .background(SynthColors.primary),
                                contentAlignment = Alignment.Center
                            ) {
                                Text(
                                    displayName.firstOrNull()?.uppercase() ?: "?",
                                    fontSize = MaterialTheme.typography.labelSmall.fontSize,
                                    color = Color.White
                                )
                            }
                        },
                        label = {
                            Text(participant.characterName ?: participant.username ?: "Unknown")
                        }
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.height(24.dp))
        
        // Actions
        if (isOwner) {
            OutlinedButton(
                onClick = onInvite,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.outlinedButtonColors(contentColor = SynthColors.accent)
            ) {
                Icon(Icons.Outlined.Mail, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Invite Users to Room")
            }
            
            Spacer(modifier = Modifier.height(12.dp))
        }
        
        Row(modifier = Modifier.fillMaxWidth()) {
            OutlinedButton(
                onClick = onAddCharacter,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Outlined.PersonAdd, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Add Character")
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Button(
                onClick = onEnterRoom,
                modifier = Modifier.weight(1f),
                colors = ButtonDefaults.buttonColors(containerColor = SynthColors.primary)
            ) {
                Icon(Icons.Default.Chat, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Enter Room")
            }
        }
        
        Spacer(modifier = Modifier.height(32.dp))
    }
}

@Composable
private fun InviteUserDialog(
    roomName: String,
    onDismiss: () -> Unit,
    onInvite: (String, String) -> Unit,
    isInviting: Boolean
) {
    var username by remember { mutableStateOf("") }
    var message by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(Icons.Outlined.PersonAdd, null, tint = SynthColors.accent)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Invite User")
            }
        },
        text = {
            Column {
                Text(
                    "Invite someone to join \"$roomName\"",
                    color = SynthColors.textSecondary
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                OutlinedTextField(
                    value = username,
                    onValueChange = { username = it },
                    label = { Text("Username or Email") },
                    leadingIcon = { Icon(Icons.Outlined.Person, null) },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                OutlinedTextField(
                    value = message,
                    onValueChange = { message = it },
                    label = { Text("Message (optional)") },
                    leadingIcon = { Icon(Icons.Outlined.Message, null) },
                    modifier = Modifier.fillMaxWidth(),
                    maxLines = 2
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onInvite(username, message) },
                enabled = username.isNotBlank() && !isInviting
            ) {
                if (isInviting) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Icon(Icons.AutoMirrored.Filled.Send, null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Send Invite")
                }
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = SynthColors.surface
    )
}

@Composable
private fun AddCharacterDialog(
    characters: List<SynthCharacter>,
    onDismiss: () -> Unit,
    onSelect: (SynthCharacter) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Select Character") },
        text = {
            if (characters.isEmpty()) {
                Text("No characters available")
            } else {
                LazyColumn {
                    items(characters) { character ->
                        ListItem(
                            headlineContent = { Text(character.name) },
                            leadingContent = {
                                CharacterAvatar(name = character.name, size = 40)
                            },
                            modifier = Modifier.clickable { onSelect(character) }
                        )
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = SynthColors.surface
    )
}

@Composable
private fun FlowRow(
    modifier: Modifier = Modifier,
    horizontalArrangement: Arrangement.Horizontal = Arrangement.Start,
    verticalArrangement: Arrangement.Vertical = Arrangement.Top,
    content: @Composable () -> Unit
) {
    // Simple flow row implementation
    Row(
        modifier = modifier.horizontalScroll(rememberScrollState()),
        horizontalArrangement = horizontalArrangement
    ) {
        content()
    }
}
