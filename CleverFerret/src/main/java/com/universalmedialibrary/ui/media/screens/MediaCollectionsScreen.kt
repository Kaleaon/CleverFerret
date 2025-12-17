package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Collections Screen
 * 
 * Organize media into custom collections:
 * - User-created collections
 * - Smart collections (auto-populated)
 * - Cross-media type collections
 * - Sharing and export
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaCollectionsScreen(
    state: CollectionsScreenState,
    onCollectionClick: (Collection) -> Unit,
    onCreateCollection: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            CollectionsTopBar(
                onBackClick = onBackClick,
                onCreateClick = { showCreateDialog = true }
            )
        }
    ) { paddingValues ->
        if (state.collections.isEmpty()) {
            CollectionsEmptyState(
                onCreateClick = { showCreateDialog = true }
            )
        } else {
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 160.dp),
                contentPadding = PaddingValues(MediaSpacing.MD),
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
            ) {
                items(state.collections) { collection ->
                    CollectionCard(
                        collection = collection,
                        onClick = { onCollectionClick(collection) }
                    )
                }
            }
        }
    }
    
    if (showCreateDialog) {
        CreateCollectionDialog(
            onDismiss = { showCreateDialog = false },
            onCreate = { name ->
                onCreateCollection(name)
                showCreateDialog = false
            }
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun CollectionsTopBar(
    onBackClick: () -> Unit,
    onCreateClick: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Collections,
                    contentDescription = null,
                    tint = MediaColors.AccentPrimary,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Collections",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onCreateClick) {
                Icon(
                    imageVector = Icons.Default.Add,
                    contentDescription = "Create Collection",
                    tint = MediaColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}

@Composable
private fun CollectionCard(
    collection: Collection,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Column {
            // Cover grid
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(topStart = MediaCorners.MD, topEnd = MediaCorners.MD))
            ) {
                when {
                    collection.coverUrls.size >= 4 -> {
                        // 2x2 grid
                        Column {
                            Row(modifier = Modifier.weight(1f)) {
                                collection.coverUrls.take(2).forEach { url ->
                                    AsyncImage(
                                        model = url,
                                        contentDescription = null,
                                        contentScale = ContentScale.Crop,
                                        modifier = Modifier
                                            .weight(1f)
                                            .fillMaxHeight()
                                    )
                                }
                            }
                            Row(modifier = Modifier.weight(1f)) {
                                collection.coverUrls.drop(2).take(2).forEach { url ->
                                    AsyncImage(
                                        model = url,
                                        contentDescription = null,
                                        contentScale = ContentScale.Crop,
                                        modifier = Modifier
                                            .weight(1f)
                                            .fillMaxHeight()
                                    )
                                }
                            }
                        }
                    }
                    collection.coverUrls.isNotEmpty() -> {
                        AsyncImage(
                            model = collection.coverUrls.first(),
                            contentDescription = null,
                            contentScale = ContentScale.Crop,
                            modifier = Modifier.fillMaxSize()
                        )
                    }
                    else -> {
                        Surface(
                            color = MediaColors.BackgroundSurface,
                            modifier = Modifier.fillMaxSize()
                        ) {
                            Icon(
                                imageVector = Icons.Default.Collections,
                                contentDescription = null,
                                tint = MediaColors.TextTertiary,
                                modifier = Modifier.padding(MediaSpacing.XL)
                            )
                        }
                    }
                }
                
                // Smart collection badge
                if (collection.isSmart) {
                    Surface(
                        shape = RoundedCornerShape(MediaCorners.XS),
                        color = MediaColors.AccentPrimary,
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(MediaSpacing.SM)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = MediaSpacing.SM, vertical = 2.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.AutoAwesome,
                                contentDescription = null,
                                tint = Color.Black,
                                modifier = Modifier.size(12.dp)
                            )
                            Spacer(modifier = Modifier.width(2.dp))
                            Text(
                                text = "Smart",
                                style = MediaTypography.LabelSmall,
                                color = Color.Black
                            )
                        }
                    }
                }
            }
            
            // Info
            Column(modifier = Modifier.padding(MediaSpacing.MD)) {
                Text(
                    text = collection.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "${collection.itemCount} items",
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
            }
        }
    }
}

@Composable
private fun CollectionsEmptyState(
    onCreateClick: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Collections,
            contentDescription = null,
            tint = MediaColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Text(
            text = "No Collections Yet",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        
        Text(
            text = "Create collections to organize your media",
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary
        )
        
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        
        Button(
            onClick = onCreateClick,
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            )
        ) {
            Icon(Icons.Default.Add, null)
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            Text("Create Collection")
        }
    }
}

@Composable
private fun CreateCollectionDialog(
    onDismiss: () -> Unit,
    onCreate: (String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var isSmart by remember { mutableStateOf(false) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create Collection", color = MediaColors.TextPrimary) },
        text = {
            Column {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Collection Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = MediaColors.AccentPrimary
                    )
                )
                
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Checkbox(
                        checked = isSmart,
                        onCheckedChange = { isSmart = it },
                        colors = CheckboxDefaults.colors(
                            checkedColor = MediaColors.AccentPrimary
                        )
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Column {
                        Text(
                            text = "Smart Collection",
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextPrimary
                        )
                        Text(
                            text = "Auto-populate based on rules",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextSecondary
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onCreate(name) },
                enabled = name.isNotBlank()
            ) {
                Text("Create")
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

/**
 * Collection Detail Screen
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CollectionDetailScreen(
    state: CollectionDetailState,
    onItemClick: (MediaItem) -> Unit,
    onRemoveItem: (MediaItem) -> Unit,
    onEditCollection: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = state.collection.name,
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = MediaColors.TextPrimary)
                    }
                },
                actions = {
                    IconButton(onClick = onEditCollection) {
                        Icon(Icons.Default.Edit, "Edit", tint = MediaColors.TextSecondary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 110.dp),
            contentPadding = PaddingValues(MediaSpacing.MD),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.LG),
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            items(state.items) { item ->
                MediaPosterCard(
                    item = item,
                    onClick = { onItemClick(item) },
                    width = 110.dp
                )
            }
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class CollectionsScreenState(
    val collections: List<Collection> = emptyList(),
    val isLoading: Boolean = false
)

data class Collection(
    val id: String,
    val name: String,
    val coverUrls: List<String>,
    val itemCount: Int,
    val isSmart: Boolean = false,
    val description: String? = null
)

data class CollectionDetailState(
    val collection: Collection,
    val items: List<MediaItem> = emptyList(),
    val isLoading: Boolean = false
)
