package com.universalmedialibrary.ui.aientertainment

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.*
import java.text.SimpleDateFormat
import java.util.*

/**
 * Document Import Screen - Character creation from documents
 * Supports text, markdown, and JSON files
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DocumentImportScreen(
    onNavigateBack: () -> Unit,
    onCharacterCreated: (Long) -> Unit,
    viewModel: DocumentImportViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val imports by viewModel.imports.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    val extractedData by viewModel.extractedData.collectAsState()
    val error by viewModel.error.collectAsState()
    
    var selectedTab by remember { mutableIntStateOf(0) }
    var showExtractedDataDialog by remember { mutableStateOf(false) }
    var pendingExtractedData by remember { mutableStateOf<ExtractedCharacterData?>(null) }
    
    // File picker launcher
    val filePickerLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri: Uri? ->
        uri?.let {
            // Read file content
            try {
                val inputStream = context.contentResolver.openInputStream(uri)
                val content = inputStream?.bufferedReader()?.use { it.readText() } ?: ""
                val fileName = uri.lastPathSegment ?: "unknown"
                val fileType = when {
                    fileName.endsWith(".json") -> "json"
                    fileName.endsWith(".md") -> "markdown"
                    else -> "text"
                }
                viewModel.parseDocument(content, fileType)
            } catch (e: Exception) {
                viewModel.setError("Failed to read file: ${e.message}")
            }
        }
    }
    
    // Watch for extracted data
    LaunchedEffect(extractedData) {
        extractedData?.let {
            pendingExtractedData = it
            showExtractedDataDialog = true
            viewModel.clearExtractedData()
        }
    }
    
    LaunchedEffect(Unit) {
        viewModel.loadImports()
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
                    Text(
                        "Import Characters",
                        color = SynthColors.textPrimary
                    )
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary
                )
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { filePickerLauncher.launch("*/*") },
                containerColor = SynthColors.primary,
                contentColor = SynthColors.textPrimary
            ) {
                Icon(Icons.Default.FileOpen, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Import File")
            }
        },
        containerColor = SynthColors.background
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Tab row
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = SynthColors.backgroundSecondary,
                contentColor = SynthColors.textPrimary
            ) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    text = { Text("Import") }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    text = { Text("History") }
                )
            }
            
            when (selectedTab) {
                0 -> ImportTab(
                    isLoading = isLoading,
                    error = error,
                    onClearError = { viewModel.clearError() },
                    onPasteText = { text, type ->
                        viewModel.parseDocument(text, type)
                    }
                )
                1 -> HistoryTab(
                    imports = imports,
                    onViewImport = { /* TODO: Show import details */ }
                )
            }
        }
    }
    
    // Extracted data dialog
    if (showExtractedDataDialog && pendingExtractedData != null) {
        ExtractedDataDialog(
            data = pendingExtractedData!!,
            onDismiss = { 
                showExtractedDataDialog = false
                pendingExtractedData = null
            },
            onCreateCharacter = { data ->
                viewModel.createCharacterFromExtractedData(data) { characterId ->
                    showExtractedDataDialog = false
                    pendingExtractedData = null
                    onCharacterCreated(characterId)
                }
            }
        )
    }
}

