package com.universalmedialibrary.ui.settings.paywall

import android.app.Activity
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.billing.BillingService
import com.universalmedialibrary.services.billing.BillingState
import com.universalmedialibrary.services.billing.ProductDetails
import com.universalmedialibrary.services.billing.PurchaseResult
import com.universalmedialibrary.services.billing.entitlements.CloudEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ScannerEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ThemeEntitlementHandler
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch
import javax.inject.Inject

enum class PaywallDomain {
    THEMES,
    SCANNER,
    CLOUD
}

data class PaywallUiState(
    val domain: PaywallDomain = PaywallDomain.THEMES,
    val billingState: BillingState = BillingState.Connected,
    val products: List<ProductDetails> = emptyList(),
    val isUnlocked: Boolean = false,
    val selectedProductId: String? = null,
    val isProcessing: Boolean = false,
    val purchaseResult: PurchaseResult? = null
)

@HiltViewModel
class ThemePaywallViewModel @Inject constructor(
    private val billingService: BillingService,
    private val themeEntitlementHandler: ThemeEntitlementHandler
) : ViewModel() {

    private val productIds = listOf("theme_pro_monthly", "theme_pro_annual", "theme_pro_lifetime")

    private val _uiState = MutableStateFlow(PaywallUiState(domain = PaywallDomain.THEMES, selectedProductId = productIds.first()))
    val uiState: StateFlow<PaywallUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            billingService.billingState.collectLatest { state ->
                _uiState.value = _uiState.value.copy(billingState = state)
                if (state is BillingState.Connected) {
                    loadProducts()
                }
            }
        }
        viewModelScope.launch {
            themeEntitlementHandler.isThemeProUnlocked.collectLatest { unlocked ->
                _uiState.value = _uiState.value.copy(isUnlocked = unlocked)
            }
        }
        viewModelScope.launch {
            billingService.purchases.collectLatest { result ->
                _uiState.value = _uiState.value.copy(isProcessing = false, purchaseResult = result)
            }
        }
        loadProducts()
    }

    fun selectProduct(productId: String) {
        _uiState.value = _uiState.value.copy(selectedProductId = productId)
    }

    private fun loadProducts() {
        viewModelScope.launch {
            val items = billingService.queryProducts(productIds)
            _uiState.value = _uiState.value.copy(products = items)
        }
    }

    fun buy(activity: Activity?, productId: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isProcessing = true, purchaseResult = null)
            billingService.launchBillingFlow(activity, productId)
        }
    }

    fun retryConnection() {
        billingService.retryConnection()
    }

    fun setOfflineSimulated(offline: Boolean) {
        billingService.setOfflineSimulated(offline)
    }

    fun dismissPurchaseResult() {
        _uiState.value = _uiState.value.copy(purchaseResult = null)
    }
}

@HiltViewModel
class ScannerPaywallViewModel @Inject constructor(
    private val billingService: BillingService,
    private val scannerEntitlementHandler: ScannerEntitlementHandler
) : ViewModel() {

    private val productIds = listOf("scanner_pro_monthly", "scanner_pro_annual")

    private val _uiState = MutableStateFlow(PaywallUiState(domain = PaywallDomain.SCANNER, selectedProductId = productIds.first()))
    val uiState: StateFlow<PaywallUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            billingService.billingState.collectLatest { state ->
                _uiState.value = _uiState.value.copy(billingState = state)
                if (state is BillingState.Connected) {
                    loadProducts()
                }
            }
        }
        viewModelScope.launch {
            scannerEntitlementHandler.isScannerProUnlocked.collectLatest { unlocked ->
                _uiState.value = _uiState.value.copy(isUnlocked = unlocked)
            }
        }
        viewModelScope.launch {
            billingService.purchases.collectLatest { result ->
                _uiState.value = _uiState.value.copy(isProcessing = false, purchaseResult = result)
            }
        }
        loadProducts()
    }

    fun selectProduct(productId: String) {
        _uiState.value = _uiState.value.copy(selectedProductId = productId)
    }

    private fun loadProducts() {
        viewModelScope.launch {
            val items = billingService.queryProducts(productIds)
            _uiState.value = _uiState.value.copy(products = items)
        }
    }

    fun buy(activity: Activity?, productId: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isProcessing = true, purchaseResult = null)
            billingService.launchBillingFlow(activity, productId)
        }
    }

    fun retryConnection() {
        billingService.retryConnection()
    }

    fun setOfflineSimulated(offline: Boolean) {
        billingService.setOfflineSimulated(offline)
    }

    fun dismissPurchaseResult() {
        _uiState.value = _uiState.value.copy(purchaseResult = null)
    }
}

@HiltViewModel
class CloudPaywallViewModel @Inject constructor(
    private val billingService: BillingService,
    private val cloudEntitlementHandler: CloudEntitlementHandler
) : ViewModel() {

    private val productIds = listOf("cloud_pro_monthly", "cloud_pro_annual")

    private val _uiState = MutableStateFlow(PaywallUiState(domain = PaywallDomain.CLOUD, selectedProductId = productIds.first()))
    val uiState: StateFlow<PaywallUiState> = _uiState.asStateFlow()

    init {
        viewModelScope.launch {
            billingService.billingState.collectLatest { state ->
                _uiState.value = _uiState.value.copy(billingState = state)
                if (state is BillingState.Connected) {
                    loadProducts()
                }
            }
        }
        viewModelScope.launch {
            cloudEntitlementHandler.isCloudProUnlocked.collectLatest { unlocked ->
                _uiState.value = _uiState.value.copy(isUnlocked = unlocked)
            }
        }
        viewModelScope.launch {
            billingService.purchases.collectLatest { result ->
                _uiState.value = _uiState.value.copy(isProcessing = false, purchaseResult = result)
            }
        }
        loadProducts()
    }

    fun selectProduct(productId: String) {
        _uiState.value = _uiState.value.copy(selectedProductId = productId)
    }

    private fun loadProducts() {
        viewModelScope.launch {
            val items = billingService.queryProducts(productIds)
            _uiState.value = _uiState.value.copy(products = items)
        }
    }

    fun buy(activity: Activity?, productId: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(isProcessing = true, purchaseResult = null)
            billingService.launchBillingFlow(activity, productId)
        }
    }

    fun retryConnection() {
        billingService.retryConnection()
    }

    fun setOfflineSimulated(offline: Boolean) {
        billingService.setOfflineSimulated(offline)
    }

    fun dismissPurchaseResult() {
        _uiState.value = _uiState.value.copy(purchaseResult = null)
    }
}
