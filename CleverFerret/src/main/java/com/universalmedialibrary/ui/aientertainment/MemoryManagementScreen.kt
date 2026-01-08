package com.universalmedialibrary.ui.aientertainment

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.*
import com.universalmedialibrary.services.aientertainment.StorageState
import java.text.SimpleDateFormat
import java.util.*

// ==================== Memory Management Screen ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MemoryManagementScreen(
    characterId: Long,
    characterName: String,
    onNavigateBack: () -> Unit,
    viewModel: MemoryManagementViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val memories by viewModel.memories.collectAsState()
    val categories by viewModel.categories.collectAsState()
    val memoryStats by viewModel.memoryStats.collectAsState()
    val storageStates by viewModel.storageStates.collectAsState()
    
    var selectedTab by remember { mutableStateOf(0) }
    var showAddMemoryDialog by remember { mutableStateOf(false) }
    var showStorageDialog by remember { mutableStateOf(false) }
    var showExportDialog by remember { mutableStateOf(false) }
    var selectedMemory by remember { mutableStateOf<SynthMemory?>(null) }
    var selectedCategoryId by remember { mutableStateOf<Long?>(null) }
    
    LaunchedEffect(characterId) {
        viewModel.loadCharacterMemories(characterId)
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
                    Column {
                        Text(
                            "$characterName's Memories",
                            style = MaterialTheme.typography.titleMedium,
                            color = SynthColors.textPrimary
                        )
                        Text(
                            "${memoryStats?.totalMemories ?: 0} memories",
                            style = MaterialTheme.typography.bodySmall,
                            color = SynthColors.textSecondary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary
                ),
                actions = {
                    IconButton(onClick = { showStorageDialog = true }) {
                        Icon(Icons.Outlined.Storage, "Storage", tint = SynthColors.textPrimary)
                    }
                    IconButton(onClick = { showExportDialog = true }) {
                        Icon(Icons.Outlined.FileDownload, "Export", tint = SynthColors.textPrimary)
                    }
                    IconButton(onClick = { showAddMemoryDialog = true }) {
                        Icon(Icons.Outlined.Add, "Add Memory", tint = SynthColors.primary)
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
            // Tab Row
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = SynthColors.backgroundSecondary,
                contentColor = SynthColors.primary
            ) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    text = { Text("All") },
                    icon = { Icon(Icons.Outlined.List, null) }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    text = { Text("Categories") },
                    icon = { Icon(Icons.Outlined.Category, null) }
                )
                Tab(
                    selected = selectedTab == 2,
                    onClick = { selectedTab = 2 },
                    text = { Text("Stats") },
                    icon = { Icon(Icons.Outlined.Analytics, null) }
                )
            }
            
            when (selectedTab) {
                0 -> MemoriesListTab(
                    memories = memories,
                    categories = categories,
                    selectedCategoryId = selectedCategoryId,
                    onCategorySelected = { selectedCategoryId = it },
                    onMemoryClick = { selectedMemory = it },
                    onMemoryPin = { viewModel.toggleMemoryPinned(it) },
                    onMemoryArchive = { viewModel.archiveMemory(it) },
                    isLoading = uiState.isLoading
                )
                1 -> CategoriesTab(
                    categories = categories,
                    memories = memories,
                    onCategoryClick = { categoryId ->
                        selectedCategoryId = categoryId
                        selectedTab = 0
                    }
                )
                2 -> StatsTab(
                    stats = memoryStats,
                    storageStates = storageStates
                )
            }
        }
    }
    
    // Add Memory Dialog
    if (showAddMemoryDialog) {
        AddMemoryDialog(
            categories = categories,
            onDismiss = { showAddMemoryDialog = false },
            onConfirm = { key, content, memoryType, categoryId, importance ->
                viewModel.createMemory(
                    characterId = characterId,
                    key = key,
                    content = content,
                    memoryType = memoryType,
                    categoryId = categoryId,
                    importance = importance
                )
                showAddMemoryDialog = false
            }
        )
    }
    
    // Memory Detail Dialog
    selectedMemory?.let { memory ->
        MemoryDetailDialog(
            memory = memory,
            categories = categories,
            onDismiss = { selectedMemory = null },
            onUpdate = { updated ->
                viewModel.updateMemory(updated)
                selectedMemory = null
            },
            onDelete = {
                viewModel.deleteMemory(memory.id)
                selectedMemory = null
            }
        )
    }
    
    // Storage Dialog
    if (showStorageDialog) {
        StorageManagementDialog(
            storageStates = storageStates,
            onDismiss = { showStorageDialog = false },
            onSelectStorage = { storage ->
                viewModel.setStorageLocation(storage)
                showStorageDialog = false
            }
        )
    }
    
    // Export Dialog
    if (showExportDialog) {
        ExportMemoriesDialog(
            characterName = characterName,
            memoryCount = memories.size,
            storageStates = storageStates,
            onDismiss = { showExportDialog = false },
            onExport = { storageState, options ->
                viewModel.exportMemories(characterId, characterName, storageState, options)
                showExportDialog = false
            }
        )
    }
}

