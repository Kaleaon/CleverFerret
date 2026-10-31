package com.universalmedialibrary.data.local

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class DatabaseKeyManagerTest {

    private lateinit var context: Context
    private lateinit var keyManager: DatabaseKeyManager

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        keyManager = DatabaseKeyManager(context)
    }

    @Test
    fun `getPassphrase returns 32 byte array and remains consistent across calls`() {
        val passphrase1 = keyManager.getPassphrase()
        assertNotNull(passphrase1)
        assertEquals(32, passphrase1.size)

        val passphrase2 = keyManager.getPassphrase()
        assertEquals(passphrase1.toList(), passphrase2.toList())
    }
}
