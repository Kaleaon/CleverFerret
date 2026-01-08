package com.universalmedialibrary.ui.books

import android.app.Activity
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.google.zxing.integration.android.IntentIntegrator
import com.journeyapps.barcodescanner.ScanContract
import com.journeyapps.barcodescanner.ScanOptions

/**
 * Barcode Scanner Screen
 * 
 * Allows users to scan book ISBNs using their device camera.
 * After scanning, searches for the book and offers to add it to the library
 * or shows purchase links if not available.
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun BarcodeScannerScreen(
    onNavigateBack: () -> Unit,
    onBookFound: (String) -> Unit,
    modifier: Modifier = Modifier,
    viewModel: BarcodeScannerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    
    // Barcode scanner launcher
    val scanLauncher = rememberLauncherForActivityResult(
        contract = ScanContract()
    ) { result ->
        if (result.contents != null) {
            viewModel.onBarcodeScanned(result.contents)
        } else {
            viewModel.onScanCancelled()
        }
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Scan Book Barcode") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Spacer(modifier = Modifier.weight(0.2f))
            
            // Icon
            Icon(
                imageVector = Icons.Default.QrCodeScanner,
                contentDescription = "Media image",
                modifier = Modifier.size(120.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            
            // Title
            Text(
                text = "Scan ISBN Barcode",
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold,
                textAlign = TextAlign.Center
            )
            
            // Description
            Text(
                text = "Point your camera at the barcode on the back of your book. " +
                        "We'll find the book details and help you add it to your library.",
                style = MaterialTheme.typography.bodyLarge,
                textAlign = TextAlign.Center,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Scan button
            Button(
                onClick = {
                    val options = ScanOptions().apply {
                        setPrompt("Scan the book's ISBN barcode")
                        setBeepEnabled(false)
                        setOrientationLocked(false)
                        setBarcodeImageEnabled(true)
                        setDesiredBarcodeFormats(
                            ScanOptions.EAN_13,
                            ScanOptions.EAN_8,
                            ScanOptions.UPC_A,
                            ScanOptions.UPC_E
                        )
                    }
                    scanLauncher.launch(options)
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                enabled = !uiState.isSearching
            ) {
                Icon(
                    imageVector = Icons.Default.CameraAlt,
                    contentDescription = "Media image",
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text("Start Scanning", style = MaterialTheme.typography.titleMedium)
            }
            
            // Status message
            when {
                uiState.isSearching -> {
                    CircularProgressIndicator()
                    Text(
                        text = "Searching for book...",
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
                uiState.errorMessage != null -> {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.errorContainer
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(16.dp),
                            horizontalArrangement = Arrangement.spacedBy(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Error,
                                contentDescription = "Media image",
                                tint = MaterialTheme.colorScheme.error
                            )
                            Text(
                                text = uiState.errorMessage ?: "Unknown error",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                        }
                    }
                }
                uiState.scannedISBN != null -> {
                    Card(
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.primaryContainer
                        )
                    ) {
                        Column(
                            modifier = Modifier.padding(16.dp),
                            verticalArrangement = Arrangement.spacedBy(8.dp)
                        ) {
                            Row(
                                horizontalArrangement = Arrangement.spacedBy(8.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = Icons.Default.CheckCircle,
                                    contentDescription = "Media image",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                                Text(
                                    text = "ISBN Scanned",
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.Bold
                                )
                            }
                            Text(
                                text = uiState.scannedISBN ?: "",
                                style = MaterialTheme.typography.bodyLarge,
                                fontFamily = androidx.compose.ui.text.font.FontFamily.Monospace
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.weight(1f))
            
            // Help text
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Row(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Info,
                            contentDescription = "Media image",
                            modifier = Modifier.size(20.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Text(
                            text = "Tips for better scanning:",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    Text(
                        text = "• Ensure good lighting\n" +
                                "• Hold camera steady\n" +
                                "• Keep barcode in focus\n" +
                                "• Try different angles if needed",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

/**
 * UI State for barcode scanner
 */
data class BarcodeScannerUiState(
    val scannedISBN: String? = null,
    val isSearching: Boolean = false,
    val errorMessage: String? = null
)