// ==================== Memories List Tab ====================

@Composable
private fun MemoriesListTab(
    memories: List<SynthMemory>,
    categories: List<SynthMemoryCategory>,
    selectedCategoryId: Long?,
    onCategorySelected: (Long?) -> Unit,
    onMemoryClick: (SynthMemory) -> Unit,
    onMemoryPin: (SynthMemory) -> Unit,
    onMemoryArchive: (SynthMemory) -> Unit,
    isLoading: Boolean
) {
    Column(modifier = Modifier.fillMaxSize()) {
        // Category filter chips
        LazyRow(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp, vertical = 8.dp),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            item {
                FilterChip(
                    selected = selectedCategoryId == null,
                    onClick = { onCategorySelected(null) },
                    label = { Text("All") },
                    leadingIcon = if (selectedCategoryId == null) {
                        { Icon(Icons.Default.Check, null, Modifier.size(16.dp)) }
                    } else null
                )
            }
            
            items(categories) { category ->
                FilterChip(
                    selected = selectedCategoryId == category.id,
                    onClick = { onCategorySelected(category.id) },
                    label = { Text("${category.icon} ${category.name}") },
                    leadingIcon = if (selectedCategoryId == category.id) {
                        { Icon(Icons.Default.Check, null, Modifier.size(16.dp)) }
                    } else null
                )
            }
        }
        
        // Memory list
        if (isLoading) {
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = SynthColors.primary)
            }
        } else {
            val filteredMemories = if (selectedCategoryId != null) {
                memories.filter { it.categoryId == selectedCategoryId }
            } else {
                memories
            }
            
            if (filteredMemories.isEmpty()) {
                EmptyMemoriesState()
            } else {
                LazyColumn(
                    modifier = Modifier.fillMaxSize(),
                    contentPadding = PaddingValues(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(filteredMemories, key = { it.id }) { memory ->
                        MemoryCard(
                            memory = memory,
                            category = categories.find { it.id == memory.categoryId },
                            onClick = { onMemoryClick(memory) },
                            onPin = { onMemoryPin(memory) },
                            onArchive = { onMemoryArchive(memory) }
                        )
                    }
                }
            }
        }
    }
}

@OptIn(ExperimentalFoundationApi::class)
@Composable
private fun MemoryCard(
    memory: SynthMemory,
    category: SynthMemoryCategory?,
    onClick: () -> Unit,
    onPin: () -> Unit,
    onArchive: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .combinedClickable(
                onClick = onClick,
                onLongClick = onArchive
            ),
        colors = CardDefaults.cardColors(
            containerColor = if (memory.isPinned) 
                SynthColors.primary.copy(alpha = 0.1f) 
            else 
                SynthColors.surface
        ),
        border = BorderStroke(
            1.dp, 
            if (memory.isPinned) SynthColors.primary.copy(alpha = 0.3f) else SynthColors.border
        )
    ) {
        Column(
            modifier = Modifier.padding(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.Top
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    modifier = Modifier.weight(1f)
                ) {
                    Text(
                        text = memory.typeIcon,
                        fontSize = 20.sp
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Column {
                        Text(
                            text = memory.key,
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.SemiBold,
                            color = SynthColors.textPrimary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                        if (category != null) {
                            Text(
                                text = "${category.icon} ${category.name}",
                                style = MaterialTheme.typography.labelSmall,
                                color = SynthColors.textSecondary
                            )
                        }
                    }
                }
                
                Row {
                    if (memory.isPinned) {
                        Icon(
                            Icons.Default.PushPin,
                            contentDescription = "Pinned",
                            tint = SynthColors.primary,
                            modifier = Modifier.size(18.dp)
                        )
                    }
                    
                    // Importance indicator
                    ImportanceIndicator(memory.importance)
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = memory.content,
                style = MaterialTheme.typography.bodyMedium,
                color = SynthColors.textPrimary,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Tags
                if (memory.getTagsList().isNotEmpty()) {
                    Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                        memory.getTagsList().take(3).forEach { tag ->
                            Surface(
                                color = SynthColors.primary.copy(alpha = 0.1f),
                                shape = RoundedCornerShape(4.dp)
                            ) {
                                Text(
                                    text = tag,
                                    style = MaterialTheme.typography.labelSmall,
                                    color = SynthColors.primary,
                                    modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                                )
                            }
                        }
                    }
                }
                
                // Meta info
                Text(
                    text = "${memory.accessCount} views • ${formatRelativeTime(memory.createdAt)}",
                    style = MaterialTheme.typography.labelSmall,
                    color = SynthColors.textMuted
                )
            }
        }
    }
}

