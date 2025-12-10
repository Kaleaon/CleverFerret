package com.universalmedialibrary.ui.plex.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
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
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Media Server Settings
 * 
 * Comprehensive settings screen for connecting to media servers:
 * - Plex
 * - Jellyfin
 * - Emby
 * - Subsonic (for music)
 * - Calibre Content Server
 * - Kavita
 * - Komga
 * 
 * Features:
 * - Server discovery
 * - Manual server setup
 * - Authentication (PIN, username/password, API key)
 * - Server library selection
 * - Sync settings per server
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexMediaServerSettingsScreen(
    state: MediaServerSettingsState,
    onAddServer: (ServerType) -> Unit,
    onRemoveServer: (String) -> Unit,
    onEditServer: (MediaServerConfig) -> Unit,
    onTestConnection: (String) -> Unit,
    onSyncServer: (String) -> Unit,
    onToggleServerEnabled: (String, Boolean) -> Unit,
    onBack: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showAddServerDialog by remember { mutableStateOf(false) }
    var selectedServerType by remember { mutableStateOf<ServerType?>(null) }
    
    Scaffold(
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        "Media Servers",
                        style = PlexTypography.TitleMedium,
                        color = PlexColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = PlexColors.TextPrimary)
                    }
                },
                actions = {
                    IconButton(onClick = { showAddServerDialog = true }) {
                        Icon(Icons.Default.Add, "Add Server", tint = PlexColors.AccentPrimary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = PlexColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(PlexSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
        ) {
            // Connected servers
            if (state.connectedServers.isNotEmpty()) {
                item {
                    SectionHeader("Connected Servers")
                }
                
                items(items = state.connectedServers, key = { it.id }) { server ->
                    ConnectedServerCard(
                        server = server,
                        onEdit = { onEditServer(server) },
                        onRemove = { onRemoveServer(server.id) },
                        onTest = { onTestConnection(server.id) },
                        onSync = { onSyncServer(server.id) },
                        onToggleEnabled = { enabled -> onToggleServerEnabled(server.id, enabled) }
                    )
                }
            }
            
            // Discovered servers
            if (state.discoveredServers.isNotEmpty()) {
                item {
                    SectionHeader("Discovered on Network")
                }
                
                items(items = state.discoveredServers, key = { it.id }) { server ->
                    DiscoveredServerCard(
                        server = server,
                        onConnect = { onAddServer(server.type) }
                    )
                }
            }
            
            // Add server options
            item {
                SectionHeader("Add Media Server")
            }
            
            item {
                ServerTypeGrid(
                    onServerTypeClick = { type ->
                        selectedServerType = type
                        showAddServerDialog = true
                    }
                )
            }
            
            // Tips
            item {
                TipsCard()
            }
        }
    }
    
    // Add server dialog
    if (showAddServerDialog && selectedServerType != null) {
        AddServerDialog(
            serverType = selectedServerType!!,
            onConfirm = { config ->
                // Handle server configuration
                showAddServerDialog = false
                selectedServerType = null
            },
            onDismiss = {
                showAddServerDialog = false
                selectedServerType = null
            }
        )
    }
}

@Composable
private fun SectionHeader(title: String) {
    Text(
        text = title,
        style = PlexTypography.LabelLarge,
        color = PlexColors.TextSecondary,
        modifier = Modifier.padding(vertical = PlexSpacing.SM)
    )
}

@Composable
private fun ConnectedServerCard(
    server: MediaServerConfig,
    onEdit: () -> Unit,
    onRemove: () -> Unit,
    onTest: () -> Unit,
    onSync: () -> Unit,
    onToggleEnabled: (Boolean) -> Unit
) {
    var expanded by remember { mutableStateOf(false) }
    
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable { expanded = !expanded },
        color = PlexColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(PlexSpacing.MD)) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Server icon
                Surface(
                    shape = RoundedCornerShape(PlexCorners.SM),
                    color = server.type.color.copy(alpha = 0.2f),
                    modifier = Modifier.size(48.dp)
                ) {
                    Icon(
                        server.type.icon,
                        null,
                        tint = server.type.color,
                        modifier = Modifier.padding(PlexSpacing.SM)
                    )
                }
                
                Spacer(Modifier.width(PlexSpacing.MD))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        server.name,
                        style = PlexTypography.BodyLarge,
                        color = PlexColors.TextPrimary,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        server.type.displayName,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextSecondary
                    )
                    Text(
                        server.url,
                        style = PlexTypography.LabelSmall,
                        color = PlexColors.TextTertiary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Status indicator
                StatusIndicator(status = server.status)
                
                Spacer(Modifier.width(PlexSpacing.SM))
                
                // Enable toggle
                Switch(
                    checked = server.isEnabled,
                    onCheckedChange = onToggleEnabled,
                    colors = SwitchDefaults.colors(
                        checkedThumbColor = PlexColors.AccentPrimary,
                        checkedTrackColor = PlexColors.AccentPrimary.copy(alpha = 0.5f)
                    )
                )
                
                Icon(
                    if (expanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                    null,
                    tint = PlexColors.TextTertiary
                )
            }
            
            // Expanded details
            AnimatedVisibility(visible = expanded) {
                Column(modifier = Modifier.padding(top = PlexSpacing.MD)) {
                    HorizontalDivider(color = PlexColors.BorderPrimary)
                    
                    Spacer(Modifier.height(PlexSpacing.MD))
                    
                    // Server stats
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        ServerStat("Libraries", server.libraryCount.toString())
                        ServerStat("Items", server.itemCount.toString())
                        ServerStat("Last Sync", server.lastSync)
                    }
                    
                    Spacer(Modifier.height(PlexSpacing.MD))
                    
                    // Action buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
                    ) {
                        OutlinedButton(
                            onClick = onTest,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.NetworkCheck, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(PlexSpacing.XS))
                            Text("Test")
                        }
                        
                        OutlinedButton(
                            onClick = onSync,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.Sync, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(PlexSpacing.XS))
                            Text("Sync")
                        }
                        
                        OutlinedButton(
                            onClick = onEdit,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.Edit, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(PlexSpacing.XS))
                            Text("Edit")
                        }
                    }
                    
                    Spacer(Modifier.height(PlexSpacing.SM))
                    
                    TextButton(
                        onClick = onRemove,
                        colors = ButtonDefaults.textButtonColors(contentColor = PlexColors.Error)
                    ) {
                        Icon(Icons.Default.Delete, null, Modifier.size(18.dp))
                        Spacer(Modifier.width(PlexSpacing.XS))
                        Text("Remove Server")
                    }
                }
            }
        }
    }
}

