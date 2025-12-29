package com.universalmedialibrary.ui.aientertainment

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.SolidColor
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.aientertainment.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

// ==================== View Model ====================

data class SynthDocumentEditorState(
    val documents: List<DocumentWithCharacterName> = emptyList(),
    val currentDocument: SynthLocalDocument? = null,
    val isLoading: Boolean = false,
    val isSaving: Boolean = false,
    val hasUnsavedChanges: Boolean = false,
    val statusMessage: String? = null,
    val filterType: String? = null,
    val searchQuery: String = ""
)

@HiltViewModel
class SynthDocumentEditorViewModel @Inject constructor(
    private val repository: AIEntertainmentRepository
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(SynthDocumentEditorState())
    val uiState: StateFlow<SynthDocumentEditorState> = _uiState.asStateFlow()
    
    private var currentUserId: Long? = null
    
    fun setUserId(userId: Long) {
        if (currentUserId != userId) {
            currentUserId = userId
            loadDocuments()
        }
    }
    
    fun loadDocuments() {
        val userId = currentUserId ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                repository.getLocalDocumentsByUserId(userId).collect { docs ->
                    _uiState.value = _uiState.value.copy(
                        documents = docs,
                        isLoading = false
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error loading documents: ${e.message}"
                )
            }
        }
    }
    
    fun loadDocument(documentId: Long) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val document = repository.getLocalDocument(documentId)
                _uiState.value = _uiState.value.copy(
                    currentDocument = document,
                    isLoading = false,
                    hasUnsavedChanges = false
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error loading document: ${e.message}"
                )
            }
        }
    }
    
    fun createNewDocument(
        title: String,
        documentType: String = "general",
        format: String = "markdown",
        characterId: Long? = null
    ) {
        val userId = currentUserId ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val document = repository.createLocalDocument(
                    userId = userId,
                    title = title,
                    documentType = documentType,
                    format = format,
                    characterId = characterId
                )
                _uiState.value = _uiState.value.copy(
                    currentDocument = document,
                    isLoading = false,
                    hasUnsavedChanges = false,
                    statusMessage = "Document created"
                )
                loadDocuments()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error creating document: ${e.message}"
                )
            }
        }
    }
    
    fun updateContent(content: String) {
        val current = _uiState.value.currentDocument ?: return
        _uiState.value = _uiState.value.copy(
            currentDocument = current.copy(content = content),
            hasUnsavedChanges = true
        )
    }
    
    fun updateTitle(title: String) {
        val current = _uiState.value.currentDocument ?: return
        _uiState.value = _uiState.value.copy(
            currentDocument = current.copy(title = title),
            hasUnsavedChanges = true
        )
    }
    
    fun saveDocument() {
        val document = _uiState.value.currentDocument ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isSaving = true)
            try {
                repository.updateLocalDocument(document)
                _uiState.value = _uiState.value.copy(
                    isSaving = false,
                    hasUnsavedChanges = false,
                    statusMessage = "Document saved"
                )
                loadDocuments()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isSaving = false,
                    statusMessage = "Error saving: ${e.message}"
                )
            }
        }
    }
    
    fun deleteDocument(documentId: Long) {
        viewModelScope.launch {
            try {
                repository.deleteLocalDocument(documentId)
                if (_uiState.value.currentDocument?.id == documentId) {
                    _uiState.value = _uiState.value.copy(
                        currentDocument = null,
                        hasUnsavedChanges = false
                    )
                }
                _uiState.value = _uiState.value.copy(statusMessage = "Document deleted")
                loadDocuments()
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    statusMessage = "Error deleting: ${e.message}"
                )
            }
        }
    }
    
    fun exportCharacterToDocument(characterId: Long) {
        val userId = currentUserId ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val document = repository.exportCharacterToDocument(characterId, userId)
                if (document != null) {
                    _uiState.value = _uiState.value.copy(
                        currentDocument = document,
                        isLoading = false,
                        statusMessage = "Character exported to document"
                    )
                    loadDocuments()
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        statusMessage = "Failed to export character"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error exporting: ${e.message}"
                )
            }
        }
    }
    
    fun exportConversationToDocument(characterId: Long) {
        val userId = currentUserId ?: return
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isLoading = true)
            try {
                val document = repository.exportConversationToDocument(characterId, userId)
                if (document != null) {
                    _uiState.value = _uiState.value.copy(
                        currentDocument = document,
                        isLoading = false,
                        statusMessage = "Conversation exported to document"
                    )
                    loadDocuments()
                } else {
                    _uiState.value = _uiState.value.copy(
                        isLoading = false,
                        statusMessage = "No messages to export"
                    )
                }
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    statusMessage = "Error exporting: ${e.message}"
                )
            }
        }
    }
    
    fun setFilterType(type: String?) {
        _uiState.value = _uiState.value.copy(filterType = type)
    }
    
    fun searchDocuments(query: String) {
        val userId = currentUserId ?: return
        _uiState.value = _uiState.value.copy(searchQuery = query)
        
        if (query.isBlank()) {
            loadDocuments()
            return
        }
        
        viewModelScope.launch {
            try {
                val results = repository.searchLocalDocuments(userId, query)
                _uiState.value = _uiState.value.copy(documents = results)
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    statusMessage = "Search error: ${e.message}"
                )
            }
        }
    }
    
    fun clearCurrentDocument() {
        _uiState.value = _uiState.value.copy(
            currentDocument = null,
            hasUnsavedChanges = false
        )
    }
    
    fun clearStatusMessage() {
        _uiState.value = _uiState.value.copy(statusMessage = null)
    }
}