@Composable
private fun ImportanceIndicator(importance: Float) {
    val color = when {
        importance >= 0.8f -> SynthColors.error
        importance >= 0.6f -> SynthColors.warning
        importance >= 0.4f -> SynthColors.success
        else -> SynthColors.textMuted
    }
    
    Box(
        modifier = Modifier
            .size(8.dp)
            .clip(CircleShape)
            .background(color)
    )
}

@Composable
private fun EmptyMemoriesState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Outlined.Psychology,
                contentDescription = "Media image",
                modifier = Modifier.size(64.dp),
                tint = SynthColors.textMuted
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "No Memories Yet",
                style = MaterialTheme.typography.titleMedium,
                color = SynthColors.textPrimary
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Memories will be created as you chat with this character, or you can add them manually.",
                style = MaterialTheme.typography.bodyMedium,
                color = SynthColors.textSecondary,
                textAlign = TextAlign.Center
            )
        }
    }
}

// ==================== Categories Tab ====================

@Composable
private fun CategoriesTab(
    categories: List<SynthMemoryCategory>,
    memories: List<SynthMemory>,
    onCategoryClick: (Long) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(categories) { category ->
            val memoryCount = memories.count { it.categoryId == category.id }
            
            Card(
                onClick = { onCategoryClick(category.id) },
                colors = CardDefaults.cardColors(containerColor = SynthColors.surface)
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
                            .clip(RoundedCornerShape(12.dp))
                            .background(Color(category.color).copy(alpha = 0.2f)),
                        contentAlignment = Alignment.Center
                    ) {
                        Text(text = category.icon, fontSize = 24.sp)
                    }
                    
                    Spacer(modifier = Modifier.width(16.dp))
                    
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = category.name,
                            style = MaterialTheme.typography.titleMedium,
                            color = SynthColors.textPrimary
                        )
                        Text(
                            text = category.description,
                            style = MaterialTheme.typography.bodySmall,
                            color = SynthColors.textSecondary,
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                    
                    Badge(
                        containerColor = SynthColors.primary.copy(alpha = 0.1f),
                        contentColor = SynthColors.primary
                    ) {
                        Text("$memoryCount")
                    }
                }
            }
        }
    }
}

// ==================== Stats Tab ====================

@Composable
private fun StatsTab(
    stats: MemoryStats?,
    storageStates: List<StorageState>
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text(
                text = "Memory Statistics",
                style = MaterialTheme.typography.titleMedium,
                color = SynthColors.textPrimary
            )
        }
        
        if (stats != null) {
            item {
                StatsGrid(stats)
            }
        }
        
        item {
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Storage",
                style = MaterialTheme.typography.titleMedium,
                color = SynthColors.textPrimary
            )
        }
        
        items(storageStates) { storage ->
            StorageCard(storage)
        }
    }
}

@Composable
private fun StatsGrid(stats: MemoryStats) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                StatItem("Total", stats.totalMemories.toString(), "📚")
                StatItem("Pinned", stats.pinnedCount.toString(), "📌")
                StatItem("Archived", stats.archivedCount.toString(), "🗃️")
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                StatItem("Categories", stats.totalCategories.toString(), "📁")
                StatItem("Blocks", stats.totalBlocks.toString(), "🧱")
                StatItem("Avg Importance", "%.0f%%".format(stats.avgImportance * 100), "⭐")
            }
        }
    }
}

