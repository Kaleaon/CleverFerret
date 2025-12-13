package com.universalmedialibrary.ui.media.screens

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
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Media Server Settings
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
fun MediaServerSettingsScreen(
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
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        "Media Servers",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = MediaColors.TextPrimary)
                    }
                },
                actions = {
                    IconButton(onClick = { showAddServerDialog = true }) {
                        Icon(Icons.Default.Add, "Add Server", tint = MediaColors.AccentPrimary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(MediaSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
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
        style = MediaTypography.LabelLarge,
        color = MediaColors.TextSecondary,
        modifier = Modifier.padding(vertical = MediaSpacing.SM)
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
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable { expanded = !expanded },
        color = MediaColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(MediaSpacing.MD)) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Server icon
                Surface(
                    shape = RoundedCornerShape(MediaCorners.SM),
                    color = server.type.color.copy(alpha = 0.2f),
                    modifier = Modifier.size(48.dp)
                ) {
                    Icon(
                        server.type.icon,
                        null,
                        tint = server.type.color,
                        modifier = Modifier.padding(MediaSpacing.SM)
                    )
                }
                
                Spacer(Modifier.width(MediaSpacing.MD))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        server.name,
                        style = MediaTypography.BodyLarge,
                        color = MediaColors.TextPrimary,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        server.type.displayName,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                    Text(
                        server.url,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                // Status indicator
                StatusIndicator(status = server.status)
                
                Spacer(Modifier.width(MediaSpacing.SM))
                
                // Enable toggle
                Switch(
                    checked = server.isEnabled,
                    onCheckedChange = onToggleEnabled,
                    colors = SwitchDefaults.colors(
                        checkedThumbColor = MediaColors.AccentPrimary,
                        checkedTrackColor = MediaColors.AccentPrimary.copy(alpha = 0.5f)
                    )
                )
                
                Icon(
                    if (expanded) Icons.Default.ExpandLess else Icons.Default.ExpandMore,
                    null,
                    tint = MediaColors.TextTertiary
                )
            }
            
            // Expanded details
            AnimatedVisibility(visible = expanded) {
                Column(modifier = Modifier.padding(top = MediaSpacing.MD)) {
                    HorizontalDivider(color = MediaColors.Border)
                    
                    Spacer(Modifier.height(MediaSpacing.MD))
                    
                    // Server stats
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        ServerStat("Libraries", server.libraryCount.toString())
                        ServerStat("Items", server.itemCount.toString())
                        ServerStat("Last Sync", server.lastSync)
                    }
                    
                    Spacer(Modifier.height(MediaSpacing.MD))
                    
                    // Action buttons
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
                    ) {
                        OutlinedButton(
                            onClick = onTest,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.NetworkCheck, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(MediaSpacing.XS))
                            Text("Test")
                        }
                        
                        OutlinedButton(
                            onClick = onSync,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.Sync, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(MediaSpacing.XS))
                            Text("Sync")
                        }
                        
                        OutlinedButton(
                            onClick = onEdit,
                            modifier = Modifier.weight(1f)
                        ) {
                            Icon(Icons.Default.Edit, null, Modifier.size(18.dp))
                            Spacer(Modifier.width(MediaSpacing.XS))
                            Text("Edit")
                        }
                    }
                    
                    Spacer(Modifier.height(MediaSpacing.SM))
                    
                    TextButton(
                        onClick = onRemove,
                        colors = ButtonDefaults.textButtonColors(contentColor = MediaColors.Error)
                    ) {
                        Icon(Icons.Default.Delete, null, Modifier.size(18.dp))
                        Spacer(Modifier.width(MediaSpacing.XS))
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
        ServerStatus.CONNECTED -> MediaColors.Success to "Connected"
        ServerStatus.CONNECTING -> MediaColors.Warning to "Connecting"
        ServerStatus.ERROR -> MediaColors.Error to "Error"
        ServerStatus.OFFLINE -> MediaColors.TextTertiary to "Offline"
    }
    
    Row(verticalAlignment = Alignment.CenterVertically) {
        Box(
            modifier = Modifier
                .size(8.dp)
                .background(color, CircleShape)
        )
        Spacer(Modifier.width(MediaSpacing.XS))
        Text(
            text,
            style = MediaTypography.LabelSmall,
            color = color
        )
    }
}

