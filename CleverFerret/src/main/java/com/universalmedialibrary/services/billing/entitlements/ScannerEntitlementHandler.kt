package com.universalmedialibrary.services.billing.entitlements

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Handles entitlement checks for advanced barcode scanner cataloging perks.
 */
@Singleton
class ScannerEntitlementHandler @Inject constructor() {

    private val _isScannerProUnlocked = MutableStateFlow(false)
    val isScannerProUnlocked: StateFlow<Boolean> = _isScannerProUnlocked.asStateFlow()

    /**
     * Check if advanced batch scanning is permitted.
     */
    fun canBatchScan(): Boolean = _isScannerProUnlocked.value

    /**
     * Check if auto cataloging and metadata enhancement are permitted.
     */
    fun canAutoCatalog(): Boolean = _isScannerProUnlocked.value

    /**
     * Update Scanner Pro entitlement state.
     */
    fun setProUnlocked(unlocked: Boolean) {
        _isScannerProUnlocked.value = unlocked
    }

    /**
     * Process purchase callbacks for scanner products.
     */
    fun processPurchase(productId: String) {
        if (productId.contains("scanner", ignoreCase = true) || productId.contains("pro", ignoreCase = true)) {
            setProUnlocked(true)
        }
    }
}