// ==================== Document List Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SynthDocumentListScreen(
    viewModel: SynthDocumentEditorViewModel,
    userId: Long,
    onNavigateToEditor: (Long) -> Unit,
    onBack: () -> Unit
) {
    val uiState by viewModel.uiState.collectAsState()
    var showNewDocumentDialog by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    
    LaunchedEffect(userId) {
        viewModel.setUserId(userId)
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("SynthChat Documents", fontWeight = FontWeight.SemiBold) },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showNewDocumentDialog = true }) {
                        Icon(Icons.Filled.Add, contentDescription = "New Document")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Search Bar
            OutlinedTextField(
                value = searchQuery,
                onValueChange = { 
                    searchQuery = it
                    viewModel.searchDocuments(it)
                },
                placeholder = { Text("Search documents...") },
                leadingIcon = { Icon(Icons.Filled.Search, contentDescription = null) },
                trailingIcon = {
                    if (searchQuery.isNotEmpty()) {
                        IconButton(onClick = { 
                            searchQuery = ""
                            viewModel.searchDocuments("")
                        }) {
                            Icon(Icons.Filled.Clear, contentDescription = "Clear")
                        }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                singleLine = true
            )
            
            // Document Type Filters
            LazyRow(
                modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                item {
                    FilterChip(
                        selected = uiState.filterType == null,
                        onClick = { viewModel.setFilterType(null) },
                        label = { Text("All") }
                    )
                }
                items(SynthLocalDocument.documentTypes) { (type, name) ->
                    FilterChip(
                        selected = uiState.filterType == type,
                        onClick = { viewModel.setFilterType(type) },
                        label = { Text(name) }
                    )
                }
            }
            
            // Document List
            if (uiState.isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else {
                val filteredDocs = if (uiState.filterType != null) {
                    uiState.documents.filter { it.document.documentType == uiState.filterType }
                } else {
                    uiState.documents
                }
                
                if (filteredDocs.isEmpty()) {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        Column(horizontalAlignment = Alignment.CenterHorizontally) {
                            Icon(
                                Icons.Filled.Description,
                                contentDescription = null,
                                modifier = Modifier.size(64.dp),
                                tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)
                            )
                            Spacer(modifier = Modifier.height(16.dp))
                            Text(
                                "No documents found",
                                style = MaterialTheme.typography.bodyLarge,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                            TextButton(onClick = { showNewDocumentDialog = true }) {
                                Text("Create your first document")
                            }
                        }
                    }
                } else {
                    LazyColumn(
                        modifier = Modifier.fillMaxSize(),
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(filteredDocs) { docWithName ->
                            DocumentListItem(
                                document = docWithName.document,
                                characterName = docWithName.characterName,
                                onClick = { onNavigateToEditor(docWithName.document.id) },
                                onDelete = { viewModel.deleteDocument(docWithName.document.id) }
                            )
                        }
                    }
                }
            }
        }
    }
    
    // New Document Dialog
    if (showNewDocumentDialog) {
        NewDocumentDialog(
            onDismiss = { showNewDocumentDialog = false },
            onCreate = { title, type, format ->
                viewModel.createNewDocument(title, type, format)
                showNewDocumentDialog = false
            }
        )
    }
    
    // Status message snackbar
    uiState.statusMessage?.let { message ->
        LaunchedEffect(message) {
            kotlinx.coroutines.delay(3000)
            viewModel.clearStatusMessage()
        }
    }
}

