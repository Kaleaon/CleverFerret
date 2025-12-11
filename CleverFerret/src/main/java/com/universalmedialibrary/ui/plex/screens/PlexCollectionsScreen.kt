package com.universalmedialibrary.ui.plex.screens

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
import com.universalmedialibrary.ui.plex.components.*
import com.universalmedialibrary.ui.plex.theme.*

/**
 * Plex-Style Collections Screen
 * 
 * Organize media into custom collections:
 * - User-created collections
 * - Smart collections (auto-populated)
 * - Cross-media type collections
 * - Sharing and export
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexCollectionsScreen(
    state: CollectionsScreenState,
    onCollectionClick: (Collection) -> Unit,
    onCreateCollection: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showCreateDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
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
                contentPadding = PaddingValues(PlexSpacing.MD),
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
                verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
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
                    tint = PlexColors.AccentPrimary,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(PlexSpacing.SM))
                Text(
                    text = "Collections",
                    style = PlexTypography.TitleMedium,
                    color = PlexColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = PlexColors.TextPrimary
                )
            }
        },
        actions = {
            IconButton(onClick = onCreateClick) {
                Icon(
                    imageVector = Icons.Default.Add,
                    contentDescription = "Create Collection",
                    tint = PlexColors.TextSecondary
                )
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = PlexColors.BackgroundElevated
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
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick),
        color = PlexColors.BackgroundElevated
    ) {
        Column {
            // Cover grid
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(topStart = PlexCorners.MD, topEnd = PlexCorners.MD))
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
                            color = PlexColors.BackgroundSurface,
                            modifier = Modifier.fillMaxSize()
                        ) {
                            Icon(
                                imageVector = Icons.Default.Collections,
                                contentDescription = null,
                                tint = PlexColors.TextTertiary,
                                modifier = Modifier.padding(PlexSpacing.XL)
                            )
                        }
                    }
                }
                
                // Smart collection badge
                if (collection.isSmart) {
                    Surface(
                        shape = RoundedCornerShape(PlexCorners.XS),
                        color = PlexColors.AccentPrimary,
                        modifier = Modifier
                            .align(Alignment.TopEnd)
                            .padding(PlexSpacing.SM)
                    ) {
                        Row(
                            modifier = Modifier.padding(horizontal = PlexSpacing.SM, vertical = 2.dp),
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
                                style = PlexTypography.LabelSmall,
                                color = Color.Black
                            )
                        }
                    }
                }
            }
            
            // Info
            Column(modifier = Modifier.padding(PlexSpacing.MD)) {
                Text(
                    text = collection.name,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = "${collection.itemCount} items",
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary
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
            .padding(PlexSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Collections,
            contentDescription = null,
            tint = PlexColors.TextTertiary,
            modifier = Modifier.size(72.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = "No Collections Yet",
            style = PlexTypography.TitleMedium,
            color = PlexColors.TextPrimary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = "Create collections to organize your media",
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Button(
            onClick = onCreateClick,
            colors = ButtonDefaults.buttonColors(
                containerColor = PlexColors.AccentPrimary
            )
        ) {
            Icon(Icons.Default.Add, null)
            Spacer(modifier = Modifier.width(PlexSpacing.SM))
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
        title = { Text("Create Collection", color = PlexColors.TextPrimary) },
        text = {
            Column {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Collection Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = PlexColors.AccentPrimary
                    )
                )
                
                Spacer(modifier = Modifier.height(PlexSpacing.MD))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Checkbox(
                        checked = isSmart,
                        onCheckedChange = { isSmart = it },
                        colors = CheckboxDefaults.colors(
                            checkedColor = PlexColors.AccentPrimary
                        )
                    )
                    Spacer(modifier = Modifier.width(PlexSpacing.SM))
                    Column {
                        Text(
                            text = "Smart Collection",
                            style = PlexTypography.BodyMedium,
                            color = PlexColors.TextPrimary
                        )
                        Text(
                            text = "Auto-populate based on rules",
                            style = PlexTypography.LabelSmall,
                            color = PlexColors.TextSecondary
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
        containerColor = PlexColors.BackgroundElevated
    )
}

/**
 * Collection Detail Screen
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexCollectionDetailScreen(
    state: CollectionDetailState,
    onItemClick: (PlexMediaItem) -> Unit,
    onRemoveItem: (PlexMediaItem) -> Unit,
    onEditCollection: () -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Scaffold(
        modifier = modifier.background(PlexColors.Background),
        containerColor = PlexColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = state.collection.name,
                        style = PlexTypography.TitleMedium,
                        color = PlexColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = PlexColors.TextPrimary)
                    }
                },
                actions = {
                    IconButton(onClick = onEditCollection) {
                        Icon(Icons.Default.Edit, "Edit", tint = PlexColors.TextSecondary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = PlexColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 110.dp),
            contentPadding = PaddingValues(PlexSpacing.MD),
            horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.LG),
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            items(state.items) { item ->
                PlexPosterCard(
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
    val items: List<PlexMediaItem> = emptyList(),
    val isLoading: Boolean = false
)