@Composable
private fun StatItem(label: String, value: String, emoji: String) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(text = emoji, fontSize = 24.sp)
        Spacer(modifier = Modifier.height(4.dp))
        Text(
            text = value,
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold,
            color = SynthColors.textPrimary
        )
        Text(
            text = label,
            style = MaterialTheme.typography.labelSmall,
            color = SynthColors.textSecondary
        )
    }
}

@Composable
private fun StorageCard(storage: StorageState) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        when (storage.type.name) {
                            "SD_CARD" -> Icons.Outlined.SdCard
                            "EXTERNAL" -> Icons.Outlined.SdStorage
                            else -> Icons.Outlined.PhoneAndroid
                        },
                        contentDescription = "Media image",
                        tint = SynthColors.primary
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        text = storage.displayName,
                        style = MaterialTheme.typography.titleSmall,
                        color = SynthColors.textPrimary
                    )
                }
                
                if (storage.isAvailable) {
                    Badge(
                        containerColor = SynthColors.success.copy(alpha = 0.1f),
                        contentColor = SynthColors.success
                    ) {
                        Text("Available")
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            LinearProgressIndicator(
                progress = { storage.usagePercent },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(8.dp)
                    .clip(RoundedCornerShape(4.dp)),
                color = if (storage.usagePercent > 0.9f) SynthColors.error else SynthColors.primary,
                trackColor = SynthColors.backgroundSecondary
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text(
                    text = "%.1f GB free".format(storage.availableGb),
                    style = MaterialTheme.typography.bodySmall,
                    color = SynthColors.textSecondary
                )
                Text(
                    text = "%.1f GB total".format(storage.totalGb),
                    style = MaterialTheme.typography.bodySmall,
                    color = SynthColors.textSecondary
                )
            }
        }
    }
}