@Composable
private fun DocumentListItem(
    document: SynthLocalDocument,
    characterName: String?,
    onClick: () -> Unit,
    onDelete: () -> Unit
) {
    var showDeleteConfirm by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Document type icon
            Text(
                text = document.documentTypeIcon,
                fontSize = 32.sp,
                modifier = Modifier.padding(end = 16.dp)
            )
            
            // Document info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = document.title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = document.documentTypeDisplayName,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                    
                    Text(
                        text = "•",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    Text(
                        text = document.formatDisplayName,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                if (characterName != null) {
                    Text(
                        text = "Linked to: $characterName",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.secondary
                    )
                }
                
                Text(
                    text = "v${document.version} • ${formatTimestamp(document.updatedAt)}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
                )
            }
            
            // Delete button
            IconButton(onClick = { showDeleteConfirm = true }) {
                Icon(
                    Icons.Filled.Delete,
                    contentDescription = "Delete",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
    
    if (showDeleteConfirm) {
        AlertDialog(
            onDismissRequest = { showDeleteConfirm = false },
            title = { Text("Delete Document?") },
            text = { Text("Are you sure you want to delete \"${document.title}\"? This cannot be undone.") },
            confirmButton = {
                TextButton(
                    onClick = {
                        onDelete()
                        showDeleteConfirm = false
                    }
                ) {
                    Text("Delete", color = MaterialTheme.colorScheme.error)
                }
            },
            dismissButton = {
                TextButton(onClick = { showDeleteConfirm = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}

@Composable
private fun NewDocumentDialog(
    onDismiss: () -> Unit,
    onCreate: (title: String, type: String, format: String) -> Unit
) {
    var title by remember { mutableStateOf("") }
    var selectedType by remember { mutableStateOf("general") }
    var selectedFormat by remember { mutableStateOf("markdown") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("New Document") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(16.dp)) {
                OutlinedTextField(
                    value = title,
                    onValueChange = { title = it },
                    label = { Text("Title") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                Text("Document Type", style = MaterialTheme.typography.labelMedium)
                LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    items(SynthLocalDocument.documentTypes) { (type, name) ->
                        FilterChip(
                            selected = selectedType == type,
                            onClick = { selectedType = type },
                            label = { Text(name) }
                        )
                    }
                }
                
                Text("Format", style = MaterialTheme.typography.labelMedium)
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    SynthLocalDocument.formats.forEach { (format, name) ->
                        FilterChip(
                            selected = selectedFormat == format,
                            onClick = { selectedFormat = format },
                            label = { Text(name) }
                        )
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = { onCreate(title.ifBlank { "Untitled" }, selectedType, selectedFormat) },
                enabled = title.isNotBlank()
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

// ==================== Document Editor Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SynthDocumentEditorScreen(
    viewModel: SynthDocumentEditorViewModel,
    documentId: Long,
    onBack: () -> Unit
) {
    val uiState by viewModel.uiState.collectAsState()
    var showMetadataDialog by remember { mutableStateOf(false) }
    
    LaunchedEffect(documentId) {
        viewModel.loadDocument(documentId)
    }
    
    val document = uiState.currentDocument
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    if (document != null) {
                        Column {
                            Text(
                                document.title,
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.SemiBold
                            )
                            Text(
                                "${document.documentTypeDisplayName} • ${document.formatDisplayName}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    } else {
                        Text("Document Editor")
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    if (uiState.hasUnsavedChanges) {
                        Badge(
                            modifier = Modifier.padding(end = 8.dp)
                        ) {
                            Text("Unsaved")
                        }
                    }
                    
                    IconButton(onClick = { showMetadataDialog = true }) {
                        Icon(Icons.Filled.Info, contentDescription = "Document Info")
                    }
                    
                    IconButton(
                        onClick = { viewModel.saveDocument() },
                        enabled = uiState.hasUnsavedChanges && !uiState.isSaving
                    ) {
                        if (uiState.isSaving) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(24.dp),
                                strokeWidth = 2.dp
                            )
                        } else {
                            Icon(Icons.Filled.Save, contentDescription = "Save")
                        }
                    }
                }
            )
        }
    ) { paddingValues ->
        if (uiState.isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        } else if (document != null) {
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                // Title editor
                OutlinedTextField(
                    value = document.title,
                    onValueChange = { viewModel.updateTitle(it) },
                    label = { Text("Title") },
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 16.dp, vertical = 8.dp),
                    singleLine = true
                )
                
                HorizontalDivider()
                
                // Content editor
                DocumentContentEditor(
                    content = document.content,
                    format = document.format,
                    onContentChange = { viewModel.updateContent(it) },
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(16.dp)
                )
            }
        } else {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.Center
            ) {
                Text("Document not found")
            }
        }
    }
    
    // Metadata dialog
    if (showMetadataDialog && document != null) {
        DocumentMetadataDialog(
            document = document,
            onDismiss = { showMetadataDialog = false }
        )
    }
    
    // Status message snackbar
    uiState.statusMessage?.let { message ->
        LaunchedEffect(message) {
            kotlinx.coroutines.delay(3000)
            viewModel.clearStatusMessage()
        }
    }
}

@Composable
private fun DocumentContentEditor(
    content: String,
    format: String,
    onContentChange: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberScrollState()
    
    // Use monospace font for code-like formats
    val textStyle = if (format in listOf("json", "yaml")) {
        TextStyle(
            fontFamily = FontFamily.Monospace,
            fontSize = 14.sp,
            color = MaterialTheme.colorScheme.onSurface
        )
    } else {
        TextStyle(
            fontSize = 16.sp,
            lineHeight = 24.sp,
            color = MaterialTheme.colorScheme.onSurface
        )
    }
    
    Box(
        modifier = modifier
            .clip(RoundedCornerShape(8.dp))
            .background(MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f))
            .padding(12.dp)
    ) {
        BasicTextField(
            value = content,
            onValueChange = onContentChange,
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(scrollState),
            textStyle = textStyle,
            cursorBrush = SolidColor(MaterialTheme.colorScheme.primary),
            decorationBox = { innerTextField ->
                if (content.isEmpty()) {
                    Text(
                        "Start writing...",
                        style = textStyle.copy(
                            color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.5f)
                        )
                    )
                }
                innerTextField()
            }
        )
    }
}

@Composable
private fun DocumentMetadataDialog(
    document: SynthLocalDocument,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Document Info") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                MetadataRow("Title", document.title)
                MetadataRow("Type", document.documentTypeDisplayName)
                MetadataRow("Format", document.formatDisplayName)
                MetadataRow("Version", "v${document.version}")
                MetadataRow("Created", formatTimestamp(document.createdAt))
                MetadataRow("Last Modified", formatTimestamp(document.updatedAt))
                MetadataRow("Template", if (document.isTemplate) "Yes" else "No")
                MetadataRow("Shared", if (document.isShared) "Yes" else "No")
                
                val tags = document.getTagsList()
                if (tags.isNotEmpty()) {
                    MetadataRow("Tags", tags.joinToString(", "))
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

@Composable
private fun MetadataRow(label: String, value: String) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium
        )
    }
}

// ==================== Utility Functions ====================

private fun formatTimestamp(timestamp: Long): String {
    val sdf = java.text.SimpleDateFormat("MMM d, yyyy h:mm a", java.util.Locale.getDefault())
    return sdf.format(java.util.Date(timestamp))
}
