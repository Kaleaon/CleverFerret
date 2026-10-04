package com.universalmedialibrary.services.billing

import com.universalmedialibrary.services.billing.entitlements.CloudEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ScannerEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ThemeEntitlementHandler
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.test.StandardTestDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.runTest
import kotlinx.coroutines.test.setMain
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

@OptIn(ExperimentalCoroutinesApi::class)
class BillingServiceTest {

    private val testDispatcher = StandardTestDispatcher()

    private lateinit var themeHandler: ThemeEntitlementHandler
    private lateinit var scannerHandler: ScannerEntitlementHandler
    private lateinit var cloudHandler: CloudEntitlementHandler
    private lateinit var adapter: GooglePlayBillingAdapter

    @Before
    fun setUp() {
        Dispatchers.setMain(testDispatcher)
        themeHandler = ThemeEntitlementHandler()
        scannerHandler = ScannerEntitlementHandler()
        cloudHandler = CloudEntitlementHandler()
        adapter = GooglePlayBillingAdapter(themeHandler, scannerHandler, cloudHandler)
    }

    @After
    fun tearDown() {
        Dispatchers.resetMain()
    }

    @Test
    fun freeThemesUnlockedByDefault_premiumThemesLocked() {
        assertTrue(themeHandler.isThemeUnlocked("NAVY_GOLD"))
        assertTrue(themeHandler.isThemeUnlocked("EMERALD_SILVER"))
        assertFalse(themeHandler.isThemeUnlocked("BURGUNDY_ROSE_GOLD"))
        assertFalse(themeHandler.isThemeUnlocked("DEEP_PURPLE_PLATINUM"))
    }

    @Test
    fun purchaseThemeProduct_unlocksAllThemes() = runTest {
        val result = adapter.launchBillingFlow(null, "theme_pro_monthly")
        assertTrue(result is PurchaseResult.Success)
        assertTrue(themeHandler.isThemeProUnlocked.value)
        assertTrue(themeHandler.isThemeUnlocked("BURGUNDY_ROSE_GOLD"))
    }

    @Test
    fun purchaseScannerProduct_unlocksScannerPro() = runTest {
        val result = adapter.launchBillingFlow(null, "scanner_pro_annual")
        assertTrue(result is PurchaseResult.Success)
        assertTrue(scannerHandler.isScannerProUnlocked.value)
        assertTrue(scannerHandler.canBatchScan())
    }

    @Test
    fun purchaseCloudProduct_unlocksCloudPro() = runTest {
        val result = adapter.launchBillingFlow(null, "cloud_pro_monthly")
        assertTrue(result is PurchaseResult.Success)
        assertTrue(cloudHandler.isCloudProUnlocked.value)
        assertTrue(cloudHandler.canSyncUnlimitedDevices())
    }

    @Test
    fun offlineSimulation_returnsOfflineStateAndEmptyProducts() = runTest {
        adapter.setOfflineSimulated(true)
        assertEquals(BillingState.Offline, adapter.billingState.value)

        val products = adapter.queryProducts(listOf("theme_pro_monthly"))
        assertTrue(products.isEmpty())

        val purchaseResult = adapter.launchBillingFlow(null, "theme_pro_monthly")
        assertTrue(purchaseResult is PurchaseResult.Error)

        // Retry restores connection when offline mode disabled
        adapter.setOfflineSimulated(false)
        adapter.retryConnection()
        testDispatcher.scheduler.advanceUntilIdle()
        assertEquals(BillingState.Connected, adapter.billingState.value)
    }
}
