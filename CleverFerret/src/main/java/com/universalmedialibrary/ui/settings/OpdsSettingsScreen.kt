package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.services.opds.OpdsServer
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import androidx.lifecycle.ViewModel

@HiltViewModel
class OpdsSettingsViewModel @Inject constructor(
    private val server: OpdsServer
) : ViewModel() {
    var isEnabled by mutableStateOf(false)
        private set

    val bindUrl: String = "http://127.0.0.1:8088/opds"

    fun toggle(enabled: Boolean) {
        isEnabled = enabled
        if (enabled) server.startServer() else server.stopServer()
    }

    init {
        // Reflect actual server state on entry
        isEnabled = server.isRunning()
    }
}

@Composable
fun OpdsSettingsScreen(onBack: () -> Unit, viewModel: OpdsSettingsViewModel = hiltViewModel()) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("OPDS Server") },
                navigationIcon = { IconButton(onClick = onBack) { Icon(PhosphorIcons.ArrowLeft, null) } }
            )
        }
    ) { padding ->
        Column(modifier = Modifier.fillMaxSize().padding(padding).padding(16.dp)) {
            Row(verticalAlignment = androidx.compose.ui.Alignment.CenterVertically) {
                Text("Enable OPDS", modifier = Modifier.weight(1f))
                Switch(checked = viewModel.isEnabled, onCheckedChange = { viewModel.toggle(it) })
            }
            Spacer(Modifier.height(8.dp))
            if (viewModel.isEnabled) {
                Text("Server running on ${viewModel.bindUrl}", style = MaterialTheme.typography.bodySmall)
                Spacer(Modifier.height(4.dp))
                Text(
                    "Note: OPDS is bound to 127.0.0.1. Enabling LAN exposure requires explicit opt-in and authentication.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}
