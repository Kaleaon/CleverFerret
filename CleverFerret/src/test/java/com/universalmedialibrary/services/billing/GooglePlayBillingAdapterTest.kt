package com.universalmedialibrary.services.billing

import android.app.Application
import android.content.Context
import android.content.Intent
import androidx.test.core.app.ApplicationProvider
import com.universalmedialibrary.services.billing.entitlements.CloudEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ScannerEntitlementHandler
import com.universalmedialibrary.services.billing.entitlements.ThemeEntitlementHandler
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows.shadowOf

@RunWith(RobolectricTestRunner::class)
class GooglePlayBillingAdapterTest {

    private lateinit var themeHandler: ThemeEntitlementHandler
    private lateinit var scannerHandler: ScannerEntitlementHandler
    private lateinit var cloudHandler: CloudEntitlementHandler
    private lateinit var adapter: GooglePlayBillingAdapter
    private lateinit var context: Context

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        themeHandler = ThemeEntitlementHandler()
        scannerHandler = ScannerEntitlementHandler()
        cloudHandler = CloudEntitlementHandler()
        adapter = GooglePlayBillingAdapter(themeHandler, scannerHandler, cloudHandler)
    }

    @Test
    fun launchManageSubscriptions_withSpecificSku_launchesCorrectPlayStoreIntent() {
        adapter.launchManageSubscriptions(context, "theme_pro_monthly")

        val app = ApplicationProvider.getApplicationContext<Application>()
        val nextStartedActivity = shadowOf(app).nextStartedActivity
        assertNotNull(nextStartedActivity)
        assertEquals(Intent.ACTION_VIEW, nextStartedActivity.action)
        assertEquals("com.android.vending", nextStartedActivity.`package`)
        val expectedUri = "https://play.google.com/store/account/subscriptions?sku=theme_pro_monthly&package=${context.packageName}"
        assertEquals(expectedUri, nextStartedActivity.dataString)
    }

    @Test
    fun launchManageSubscriptions_withNullSku_launchesGeneralSubscriptionsIntent() {
        adapter.launchManageSubscriptions(context, null)

        val app = ApplicationProvider.getApplicationContext<Application>()
        val nextStartedActivity = shadowOf(app).nextStartedActivity
        assertNotNull(nextStartedActivity)
        assertEquals(Intent.ACTION_VIEW, nextStartedActivity.action)
        assertEquals("com.android.vending", nextStartedActivity.`package`)
        val expectedUri = "https://play.google.com/store/account/subscriptions?package=${context.packageName}"
        assertEquals(expectedUri, nextStartedActivity.dataString)
    }

    @Test
    fun launchManageSubscriptions_whenPlayStoreFails_executesBrowserFallback() {
        val mockContext = io.mockk.mockk<Context>(relaxed = true)
        io.mockk.every { mockContext.packageName } returns "com.universalmedialibrary"

        val intentSlot = mutableListOf<Intent>()
        io.mockk.every { mockContext.startActivity(capture(intentSlot)) } throws Exception("Play Store missing") andThenAnswer { }

        adapter.launchManageSubscriptions(mockContext, "cloud_pro_annual")

        assertEquals(2, intentSlot.size)
        assertEquals("com.android.vending", intentSlot[0].`package`)
        assertNull(intentSlot[1].`package`)
        val expectedUrl = "https://play.google.com/store/account/subscriptions?" +
            "sku=cloud_pro_annual&package=com.universalmedialibrary"
        assertEquals(expectedUrl, intentSlot[1].dataString)
    }
}
