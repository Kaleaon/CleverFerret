package com.universalmedialibrary.services.billing.entitlements

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Handles entitlement checks for Cloud Sync and multi-device library perks.
 */
@Singleton
class CloudEntitlementHandler @Inject constructor() {

    private val _isCloudProUnlocked = MutableStateFlow(false)
    val isCloudProUnlocked: StateFlow<Boolean> = _isCloudProUnlocked.asStateFlow()

    /**
     * Check if unlimited multi-device cloud sync is permitted.
     */
    fun canSyncUnlimitedDevices(): Boolean = _isCloudProUnlocked.value

    /**
     * Update Cloud Pro entitlement state.
     */
    fun setProUnlocked(unlocked: Boolean) {
        _isCloudProUnlocked.value = unlocked
    }

    /**
     * Process purchase callbacks for cloud products.
     */
    fun processPurchase(productId: String) {
        if (productId.contains("cloud", ignoreCase = true) || productId.contains("pro", ignoreCase = true)) {
            setProUnlocked(true)
        }
    }
}
