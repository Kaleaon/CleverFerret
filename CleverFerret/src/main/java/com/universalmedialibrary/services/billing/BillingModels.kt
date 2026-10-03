package com.universalmedialibrary.services.billing

/**
 * State representing the connection to the billing service / store.
 */
sealed class BillingState {
    object Connected : BillingState()
    object Connecting : BillingState()
    object Disconnected : BillingState()
    object Offline : BillingState()
    data class Error(val message: String) : BillingState()
}

/**
 * Purchase state returned by billing provider.
 */
enum class PurchaseState {
    PENDING,
    PURCHASED,
    UNSPECIFIED_STATE,
    FAILED,
    CANCELLED
}

/**
 * Result of a billing purchase flow transaction.
 */
sealed class PurchaseResult {
    data class Success(
        val productId: String,
        val purchaseToken: String,
        val orderId: String? = null
    ) : PurchaseResult()

    object Cancelled : PurchaseResult()
    data class Error(val message: String, val errorCode: Int? = null) : PurchaseResult()
}

/**
 * Product detail representation abstracted from underlying store.
 */
data class ProductDetails(
    val productId: String,
    val title: String,
    val description: String,
    val price: String,
    val priceMicros: Long,
    val currencyCode: String,
    val subscriptionPeriod: String? = null,
    val productType: ProductType = ProductType.SUBSCRIPTION
)

enum class ProductType {
    SUBSCRIPTION,
    INAPP
}

/**
 * Represents entitlement status for a feature domain.
 */
data class EntitlementStatus(
    val featureId: String,
    val isUnlocked: Boolean,
    val expirationTimeMs: Long? = null,
    val activeProductId: String? = null
)