// ==================== Dialogs ====================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AddMemoryDialog(
    categories: List<SynthMemoryCategory>,
    onDismiss: () -> Unit,
    onConfirm: (key: String, content: String, memoryType: String, categoryId: Long?, importance: Float) -> Unit
) {
    var key by remember { mutableStateOf("") }
    var content by remember { mutableStateOf("") }
    var memoryType by remember { mutableStateOf("fact") }
    var selectedCategory by remember { mutableStateOf<SynthMemoryCategory?>(null) }
    var importance by remember { mutableFloatStateOf(0.5f) }
    
    val memoryTypes = listOf("fact", "preference", "event", "relationship", "skill", "goal")
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add New Memory") },
        text = {
            Column(
                modifier = Modifier.verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                OutlinedTextField(
                    value = key,
                    onValueChange = { key = it },
                    label = { Text("Key/Title") },
                    placeholder = { Text("e.g., user_name, favorite_color") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                OutlinedTextField(
                    value = content,
                    onValueChange = { content = it },
                    label = { Text("Content") },
                    placeholder = { Text("What to remember...") },
                    modifier = Modifier.fillMaxWidth(),
                    minLines = 3,
                    maxLines = 5
                )
                
                // Memory Type dropdown
                var typeExpanded by remember { mutableStateOf(false) }
                ExposedDropdownMenuBox(
                    expanded = typeExpanded,
                    onExpandedChange = { typeExpanded = it }
                ) {
                    OutlinedTextField(
                        value = memoryType.replaceFirstChar { it.uppercase() },
                        onValueChange = {},
                        readOnly = true,
                        label = { Text("Type") },
                        trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = typeExpanded) },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor()
                    )
                    ExposedDropdownMenu(
                        expanded = typeExpanded,
                        onDismissRequest = { typeExpanded = false }
                    ) {
                        memoryTypes.forEach { type ->
                            DropdownMenuItem(
                                text = { Text(type.replaceFirstChar { it.uppercase() }) },
                                onClick = {
                                    memoryType = type
                                    typeExpanded = false
                                }
                            )
                        }
                    }
                }
                
                // Category dropdown
                var categoryExpanded by remember { mutableStateOf(false) }
                ExposedDropdownMenuBox(
                    expanded = categoryExpanded,
                    onExpandedChange = { categoryExpanded = it }
                ) {
                    OutlinedTextField(
                        value = selectedCategory?.let { "${it.icon} ${it.name}" } ?: "None",
                        onValueChange = {},
                        readOnly = true,
                        label = { Text("Category") },
                        trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded = categoryExpanded) },
                        modifier = Modifier
                            .fillMaxWidth()
                            .menuAnchor()
                    )
                    ExposedDropdownMenu(
                        expanded = categoryExpanded,
                        onDismissRequest = { categoryExpanded = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("None") },
                            onClick = {
                                selectedCategory = null
                                categoryExpanded = false
                            }
                        )
                        categories.forEach { category ->
                            DropdownMenuItem(
                                text = { Text("${category.icon} ${category.name}") },
                                onClick = {
                                    selectedCategory = category
                                    categoryExpanded = false
                                }
                            )
                        }
                    }
                }
                
                // Importance slider
                Column {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("Importance", style = MaterialTheme.typography.bodyMedium)
                        Text(
                            "%.0f%%".format(importance * 100),
                            style = MaterialTheme.typography.bodyMedium,
                            color = SynthColors.primary
                        )
                    }
                    Slider(
                        value = importance,
                        onValueChange = { importance = it },
                        valueRange = 0f..1f,
                        steps = 9
                    )
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(key, content, memoryType, selectedCategory?.id, importance) },
                enabled = key.isNotBlank() && content.isNotBlank()
            ) {
                Text("Add Memory")
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
private fun MemoryDetailDialog(
    memory: SynthMemory,
    categories: List<SynthMemoryCategory>,
    onDismiss: () -> Unit,
    onUpdate: (SynthMemory) -> Unit,
    onDelete: () -> Unit
) {
    var editedContent by remember { mutableStateOf(memory.content) }
    var editedImportance by remember { mutableFloatStateOf(memory.importance) }
    var isPinned by remember { mutableStateOf(memory.isPinned) }
    var showDeleteConfirm by remember { mutableStateOf(false) }
    
    val category = categories.find { it.id == memory.categoryId }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Text(text = memory.typeIcon, fontSize = 24.sp)
                Spacer(modifier = Modifier.width(8.dp))
                Text(memory.key)
            }
        },
        text = {
            Column(
                modifier = Modifier.verticalScroll(rememberScrollState()),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // Category badge
                if (category != null) {
                    Surface(
                        color = Color(category.color).copy(alpha = 0.1f),
                        shape = RoundedCornerShape(8.dp)
                    ) {
                        Text(
                            text = "${category.icon} ${category.name}",
                            style = MaterialTheme.typography.labelMedium,
                            modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp)
                        )
                    }
                }
                
                // Content
                OutlinedTextField(
                    value = editedContent,
                    onValueChange = { editedContent = it },
                    label = { Text("Content") },
                    modifier = Modifier.fillMaxWidth(),
                    minLines = 3,
                    maxLines = 6
                )
                
                // Importance
                Column {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("Importance")
                        Text("%.0f%%".format(editedImportance * 100), color = SynthColors.primary)
                    }
                    Slider(
                        value = editedImportance,
                        onValueChange = { editedImportance = it },
                        valueRange = 0f..1f,
                        steps = 9
                    )
                }
                
                // Pin toggle
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Pin Memory")
                    Switch(
                        checked = isPinned,
                        onCheckedChange = { isPinned = it }
                    )
                }
                
                Divider()
                
                // Meta info
                Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                    Text(
                        text = "Created: ${formatDateTime(memory.createdAt)}",
                        style = MaterialTheme.typography.bodySmall,
                        color = SynthColors.textSecondary
                    )
                    Text(
                        text = "Accessed: ${memory.accessCount} times",
                        style = MaterialTheme.typography.bodySmall,
                        color = SynthColors.textSecondary
                    )
                    memory.lastAccessedAt?.let { lastAccess ->
                        Text(
                            text = "Last accessed: ${formatDateTime(lastAccess)}",
                            style = MaterialTheme.typography.bodySmall,
                            color = SynthColors.textSecondary
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    onUpdate(memory.copy(
                        content = editedContent,
                        importance = editedImportance,
                        isPinned = isPinned,
                        updatedAt = System.currentTimeMillis()
                    ))
                }
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            Row {
                TextButton(
                    onClick = { showDeleteConfirm = true },
                    colors = ButtonDefaults.textButtonColors(contentColor = SynthColors.error)
                ) {
                    Text("Delete")
                }
                TextButton(onClick = onDismiss) {
                    Text("Cancel")
                }
            }
        },
        containerColor = SynthColors.surface
    )
    
    if (showDeleteConfirm) {
        AlertDialog(
            onDismissRequest = { showDeleteConfirm = false },
            title = { Text("Delete Memory?") },
            text = { Text("This will permanently delete this memory. This action cannot be undone.") },
            confirmButton = {
                Button(
                    onClick = {
                        showDeleteConfirm = false
                        onDelete()
                    },
                    colors = ButtonDefaults.buttonColors(containerColor = SynthColors.error)
                ) {
                    Text("Delete")
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
private fun StorageManagementDialog(
    storageStates: List<StorageState>,
    onDismiss: () -> Unit,
    onSelectStorage: (StorageState) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Storage Management") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(
                    text = "Select where to store memories:",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SynthColors.textSecondary
                )
                
                storageStates.forEach { storage ->
                    Card(
                        onClick = { onSelectStorage(storage) },
                        colors = CardDefaults.cardColors(containerColor = SynthColors.backgroundSecondary),
                        enabled = storage.isAvailable
                    ) {
                        Row(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                when (storage.type.name) {
                                    "SD_CARD" -> Icons.Outlined.SdCard
                                    "EXTERNAL" -> Icons.Outlined.SdStorage
                                    else -> Icons.Outlined.PhoneAndroid
                                },
                                contentDescription = "Media image",
                                tint = if (storage.isAvailable) SynthColors.primary else SynthColors.textMuted
                            )
                            
                            Spacer(modifier = Modifier.width(12.dp))
                            
                            Column(modifier = Modifier.weight(1f)) {
                                Text(
                                    text = storage.displayName,
                                    style = MaterialTheme.typography.titleSmall
                                )
                                Text(
                                    text = "%.1f GB free of %.1f GB".format(storage.availableGb, storage.totalGb),
                                    style = MaterialTheme.typography.bodySmall,
                                    color = SynthColors.textSecondary
                                )
                            }
                            
                            if (!storage.isAvailable) {
                                Text(
                                    text = "Unavailable",
                                    style = MaterialTheme.typography.labelSmall,
                                    color = SynthColors.error
                                )
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {},
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        },
        containerColor = SynthColors.surface
    )
}

@Composable
private fun ExportMemoriesDialog(
    characterName: String,
    memoryCount: Int,
    storageStates: List<StorageState>,
    onDismiss: () -> Unit,
    onExport: (StorageState, MemoryExportOptions) -> Unit
) {
    var selectedStorage by remember { mutableStateOf(storageStates.firstOrNull()) }
    var compress by remember { mutableStateOf(true) }
    var includeMetadata by remember { mutableStateOf(true) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Export Memories") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(
                    text = "Export $memoryCount memories for $characterName",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SynthColors.textSecondary
                )
                
                Text(
                    text = "Destination:",
                    style = MaterialTheme.typography.labelMedium,
                    color = SynthColors.textPrimary
                )
                
                storageStates.filter { it.isAvailable }.forEach { storage ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedStorage = storage }
                            .padding(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = selectedStorage == storage,
                            onClick = { selectedStorage = storage }
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(storage.displayName)
                    }
                }
                
                Divider()
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Compress archive")
                    Switch(checked = compress, onCheckedChange = { compress = it })
                }
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Include metadata")
                    Switch(checked = includeMetadata, onCheckedChange = { includeMetadata = it })
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    selectedStorage?.let { storage ->
                        onExport(storage, MemoryExportOptions(
                            compress = compress,
                            includeMetadata = includeMetadata
                        ))
                    }
                },
                enabled = selectedStorage != null
            ) {
                Icon(Icons.Default.FileDownload, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Export")
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

// ==================== Utility Functions ====================

private fun formatRelativeTime(timestamp: Long): String {
    val now = System.currentTimeMillis()
    val diff = now - timestamp
    
    return when {
        diff < 60_000 -> "now"
        diff < 3_600_000 -> "${diff / 60_000}m ago"
        diff < 86_400_000 -> "${diff / 3_600_000}h ago"
        diff < 604_800_000 -> "${diff / 86_400_000}d ago"
        else -> SimpleDateFormat("MMM dd", Locale.getDefault()).format(Date(timestamp))
    }
}

private fun formatDateTime(timestamp: Long): String {
    return SimpleDateFormat("MMM dd, yyyy HH:mm", Locale.getDefault()).format(Date(timestamp))
}