@Composable
private fun ServerStat(label: String, value: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            value,
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
        Text(
            label,
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary
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
            .clip(RoundedCornerShape(MediaCorners.MD)),
        color = MediaColors.BackgroundSurface
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                server.type.icon,
                null,
                tint = server.type.color,
                modifier = Modifier.size(32.dp)
            )
            
            Spacer(Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    server.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary
                )
                Text(
                    server.url,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
            }
            
            Button(
                onClick = onConnect,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
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
    
    Column(verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)) {
        serverTypes.forEach { row ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
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
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(MediaSpacing.SM),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                type.icon,
                null,
                tint = type.color,
                modifier = Modifier.size(32.dp)
            )
            Spacer(Modifier.height(MediaSpacing.XS))
            Text(
                type.displayName,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextPrimary
            )
        }
    }
}

@Composable
private fun TipsCard() {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD)),
        color = MediaColors.AccentPrimary.copy(alpha = 0.1f)
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.Top
        ) {
            Icon(
                Icons.Outlined.Info,
                null,
                tint = MediaColors.AccentPrimary,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(Modifier.width(MediaSpacing.MD))
            
            Column {
                Text(
                    "Tips for connecting",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Spacer(Modifier.height(MediaSpacing.XS))
                Text(
                    "• For Plex, sign in at plex.tv/link with the PIN code\n" +
                    "• Jellyfin/Emby require server URL and credentials\n" +
                    "• Subsonic-compatible servers use API keys\n" +
                    "• Ensure servers are on the same network for discovery",
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextSecondary
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
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Connect to ${serverType.displayName}", color = MediaColors.TextPrimary)
            }
        },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
            ) {
                when (authMethod) {
                    AuthMethod.PIN -> {
                        // Plex PIN flow
                        if (pinCode != null) {
                            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                Text(
                                    "Enter this code at plex.tv/link",
                                    style = MediaTypography.BodyMedium,
                                    color = MediaColors.TextSecondary
                                )
                                Spacer(Modifier.height(MediaSpacing.MD))
                                Text(
                                    pinCode!!,
                                    style = MediaTypography.TitleLarge,
                                    color = MediaColors.AccentPrimary,
                                    fontWeight = FontWeight.Bold
                                )
                                Spacer(Modifier.height(MediaSpacing.MD))
                                if (isLoading) {
                                    CircularProgressIndicator(
                                        color = MediaColors.AccentPrimary,
                                        modifier = Modifier.size(24.dp)
                                    )
                                    Spacer(Modifier.height(MediaSpacing.SM))
                                    Text(
                                        "Waiting for authorization...",
                                        style = MediaTypography.LabelSmall,
                                        color = MediaColors.TextTertiary
                                    )
                                }
                            }
                        } else {
                            Text(
                                "Click 'Get PIN' to start the Plex authentication flow.",
                                style = MediaTypography.BodyMedium,
                                color = MediaColors.TextSecondary
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
                                    focusedBorderColor = MediaColors.AccentPrimary,
                                    unfocusedBorderColor = MediaColors.Border
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
                                focusedBorderColor = MediaColors.AccentPrimary,
                                unfocusedBorderColor = MediaColors.Border
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
                                        tint = MediaColors.TextSecondary
                                    )
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = MediaColors.AccentPrimary,
                                unfocusedBorderColor = MediaColors.Border
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
                                focusedBorderColor = MediaColors.AccentPrimary,
                                unfocusedBorderColor = MediaColors.Border
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
                                        tint = MediaColors.TextSecondary
                                    )
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = OutlinedTextFieldDefaults.colors(
                                focusedBorderColor = MediaColors.AccentPrimary,
                                unfocusedBorderColor = MediaColors.Border
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
                    containerColor = MediaColors.AccentPrimary
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
        containerColor = MediaColors.BackgroundElevated
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
