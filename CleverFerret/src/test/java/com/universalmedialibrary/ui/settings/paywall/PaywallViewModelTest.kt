package com.universalmedialibrary.ui.settings.paywall

import com.universalmedialibrary.services.billing.BillingState
import com.universalmedialibrary.services.billing.GooglePlayBillingAdapter
import com.universalmedialibrary.services.billing.PurchaseResult
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
class PaywallViewModelTest {

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
    fun themePaywallViewModel_loadsProductsAndBuysThemePro() = runTest {
        val viewModel = ThemePaywallViewModel(adapter, themeHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        assertEquals(PaywallDomain.THEMES, viewModel.uiState.value.domain)
        assertFalse(viewModel.uiState.value.products.isEmpty())

        viewModel.buy(null, "theme_pro_monthly")
        testDispatcher.scheduler.advanceUntilIdle()

        assertTrue(viewModel.uiState.value.isUnlocked)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Success)
    }

    @Test
    fun scannerPaywallViewModel_loadsProductsAndBuysScannerPro() = runTest {
        val viewModel = ScannerPaywallViewModel(adapter, scannerHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        assertEquals(PaywallDomain.SCANNER, viewModel.uiState.value.domain)
        assertFalse(viewModel.uiState.value.products.isEmpty())

        viewModel.buy(null, "scanner_pro_annual")
        testDispatcher.scheduler.advanceUntilIdle()

        assertTrue(viewModel.uiState.value.isUnlocked)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Success)
    }

    @Test
    fun cloudPaywallViewModel_offlineStateAndRetry() = runTest {
        adapter.setOfflineSimulated(true)
        val viewModel = CloudPaywallViewModel(adapter, cloudHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        assertEquals(BillingState.Offline, viewModel.uiState.value.billingState)

        adapter.setOfflineSimulated(false)
        viewModel.retryConnection()
        testDispatcher.scheduler.advanceUntilIdle()

        assertEquals(BillingState.Connected, viewModel.uiState.value.billingState)
    }

    @Test
    fun themePaywallViewModel_restorePurchases_unlocksProAndSetsSuccessResult() = runTest {
        adapter.addActivePurchase("theme_pro_annual")
        val viewModel = ThemePaywallViewModel(adapter, themeHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        assertFalse(viewModel.uiState.value.isUnlocked)

        viewModel.restorePurchases()
        testDispatcher.scheduler.advanceUntilIdle()

        assertTrue(viewModel.uiState.value.isUnlocked)
        assertFalse(viewModel.uiState.value.isProcessing)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Success)
    }

    @Test
    fun themePaywallViewModel_restorePurchases_whenNoPurchases_showsErrorFeedback() = runTest {
        val viewModel = ThemePaywallViewModel(adapter, themeHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.restorePurchases()
        testDispatcher.scheduler.advanceUntilIdle()

        assertFalse(viewModel.uiState.value.isUnlocked)
        assertFalse(viewModel.uiState.value.isProcessing)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Error)
    }

    @Test
    fun scannerPaywallViewModel_restorePurchases_unlocksScannerPro() = runTest {
        adapter.addActivePurchase("scanner_pro_monthly")
        val viewModel = ScannerPaywallViewModel(adapter, scannerHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.restorePurchases()
        testDispatcher.scheduler.advanceUntilIdle()

        assertTrue(viewModel.uiState.value.isUnlocked)
        assertTrue(scannerHandler.isScannerProUnlocked.value)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Success)
    }

    @Test
    fun cloudPaywallViewModel_restorePurchases_whenOffline_setsErrorResult() = runTest {
        adapter.addActivePurchase("cloud_pro_monthly")
        adapter.setOfflineSimulated(true)
        val viewModel = CloudPaywallViewModel(adapter, cloudHandler)
        testDispatcher.scheduler.advanceUntilIdle()

        viewModel.restorePurchases()
        testDispatcher.scheduler.advanceUntilIdle()

        assertFalse(viewModel.uiState.value.isUnlocked)
        assertTrue(viewModel.uiState.value.purchaseResult is PurchaseResult.Error)
    }
}