@Composable
private fun ImportTab(
    isLoading: Boolean,
    error: String?,
    onClearError: () -> Unit,
    onPasteText: (String, String) -> Unit
) {
    var pastedText by remember { mutableStateOf("") }
    var selectedType by remember { mutableStateOf("text") }
    var expanded by remember { mutableStateOf(false) }
    
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Instructions
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
                shape = RoundedCornerShape(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Outlined.Info,
                            null,
                            tint = SynthColors.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "Import Character Data",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold,
                            color = SynthColors.textPrimary
                        )
                    }
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Text(
                        "Create characters from existing descriptions, stories, or character sheets. " +
                        "Supported formats:",
                        color = SynthColors.textSecondary
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    SupportedFormat(
                        icon = Icons.Outlined.Description,
                        title = "Text/Markdown",
                        description = "Character descriptions, bios, or roleplay profiles"
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    SupportedFormat(
                        icon = Icons.Outlined.Code,
                        title = "JSON",
                        description = "Structured character data with name, personality, etc."
                    )
                }
            }
        }
        
        // Error message
        error?.let {
            item {
                Card(
                    colors = CardDefaults.cardColors(containerColor = SynthColors.error.copy(alpha = 0.1f)),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Error,
                            null,
                            tint = SynthColors.error
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            it,
                            color = SynthColors.error,
                            modifier = Modifier.weight(1f)
                        )
                        IconButton(onClick = onClearError) {
                            Icon(
                                Icons.Default.Close,
                                null,
                                tint = SynthColors.error
                            )
                        }
                    }
                }
            }
        }
        
        // Paste text option
        item {
            Card(
                colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
                shape = RoundedCornerShape(16.dp)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        "Paste Character Data",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = SynthColors.textPrimary
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    // Format selector
                    ExposedDropdownMenuBox(
                        expanded = expanded,
                        onExpandedChange = { expanded = it }
                    ) {
                        OutlinedTextField(
                            value = when(selectedType) {
                                "json" -> "JSON"
                                "markdown" -> "Markdown"
                                else -> "Plain Text"
                            },
                            onValueChange = {},
                            readOnly = true,
                            label = { Text("Format") },
                            trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = expanded) },
                            modifier = Modifier
                                .fillMaxWidth()
                                .menuAnchor(),
                            colors = OutlinedTextFieldDefaults.colors(
                                unfocusedBorderColor = SynthColors.border,
                                focusedBorderColor = SynthColors.primary
                            )
                        )
                        
                        ExposedDropdownMenu(
                            expanded = expanded,
                            onDismissRequest = { expanded = false }
                        ) {
                            DropdownMenuItem(
                                text = { Text("Plain Text") },
                                onClick = {
                                    selectedType = "text"
                                    expanded = false
                                }
                            )
                            DropdownMenuItem(
                                text = { Text("Markdown") },
                                onClick = {
                                    selectedType = "markdown"
                                    expanded = false
                                }
                            )
                            DropdownMenuItem(
                                text = { Text("JSON") },
                                onClick = {
                                    selectedType = "json"
                                    expanded = false
                                }
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    // Text input
                    OutlinedTextField(
                        value = pastedText,
                        onValueChange = { pastedText = it },
                        label = { Text("Character Data") },
                        placeholder = { 
                            Text(
                                when(selectedType) {
                                    "json" -> "{ \"name\": \"Character Name\", ... }"
                                    else -> "Paste character description here..."
                                }
                            )
                        },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(200.dp),
                        colors = OutlinedTextFieldDefaults.colors(
                            unfocusedBorderColor = SynthColors.border,
                            focusedBorderColor = SynthColors.primary
                        )
                    )
                    
                    Spacer(modifier = Modifier.height(16.dp))
                    
                    Button(
                        onClick = {
                            if (pastedText.isNotBlank()) {
                                onPasteText(pastedText, selectedType)
                            }
                        },
                        enabled = pastedText.isNotBlank() && !isLoading,
                        modifier = Modifier.fillMaxWidth(),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = SynthColors.primary
                        )
                    ) {
                        if (isLoading) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(20.dp),
                                color = SynthColors.textPrimary,
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Default.AutoAwesome, null)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text("Extract Character")
                        }
                    }
                }
            }
        }
        
        item {
            Spacer(modifier = Modifier.height(80.dp)) // FAB space
        }
    }
}

@Composable
private fun SupportedFormat(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    title: String,
    description: String
) {
    Row(verticalAlignment = Alignment.Top) {
        Icon(
            icon,
            null,
            modifier = Modifier.size(20.dp),
            tint = SynthColors.textMuted
        )
        Spacer(modifier = Modifier.width(8.dp))
        Column {
            Text(
                title,
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium,
                color = SynthColors.textPrimary
            )
            Text(
                description,
                style = MaterialTheme.typography.bodySmall,
                color = SynthColors.textMuted
            )
        }
    }
}

@Composable
private fun HistoryTab(
    imports: List<SynthDocumentImport>,
    onViewImport: (SynthDocumentImport) -> Unit
) {
    if (imports.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Icon(
                    Icons.Outlined.History,
                    null,
                    modifier = Modifier.size(64.dp),
                    tint = SynthColors.textMuted
                )
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    "No import history",
                    style = MaterialTheme.typography.titleMedium,
                    color = SynthColors.textSecondary
                )
                Text(
                    "Your imported characters will appear here",
                    style = MaterialTheme.typography.bodyMedium,
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
            items(imports) { import ->
                ImportHistoryCard(
                    import = import,
                    onClick = { onViewImport(import) }
                )
            }
        }
    }
}

