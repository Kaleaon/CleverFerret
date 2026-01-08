package com.universalmedialibrary.ui.aientertainment

import androidx.compose.animation.*
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
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
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.*
import java.text.SimpleDateFormat
import java.util.*

// ==================== Login Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LoginScreen(
    onNavigateToRegister: () -> Unit,
    onNavigateToCharacters: () -> Unit,
    viewModel: LoginViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var showPassword by remember { mutableStateOf(false) }
    var showBlueskyLogin by remember { mutableStateOf(false) }
    var blueskyHandle by remember { mutableStateOf("") }
    var blueskyAppPassword by remember { mutableStateOf("") }
    
    LaunchedEffect(Unit) {
        viewModel.currentUser.collect { user ->
            if (user != null) {
                onNavigateToCharacters()
            }
        }
    }
    
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = SynthColors.background
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // Logo
            Box(
                modifier = Modifier
                    .size(80.dp)
                    .clip(RoundedCornerShape(16.dp))
                    .background(SynthColors.primaryGradient),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    Icons.Default.SmartToy,
                    contentDescription = "Media image",
                    tint = Color.White,
                    modifier = Modifier.size(48.dp)
                )
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            Text(
                text = "SynthChat",
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold,
                color = SynthColors.textPrimary
            )
            
            Text(
                text = "AI Entertainment",
                style = MaterialTheme.typography.bodyLarge,
                color = SynthColors.textSecondary
            )
            
            Spacer(modifier = Modifier.height(48.dp))
            
            if (!showBlueskyLogin) {
                // Username field
                OutlinedTextField(
                    value = username,
                    onValueChange = { username = it },
                    label = { Text("Username or Email") },
                    leadingIcon = { Icon(Icons.Default.Person, contentDescription = "Person") },
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = SynthColors.primary,
                        unfocusedBorderColor = SynthColors.border,
                        focusedLabelColor = SynthColors.primary,
                        cursorColor = SynthColors.primary
                    ),
                    singleLine = true
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                // Password field
                OutlinedTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = { Text("Password") },
                    leadingIcon = { Icon(Icons.Default.Lock, contentDescription = "Lock") },
                    trailingIcon = {
                        IconButton(onClick = { showPassword = !showPassword }) {
                            Icon(
                                if (showPassword) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                contentDescription = null
                            )
                        }
                    },
                    visualTransformation = if (showPassword) VisualTransformation.None else PasswordVisualTransformation(),
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = SynthColors.primary,
                        unfocusedBorderColor = SynthColors.border,
                        focusedLabelColor = SynthColors.primary,
                        cursorColor = SynthColors.primary
                    ),
                    singleLine = true
                )
            } else {
                // Bluesky login
                Text(
                    text = "Login with Bluesky",
                    style = MaterialTheme.typography.titleMedium,
                    color = SynthColors.textPrimary
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                OutlinedTextField(
                    value = blueskyHandle,
                    onValueChange = { blueskyHandle = it },
                    label = { Text("Handle (e.g., user.bsky.social)") },
                    leadingIcon = { Icon(Icons.Default.AlternateEmail, contentDescription = "Email") },
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = SynthColors.info,
                        unfocusedBorderColor = SynthColors.border
                    ),
                    singleLine = true
                )
                
                Spacer(modifier = Modifier.height(16.dp))
                
                OutlinedTextField(
                    value = blueskyAppPassword,
                    onValueChange = { blueskyAppPassword = it },
                    label = { Text("App Password") },
                    leadingIcon = { Icon(Icons.Default.Key, contentDescription = "Key") },
                    visualTransformation = PasswordVisualTransformation(),
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = SynthColors.info,
                        unfocusedBorderColor = SynthColors.border
                    ),
                    singleLine = true
                )
            }
            
            // Error message
            uiState.error?.let { error ->
                Spacer(modifier = Modifier.height(16.dp))
                Card(
                    colors = CardDefaults.cardColors(containerColor = SynthColors.error.copy(alpha = 0.1f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(Icons.Default.Error, contentDescription = "Error", tint = SynthColors.error)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(error, color = SynthColors.error)
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Login button
            Button(
                onClick = {
                    if (showBlueskyLogin) {
                        viewModel.loginWithBluesky(blueskyHandle, blueskyAppPassword) {
                            onNavigateToCharacters()
                        }
                    } else {
                        viewModel.login(username, password) {
                            onNavigateToCharacters()
                        }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(52.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = if (showBlueskyLogin) SynthColors.info else SynthColors.primary
                ),
                enabled = !uiState.isLoading
            ) {
                if (uiState.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = Color.White,
                        strokeWidth = 2.dp
                    )
                } else {
                    Text(if (showBlueskyLogin) "Login with Bluesky" else "Login")
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Toggle Bluesky login
            TextButton(onClick = { showBlueskyLogin = !showBlueskyLogin }) {
                Text(
                    if (showBlueskyLogin) "Use regular login" else "Login with Bluesky AT Protocol",
                    color = SynthColors.info
                )
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Register link
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text("Don't have an account?", color = SynthColors.textSecondary)
                TextButton(onClick = onNavigateToRegister) {
                    Text("Register", color = SynthColors.primary)
                }
            }
        }
    }
}

// ==================== Register Screen ====================

@Composable
fun RegisterScreen(
    onNavigateToLogin: () -> Unit,
    onNavigateToCharacters: () -> Unit,
    viewModel: RegisterViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var username by remember { mutableStateOf("") }
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var confirmPassword by remember { mutableStateOf("") }
    var showPassword by remember { mutableStateOf(false) }
    
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = SynthColors.background
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(24.dp)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Spacer(modifier = Modifier.height(48.dp))
            
            Text(
                text = "Create Account",
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold,
                color = SynthColors.textPrimary
            )
            
            Spacer(modifier = Modifier.height(32.dp))
            
            OutlinedTextField(
                value = username,
                onValueChange = { username = it },
                label = { Text("Username") },
                leadingIcon = { Icon(Icons.Default.Person, contentDescription = "Person") },
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = SynthColors.primary,
                    unfocusedBorderColor = SynthColors.border
                ),
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            OutlinedTextField(
                value = email,
                onValueChange = { email = it },
                label = { Text("Email") },
                leadingIcon = { Icon(Icons.Default.Email, contentDescription = "Email") },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = SynthColors.primary,
                    unfocusedBorderColor = SynthColors.border
                ),
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            OutlinedTextField(
                value = password,
                onValueChange = { password = it },
                label = { Text("Password") },
                leadingIcon = { Icon(Icons.Default.Lock, contentDescription = "Lock") },
                trailingIcon = {
                    IconButton(onClick = { showPassword = !showPassword }) {
                        Icon(
                            if (showPassword) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                            contentDescription = null
                        )
                    }
                },
                visualTransformation = if (showPassword) VisualTransformation.None else PasswordVisualTransformation(),
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = SynthColors.primary,
                    unfocusedBorderColor = SynthColors.border
                ),
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            OutlinedTextField(
                value = confirmPassword,
                onValueChange = { confirmPassword = it },
                label = { Text("Confirm Password") },
                leadingIcon = { Icon(Icons.Default.Lock, contentDescription = "Lock") },
                visualTransformation = if (showPassword) VisualTransformation.None else PasswordVisualTransformation(),
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = SynthColors.primary,
                    unfocusedBorderColor = SynthColors.border
                ),
                singleLine = true,
                isError = confirmPassword.isNotEmpty() && password != confirmPassword
            )
            
            uiState.error?.let { error ->
                Spacer(modifier = Modifier.height(16.dp))
                Card(
                    colors = CardDefaults.cardColors(containerColor = SynthColors.error.copy(alpha = 0.1f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(Icons.Default.Error, contentDescription = "Error", tint = SynthColors.error)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(error, color = SynthColors.error)
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            Button(
                onClick = {
                    if (password == confirmPassword) {
                        viewModel.register(username, email, password) {
                            onNavigateToCharacters()
                        }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(52.dp),
                colors = ButtonDefaults.buttonColors(containerColor = SynthColors.primary),
                enabled = !uiState.isLoading && password == confirmPassword && password.length >= 6
            ) {
                if (uiState.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = Color.White,
                        strokeWidth = 2.dp
                    )
                } else {
                    Text("Create Account")
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text("Already have an account?", color = SynthColors.textSecondary)
                TextButton(onClick = onNavigateToLogin) {
                    Text("Login", color = SynthColors.primary)
                }
            }
        }
    }
}

// ==================== Characters Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CharactersScreen(
    onNavigateToChat: (Long) -> Unit,
    onNavigateToCharacterEdit: (Long?) -> Unit,
    onNavigateToRooms: () -> Unit,
    onNavigateToImport: () -> Unit,
    onNavigateToLogin: () -> Unit,
    viewModel: CharactersViewModel = hiltViewModel()
) {
    val characters by viewModel.characters.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val currentUser by viewModel.currentUser.collectAsState()
    var showLogoutDialog by remember { mutableStateOf(false) }
    
    LaunchedEffect(currentUser) {
        if (currentUser == null) {
            onNavigateToLogin()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Box(
                            modifier = Modifier
                                .size(36.dp)
                                .clip(RoundedCornerShape(8.dp))
                                .background(SynthColors.primaryGradient),
                            contentAlignment = Alignment.Center
                        ) {
                            Icon(Icons.Default.SmartToy, null, tint = Color.White, modifier = Modifier.size(22.dp))
                        }
                        Spacer(modifier = Modifier.width(12.dp))
                        Text("AI Entertainment")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary,
                    titleContentColor = SynthColors.textPrimary
                ),
                actions = {
                    IconButton(onClick = onNavigateToRooms) {
                        Icon(Icons.Outlined.MeetingRoom, "Rooms", tint = SynthColors.textPrimary)
                    }
                    IconButton(onClick = onNavigateToImport) {
                        Icon(Icons.Outlined.UploadFile, "Import", tint = SynthColors.textPrimary)
                    }
                    IconButton(onClick = { showLogoutDialog = true }) {
                        Icon(Icons.Outlined.Logout, "Logout", tint = SynthColors.textSecondary)
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { onNavigateToCharacterEdit(null) },
                containerColor = SynthColors.primary,
                contentColor = Color.White
            ) {
                Icon(Icons.Default.Add, contentDescription = "Add")
                Spacer(modifier = Modifier.width(8.dp))
                Text("New Character")
            }
        },
        containerColor = SynthColors.background
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = SynthColors.primary)
            }
        } else if (characters.isEmpty()) {
            // Empty state
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(32.dp),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.Center
            ) {
                Box(
                    modifier = Modifier
                        .size(100.dp)
                        .clip(CircleShape)
                        .background(SynthColors.primary.copy(alpha = 0.1f)),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        Icons.Default.PersonAdd,
                        contentDescription = "Media image",
                        modifier = Modifier.size(50.dp),
                        tint = SynthColors.primary
                    )
                }
                Spacer(modifier = Modifier.height(24.dp))
                Text(
                    "No Characters Yet",
                    style = MaterialTheme.typography.headlineSmall,
                    color = SynthColors.textPrimary
                )
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    "Create your first AI character to start chatting!",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SynthColors.textSecondary,
                    textAlign = TextAlign.Center
                )
                Spacer(modifier = Modifier.height(32.dp))
                Button(
                    onClick = { onNavigateToCharacterEdit(null) },
                    colors = ButtonDefaults.buttonColors(containerColor = SynthColors.primary)
                ) {
                    Icon(Icons.Default.Add, contentDescription = "Add")
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Create Character")
                }
            }
        } else {
            LazyVerticalGrid(
                columns = GridCells.Fixed(2),
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(characters) { charWithCount ->
                    CharacterCard(
                        character = charWithCount.character,
                        messageCount = charWithCount.messageCount,
                        onClick = { onNavigateToChat(charWithCount.character.id) },
                        onLongClick = { onNavigateToCharacterEdit(charWithCount.character.id) }
                    )
                }
            }
        }
    }
    
    // Logout dialog
    if (showLogoutDialog) {
        AlertDialog(
            onDismissRequest = { showLogoutDialog = false },
            title = { Text("Logout") },
            text = { Text("Are you sure you want to log out?") },
            confirmButton = {
                Button(
                    onClick = {
                        viewModel.logout()
                        showLogoutDialog = false
                    },
                    colors = ButtonDefaults.buttonColors(containerColor = SynthColors.error)
                ) {
                    Text("Logout")
                }
            },
            dismissButton = {
                TextButton(onClick = { showLogoutDialog = false }) {
                    Text("Cancel")
                }
            },
            containerColor = SynthColors.surface
        )
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun CharacterCard(
    character: SynthCharacter,
    messageCount: Int,
    onClick: () -> Unit,
    onLongClick: () -> Unit
) {
    val avatarColor = SynthColors.getAvatarColor(character.name)
    
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .aspectRatio(0.75f)
            .combinedClickable(
                onClick = onClick,
                onLongClick = onLongClick
            ),
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(12.dp),
        border = BorderStroke(1.dp, SynthColors.border)
    ) {
        Column {
            // Avatar area
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(3f)
                    .background(
                        Brush.linearGradient(
                            colors = listOf(avatarColor, avatarColor.copy(alpha = 0.7f))
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = getInitials(character.name),
                    fontSize = 42.sp,
                    fontWeight = FontWeight.Bold,
                    color = Color.White
                )
            }
            
            // Info area
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(2f)
                    .padding(12.dp)
            ) {
                Text(
                    text = character.name,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    color = SynthColors.textPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    text = character.description.ifEmpty { 
                        character.personality.ifEmpty { "No description" }
                    },
                    style = MaterialTheme.typography.bodySmall,
                    color = SynthColors.textSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f)
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        Icons.Outlined.ChatBubbleOutline,
                        contentDescription = "Media image",
                        modifier = Modifier.size(14.dp),
                        tint = SynthColors.textMuted
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        "$messageCount",
                        style = MaterialTheme.typography.labelSmall,
                        color = SynthColors.textMuted
                    )
                }
            }
        }
    }
}

