package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.settings.ImageGeneratorType
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * API Settings Screen for managing external API keys
 *
 * Allows users to securely input and manage API keys for:
 * - Google Gemini AI (for OCR and book identification)
 * - Cloud TTS services
 * - Other external integrations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun APISettingsScreen(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: APISettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    var showGeminiKey by remember { mutableStateOf(false) }
    var geminiKey by remember { mutableStateOf("") }

    LaunchedEffect(Unit) {
        viewModel.loadSettings()
        geminiKey = uiState.geminiApiKey ?: ""
    }

    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = { Text("API Settings") },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back")
                }
            }
        )

        // Settings Content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Security Notice
            SecurityNoticeCard()

            // Gemini AI Section
            GeminiAPISection(
                apiKey = geminiKey,
                showKey = showGeminiKey,
                onKeyChanged = { geminiKey = it },
                onShowKeyToggle = { showGeminiKey = !showGeminiKey },
                onSaveKey = { viewModel.saveGeminiApiKey(geminiKey) },
                onTestKey = { viewModel.testGeminiApiKey(geminiKey) },
                isLoading = uiState.isLoading,
                testResult = uiState.geminiTestResult
            )

            // Image Generator Selection Section
            ImageGeneratorSection(
                selectedType = uiState.imageGeneratorType,
                onTypeSelected = { viewModel.updateImageGeneratorType(it) },
                isLoading = uiState.isLoading
            )

            // Cloud TTS Section
            CloudTTSSection(
                isEnabled = uiState.cloudTTSEnabled,
                onEnabledChanged = { viewModel.setCloudTTSEnabled(it) }
            )

            // Feature Flags Section
            FeatureFlagsSection(
                geminiEnabled = uiState.geminiEnabled,
                exoPlayerEnabled = uiState.exoPlayerEnabled,
                podcastsEnabled = uiState.podcastsEnabled,
                onGeminiToggle = { viewModel.setGeminiEnabled(it) },
                onExoPlayerToggle = { viewModel.setExoPlayerEnabled(it) },
                onPodcastsToggle = { viewModel.setPodcastsEnabled(it) }
            )

            // Status Section
            uiState.statusMessage?.let { message ->
                StatusMessageCard(
                    message = message,
                    isError = uiState.hasError
                )
            }
        }
    }
}

@Composable
private fun SecurityNoticeCard() {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "🔐 Security Notice",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "API keys are stored securely on your device and never shared. " +
                        "Images and text sent to AI services are processed according to their privacy policies. " +
                        "You can disable these features at any time.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}

@Composable
private fun GeminiAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    onTestKey: () -> Unit,
    isLoading: Boolean,
    testResult: String?
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Google Gemini AI",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = "Enable OCR, book identification, and AI-powered metadata enhancement. " +
                        "Get your API key from Google AI Studio.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // API Key Input
            OutlinedTextField(
                value = apiKey,
                onValueChange = onKeyChanged,
                label = { Text("Gemini API Key") },
                placeholder = { Text("Enter your Gemini API key") },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    IconButton(onClick = onShowKeyToggle) {
                        Icon(
                            imageVector = if (showKey) PhosphorIcons.Warning else PhosphorIcons.Star,
                            contentDescription = if (showKey) "Hide key" else "Show key"
                        )
                    }
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                modifier = Modifier.fillMaxWidth(),
                singleLine = true
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Action Buttons
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onSaveKey,
                    enabled = !isLoading && apiKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    if (isLoading) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        Text("Save Key")
                    }
                }

                OutlinedButton(
                    onClick = onTestKey,
                    enabled = !isLoading && apiKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Key")
                }
            }

            // Test Result
            if (testResult != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = testResult,
                    style = MaterialTheme.typography.bodySmall,
                    color = if (testResult.contains("success", ignoreCase = true)) {
                        MaterialTheme.colorScheme.primary
                    } else {
                        MaterialTheme.colorScheme.error
                    }
                )
            }
        }
    }
}

@Composable
private fun CloudTTSSection(
    isEnabled: Boolean,
    onEnabledChanged: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Cloud Text-to-Speech",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Enable cloud-based TTS for higher quality voices",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = isEnabled,
                    onCheckedChange = onEnabledChanged
                )
            }
        }
    }
}

@Composable
private fun FeatureFlagsSection(
    geminiEnabled: Boolean,
    exoPlayerEnabled: Boolean,
    podcastsEnabled: Boolean,
    onGeminiToggle: (Boolean) -> Unit,
    onExoPlayerToggle: (Boolean) -> Unit,
    onPodcastsToggle: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Feature Controls",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Gemini Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Gemini AI Integration",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "OCR and book identification",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = geminiEnabled,
                    onCheckedChange = onGeminiToggle
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // ExoPlayer Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Advanced Media Player",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "ExoPlayer for better audio/video",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = exoPlayerEnabled,
                    onCheckedChange = onExoPlayerToggle
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Podcasts Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Podcast Features",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "Discovery and download management",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = podcastsEnabled,
                    onCheckedChange = onPodcastsToggle
                )
            }
        }
    }
}

@Composable
private fun ImageGeneratorSection(
    selectedType: ImageGeneratorType,
    onTypeSelected: (ImageGeneratorType) -> Unit,
    isLoading: Boolean
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Image Generator",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = "Choose which image generation model to use for creating book covers",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Imagen Option
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                RadioButton(
                    selected = selectedType == ImageGeneratorType.IMAGEN,
                    onClick = { if (!isLoading) onTypeSelected(ImageGeneratorType.IMAGEN) },
                    enabled = !isLoading
                )
                Column(
                    modifier = Modifier
                        .weight(1f)
                        .padding(start = 8.dp)
                ) {
                    Text(
                        text = "Gemini Imagen (Dedicated)",
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Higher quality, optimized for book covers",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Gemini Built-in Option
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                RadioButton(
                    selected = selectedType == ImageGeneratorType.GEMINI_BUILTIN,
                    onClick = { if (!isLoading) onTypeSelected(ImageGeneratorType.GEMINI_BUILTIN) },
                    enabled = !isLoading
                )
                Column(
                    modifier = Modifier
                        .weight(1f)
                        .padding(start = 8.dp)
                ) {
                    Text(
                        text = "Gemini Built-in",
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Native multimodal, faster generation",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun StatusMessageCard(
    message: String,
    isError: Boolean
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = if (isError) {
                MaterialTheme.colorScheme.errorContainer
            } else {
                MaterialTheme.colorScheme.primaryContainer
            }
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Text(
            text = message,
            style = MaterialTheme.typography.bodyMedium,
            color = if (isError) {
                MaterialTheme.colorScheme.onErrorContainer
            } else {
                MaterialTheme.colorScheme.onPrimaryContainer
            },
            modifier = Modifier.padding(16.dp)
        )
    }
}
