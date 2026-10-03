package com.universalmedialibrary.ui.settings.paywall

import android.app.Activity
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.AutoAwesome
import androidx.compose.material.icons.filled.ColorLens
import androidx.compose.material.icons.filled.Palette
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.billing.BillingState
import com.universalmedialibrary.services.billing.PurchaseResult

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ThemePaywallSubpage(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: ThemePaywallViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val context = LocalContext.current
    val activity = context as? Activity

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Theme Pro Store") },
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
            // Hero section
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
                        imageVector = Icons.Default.Palette,
                        contentDescription = "Theme Pro",
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(64.dp)
                    )
                    Text(
                        text = "Unlock All Premium Metallic Themes",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold,
                        textAlign = TextAlign.Center
                    )
                    Text(
                        text = "Transform CleverFerret with rich metallic gradients, custom reader typography, and exclusive color palettes.",
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Benefits
            Text(
                text = "Pro Theme Perks",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            FeatureBenefitItem(
                icon = Icons.Default.ColorLens,
                title = "20+ Exclusive Metallic Palettes",
                description = "Burgundy Rose Gold, Obsidian Crimson, Platinum, Deep Purple, and more."
            )

            FeatureBenefitItem(
                icon = Icons.Default.AutoAwesome,
                title = "Dynamic Reader Shimmer Effects",
                description = "Enhance EPUB, PDF, and comic reader background themes."
            )

            if (uiState.isUnlocked) {
                AlreadyUnlockedCard(
                    title = "Theme Pro Unlocked",
                    description = "You have full access to all premium theme palettes and reader styles."
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
                            text = "Upgrade to Theme Pro",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                    }
                }
            }

            // Purchase result feedback dialog/snackbar
            uiState.purchaseResult?.let { result ->
                AlertDialog(
                    onDismissRequest = { viewModel.dismissPurchaseResult() },
                    title = {
                        Text(if (result is PurchaseResult.Success) "Purchase Successful!" else "Purchase Update")
                    },
                    text = {
                        Text(
                            when (result) {
                                is PurchaseResult.Success -> "Theme Pro is now unlocked on your account."
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
