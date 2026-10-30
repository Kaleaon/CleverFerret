package com.universalmedialibrary.services.billing

import android.app.Activity
import com.universalmedialibrary.services.billing.entitlements.CloudEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ScannerEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ThemeEntitlementHandler
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Modular Google Play Billing Service implementation adapter.
 * Encapsulates store interactions and updates domain entitlement handlers.
 */
@Singleton
class GooglePlayBillingAdapter @Inject constructor(
    private val themeEntitlementHandler: ThemeEntitlementHandler,
    private val scannerEntitlementHandler: ScannerEntitlementHandler,
    private val cloudEntitlementHandler: CloudEntitlementHandler
) : BillingService {

    private val scope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    private val _billingState = MutableStateFlow<BillingState>(BillingState.Connected)
    override val billingState: StateFlow<BillingState> = _billingState.asStateFlow()

    private val _purchases = MutableSharedFlow<PurchaseResult>()
    override val purchases: SharedFlow<PurchaseResult> = _purchases.asSharedFlow()

    private var isSimulatedOffline = false

    private val catalog = mapOf(
        // Theme products
        "theme_pro_monthly" to ProductDetails(
            productId = "theme_pro_monthly",
            title = "Theme Pro Pass (Monthly)",
            description = "Access all premium metallic palettes and custom reader themes.",
            price = "$1.99/mo",
            priceMicros = 1990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1M",
            productType = ProductType.SUBSCRIPTION
        ),
        "theme_pro_annual" to ProductDetails(
            productId = "theme_pro_annual",
            title = "Theme Pro Pass (Annual)",
            description = "Full theme library access with 35% savings.",
            price = "$14.99/yr",
            priceMicros = 14990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1Y",
            productType = ProductType.SUBSCRIPTION
        ),
        "theme_pro_lifetime" to ProductDetails(
            productId = "theme_pro_lifetime",
            title = "Theme Pro Pass (Lifetime)",
            description = "Unlock all current and future themes forever.",
            price = "$29.99",
            priceMicros = 29990000L,
            currencyCode = "USD",
            productType = ProductType.INAPP
        ),
        // Scanner products
        "scanner_pro_monthly" to ProductDetails(
            productId = "scanner_pro_monthly",
            title = "Scanner Pro (Monthly)",
            description = "Batch ISBN scanning, auto-importing, and metadata retrieval.",
            price = "$2.99/mo",
            priceMicros = 2990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1M",
            productType = ProductType.SUBSCRIPTION
        ),
        "scanner_pro_annual" to ProductDetails(
            productId = "scanner_pro_annual",
            title = "Scanner Pro (Annual)",
            description = "Unlimited cataloging and barcode perks annually.",
            price = "$19.99/yr",
            priceMicros = 19990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1Y",
            productType = ProductType.SUBSCRIPTION
        ),
        // Cloud products
        "cloud_pro_monthly" to ProductDetails(
            productId = "cloud_pro_monthly",
            title = "Cloud Sync Pro (Monthly)",
            description = "Cross-device progress, multi-room sync, and automated backup.",
            price = "$3.99/mo",
            priceMicros = 3990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1M",
            productType = ProductType.SUBSCRIPTION
        ),
        "cloud_pro_annual" to ProductDetails(
            productId = "cloud_pro_annual",
            title = "Cloud Sync Pro (Annual)",
            description = "Unlimited cloud sync and multi-device backup for 1 year.",
            price = "$29.99/yr",
            priceMicros = 29990000L,
            currencyCode = "USD",
            subscriptionPeriod = "P1Y",
            productType = ProductType.SUBSCRIPTION
        )
    )

    override suspend fun queryProducts(productIds: List<String>): List<ProductDetails> {
        if (_billingState.value is BillingState.Offline || _billingState.value is BillingState.Disconnected) {
            return emptyList()
        }
        return productIds.mapNotNull { catalog[it] }
    }

    override suspend fun launchBillingFlow(activity: Activity?, productId: String): PurchaseResult {
        if (_billingState.value is BillingState.Offline || _billingState.value is BillingState.Disconnected) {
            val result = PurchaseResult.Error("Service unavailable. Device is offline.", errorCode = -1)
            _purchases.emit(result)
            return result
        }

        val product = catalog[productId]
        if (product == null) {
            val result = PurchaseResult.Error("Product $productId not found in store catalog.", errorCode = 404)
            _purchases.emit(result)
            return result
        }

        val result = PurchaseResult.Success(
            productId = productId,
            purchaseToken = "mock_token_${productId}_${System.currentTimeMillis()}",
            orderId = "GPA.${System.currentTimeMillis()}-0001"
        )

        // Process callback to update domain entitlement handlers
        processPurchaseSuccess(productId)

        _purchases.emit(result)
        return result
    }

    override suspend fun refreshEntitlements() {
        if (isSimulatedOffline) {
            _billingState.value = BillingState.Offline
            return
        }
        _billingState.value = BillingState.Connected
    }

    override fun retryConnection() {
        scope.launch {
            _billingState.value = BillingState.Connecting
            if (isSimulatedOffline) {
                _billingState.value = BillingState.Offline
            } else {
                _billingState.value = BillingState.Connected
                refreshEntitlements()
            }
        }
    }

    override fun observeEntitlement(featureId: String): Flow<EntitlementStatus> {
        return when (featureId) {
            "themes" -> themeEntitlementHandler.isThemeProUnlocked.map {
                EntitlementStatus("themes", it)
            }
            "scanner" -> scannerEntitlementHandler.isScannerProUnlocked.map {
                EntitlementStatus("scanner", it)
            }
            "cloud" -> cloudEntitlementHandler.isCloudProUnlocked.map {
                EntitlementStatus("cloud", it)
            }
            else -> themeEntitlementHandler.isThemeProUnlocked.map {
                EntitlementStatus(featureId, it)
            }
        }
    }

    override fun setOfflineSimulated(offline: Boolean) {
        isSimulatedOffline = offline
        _billingState.value = if (offline) BillingState.Offline else BillingState.Connected
    }

    private fun processPurchaseSuccess(productId: String) {
        when {
            productId.contains("theme") -> themeEntitlementHandler.processPurchase(productId)
            productId.contains("scanner") -> scannerEntitlementHandler.processPurchase(productId)
            productId.contains("cloud") -> cloudEntitlementHandler.processPurchase(productId)
            else -> {
                themeEntitlementHandler.processPurchase(productId)
                scannerEntitlementHandler.processPurchase(productId)
                cloudEntitlementHandler.processPurchase(productId)
            }
        }
    }
}