@Composable
private fun ImportHistoryCard(
    import: SynthDocumentImport,
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
            // File type icon
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(8.dp))
                    .background(SynthColors.backgroundSecondary),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    when (import.fileType) {
                        "json" -> Icons.Default.Code
                        "markdown" -> Icons.Default.Description
                        else -> Icons.Default.TextSnippet
                    },
                    null,
                    tint = SynthColors.primary
                )
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    import.fileName,
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium,
                    color = SynthColors.textPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Row(verticalAlignment = Alignment.CenterVertically) {
                    if (import.success) {
                        Icon(
                            Icons.Default.CheckCircle,
                            null,
                            modifier = Modifier.size(14.dp),
                            tint = SynthColors.success
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            "Imported successfully",
                            style = MaterialTheme.typography.labelSmall,
                            color = SynthColors.success
                        )
                    } else {
                        Icon(
                            Icons.Default.Error,
                            null,
                            modifier = Modifier.size(14.dp),
                            tint = SynthColors.error
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            "Import failed",
                            style = MaterialTheme.typography.labelSmall,
                            color = SynthColors.error
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    formatImportTime(import.createdAt),
                    style = MaterialTheme.typography.labelSmall,
                    color = SynthColors.textMuted
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
private fun ExtractedDataDialog(
    data: ExtractedCharacterData,
    onDismiss: () -> Unit,
    onCreateCharacter: (ExtractedCharacterData) -> Unit
) {
    var editedData by remember { mutableStateOf(data) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                "Character Extracted",
                style = MaterialTheme.typography.titleLarge
            )
        },
        text = {
            LazyColumn(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                item {
                    OutlinedTextField(
                        value = editedData.name,
                        onValueChange = { editedData = editedData.copy(name = it) },
                        label = { Text("Name") },
                        modifier = Modifier.fillMaxWidth(),
                        singleLine = true,
                        colors = OutlinedTextFieldDefaults.colors(
                            unfocusedBorderColor = SynthColors.border,
                            focusedBorderColor = SynthColors.primary
                        )
                    )
                }
                
                item {
                    OutlinedTextField(
                        value = editedData.description ?: "",
                        onValueChange = { editedData = editedData.copy(description = it) },
                        label = { Text("Description") },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(100.dp),
                        colors = OutlinedTextFieldDefaults.colors(
                            unfocusedBorderColor = SynthColors.border,
                            focusedBorderColor = SynthColors.primary
                        )
                    )
                }
                
                item {
                    OutlinedTextField(
                        value = editedData.personality ?: "",
                        onValueChange = { editedData = editedData.copy(personality = it) },
                        label = { Text("Personality") },
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(80.dp),
                        colors = OutlinedTextFieldDefaults.colors(
                            unfocusedBorderColor = SynthColors.border,
                            focusedBorderColor = SynthColors.primary
                        )
                    )
                }
                
                item {
                    OutlinedTextField(
                        value = editedData.greeting ?: "",
                        onValueChange = { editedData = editedData.copy(greeting = it) },
                        label = { Text("Greeting") },
                        modifier = Modifier.fillMaxWidth(),
                        colors = OutlinedTextFieldDefaults.colors(
                            unfocusedBorderColor = SynthColors.border,
                            focusedBorderColor = SynthColors.primary
                        )
                    )
                }
                
                if (!editedData.suggestedTraits.isNullOrEmpty()) {
                    item {
                        Text(
                            "Suggested Traits:",
                            style = MaterialTheme.typography.labelMedium,
                            color = SynthColors.textSecondary
                        )
                        Spacer(modifier = Modifier.height(4.dp))
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            editedData.suggestedTraits!!.take(5).forEach { trait ->
                                Surface(
                                    color = SynthColors.primary.copy(alpha = 0.2f),
                                    shape = RoundedCornerShape(16.dp)
                                ) {
                                    Text(
                                        trait,
                                        modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                                        style = MaterialTheme.typography.labelSmall,
                                        color = SynthColors.primary
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onCreateCharacter(editedData) },
                enabled = editedData.name.isNotBlank(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = SynthColors.primary
                )
            ) {
                Text("Create Character")
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

private fun formatImportTime(timestamp: Long): String {
    val sdf = SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault())
    return sdf.format(Date(timestamp))
}
