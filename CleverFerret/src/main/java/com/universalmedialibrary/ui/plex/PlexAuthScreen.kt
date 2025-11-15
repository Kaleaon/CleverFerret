package com.universalmedialibrary.ui.plex

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.plex.PlexDiscoveredServer

/**
 * Screen for Plex PIN authentication flow
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexAuthScreen(
    navController: NavController,
    viewModel: PlexAuthViewModel = hiltViewModel()
) {
    val authState by viewModel.authState.collectAsState()
    val servers by viewModel.discoveredServers.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Plex Authentication") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            when (val state = authState) {
                is PlexAuthUiState.Idle -> {
                    if (viewModel.isAuthenticated()) {
                        AuthenticatedContent(
                            username = viewModel.getUsername(),
                            onDiscoverServers = { viewModel.discoverServers() },
                            onSignOut = { viewModel.signOut() }
                        )
                    } else {
                        IdleContent(
                            onStartAuth = { viewModel.startPinAuth() },
                            onSignInWithCredentials = { username, password ->
                                viewModel.signInWithCredentials(username, password)
                            }
                        )
                    }
                }

                is PlexAuthUiState.RequestingPin -> {
                    LoadingContent("Requesting authentication PIN...")
                }

                is PlexAuthUiState.WaitingForUser -> {
                    PinDisplayContent(
                        pinCode = state.pinCode,
                        onCancel = { viewModel.cancelAuth() }
                    )
                }

                is PlexAuthUiState.Authenticating -> {
                    LoadingContent("Authenticating with Plex...")
                }

                is PlexAuthUiState.Authenticated -> {
                    SuccessContent(
                        username = state.username,
                        onDiscoverServers = { viewModel.discoverServers() }
                    )
                }

                is PlexAuthUiState.DiscoveringServers -> {
                    LoadingContent("Discovering Plex servers...")
                }

                is PlexAuthUiState.ServersDiscovered -> {
                    ServersContent(
                        servers = servers,
                        onServerSelected = { server -> viewModel.selectServer(server) }
                    )
                }

                is PlexAuthUiState.Error -> {
                    ErrorContent(
                        message = state.message,
                        onRetry = { viewModel.startPinAuth() }
                    )
                }
            }
        }
    }
}

@Composable
private fun IdleContent(
    onStartAuth: () -> Unit,
    onSignInWithCredentials: (String, String) -> Unit = { _, _ -> }
) {
    var showCredentialsForm by remember { mutableStateOf(false) }
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var passwordVisible by remember { mutableStateOf(false) }

    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 16.dp)
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Login,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.primary
            )

            Text(
                text = "Sign in to Plex",
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold
            )

            Text(
                text = "Connect your Plex account to sync your media library",
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            if (!showCredentialsForm) {
                // PIN Authentication Button
                Button(
                    onClick = onStartAuth,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Login, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Sign in with PIN")
                }

                // Divider with "OR"
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    HorizontalDivider(modifier = Modifier.weight(1f))
                    Text(
                        text = "OR",
                        modifier = Modifier.padding(horizontal = 16.dp),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    HorizontalDivider(modifier = Modifier.weight(1f))
                }

                // Username/Password Button
                OutlinedButton(
                    onClick = { showCredentialsForm = true },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.AccountCircle, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Sign in with Username")
                }
            } else {
                // Username/Password Form
                OutlinedTextField(
                    value = username,
                    onValueChange = { username = it },
                    label = { Text("Username or Email") },
                    leadingIcon = {
                        Icon(Icons.Default.AccountCircle, contentDescription = null)
                    },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                OutlinedTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = { Text("Password") },
                    leadingIcon = {
                        Icon(Icons.Default.Lock, contentDescription = null)
                    },
                    trailingIcon = {
                        IconButton(onClick = { passwordVisible = !passwordVisible }) {
                            Icon(
                                imageVector = if (passwordVisible) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                                contentDescription = if (passwordVisible) "Hide password" else "Show password"
                            )
                        }
                    },
                    visualTransformation = if (passwordVisible) androidx.compose.ui.text.input.VisualTransformation.None else androidx.compose.ui.text.input.PasswordVisualTransformation(),
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                Button(
                    onClick = { onSignInWithCredentials(username, password) },
                    modifier = Modifier.fillMaxWidth(),
                    enabled = username.isNotBlank() && password.isNotBlank()
                ) {
                    Icon(Icons.Default.Login, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Sign In")
                }

                OutlinedButton(
                    onClick = {
                        showCredentialsForm = false
                        username = ""
                        password = ""
                        passwordVisible = false
                    },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Text("Back to PIN Login")
                }
            }
        }
    }
}

@Composable
private fun PinDisplayContent(
    pinCode: String,
    onCancel: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.PhoneAndroid,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.primary
            )

            Text(
                text = "Enter this PIN at",
                style = MaterialTheme.typography.titleMedium
            )

            Text(
                text = "plex.tv/link",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )

            Surface(
                modifier = Modifier.padding(vertical = 8.dp),
                shape = MaterialTheme.shapes.medium,
                color = MaterialTheme.colorScheme.surface,
                tonalElevation = 4.dp
            ) {
                Text(
                    text = pinCode,
                    style = MaterialTheme.typography.displayMedium,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(horizontal = 32.dp, vertical = 16.dp)
                )
            }

            CircularProgressIndicator(
                modifier = Modifier.size(32.dp)
            )

            Text(
                text = "Waiting for authorization...",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            OutlinedButton(
                onClick = onCancel,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Cancel")
            }
        }
    }
}

@Composable
private fun AuthenticatedContent(
    username: String?,
    onDiscoverServers: () -> Unit,
    onSignOut: () -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(24.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    imageVector = Icons.Default.CheckCircle,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "Signed in as ${username ?: "Unknown"}",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
            }

            Button(
                onClick = onDiscoverServers,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.CloudSync, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Discover Servers")
            }

            OutlinedButton(
                onClick = onSignOut,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Sign Out")
            }
        }
    }
}

@Composable
private fun SuccessContent(
    username: String,
    onDiscoverServers: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.primary
            )

            Text(
                text = "Authentication Successful!",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )

            Text(
                text = "Welcome, $username",
                style = MaterialTheme.typography.bodyLarge
            )

            Button(
                onClick = onDiscoverServers,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.CloudSync, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Discover Servers")
            }
        }
    }
}

@Composable
private fun ServersContent(
    servers: List<PlexDiscoveredServer>,
    onServerSelected: (PlexDiscoveredServer) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Text(
                text = "Available Servers",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(bottom = 8.dp)
            )

            if (servers.isEmpty()) {
                Text(
                    text = "No servers found",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    modifier = Modifier.padding(vertical = 16.dp)
                )
            } else {
                servers.forEach { server ->
                    ServerListItem(
                        server = server,
                        onClick = { onServerSelected(server) }
                    )
                }
            }
        }
    }
}

@Composable
private fun ServerListItem(
    server: PlexDiscoveredServer,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = server.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = if (server.owned) "Owned" else "Shared",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                if (server.connections.isNotEmpty()) {
                    Text(
                        text = "${server.connections.size} connection(s)",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null
            )
        }
    }
}

@Composable
private fun LoadingContent(message: String) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(32.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            CircularProgressIndicator()
            Text(
                text = message,
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center
            )
        }
    }
}

@Composable
private fun ErrorContent(
    message: String,
    onRetry: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )

            Text(
                text = "Authentication Failed",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onErrorContainer
            )

            Text(
                text = message,
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onErrorContainer
            )

            Button(
                onClick = onRetry,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MaterialTheme.colorScheme.error
                )
            ) {
                Icon(Icons.Default.Refresh, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Try Again")
            }
        }
    }
}