// ==================== Chat Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChatScreen(
    characterId: Long,
    onNavigateBack: () -> Unit,
    onNavigateToCharacterEdit: () -> Unit,
    onNavigateToPersonality: () -> Unit,
    viewModel: ChatViewModel = hiltViewModel()
) {
    val character by viewModel.selectedCharacter.collectAsState()
    val messages by viewModel.messages.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val isTyping by viewModel.isTyping.collectAsState()
    val currentMood by viewModel.currentMood.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    
    var messageText by remember { mutableStateOf("") }
    val listState = rememberLazyListState()
    val focusManager = LocalFocusManager.current
    
    LaunchedEffect(characterId) {
        viewModel.loadMessages(characterId)
    }
    
    LaunchedEffect(messages.size) {
        if (messages.isNotEmpty()) {
            listState.animateScrollToItem(messages.size - 1)
        }
    }
    
    val currentCharacter = character
    
    if (currentCharacter == null) {
        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Text("No character selected", color = SynthColors.textSecondary)
        }
        return
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null, tint = SynthColors.textPrimary)
                    }
                },
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        CharacterAvatar(name = currentCharacter.name, size = 36)
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                currentCharacter.name,
                                style = MaterialTheme.typography.titleMedium,
                                color = SynthColors.textPrimary
                            )
                            Text(
                                "Online",
                                style = MaterialTheme.typography.bodySmall,
                                color = SynthColors.success
                            )
                        }
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary
                ),
                actions = {
                    currentMood?.let { mood ->
                        IconButton(onClick = onNavigateToPersonality) {
                            Text(mood.emoji, fontSize = 20.sp)
                        }
                    }
                    IconButton(onClick = onNavigateToPersonality) {
                        Icon(Icons.Outlined.Psychology, "Personality", tint = SynthColors.textPrimary)
                    }
                    IconButton(onClick = onNavigateToCharacterEdit) {
                        Icon(Icons.Outlined.Info, "Info", tint = SynthColors.textPrimary)
                    }
                }
            )
        },
        containerColor = SynthColors.background
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Messages
            if (isLoading) {
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator(color = SynthColors.primary)
                }
            } else if (messages.isEmpty()) {
                Box(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth(),
                    contentAlignment = Alignment.Center
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Icon(
                            Icons.Outlined.ChatBubbleOutline,
                            contentDescription = "Media image",
                            modifier = Modifier.size(64.dp),
                            tint = SynthColors.textMuted
                        )
                        Spacer(modifier = Modifier.height(16.dp))
                        Text(
                            "Start a conversation!",
                            style = MaterialTheme.typography.bodyLarge,
                            color = SynthColors.textSecondary
                        )
                    }
                }
            } else {
                LazyColumn(
                    modifier = Modifier
                        .weight(1f)
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    state = listState
                ) {
                    items(messages) { message ->
                        MessageBubble(
                            message = message,
                            characterName = currentCharacter.name
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                    }
                    
                    if (isTyping) {
                        item {
                            TypingIndicator(characterName = currentCharacter.name)
                        }
                    }
                }
            }
            
            // Input area
            Surface(
                color = SynthColors.backgroundSecondary,
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier
                        .padding(12.dp)
                        .fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    OutlinedTextField(
                        value = messageText,
                        onValueChange = { messageText = it },
                        modifier = Modifier.weight(1f),
                        placeholder = { Text("Type a message...", color = SynthColors.textMuted) },
                        colors = OutlinedTextFieldDefaults.colors(
                            focusedBorderColor = Color.Transparent,
                            unfocusedBorderColor = Color.Transparent,
                            focusedContainerColor = SynthColors.background,
                            unfocusedContainerColor = SynthColors.background
                        ),
                        shape = RoundedCornerShape(24.dp),
                        keyboardOptions = KeyboardOptions(imeAction = ImeAction.Send),
                        keyboardActions = KeyboardActions(
                            onSend = {
                                if (messageText.isNotBlank()) {
                                    viewModel.sendMessage(messageText)
                                    messageText = ""
                                    focusManager.clearFocus()
                                }
                            }
                        ),
                        maxLines = 4
                    )
                    
                    Spacer(modifier = Modifier.width(8.dp))
                    
                    Box(
                        modifier = Modifier
                            .size(48.dp)
                            .clip(CircleShape)
                            .background(SynthColors.primaryGradient)
                            .clickable(enabled = !uiState.isSending && messageText.isNotBlank()) {
                                viewModel.sendMessage(messageText)
                                messageText = ""
                                focusManager.clearFocus()
                            },
                        contentAlignment = Alignment.Center
                    ) {
                        if (uiState.isSending) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(20.dp),
                                color = Color.White,
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(
                                Icons.AutoMirrored.Filled.Send,
                                contentDescription = "Send",
                                tint = Color.White
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
fun CharacterAvatar(
    name: String,
    size: Int,
    modifier: Modifier = Modifier
) {
    val avatarColor = SynthColors.getAvatarColor(name)
    
    Box(
        modifier = modifier
            .size(size.dp)
            .clip(CircleShape)
            .background(
                Brush.linearGradient(
                    colors = listOf(avatarColor, avatarColor.copy(alpha = 0.7f))
                )
            ),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = getInitials(name),
            fontSize = (size * 0.4f).sp,
            fontWeight = FontWeight.Bold,
            color = Color.White
        )
    }
}

@Composable
fun MessageBubble(
    message: SynthMessage,
    characterName: String
) {
    val isUser = message.isUser
    
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = if (isUser) Arrangement.End else Arrangement.Start,
        verticalAlignment = Alignment.Bottom
    ) {
        if (!isUser) {
            CharacterAvatar(name = characterName, size = 32)
            Spacer(modifier = Modifier.width(8.dp))
        }
        
        Column(
            modifier = Modifier.widthIn(max = 280.dp),
            horizontalAlignment = if (isUser) Alignment.End else Alignment.Start
        ) {
            Surface(
                shape = RoundedCornerShape(
                    topStart = 16.dp,
                    topEnd = 16.dp,
                    bottomStart = if (isUser) 16.dp else 4.dp,
                    bottomEnd = if (isUser) 4.dp else 16.dp
                ),
                color = if (isUser) SynthColors.primary else SynthColors.surface,
                border = if (isUser) null else BorderStroke(1.dp, SynthColors.border)
            ) {
                Column(modifier = Modifier.padding(horizontal = 16.dp, vertical = 12.dp)) {
                    Text(
                        text = message.content,
                        color = if (isUser) Color.White else SynthColors.textPrimary,
                        fontSize = 15.sp,
                        lineHeight = 21.sp
                    )
                    
                    Spacer(modifier = Modifier.height(4.dp))
                    
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        if (!isUser && message.emotion != "neutral") {
                            Surface(
                                color = SynthColors.backgroundSecondary,
                                shape = RoundedCornerShape(8.dp)
                            ) {
                                Row(
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                                    verticalAlignment = Alignment.CenterVertically
                                ) {
                                    Text(message.emotionEmoji, fontSize = 10.sp)
                                    Spacer(modifier = Modifier.width(2.dp))
                                    Text(
                                        message.emotion,
                                        fontSize = 9.sp,
                                        color = SynthColors.textMuted
                                    )
                                }
                            }
                            Spacer(modifier = Modifier.width(6.dp))
                        }
                        
                        Text(
                            text = formatMessageTime(message.createdAt),
                            fontSize = 10.sp,
                            color = if (isUser) Color.White.copy(alpha = 0.7f) else SynthColors.textMuted
                        )
                    }
                }
            }
        }
        
        if (isUser) {
            Spacer(modifier = Modifier.width(8.dp))
            Box(
                modifier = Modifier
                    .size(32.dp)
                    .clip(CircleShape)
                    .background(SynthColors.surfaceLight),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    Icons.Default.Person,
                    contentDescription = "Media image",
                    tint = SynthColors.textSecondary,
                    modifier = Modifier.size(18.dp)
                )
            }
        }
    }
}

