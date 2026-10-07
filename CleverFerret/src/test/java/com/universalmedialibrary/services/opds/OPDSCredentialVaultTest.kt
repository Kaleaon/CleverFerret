package com.universalmedialibrary.services.opds

import android.content.Context
import android.content.SharedPreferences
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test

import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class OPDSCredentialVaultTest {

    @MockK
    lateinit var context: Context

    private val memoryStorage = mutableMapOf<String, Any?>()

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        val mockPrefs = FakeSharedPreferences(memoryStorage)
        every { context.getSharedPreferences(any(), any()) } returns mockPrefs
    }

    @Test
    fun `stores and retrieves credentials by catalog ID and host`() {
        val vault = OPDSCredentialVault(context)

        vault.saveCredentials(catalogId = 42L, username = "testuser", password = "secretpassword", host = "catalog.example.com")

        val credsById = vault.getCredentials(42L)
        assertEquals("testuser", credsById?.username)
        assertEquals("secretpassword", credsById?.password)

        val credsByHost = vault.getCredentialsForHost("catalog.example.com")
        assertEquals("testuser", credsByHost?.username)
        assertEquals("secretpassword", credsByHost?.password)
    }

    @Test
    fun `removes credentials by catalog ID and host`() {
        val vault = OPDSCredentialVault(context)
        vault.saveCredentials(catalogId = 42L, username = "testuser", password = "secretpassword", host = "catalog.example.com")

        vault.removeCredentials(42L)
        assertNull(vault.getCredentials(42L))

        vault.removeCredentialsForHost("catalog.example.com")
        assertNull(vault.getCredentialsForHost("catalog.example.com"))
    }

    private class FakeSharedPreferences(
        private val storage: MutableMap<String, Any?>
    ) : SharedPreferences {
        override fun getAll(): MutableMap<String, *> = storage
        override fun getString(key: String?, defValue: String?): String? = storage[key] as? String ?: defValue
        override fun getStringSet(key: String?, defValues: MutableSet<String>?): MutableSet<String>? = null
        override fun getInt(key: String?, defValue: Int): Int = storage[key] as? Int ?: defValue
        override fun getLong(key: String?, defValue: Long): Long = storage[key] as? Long ?: defValue
        override fun getFloat(key: String?, defValue: Float): Float = storage[key] as? Float ?: defValue
        override fun getBoolean(key: String?, defValue: Boolean): Boolean = storage[key] as? Boolean ?: defValue
        override fun contains(key: String?): Boolean = storage.containsKey(key)
        override fun edit(): SharedPreferences.Editor = Editor(storage)
        override fun registerOnSharedPreferenceChangeListener(listener: SharedPreferences.OnSharedPreferenceChangeListener?) {}
        override fun unregisterOnSharedPreferenceChangeListener(listener: SharedPreferences.OnSharedPreferenceChangeListener?) {}

        private class Editor(private val storage: MutableMap<String, Any?>) : SharedPreferences.Editor {
            private val changes = mutableMapOf<String, Any?>()
            private val removals = mutableSetOf<String>()
            private var clearAll = false

            override fun putString(key: String, value: String?): SharedPreferences.Editor { changes[key] = value; return this }
            override fun putStringSet(key: String, values: MutableSet<String>?): SharedPreferences.Editor { changes[key] = values; return this }
            override fun putInt(key: String, value: Int): SharedPreferences.Editor { changes[key] = value; return this }
            override fun putLong(key: String, value: Long): SharedPreferences.Editor { changes[key] = value; return this }
            override fun putFloat(key: String, value: Float): SharedPreferences.Editor { changes[key] = value; return this }
            override fun putBoolean(key: String, value: Boolean): SharedPreferences.Editor { changes[key] = value; return this }
            override fun remove(key: String): SharedPreferences.Editor { removals.add(key); return this }
            override fun clear(): SharedPreferences.Editor { clearAll = true; return this }
            override fun commit(): Boolean { apply(); return true }
            override fun apply() {
                if (clearAll) storage.clear()
                removals.forEach { storage.remove(it) }
                changes.forEach { (k, v) -> storage[k] = v }
            }
        }
    }
}
