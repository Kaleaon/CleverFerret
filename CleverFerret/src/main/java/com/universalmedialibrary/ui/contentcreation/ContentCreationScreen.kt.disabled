package com.universalmedialibrary.ui.contentcreation

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle

/**
 * Screen for content creation features - converting online content to EPUB
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ContentCreationScreen(
    viewModel: ContentCreationViewModel = hiltViewModel(),
    onNavigateBack: () -> Unit = {}
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val keyboardController = LocalSoftwareKeyboardController.current

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        // Header
        Card(
            modifier = Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.Add,
                        contentDescription = null,
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = "Content to EPUB",
                        style = MaterialTheme.typography.headlineMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer,
                        fontWeight = FontWeight.Bold
                    )
                }
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Convert online articles and fanfiction to EPUB format for offline reading",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
        }

        // URL Input
        Card(
            modifier = Modifier.fillMaxWidth()
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Enter URL",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Spacer(modifier = Modifier.height(8.dp))

                OutlinedTextField(
                    value = uiState.inputUrl,
                    onValueChange = viewModel::updateInputUrl,
                    modifier = Modifier.fillMaxWidth(),
                    label = { Text("Article or Story URL") },
                    placeholder = { Text("https://...") },
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Uri,
                        imeAction = ImeAction.Done
                    ),
                    keyboardActions = KeyboardActions(
                        onDone = { keyboardController?.hide() }
                    ),
                    enabled = !uiState.isConverting
                )

                Spacer(modifier = Modifier.height(12.dp))

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // Convert as News Article
                    Button(
                        onClick = { viewModel.convertNews() },
                        enabled = uiState.inputUrl.isNotEmpty() && !uiState.isConverting,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("📰 News Article")
                    }

                    // Convert as Fanfiction
                    Button(
                        onClick = { viewModel.convertFanfiction() },
                        enabled = uiState.inputUrl.isNotEmpty() && !uiState.isConverting,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("📚 Fanfiction")
                    }
                }
            }
        }

        // Conversion Status
        if (uiState.isConverting) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    CircularProgressIndicator()
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Converting content to EPUB...",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    if (uiState.conversionProgress.isNotEmpty()) {
                        Spacer(modifier = Modifier.height(4.dp))
                        Text(
                            text = uiState.conversionProgress,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSecondaryContainer.copy(alpha = 0.7f)
                        )
                    }
                }
            }
        }

        // Conversion Result
        uiState.lastResult?.let { result ->
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = if (result.success) {
                        MaterialTheme.colorScheme.tertiaryContainer
                    } else {
                        MaterialTheme.colorScheme.errorContainer
                    }
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = if (result.success) "✅ Conversion Successful" else "❌ Conversion Failed",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = if (result.success) {
                            MaterialTheme.colorScheme.onTertiaryContainer
                        } else {
                            MaterialTheme.colorScheme.onErrorContainer
                        }
                    )

                    Spacer(modifier = Modifier.height(8.dp))

                    if (result.success && result.title != null) {
                        Text(
                            text = "Title: ${result.title}",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        if (result.author != null) {
                            Text(
                                text = "Author: ${result.author}",
                                style = MaterialTheme.typography.bodyMedium
                            )
                        }
                        if (result.chapters > 0) {
                            Text(
                                text = if (result.wasUpdate) {
                                    "Updated: ${result.previousChapters} → ${result.chapters} chapters (+${result.chapters - result.previousChapters} new)"
                                } else {
                                    "Chapters: ${result.chapters}"
                                },
                                style = MaterialTheme.typography.bodyMedium
                            )
                        }
                        if (result.wasUpdate) {
                            Text(
                                text = "✨ Story was updated with new content!",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.primary,
                                fontWeight = FontWeight.SemiBold
                            )
                        } else if (result.storyId != null && result.success) {
                            Text(
                                text = "📚 Previously downloaded story is up-to-date",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onTertiaryContainer.copy(alpha = 0.7f)
                            )
                        }
                        if (result.filePath != null) {
                            Text(
                                text = "Saved to: ${result.filePath}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onTertiaryContainer.copy(alpha = 0.7f)
                            )
                        }
                    } else if (!result.success && result.errorMessage != null) {
                        Text(
                            text = result.errorMessage,
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onErrorContainer
                        )
                    }
                }
            }
        }

        // Supported Sites Information
        Card(
            modifier = Modifier.fillMaxWidth()
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(
                    text = "Supported Sites",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold
                )
                Spacer(modifier = Modifier.height(8.dp))

                Text(
                    text = "📰 News Articles: Most major news sites with article content",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = "📚 Fanfiction:",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = "  • Archive of Our Own (AO3) - Full multi-chapter support",
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.padding(start = 8.dp)
                )
                Text(
                    text = "  • FanFiction.Net - Full multi-chapter support",
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.padding(start = 8.dp)
                )
                Text(
                    text = "  • Wattpad - Single chapter support",
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.padding(start = 8.dp)
                )
                Text(
                    text = "  • Other sites - Basic content extraction",
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.padding(start = 8.dp)
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))
    }
}
