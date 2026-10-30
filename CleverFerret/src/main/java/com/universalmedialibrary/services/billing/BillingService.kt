package com.universalmedialibrary.services.billing

import android.app.Activity
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow

/**
 * Decoupled interface for Play Billing and multi-store payment abstractions.
 */
interface BillingService {
    /**
     * Current connectivity status to the payment store.
     */
    val billingState: StateFlow<BillingState>

    /**
     * Shared flow of purchase flow results.
     */
    val purchases: SharedFlow<PurchaseResult>

    /**
     * Query product details for given product IDs.
     */
    suspend fun queryProducts(productIds: List<String>): List<ProductDetails>

    /**
     * Launch billing purchase flow for a product.
     */
    suspend fun launchBillingFlow(activity: Activity?, productId: String): PurchaseResult

    /**
     * Refresh active entitlements from store backend.
     */
    suspend fun refreshEntitlements()

    /**
     * Attempt reconnection to billing service when in Disconnected/Offline state.
     */
    fun retryConnection()

    /**
     * Observe entitlement state for a specific feature ID.
     */
    fun observeEntitlement(featureId: String): Flow<EntitlementStatus>

    /**
     * Set offline mode simulation for testing or offline recovery handling.
     */
    fun setOfflineSimulated(offline: Boolean)
}
