package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController

/**
 * API Settings Screen
 * 
 * Configure API keys for external services:
 * - Gemini (Google AI)
 * - OpenAI
 * - ElevenLabs
 * - Google Cloud TTS
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiSettingsScreen(
    navController: NavController,
    viewModel: ApiSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val scrollState = rememberScrollState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("API Keys") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(scrollState)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Intro text
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = "Text-to-Speech API Configuration",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Text(
                        text = "Configure API keys for premium TTS providers. All keys are stored securely using encrypted storage.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }

            // Gemini AI
            ApiKeySection(
                title = "Gemini (Google AI)",
                description = "High-quality multilingual TTS with natural voices",
                apiKey = uiState.geminiApiKey,
                onApiKeyChange = { viewModel.setGeminiApiKey(it) },
                isConfigured = uiState.isGeminiConfigured,
                getKeyUrl = "https://aistudio.google.com/app/apikey",
                docsUrl = "https://ai.google.dev/gemini-api/docs/text-generation"
            )

            Divider()

            // OpenAI
            ApiKeySection(
                title = "OpenAI",
                description = "Premium TTS with multiple voice options (alloy, echo, fable, onyx, nova, shimmer)",
                apiKey = uiState.openaiApiKey,
                onApiKeyChange = { viewModel.setOpenAiApiKey(it) },
                isConfigured = uiState.isOpenAiConfigured,
                getKeyUrl = "https://platform.openai.com/api-keys",
                docsUrl = "https://platform.openai.com/docs/guides/text-to-speech"
            )

            Divider()

            // ElevenLabs
            ApiKeySection(
                title = "ElevenLabs",
                description = "Ultra-realistic AI voices with emotion and inflection",
                apiKey = uiState.elevenLabsApiKey,
                onApiKeyChange = { viewModel.setElevenLabsApiKey(it) },
                isConfigured = uiState.isElevenLabsConfigured,
                getKeyUrl = "https://elevenlabs.io/app/settings/api-keys",
                docsUrl = "https://elevenlabs.io/docs/api-reference/text-to-speech"
            )

            Divider()

            // Google Cloud TTS
            ApiKeySection(
                title = "Google Cloud TTS",
                description = "Professional-grade TTS with 380+ voices in 50+ languages",
                apiKey = uiState.googleCloudApiKey,
                onApiKeyChange = { viewModel.setGoogleCloudApiKey(it) },
                isConfigured = uiState.isGoogleCloudConfigured,
                getKeyUrl = "https://console.cloud.google.com/apis/credentials",
                docsUrl = "https://cloud.google.com/text-to-speech/docs"
            )

            // Save status
            if (uiState.saveSuccess) {
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Check,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onTertiaryContainer
                        )
                        Text(
                            text = "API keys saved successfully",
                            color = MaterialTheme.colorScheme.onTertiaryContainer
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(32.dp))
        }
    }
}

@Composable
private fun ApiKeySection(
    title: String,
    description: String,
    apiKey: String,
    onApiKeyChange: (String) -> Unit,
    isConfigured: Boolean,
    getKeyUrl: String,
    docsUrl: String
) {
    var isPasswordVisible by remember { mutableStateOf(false) }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            if (isConfigured) {
                AssistChip(
                    onClick = { },
                    label = { Text("Configured") },
                    leadingIcon = {
                        Icon(
                            Icons.Default.Check,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    colors = AssistChipDefaults.assistChipColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                )
            }
        }

        // API Key input
        OutlinedTextField(
            value = apiKey,
            onValueChange = onApiKeyChange,
            label = { Text("API Key") },
            placeholder = { Text("sk-...") },
            modifier = Modifier.fillMaxWidth(),
            visualTransformation = if (isPasswordVisible) 
                VisualTransformation.None 
            else 
                PasswordVisualTransformation(),
            trailingIcon = {
                IconButton(onClick = { isPasswordVisible = !isPasswordVisible }) {
                    Icon(
                        if (isPasswordVisible) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                        contentDescription = if (isPasswordVisible) "Hide" else "Show"
                    )
                }
            },
            singleLine = true
        )

        // Links
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            TextButton(
                onClick = { /* Open getKeyUrl in browser */ }
            ) {
                Text("Get API Key →")
            }
            
            TextButton(
                onClick = { /* Open docsUrl in browser */ }
            ) {
                Text("Documentation")
            }
        }
    }
}
