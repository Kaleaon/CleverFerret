package com.universalmedialibrary.ui.collaborative

import android.Manifest
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import com.journeyapps.barcodescanner.ScanContract
import com.journeyapps.barcodescanner.ScanOptions
import kotlinx.serialization.json.Json
import com.universalmedialibrary.services.collaborative.SessionConnectionData

/**
 * QR Scanner Screen for joining collaborative sessions
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun QRScannerScreen(
    onNavigateBack: () -> Unit = {},
    onSessionJoined: (String) -> Unit = {}
) {
    val context = LocalContext.current
    var hasCameraPermission by remember { mutableStateOf(false) }
    var scanResult by remember { mutableStateOf<String?>(null) }
    var errorMessage by remember { mutableStateOf<String?>(null) }

    // Camera permission launcher
    val permissionLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.RequestPermission()
    ) { isGranted ->
        hasCameraPermission = isGranted
        if (!isGranted) {
            errorMessage = "Camera permission is required to scan QR codes"
        }
    }

    // QR code scanner launcher
    val scanLauncher = rememberLauncherForActivityResult(
        contract = ScanContract()
    ) { result ->
        if (result.contents != null) {
            scanResult = result.contents
            try {
                // Parse the session connection data
                val json = Json { ignoreUnknownKeys = true }
                val connectionData = json.decodeFromString<SessionConnectionData>(result.contents)
                onSessionJoined(connectionData.sessionId)
            } catch (e: Exception) {
                errorMessage = "Invalid QR code. Please scan a valid session QR code."
            }
        }
    }

    // Request camera permission on first launch
    LaunchedEffect(Unit) {
        permissionLauncher.launch(Manifest.permission.CAMERA)
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Scan Session QR Code") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            when {
                !hasCameraPermission -> {
                    PermissionDeniedView(
                        onRequestPermission = {
                            permissionLauncher.launch(Manifest.permission.CAMERA)
                        }
                    )
                }
                errorMessage != null -> {
                    ErrorView(
                        message = errorMessage ?: "",
                        onDismiss = { errorMessage = null },
                        onRetry = {
                            errorMessage = null
                            val options = ScanOptions().apply {
                                setDesiredBarcodeFormats(ScanOptions.QR_CODE)
                                setPrompt("Scan a session QR code")
                                setBeepEnabled(true)
                                setOrientationLocked(false)
                            }
                            scanLauncher.launch(options)
                        }
                    )
                }
                else -> {
                    ScannerPromptView(
                        onScan = {
                            val options = ScanOptions().apply {
                                setDesiredBarcodeFormats(ScanOptions.QR_CODE)
                                setPrompt("Scan a session QR code")
                                setBeepEnabled(true)
                                setOrientationLocked(false)
                            }
                            scanLauncher.launch(options)
                        }
                    )
                }
            }
        }
    }
}

@Composable
private fun PermissionDeniedView(
    onRequestPermission: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            "Camera Permission Required",
            style = MaterialTheme.typography.titleLarge
        )
        Text(
            "To scan QR codes and join collaborative sessions, please grant camera permission.",
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.padding(horizontal = 32.dp)
        )
        Button(onClick = onRequestPermission) {
            Text("Grant Permission")
        }
    }
}

@Composable
private fun ErrorView(
    message: String,
    onDismiss: () -> Unit,
    onRetry: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Icon(
            Icons.Default.Close,
            contentDescription = null,
            modifier = Modifier.size(64.dp),
            tint = MaterialTheme.colorScheme.error
        )
        Text(
            "Scan Failed",
            style = MaterialTheme.typography.titleLarge,
            color = MaterialTheme.colorScheme.error
        )
        Text(
            message,
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.padding(horizontal = 32.dp)
        )
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            OutlinedButton(onClick = onDismiss) {
                Text("Cancel")
            }
            Button(onClick = onRetry) {
                Text("Retry")
            }
        }
    }
}

@Composable
private fun ScannerPromptView(
    onScan: () -> Unit
) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text(
            "Join Collaborative Session",
            style = MaterialTheme.typography.titleLarge
        )
        Text(
            "Scan the QR code displayed on the host device to join their collaborative playlist session.",
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.padding(horizontal = 32.dp)
        )
        Button(
            onClick = onScan,
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 32.dp)
        ) {
            Text("Open Scanner")
        }
    }
}
