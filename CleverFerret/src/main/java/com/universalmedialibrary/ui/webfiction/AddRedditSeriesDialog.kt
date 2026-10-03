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
fun AddRedditSeriesDialog(
    onDismiss: () -> Unit,
    onAdd: (subreddit: String, seriesName: String, author: String) -> Unit
) {
    var subreddit by remember { mutableStateOf("HFY") }
    var seriesName by remember { mutableStateOf("") }
    var author by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add Reddit Series") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(
                    value = subreddit,
                    onValueChange = { subreddit = it.trim() },
                    label = { Text("Subreddit (e.g. HFY)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = seriesName,
                    onValueChange = { seriesName = it },
                    label = { Text("Series Name (Search Query)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                OutlinedTextField(
                    value = author,
                    onValueChange = { author = it.trim() },
                    label = { Text("Author (Optional)") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                Text(
                    "Use exact series title for best results.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(subreddit, seriesName, author) },
                enabled = subreddit.isNotBlank() && seriesName.isNotBlank()
            ) {
                Text("Download")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
