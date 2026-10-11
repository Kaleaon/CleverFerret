package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.BugReport
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
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
import com.universalmedialibrary.data.settings.ArtworkApiSettings
import com.universalmedialibrary.data.settings.LyricsApiSettings
import androidx.compose.ui.platform.LocalContext
import androidx.core.net.toUri
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.icons.PhosphorIcons

import com.universalmedialibrary.ui.components.AccessibleOutlinedTextField

@Suppress("LongParameterList")
@Composable
internal fun GeminiAPISection(
    apiKey: String,
    onSaveKey: (String) -> Unit,
    onTestKey: (String) -> Unit,
    isLoading: Boolean,
    testResult: String?,
    errorMessage: String? = null
) {
    var currentKey by remember(apiKey) { mutableStateOf(apiKey) }
    var showKey by remember { mutableStateOf(false) }

    val computedError = errorMessage ?: if (testResult != null && !testResult.contains("success", ignoreCase = true)) {
        testResult
    } else {
        null
    }

    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(MediaSpacing.LG)
        ) {
            Text(
                text = "Google Gemini AI",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(MediaSpacing.SM))

            Text(
                text = "Enable OCR, book identification, and AI-powered metadata enhancement.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(MediaSpacing.LG))

            // API Key Input + Info
            AccessibleOutlinedTextField(
                value = currentKey,
                onValueChange = { currentKey = it },
                label = { Text("Gemini API Key") },
                placeholder = { Text("Enter your Gemini API key") },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                errorMessage = computedError,
                trailingIcon = { GeminiKeyVisibilityActions(showKey) { showKey = !showKey } },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                modifier = Modifier.fillMaxWidth(),
                singleLine = true
            )

            Spacer(modifier = Modifier.height(MediaSpacing.LG))

            // Action Buttons
            GeminiKeyActionButtons(currentKey, onSaveKey, onTestKey, isLoading)

            // Test Result Success banner
            if (testResult != null && testResult.contains("success", ignoreCase = true)) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = testResult,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}

@Composable
private fun GeminiKeyVisibilityActions(showKey: Boolean, onToggle: () -> Unit) {
    val context = LocalContext.current

                    Row(verticalAlignment = Alignment.CenterVertically) {
                        IconButton(onClick = {
                            val url = "https://ai.google.dev/"
                            val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri())
                            context.startActivity(intent)
                        }) {
                            Icon(
                                imageVector = PhosphorIcons.Info,
                                contentDescription = "Where to get a key"
                            )
                        }
                        IconButton(onClick = { onToggle() }) {
                            Icon(
                                imageVector = if (showKey) PhosphorIcons.Warning else PhosphorIcons.Star,
                                contentDescription = if (showKey) "Hide key" else "Show key"
                            )
                        }
                    }

}

@Composable
private fun GeminiKeyActionButtons(currentKey: String, onSaveKey: (String) -> Unit, onTestKey: (String) -> Unit, isLoading: Boolean) {
            Row(
                horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
            ) {
                Button(
                    onClick = { onSaveKey(currentKey) },
                    enabled = !isLoading && currentKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    if (isLoading) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(MediaSpacing.LG),
                            strokeWidth = 2.dp
                        )
                    } else {
                        Text("Save Key")
                    }
                }

                OutlinedButton(
                    onClick = { onTestKey(currentKey) },
                    enabled = !isLoading && currentKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Key")
                }
            }
}