@Composable
fun TypingIndicator(characterName: String) {
    Row(verticalAlignment = Alignment.Bottom) {
        CharacterAvatar(name = characterName, size = 32)
        Spacer(modifier = Modifier.width(8.dp))
        
        Surface(
            shape = RoundedCornerShape(16.dp),
            color = SynthColors.surface
        ) {
            Row(modifier = Modifier.padding(horizontal = 16.dp, vertical = 12.dp)) {
                repeat(3) { index ->
                    val alpha by animateFloatAsState(
                        targetValue = 1f,
                        animationSpec = androidx.compose.animation.core.infiniteRepeatable(
                            animation = androidx.compose.animation.core.tween(600),
                            repeatMode = androidx.compose.animation.core.RepeatMode.Reverse
                        ),
                        label = "typing_dot_$index"
                    )
                    
                    Box(
                        modifier = Modifier
                            .size(8.dp)
                            .clip(CircleShape)
                            .background(SynthColors.textMuted.copy(alpha = 0.5f + alpha * 0.5f))
                    )
                    
                    if (index < 2) {
                        Spacer(modifier = Modifier.width(4.dp))
                    }
                }
            }
        }
    }
}

private fun formatMessageTime(timestamp: Long): String {
    val now = System.currentTimeMillis()
    val diff = now - timestamp
    
    return when {
        diff < 60_000 -> "now"
        diff < 3_600_000 -> "${diff / 60_000}m"
        diff < 86_400_000 -> SimpleDateFormat("HH:mm", Locale.getDefault()).format(Date(timestamp))
        diff < 604_800_000 -> "${diff / 86_400_000}d"
        else -> SimpleDateFormat("MM/dd", Locale.getDefault()).format(Date(timestamp))
    }
}