@Composable
private fun StatusIndicator(status: ServerStatus) {
    val (color, text) = when (status) {
        ServerStatus.CONNECTED -> PlexColors.Success to "Connected"
        ServerStatus.CONNECTING -> PlexColors.Warning to "Connecting"
        ServerStatus.ERROR -> PlexColors.Error to "Error"
        ServerStatus.OFFLINE -> PlexColors.TextTertiary to "Offline"
    }
    
    Row(verticalAlignment = Alignment.CenterVertically) {
        Box(
            modifier = Modifier
                .size(8.dp)
                .background(color, CircleShape)
        )
        Spacer(Modifier.width(PlexSpacing.XS))
        Text(
            text,
            style = PlexTypography.LabelSmall,
            color = color
        )
    }
}

@Composable
private fun ServerStat(label: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            value,
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
        Text(
            label,
            style = PlexTypography.LabelSmall,
            color = PlexColors.TextTertiary
        )
    }
}

@Composable
private fun DiscoveredServerCard(
    server: DiscoveredServer,
    onConnect: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD)),
        color = PlexColors.BackgroundSurface
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                server.type.icon,
                null,
                tint = server.type.color,
                modifier = Modifier.size(32.dp)
            )
            
            Spacer(Modifier.width(PlexSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    server.name,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary
                )
                Text(
                    server.url,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextTertiary
                )
            }
            
            Button(
                onClick = onConnect,
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
                )
            ) {
                Text("Connect")
            }
        }
    }
}

@Composable
private fun ServerTypeGrid(
    onServerTypeClick: (ServerType) -> Unit
) {
    val serverTypes = listOf(
        listOf(ServerType.PLEX, ServerType.JELLYFIN, ServerType.EMBY),
        listOf(ServerType.SUBSONIC, ServerType.CALIBRE, ServerType.KAVITA),
        listOf(ServerType.KOMGA, ServerType.AUDIOBOOKSHELF, ServerType.NAVIDROME)
    )
    
    Column(verticalArrangement = Arrangement.spacedBy(PlexSpacing.SM)) {
        serverTypes.forEach { row ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.SM)
            ) {
                row.forEach { type ->
                    ServerTypeCard(
                        type = type,
                        onClick = { onServerTypeClick(type) },
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }
    }
}

@Composable
private fun ServerTypeCard(
    type: ServerType,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier
            .height(100.dp)
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(PlexSpacing.SM),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                type.icon,
                null,
                tint = type.color,
                modifier = Modifier.size(32.dp)
            )
            Spacer(Modifier.height(PlexSpacing.XS))
            Text(
                type.displayName,
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextPrimary
            )
        }
    }
}

