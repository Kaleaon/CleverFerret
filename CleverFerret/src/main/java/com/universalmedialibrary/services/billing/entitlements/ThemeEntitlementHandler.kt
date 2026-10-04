package com.universalmedialibrary.services.billing.entitlements

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Handles entitlement checks and unlocking logic for premium theme cosmetics.
 */
@Singleton
class ThemeEntitlementHandler @Inject constructor() {

    private val _isThemeProUnlocked = MutableStateFlow(false)
    val isThemeProUnlocked: StateFlow<Boolean> = _isThemeProUnlocked.asStateFlow()

    // Default free palettes available to all users
    private val freeThemePalettes = setOf(
        "NAVY_GOLD",
        "EMERALD_SILVER",
        "ROYAL_BRONZE",
        "MIDNIGHT_AMBER",
        "OBSIDIAN_CRIMSON",
        "SLATE_CYAN",
        "PAPER_INK"
    )

    /**
     * Check if a specific theme palette name is unlocked for the user.
     */
    fun isThemeUnlocked(paletteName: String): Boolean {
        if (_isThemeProUnlocked.value) return true
        return paletteName.uppercase() in freeThemePalettes
    }

    /**
     * Update Pro theme entitlement state (called by BillingService on purchase/restore).
     */
    fun setProUnlocked(unlocked: Boolean) {
        _isThemeProUnlocked.value = unlocked
    }

    /**
     * Helper to process purchase token or product callback.
     */
    fun processPurchase(productId: String) {
        if (productId.contains("theme", ignoreCase = true) || productId.contains("pro", ignoreCase = true)) {
            setProUnlocked(true)
        }
    }
}
