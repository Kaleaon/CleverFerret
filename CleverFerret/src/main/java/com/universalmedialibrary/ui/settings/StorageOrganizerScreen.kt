package com.universalmedialibrary.ui.settings

import android.net.Uri
import android.os.Build
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
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.lifecycleScope
import com.universalmedialibrary.services.StorageAccessService
import com.universalmedialibrary.utils.PermissionsHandler
import dagger.hilt.android.EntryPointAccessors
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun StorageOrganizerScreen(
    onBack: () -> Unit,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val context = androidx.compose.ui.platform.LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current
    var selectedUri by remember { mutableStateOf<Uri?>(null) }
    var progress by remember { mutableStateOf("") }
    var movedCount by remember { mutableStateOf<Int?>(null) }
    var hasAllFilesAccess by remember {
        mutableStateOf(PermissionsHandler.hasFullStorageAccess(context))
    }

    // Refresh the toggle state when returning from system settings.
    DisposableEffect(lifecycleOwner, context) {
        val observer = LifecycleEventObserver { _, event ->
            if (event == Lifecycle.Event.ON_RESUME) {
                hasAllFilesAccess = PermissionsHandler.hasFullStorageAccess(context)
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose { lifecycleOwner.lifecycle.removeObserver(observer) }
    }

    val picker = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocumentTree()) { uri ->
        if (uri != null) {
            selectedUri = uri
            val appContext = context.applicationContext
            // Access StorageAccessService via EntryPoint or injected graph
            val service = EntryPointAccessors.fromApplication(appContext, OrganizerEntryPoint::class.java).storageService()
            service.persistUriPermission(context, uri)
            // Launch organize in lifecycle-aware coroutine
            lifecycleOwner.lifecycleScope.launch {
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
            // Optional: All files access toggle for Android 11+ (MANAGE_EXTERNAL_STORAGE)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                Card(
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Text(
                            text = "All files access (optional)",
                            style = MaterialTheme.typography.titleMedium
                        )
                        Spacer(modifier = Modifier.height(6.dp))
                        Text(
                            text = "Enable this only if you need full folder scanning for documents/ebooks outside MediaStore.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )

                        Spacer(modifier = Modifier.height(12.dp))

                        Text(
                            text = "Status: ${if (hasAllFilesAccess) "Granted" else "Not granted"}",
                            style = MaterialTheme.typography.bodyMedium,
                            color = if (hasAllFilesAccess) {
                                MaterialTheme.colorScheme.primary
                            } else {
                                MaterialTheme.colorScheme.onSurfaceVariant
                            }
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        Button(
                            onClick = { PermissionsHandler.requestFullStorageAccess(context) },
                            modifier = Modifier.fillMaxWidth()
                        ) {
                            Text(
                                text = if (hasAllFilesAccess) {
                                    "Manage in system settings"
                                } else {
                                    "Grant all files access"
                                }
                            )
                        }
                    }
                }
            }

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