@Composable
private fun TipsCard() {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD)),
        color = PlexColors.AccentPrimary.copy(alpha = 0.1f)
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
            verticalAlignment = Alignment.Top
        ) {
            Icon(
                Icons.Outlined.Info,
                null,
                tint = PlexColors.AccentPrimary,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(Modifier.width(PlexSpacing.MD))
            
            Column {
                Text(
                    "Tips for connecting",
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Spacer(Modifier.height(PlexSpacing.XS))
                Text(
                    "• For Plex, sign in at plex.tv/link with the PIN code\n" +
                    "• Jellyfin/Emby require server URL and credentials\n" +
                    "• Subsonic-compatible servers use API keys\n" +
                    "• Ensure servers are on the same network for discovery",
                    style = PlexTypography.BodySmall,
                    color = PlexColors.TextSecondary
                )
            }
        }
    }
}

// =============================================================================
// ADD SERVER DIALOG
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddServerDialog(
    serverType: ServerType,
    onConfirm: (MediaServerConfig) -> Unit,
    onDismiss: () -> Unit
) {
    var serverUrl by remember { mutableStateOf("") }
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var apiKey by remember { mutableStateOf("") }
    var showPassword by remember { mutableStateOf(false) }
    var isLoading by remember { mutableStateOf(false) }
    var pinCode by remember { mutableStateOf<String?>(null) }
    
    val authMethod = serverType.authMethod
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(serverType.icon, null, tint = serverType.color)
                Spacer(Modifier.width(PlexSpacing.SM))
                Text("Connect to ${serverType.displayName}", color = PlexColors.TextPrimary)
            }
        },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                when (authMethod) {
                    AuthMethod.PIN -> {
                        // Plex PIN flow
                        if (pinCode != null) {
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                Text(
                                    "Enter this code at plex.tv/link",
                                    style = PlexTypography.BodyMedium,
                                    color = PlexColors.TextSecondary
                                )
                                Spacer(Modifier.height(PlexSpacing.MD))
                                Text(
                                    pinCode!!,
                                    style = PlexTypography.DisplayMedium,
                                    color = PlexColors.AccentPrimary,
                                    fontWeight = FontWeight.Bold
                                )
                                Spacer(Modifier.height(PlexSpacing.MD))
                                if (isLoading) {
                                    CircularProgressIndicator(
                                        color = PlexColors.AccentPrimary,
                                        modifier = Modifier.size(24.dp)
                                    )
                                    Spacer(Modifier.height(PlexSpacing.SM))
                                    Text(
                                        "Waiting for authorization...",
                                        style = PlexTypography.LabelSmall,
                                        color = PlexColors.TextTertiary
                                    )
                                }
                            }
                        } else {
                            Text(
                                "Click 'Get PIN' to start the Plex authentication flow.",
                                style = PlexTypography.BodyMedium,
                                color = PlexColors.TextSecondary
                            )
                        }
                    }
                    
                    AuthMethod.USERNAME_PASSWORD, AuthMethod.URL_USERNAME_PASSWORD -> {
                        if (authMethod == AuthMethod.URL_USERNAME_PASSWORD) {
                            OutlinedTextField(
                                value = serverUrl,
                                onValueChange = { serverUrl = it },
                                label = { Text("Server URL") },
                                placeholder = { Text("http://192.168.1.x:8096") },
                                singleLine = true,
                                modifier = Modifier.fillMaxWidth(),
                                colors = OutlinedTextFieldDefaults.colors(
                                    focusedBorderColor = PlexColors.AccentPrimary,
                                    unfocusedBorderColor = PlexColors.BorderPrimary
                                )
                            )
                        }
                        
                        OutlinedTextField(
                            value = username,
                            onValueChange = { username = it },
                            label = { Text("Username") },
                            singleLine = true,
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = PlexColors.AccentPrimary,
                                unfocusedBorderColor = PlexColors.BorderPrimary
                            )
                        )
                        
                        OutlinedTextField(
                            value = password,
                            onValueChange = { password = it },
                            label = { Text("Password") },
                            singleLine = true,
                            visualTransformation = if (showPassword)
                                VisualTransformation.None
                            else
                                PasswordVisualTransformation(),
                            trailingIcon = {
                                IconButton(onClick = { showPassword = !showPassword }) {
                                    Icon(
                                        if (showPassword) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                        null,
                                        tint = PlexColors.TextSecondary
                                    )
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = PlexColors.AccentPrimary,
                                unfocusedBorderColor = PlexColors.BorderPrimary
                            )
                        )
                    }
                    
                    AuthMethod.API_KEY -> {
                        OutlinedTextField(
                            value = serverUrl,
                            onValueChange = { serverUrl = it },
                            label = { Text("Server URL") },
                            placeholder = { Text("http://192.168.1.x:port") },
                            singleLine = true,
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = PlexColors.AccentPrimary,
                                unfocusedBorderColor = PlexColors.BorderPrimary
                            )
                        )
                        
                        OutlinedTextField(
                            value = apiKey,
                            onValueChange = { apiKey = it },
                            label = { Text("API Key") },
                            singleLine = true,
                            visualTransformation = if (showPassword)
                                VisualTransformation.None
                            else
                                PasswordVisualTransformation(),
                            trailingIcon = {
                                IconButton(onClick = { showPassword = !showPassword }) {
                                    Icon(
                                        if (showPassword) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                        null,
                                        tint = PlexColors.TextSecondary
                                    )
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = PlexColors.AccentPrimary,
                                unfocusedBorderColor = PlexColors.BorderPrimary
                            )
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    isLoading = true
                    when (authMethod) {
                        AuthMethod.PIN -> {
                            if (pinCode == null) {
                                // Request PIN
                                pinCode = "ABCD1234" // Would come from service
                            }
                        }
                        else -> {
                            // Handle other auth methods
                        }
                    }
                },
                colors = ButtonDefaults.buttonColors(
                    containerColor = PlexColors.AccentPrimary
                )
            ) {
                if (isLoading && authMethod != AuthMethod.PIN) {
                    CircularProgressIndicator(
                        color = Color.Black,
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp
                    )
                } else {
                    Text(
                        when (authMethod) {
                            AuthMethod.PIN -> if (pinCode == null) "Get PIN" else "Connecting..."
                            else -> "Connect"
                        }
                    )
                }
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = PlexColors.BackgroundElevated
    )
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class MediaServerSettingsState(
    val connectedServers: List<MediaServerConfig> = emptyList(),
    val discoveredServers: List<DiscoveredServer> = emptyList(),
    val isScanning: Boolean = false
)

