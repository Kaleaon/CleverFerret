package com.universalmedialibrary.ui.music

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Radio tab - shows saved radio stations
 */
@Composable
fun RadioTab(
    stations: List<RadioStation>,
    onPlayStation: (RadioStation) -> Unit,
    onAddStation: () -> Unit,
    onEditStation: (RadioStation) -> Unit,
    onDeleteStation: (RadioStation) -> Unit
) {
    if (stations.isEmpty()) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(32.dp),
            contentAlignment = Alignment.Center
        ) {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Icon(
                    Icons.Default.Radio,
                    contentDescription = "Media image",
                    modifier = Modifier.size(64.dp),
                    tint = MaterialTheme.colorScheme.primary
                )
                Text(
                    text = "No Radio Stations",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Add your favorite internet radio stations",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Button(onClick = onAddStation) {
                    Icon(Icons.Default.Add, null)
                    Spacer(Modifier.width(8.dp))
                    Text("Add Station")
                }
            }
        }
    } else {
        LazyColumn(
            contentPadding = PaddingValues(start = 16.dp, end = 16.dp, top = 16.dp, bottom = 160.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(stations) { station ->
                RadioStationItem(
                    station = station,
                    onPlay = { onPlayStation(station) },
                    onEdit = { onEditStation(station) },
                    onDelete = { onDeleteStation(station) }
                )
            }
            
            // Add station button at bottom
            item {
                OutlinedButton(
                    onClick = onAddStation,
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Add, null)
                    Spacer(Modifier.width(8.dp))
                    Text("Add Radio Station")
                }
            }
        }
    }
}

@Composable
private fun RadioStationItem(
    station: RadioStation,
    onPlay: () -> Unit,
    onEdit: () -> Unit,
    onDelete: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Row(
                modifier = Modifier.weight(1f),
                horizontalArrangement = Arrangement.spacedBy(16.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Surface(
                    color = MaterialTheme.colorScheme.primaryContainer,
                    shape = MaterialTheme.shapes.medium,
                    modifier = Modifier.size(56.dp)
                ) {
                    Icon(
                        Icons.Default.Radio,
                        contentDescription = "Media image",
                        modifier = Modifier.padding(12.dp),
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
                
                Column(
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    Text(
                        text = station.name,
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.SemiBold
                    )
                    Text(
                        text = "${station.displayGenre} • ${station.displayCountry}",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    if (station.bitrate != null) {
                        Text(
                            text = "${station.bitrate} kbps",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilledTonalIconButton(onClick = onPlay) {
                    Icon(Icons.Default.PlayArrow, "Play")
                }
                
                Box {
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, "More")
                    }
                    
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        DropdownMenuItem(
                            text = { Text("Edit") },
                            onClick = {
                                onEdit()
                                showMenu = false
                            },
                            leadingIcon = { Icon(Icons.Default.Edit, null) }
                        )
                        DropdownMenuItem(
                            text = { Text("Delete") },
                            onClick = {
                                onDelete()
                                showMenu = false
                            },
                            leadingIcon = { Icon(Icons.Default.Delete, null) }
                        )
                    }
                }
            }
        }
    }
}

/**
 * Dialog for adding/editing a radio station
 */
@Composable
fun RadioStationDialog(
    station: RadioStation? = null,
    onDismiss: () -> Unit,
    onSave: (name: String, url: String, genre: String?, country: String?, bitrate: Int?) -> Unit
) {
    var name by remember { mutableStateOf(station?.name ?: "") }
    var url by remember { mutableStateOf(station?.url ?: "") }
    var genre by remember { mutableStateOf(station?.genre ?: "") }
    var country by remember { mutableStateOf(station?.country ?: "") }
    var bitrate by remember { mutableStateOf(station?.bitrate?.toString() ?: "") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(if (station == null) "Add Radio Station" else "Edit Station") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Station Name *") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Stream URL *") },
                    placeholder = { Text("http://...") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = genre,
                    onValueChange = { genre = it },
                    label = { Text("Genre") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = country,
                    onValueChange = { country = it },
                    label = { Text("Country") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = bitrate,
                    onValueChange = { if (it.all { c -> c.isDigit() }) bitrate = it },
                    label = { Text("Bitrate (kbps)") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (name.isNotBlank() && url.isNotBlank()) {
                        onSave(
                            name,
                            url,
                            genre.ifBlank { null },
                            country.ifBlank { null },
                            bitrate.toIntOrNull()
                        )
                    }
                },
                enabled = name.isNotBlank() && url.isNotBlank()
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
