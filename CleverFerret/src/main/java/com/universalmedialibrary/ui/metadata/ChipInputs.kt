package com.universalmedialibrary.ui.metadata

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.unit.dp

/**
 * A chip-based input field for editing a list of authors.
 *
 * @param authors The current list of authors.
 * @param originalAuthors The original list of authors, for showing diffs.
 * @param onAuthorsChange A callback for when the list of authors changes.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AuthorsChipInput(
    authors: List<String>,
    originalAuthors: List<String>?,
    onAuthorsChange: (List<String>) -> Unit
) {
    var newAuthorText by remember { mutableStateOf("") }
    var showAddDialog by remember { mutableStateOf(false) }

    Column {
        Text(
            text = "Authors",
            style = MaterialTheme.typography.titleMedium,
            modifier = Modifier.padding(bottom = 8.dp)
        )
        
        // Authors chips
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.fillMaxWidth()
        ) {
            items(authors) { author ->
                AssistChip(
                    onClick = { },
                    label = { Text(author) },
                    trailingIcon = {
                        IconButton(
                            onClick = {
                                onAuthorsChange(authors.filter { it != author })
                            },
                            modifier = Modifier.size(16.dp)
                        ) {
                            Icon(
                                Icons.Default.Close,
                                contentDescription = "Remove $author",
                                modifier = Modifier.size(12.dp)
                            )
                        }
                    }
                )
            }
            
            // Add button
            item {
                AssistChip(
                    onClick = { showAddDialog = true },
                    label = { Text("Add Author") },
                    leadingIcon = {
                        Icon(
                            Icons.Default.Add,
                            contentDescription = "Add author",
                            modifier = Modifier.size(16.dp)
                        )
                    }
                )
            }
        }
        
        // Show original authors if different
        if (originalAuthors != null && originalAuthors != authors) {
            val removedAuthors = originalAuthors.filter { it !in authors }
            val addedAuthors = authors.filter { it !in originalAuthors }
            
            if (removedAuthors.isNotEmpty()) {
                Text(
                    text = "Removed: ${removedAuthors.joinToString(", ")}",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.Gray,
                    textDecoration = TextDecoration.LineThrough,
                    modifier = Modifier.padding(top = 4.dp)
                )
            }
            
            if (addedAuthors.isNotEmpty()) {
                Text(
                    text = "Added: ${addedAuthors.joinToString(", ")}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(top = 4.dp)
                )
            }
        }
    }
    
    // Add author dialog
    if (showAddDialog) {
        AlertDialog(
            onDismissRequest = { showAddDialog = false },
            title = { Text("Add Author") },
            text = {
                OutlinedTextField(
                    value = newAuthorText,
                    onValueChange = { newAuthorText = it },
                    label = { Text("Author Name") },
                    singleLine = true
                )
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        if (newAuthorText.isNotBlank()) {
                            onAuthorsChange(authors + newAuthorText.trim())
                            newAuthorText = ""
                        }
                        showAddDialog = false
                    }
                ) {
                    Text("Add")
                }
            },
            dismissButton = {
                TextButton(onClick = { 
                    showAddDialog = false
                    newAuthorText = ""
                }) {
                    Text("Cancel")
                }
            }
        )
    }
}

/**
 * A chip-based input field for editing a list of genres or tags.
 *
 * @param genres The current list of genres.
 * @param originalGenres The original list of genres, for showing diffs.
 * @param onGenresChange A callback for when the list of genres changes.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GenresChipInput(
    genres: List<String>,
    originalGenres: List<String>?,
    onGenresChange: (List<String>) -> Unit
) {
    var newGenreText by remember { mutableStateOf("") }
    var showAddDialog by remember { mutableStateOf(false) }

    Column {
        Text(
            text = "Genres/Tags",
            style = MaterialTheme.typography.titleMedium,
            modifier = Modifier.padding(bottom = 8.dp)
        )
        
        // Genres chips
        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            modifier = Modifier.fillMaxWidth()
        ) {
            items(genres) { genre ->
                AssistChip(
                    onClick = { },
                    label = { Text(genre) },
                    trailingIcon = {
                        IconButton(
                            onClick = {
                                onGenresChange(genres.filter { it != genre })
                            },
                            modifier = Modifier.size(16.dp)
                        ) {
                            Icon(
                                Icons.Default.Close,
                                contentDescription = "Remove $genre",
                                modifier = Modifier.size(12.dp)
                            )
                        }
                    }
                )
            }
            
            // Add button
            item {
                AssistChip(
                    onClick = { showAddDialog = true },
                    label = { Text("Add Genre") },
                    leadingIcon = {
                        Icon(
                            Icons.Default.Add,
                            contentDescription = "Add genre",
                            modifier = Modifier.size(16.dp)
                        )
                    }
                )
            }
        }
        
        // Show original genres if different
        if (originalGenres != null && originalGenres != genres) {
            val removedGenres = originalGenres.filter { it !in genres }
            val addedGenres = genres.filter { it !in originalGenres }
            
            if (removedGenres.isNotEmpty()) {
                Text(
                    text = "Removed: ${removedGenres.joinToString(", ")}",
                    style = MaterialTheme.typography.bodySmall,
                    color = Color.Gray,
                    textDecoration = TextDecoration.LineThrough,
                    modifier = Modifier.padding(top = 4.dp)
                )
            }
            
            if (addedGenres.isNotEmpty()) {
                Text(
                    text = "Added: ${addedGenres.joinToString(", ")}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary,
                    modifier = Modifier.padding(top = 4.dp)
                )
            }
        }
    }
    
    // Add genre dialog
    if (showAddDialog) {
        AlertDialog(
            onDismissRequest = { showAddDialog = false },
            title = { Text("Add Genre/Tag") },
            text = {
                OutlinedTextField(
                    value = newGenreText,
                    onValueChange = { newGenreText = it },
                    label = { Text("Genre/Tag") },
                    singleLine = true
                )
            },
            confirmButton = {
                TextButton(
                    onClick = {
                        if (newGenreText.isNotBlank()) {
                            onGenresChange(genres + newGenreText.trim())
                            newGenreText = ""
                        }
                        showAddDialog = false
                    }
                ) {
                    Text("Add")
                }
            },
            dismissButton = {
                TextButton(onClick = { 
                    showAddDialog = false
                    newGenreText = ""
                }) {
                    Text("Cancel")
                }
            }
        )
    }
}