data class MediaServerConfig(
    val id: String,
    val name: String,
    val type: ServerType,
    val url: String,
    val isEnabled: Boolean = true,
    val status: ServerStatus = ServerStatus.CONNECTED,
    val libraryCount: Int = 0,
    val itemCount: Int = 0,
    val lastSync: String = "Never"
)

data class DiscoveredServer(
    val id: String,
    val name: String,
    val type: ServerType,
    val url: String
)

enum class ServerStatus {
    CONNECTED, CONNECTING, ERROR, OFFLINE
}

enum class AuthMethod {
    PIN, USERNAME_PASSWORD, URL_USERNAME_PASSWORD, API_KEY
}

enum class ServerType(
    val displayName: String,
    val icon: ImageVector,
    val color: Color,
    val authMethod: AuthMethod
) {
    PLEX("Plex", Icons.Default.Movie, Color(0xFFE5A00D), AuthMethod.PIN),
    JELLYFIN("Jellyfin", Icons.Default.Movie, Color(0xFF00A4DC), AuthMethod.URL_USERNAME_PASSWORD),
    EMBY("Emby", Icons.Default.Movie, Color(0xFF52B54B), AuthMethod.URL_USERNAME_PASSWORD),
    SUBSONIC("Subsonic", Icons.Default.MusicNote, Color(0xFFFF7E00), AuthMethod.API_KEY),
    CALIBRE("Calibre", Icons.Default.Book, Color(0xFF795548), AuthMethod.URL_USERNAME_PASSWORD),
    KAVITA("Kavita", Icons.Default.Book, Color(0xFF4A90D9), AuthMethod.API_KEY),
    KOMGA("Komga", Icons.Default.CollectionsBookmark, Color(0xFF2196F3), AuthMethod.API_KEY),
    AUDIOBOOKSHELF("Audiobookshelf", Icons.Default.Headphones, Color(0xFFFF9800), AuthMethod.API_KEY),
    NAVIDROME("Navidrome", Icons.Default.MusicNote, Color(0xFF0A7BC4), AuthMethod.URL_USERNAME_PASSWORD)
}