// ==================== Character Edit Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CharacterEditScreen(
    characterId: Long?,
    onNavigateBack: () -> Unit,
    viewModel: CharacterEditViewModel = hiltViewModel()
) {
    val isNew = characterId == null
    val uiState by viewModel.uiState.collectAsState()
    val formState by viewModel.formState.collectAsState()
    var showDeleteDialog by remember { mutableStateOf(false) }
    
    LaunchedEffect(characterId) {
        if (isNew) {
            viewModel.initForNew()
        } else {
            viewModel.initForEdit(characterId!!)
        }
    }
    
    val models = listOf("gpt-3.5-turbo", "gpt-4", "gpt-4-turbo", "gpt-4o", "gpt-4o-mini")
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null, tint = SynthColors.textPrimary)
                    }
                },
                title = {
                    Text(if (isNew) "Create Character" else "Edit Character")
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary,
                    titleContentColor = SynthColors.textPrimary
                ),
                actions = {
                    if (!isNew) {
                        IconButton(onClick = { showDeleteDialog = true }) {
                            Icon(Icons.Outlined.Delete, "Delete", tint = SynthColors.error)
                        }
                    }
                }
            )
        },
        containerColor = SynthColors.background
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp)
                .verticalScroll(rememberScrollState())
        ) {
            // Avatar preview
            Box(
                modifier = Modifier.fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                Box(
                    modifier = Modifier
                        .size(100.dp)
                        .clip(CircleShape)
                        .background(SynthColors.primaryGradient),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = if (formState.name.isNotEmpty()) getInitials(formState.name) else "?",
                        fontSize = 36.sp,
                        fontWeight = FontWeight.Bold,
                        color = Color.White
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Name
            OutlinedTextField(
                value = formState.name,
                onValueChange = { viewModel.updateForm { copy(name = it) } },
                label = { Text("Character Name *") },
                placeholder = { Text("e.g., Alice, Sherlock, etc.") },
                leadingIcon = { Icon(Icons.Default.Person, null) },
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors(),
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Description
            OutlinedTextField(
                value = formState.description,
                onValueChange = { viewModel.updateForm { copy(description = it) } },
                label = { Text("Short Description") },
                leadingIcon = { Icon(Icons.Outlined.Description, null) },
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors(),
                maxLines = 2
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Personality
            OutlinedTextField(
                value = formState.personality,
                onValueChange = { viewModel.updateForm { copy(personality = it) } },
                label = { Text("Personality") },
                placeholder = { Text("Describe personality traits, behavior...") },
                leadingIcon = { Icon(Icons.Outlined.Psychology, null) },
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors(),
                maxLines = 4
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // System Prompt
            OutlinedTextField(
                value = formState.systemPrompt,
                onValueChange = { viewModel.updateForm { copy(systemPrompt = it) } },
                label = { Text("System Prompt (Optional)") },
                leadingIcon = { Icon(Icons.Outlined.Terminal, null) },
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors(),
                maxLines = 4
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Greeting
            OutlinedTextField(
                value = formState.greeting,
                onValueChange = { viewModel.updateForm { copy(greeting = it) } },
                label = { Text("Greeting Message") },
                leadingIcon = { Icon(Icons.Outlined.WavingHand, null) },
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors(),
                maxLines = 2
            )
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // LLM Settings
            Text(
                "LLM Settings",
                style = MaterialTheme.typography.titleMedium,
                color = SynthColors.textPrimary
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Model dropdown
            var expanded by remember { mutableStateOf(false) }
            ExposedDropdownMenuBox(
                expanded = expanded,
                onExpandedChange = { expanded = it }
            ) {
                OutlinedTextField(
                    value = formState.model,
                    onValueChange = {},
                    readOnly = true,
                    label = { Text("Model") },
                    trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
                    modifier = Modifier
                        .fillMaxWidth()
                        .menuAnchor(),
                    colors = textFieldColors()
                )
                
                ExposedDropdownMenu(
                    expanded = expanded,
                    onDismissRequest = { expanded = false }
                ) {
                    models.forEach { model ->
                        DropdownMenuItem(
                            text = { Text(model) },
                            onClick = {
                                viewModel.updateForm { copy(model = model) }
                                expanded = false
                            }
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Temperature slider
            Column {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text("Temperature", color = SynthColors.textPrimary)
                    Text(
                        "%.1f".format(formState.temperature),
                        color = SynthColors.primary,
                        fontWeight = FontWeight.SemiBold
                    )
                }
                
                Slider(
                    value = formState.temperature,
                    onValueChange = { viewModel.updateForm { copy(temperature = it) } },
                    valueRange = 0f..1f,
                    steps = 9,
                    colors = SliderDefaults.colors(
                        thumbColor = SynthColors.primary,
                        activeTrackColor = SynthColors.primary
                    )
                )
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Text("Precise", style = MaterialTheme.typography.labelSmall, color = SynthColors.textMuted)
                    Text("Creative", style = MaterialTheme.typography.labelSmall, color = SynthColors.textMuted)
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Max Tokens
            OutlinedTextField(
                value = formState.maxTokens.toString(),
                onValueChange = { 
                    it.toIntOrNull()?.let { tokens ->
                        viewModel.updateForm { copy(maxTokens = tokens.coerceIn(100, 4000)) }
                    }
                },
                label = { Text("Max Tokens") },
                leadingIcon = { Icon(Icons.Outlined.FormatListNumbered, null) },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                modifier = Modifier.fillMaxWidth(),
                colors = textFieldColors()
            )
            
            // Error message
            uiState.error?.let { error ->
                Spacer(modifier = Modifier.height(16.dp))
                Card(
                    colors = CardDefaults.cardColors(containerColor = SynthColors.error.copy(alpha = 0.1f)),
                    shape = RoundedCornerShape(8.dp)
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(Icons.Default.Error, null, tint = SynthColors.error)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(error, color = SynthColors.error)
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(24.dp))
            
            // Save button
            Button(
                onClick = {
                    viewModel.save(isNew) { onNavigateBack() }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(52.dp),
                colors = ButtonDefaults.buttonColors(containerColor = SynthColors.primary),
                enabled = !uiState.isLoading
            ) {
                if (uiState.isLoading) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = Color.White,
                        strokeWidth = 2.dp
                    )
                } else {
                    Icon(Icons.Default.Save, null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(if (isNew) "Create Character" else "Save Changes")
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
        }
    }
    
    // Delete dialog
    if (showDeleteDialog) {
        AlertDialog(
            onDismissRequest = { showDeleteDialog = false },
            title = { Text("Delete Character") },
            text = { Text("Are you sure you want to delete \"${formState.name}\"? This action cannot be undone.") },
            confirmButton = {
                Button(
                    onClick = {
                        viewModel.delete { onNavigateBack() }
                        showDeleteDialog = false
                    },
                    colors = ButtonDefaults.buttonColors(containerColor = SynthColors.error)
                ) {
                    Text("Delete")
                }
            },
            dismissButton = {
                TextButton(onClick = { showDeleteDialog = false }) {
                    Text("Cancel")
                }
            },
            containerColor = SynthColors.surface
        )
    }
}

@Composable
private fun textFieldColors() = OutlinedTextFieldDefaults.colors(
    focusedBorderColor = SynthColors.primary,
    unfocusedBorderColor = SynthColors.border,
    focusedLabelColor = SynthColors.primary,
    cursorColor = SynthColors.primary,
    focusedLeadingIconColor = SynthColors.primary,
    unfocusedLeadingIconColor = SynthColors.textSecondary
)
