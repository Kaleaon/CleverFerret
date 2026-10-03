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
import com.universalmedialibrary.ui.icons.PhosphorIcons

@Composable
internal fun GenericApiKeySection(
    title: String,
    description: String,
    apiKey: String,
    onSaveKey: (String) -> Unit,
    isLoading: Boolean,
    getKeyUrl: String? = null,
    placeholder: String = "Enter API Key",
    note: String? = null
) {
    var currentKey by remember(apiKey) { mutableStateOf(apiKey) }
    var showKey by remember { mutableStateOf(false) }
    val context = LocalContext.current

    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // API Key Input
            OutlinedTextField(
                value = currentKey,
                onValueChange = { currentKey = it },
                label = { Text("$title Key") },
                placeholder = { Text(placeholder) },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        if (getKeyUrl != null) {
                            IconButton(onClick = {
                                val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, getKeyUrl.toUri())
                                context.startActivity(intent)
                            }) {
                                Icon(PhosphorIcons.Info, contentDescription = "Get API Key")
                            }
                        }
                        IconButton(onClick = { showKey = !showKey }) {
                            Icon(
                                imageVector = if (showKey) PhosphorIcons.Warning else PhosphorIcons.Star,
                                contentDescription = if (showKey) "Hide key" else "Show key"
                            )
                        }
                    }
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                modifier = Modifier.fillMaxWidth(),
                singleLine = true
            )
            
            if (note != null) {
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = note,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            Button(
                onClick = { onSaveKey(currentKey) },
                enabled = !isLoading && currentKey.isNotBlank(),
                modifier = Modifier.fillMaxWidth()
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
        }
    }
}
