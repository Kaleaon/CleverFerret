package com.universalmedialibrary.ui.settings

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.StorageAccessService
import dagger.hilt.android.EntryPointAccessors

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StorageOrganizerScreen(
    onBack: () -> Unit,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val context = androidx.compose.ui.platform.LocalContext.current
    var selectedUri by remember { mutableStateOf<Uri?>(null) }
    var progress by remember { mutableStateOf("") }
    var movedCount by remember { mutableStateOf<Int?>(null) }

    val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            selectedUri = uri
            val appContext = context.applicationContext
            // Access StorageAccessService via EntryPoint or injected graph
            val service = EntryPointAccessors.fromApplication(appContext, OrganizerEntryPoint::class.java).storageService()
            service.persistUriPermission(context, uri)
            // Launch organize in coroutine
            androidx.lifecycle.compose.LocalLifecycleOwner.current.lifecycleScope.launchWhenStarted {
                movedCount = service.organizeDirectory(context, uri) { msg -> progress = msg }
            }
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Storage Organizer") },
                navigationIcon = { IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = null) } }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text("Select a mixed folder to organize into subfolders by media type.")
            Button(onClick = { picker.launch(null) }) { Text("Choose Folder") }
            selectedUri?.let { Text("Selected: $it") }
            if (progress.isNotBlank()) Text(progress)
            movedCount?.let { Text("Moved $it file(s)") }
        }
    }
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface OrganizerEntryPoint {
    fun storageService(): StorageAccessService
}
