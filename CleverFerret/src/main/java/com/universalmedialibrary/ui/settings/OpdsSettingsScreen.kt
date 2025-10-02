package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
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

    fun toggle(enabled: Boolean) {
        isEnabled = enabled
        if (enabled) server.startServer() else server.stopServer()
    }
}

@Composable
fun OpdsSettingsScreen(onBack: () -> Unit, viewModel: OpdsSettingsViewModel = hiltViewModel()) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("OPDS Server") },
                navigationIcon = { IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, null) } }
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
                Text("Server running on http://localhost:8088/opds", style = MaterialTheme.typography.bodySmall)
            }
        }
    }
}

