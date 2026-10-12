package com.universalmedialibrary.ui.settings.paywall

import android.app.Activity
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.AutoFixHigh
import androidx.compose.material.icons.filled.BatchPrediction
import androidx.compose.material.icons.filled.QrCodeScanner
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.billing.BillingState
import com.universalmedialibrary.services.billing.PurchaseResult

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ScannerPaywallSubpage(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: ScannerPaywallViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val context = LocalContext.current
    val activity = context as? Activity

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Barcode Scanner Pro") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        },
        modifier = modifier
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Hero
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(24.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Icon(
                        imageVector = Icons.Default.QrCodeScanner,
                        contentDescription = "Scanner Pro",
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(64.dp)
                    )
                    Text(
                        text = "Upgrade Barcode Cataloging",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold,
                        textAlign = TextAlign.Center
                    )
                    Text(
                        text = "Scan physical bookshelves, auto-import metadata from Google Books & Goodreads, and batch catalog your library instantly.",
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Benefits
            Text(
                text = "Scanner Pro Features",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            FeatureBenefitItem(
                icon = Icons.Default.BatchPrediction,
                title = "Batch ISBN Camera Scan",
                description = "Scan dozens of physical book barcodes continuously without closing the camera."
            )

            FeatureBenefitItem(
                icon = Icons.Default.AutoFixHigh,
                title = "Automatic Metadata Enrichment",
                description = "Instantly fetch high-resolution covers, authors, tags, and summary blurbs."
            )

            if (uiState.isUnlocked) {
                AlreadyUnlockedCard(
                    title = "Scanner Pro Active",
                    description = "Unlimited batch cataloging and metadata enrichment are active."
                )
            } else if (uiState.billingState is BillingState.Offline || uiState.billingState is BillingState.Error) {
                OfflineErrorStateCard(
                    onRetry = { viewModel.retryConnection() }
                )
            } else {
                Text(
                    text = "Select Plan",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )

                uiState.products.forEach { product ->
                    PricingPlanCard(
                        product = product,
                        isSelected = product.productId == uiState.selectedProductId,
                        onSelect = { viewModel.selectProduct(product.productId) }
                    )
                }

                Spacer(modifier = Modifier.height(8.dp))

                Button(
                    onClick = {
                        uiState.selectedProductId?.let { id ->
                            viewModel.buy(activity, id)
                        }
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(54.dp),
                    enabled = uiState.selectedProductId != null && !uiState.isProcessing
                ) {
                    if (uiState.isProcessing) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(24.dp),
                            color = MaterialTheme.colorScheme.onPrimary,
                            strokeWidth = 2.dp
                        )
                    } else {
                        Text(
                            text = "Get Scanner Pro",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }

            uiState.purchaseResult?.let { result ->
                AlertDialog(
                    onDismissRequest = { viewModel.dismissPurchaseResult() },
                    title = {
                        Text(if (result is PurchaseResult.Success) "Scanner Pro Unlocked!" else "Purchase Result")
                    },
                    text = {
                        Text(
                            when (result) {
                                is PurchaseResult.Success -> "Barcode Scanner Pro features are now unlocked."
                                is PurchaseResult.Cancelled -> "Purchase was cancelled."
                                is PurchaseResult.Error -> "Error: ${result.message}"
                            }
                        )
                    },
                    confirmButton = {
                        TextButton(onClick = { viewModel.dismissPurchaseResult() }) {
                            Text("OK")
                        }
                    }
                )
            }
        }
    }
}
