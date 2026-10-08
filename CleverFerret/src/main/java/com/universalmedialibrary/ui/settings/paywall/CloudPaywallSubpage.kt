package com.universalmedialibrary.ui.settings.paywall

import android.app.Activity
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.CloudDone
import androidx.compose.material.icons.filled.CloudQueue
import androidx.compose.material.icons.filled.Sync
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
fun CloudPaywallSubpage(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: CloudPaywallViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val context = LocalContext.current
    val activity = context as? Activity

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Cloud Sync Pro") },
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
                        imageVector = Icons.Default.CloudQueue,
                        contentDescription = "Cloud Pro",
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(64.dp)
                    )
                    Text(
                        text = "Multi-Device Library Sync",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold,
                        textAlign = TextAlign.Center
                    )
                    Text(
                        text = "Seamlessly synchronize reading positions, audio bookmarks, annotations, and media metadata across all your Android & desktop devices.",
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Benefits
            Text(
                text = "Cloud Sync Features",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            FeatureBenefitItem(
                icon = Icons.Default.Sync,
                title = "Real-Time Reading & Playback Sync",
                description = "Pick up reading or audio playback right where you left off on any connected device."
            )

            FeatureBenefitItem(
                icon = Icons.Default.CloudDone,
                title = "Automated Encrypted Backups",
                description = "Safeguard your tags, collections, search history, and settings in encrypted cloud storage."
            )

            if (uiState.isUnlocked) {
                AlreadyUnlockedCard(
                    title = "Cloud Sync Pro Active",
                    description = "Unlimited device sync and encrypted cloud backups are active."
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
                            text = "Get Cloud Sync Pro",
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
                        Text(if (result is PurchaseResult.Success) "Cloud Pro Active!" else "Purchase Result")
                    },
                    text = {
                        Text(
                            when (result) {
                                is PurchaseResult.Success -> "Cloud Sync Pro features are now unlocked."
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
