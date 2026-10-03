package com.universalmedialibrary.ui.webfiction

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.webfiction.WebFictionSite
import com.universalmedialibrary.services.webfiction.WebFictionSiteType
import com.universalmedialibrary.services.webfiction.isAdultSite
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.services.webfiction.StoryStatus
import com.universalmedialibrary.ui.components.UserFeedbackMessage
import com.universalmedialibrary.ui.components.UserFeedbackSeverity
import com.universalmedialibrary.ui.components.UserFeedbackSnackbarHost
import com.universalmedialibrary.ui.components.showUserFeedback
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import kotlinx.coroutines.launch

@Composable
fun AddWebFictionDialog(
    onDismiss: () -> Unit,
    validateUrl: (String) -> Result<String>,
    onAdd: (String) -> Unit
) {
    var url by remember { mutableStateOf("") }
    var validationError by remember { mutableStateOf<String?>(null) }
    val normalizedUrl = remember(url, validationError) {
        if (validationError == null && url.isNotBlank()) validateUrl(url).getOrNull() else null
    }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                "Add Web Fiction Story",
                fontWeight = FontWeight.Medium
            )
        },
        text = {
            Column {
                Text(
                    text = "Enter the URL of a story from a supported fanfiction site:",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(bottom = 16.dp)
                )

                OutlinedTextField(
                    value = url,
                    onValueChange = {
                        url = it
                        validationError = if (it.isBlank()) {
                            null
                        } else {
                            validateUrl(it).exceptionOrNull()?.message
                        }
                    },
                    label = { Text("Story URL") },
                    placeholder = { Text("https://archiveofourown.org/works/12345") },
                    modifier = Modifier.fillMaxWidth(),
                    isError = validationError != null,
                    supportingText = if (validationError != null) {
                        { Text(validationError ?: "") }
                    } else null,
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Uri)
                )

                Spacer(modifier = Modifier.height(8.dp))

                normalizedUrl?.let {
                    Text(
                        text = "Canonical URL: $it",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                }

                Text(
                    text = "Supported sites: AO3, FFN, Royal Road, WebNovel, Wattpad, and more",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(normalizedUrl ?: url) },
                enabled = url.isNotBlank() && validationError == null
            ) {
                Text("Add Story")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
