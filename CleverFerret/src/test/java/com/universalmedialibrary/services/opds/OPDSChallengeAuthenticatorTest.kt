package com.universalmedialibrary.services.opds

import android.content.Context
import android.content.SharedPreferences
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import io.mockk.MockKAnnotations
import io.mockk.every
import io.mockk.impl.annotations.MockK
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.launch
import kotlinx.coroutines.test.runTest
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.Protocol
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import javax.inject.Provider

import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class OPDSChallengeAuthenticatorTest {

    @MockK
    lateinit var context: Context

    @MockK
    lateinit var catalogDao: OPDSCatalogDao

    private val memoryStorage = mutableMapOf<String, Any?>()
    private lateinit var vault: OPDSCredentialVault
    private lateinit var authenticator: OPDSChallengeAuthenticator

    @Before
    fun setUp() {
        MockKAnnotations.init(this, relaxUnitFun = true)
        val mockPrefs = FakeSharedPreferences(memoryStorage)
        every { context.getSharedPreferences(any(), any()) } returns mockPrefs
        vault = OPDSCredentialVault(context)
        authenticator = OPDSChallengeAuthenticator(
            credentialVault = vault,
            catalogDaoProvider = Provider { catalogDao }
        )
    }

    @Test
    fun `interactive request 401 emits challenge event and attaches basic auth header`() = runTest {
        val request = Request.Builder()
            .url("https://catalog.example.com/opds")
            .tag(OPDSAuthContext::class.java, OPDSAuthContext(isBackground = false, catalogId = 10L, catalogName = "Test Catalog"))
            .build()

        val response = Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(401)
            .message("Unauthorized")
            .header("WWW-Authenticate", "Basic realm=\"Library\"")
            .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
            .build()

        val asyncResult = async(Dispatchers.IO) {
            authenticator.authenticate(null, response)
        }

        val challengeEvent = authenticator.challengeEvent.first()
        assertEquals(10L, challengeEvent.catalogId)
        assertEquals("Test Catalog", challengeEvent.catalogName)
        assertEquals("catalog.example.com", challengeEvent.host)

        challengeEvent.deferredCredential.complete(OPDSCredential("alice", "secret123"))

        val retriedRequest = asyncResult.await()
        assertNotNull(retriedRequest)
        assertEquals("Basic YWxpY2U6c2VjcmV0MTIz", retriedRequest?.header("Authorization"))

        // Confirm vault saved credentials
        val storedCreds = vault.getCredentials(10L)
        assertEquals("alice", storedCreds?.username)
        assertEquals("secret123", storedCreds?.password)
    }

    @Test
    fun `background task 401 throws RequiresAuthenticationException without popping UI`() = runTest {
        val request = Request.Builder()
            .url("https://catalog.example.com/opds")
            .tag(OPDSAuthContext::class.java, OPDSAuthContext(isBackground = true, catalogId = 10L))
            .build()

        val response = Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(401)
            .message("Unauthorized")
            .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
            .build()

        val failure = runCatching {
            authenticator.authenticate(null, response)
        }.exceptionOrNull()

        assertTrue(failure is RequiresAuthenticationException)
        assertTrue(failure?.message?.contains("background OPDS task") == true)
    }

    @Test
    fun `already saved credentials in vault automatically retry without challenge prompt`() = runTest {
        vault.saveCredentials(10L, "bob", "password456", "catalog.example.com")

        val request = Request.Builder()
            .url("https://catalog.example.com/opds")
            .tag(OPDSAuthContext::class.java, OPDSAuthContext(isBackground = false, catalogId = 10L))
            .build()

        val response = Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(401)
            .message("Unauthorized")
            .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
            .build()

        val retriedRequest = authenticator.authenticate(null, response)
        assertNotNull(retriedRequest)
        assertEquals("Basic Ym9iOnBhc3N3b3JkNDU2", retriedRequest?.header("Authorization"))
    }

    @Test
    fun `cancelling challenge dialog returns null`() = runTest {
        val request = Request.Builder()
            .url("https://catalog.example.com/opds")
            .tag(OPDSAuthContext::class.java, OPDSAuthContext(isBackground = false, catalogId = 10L))
            .build()

        val response = Response.Builder()
            .request(request)
            .protocol(Protocol.HTTP_1_1)
            .code(401)
            .message("Unauthorized")
            .body("Unauthorized".toResponseBody("text/plain".toMediaType()))
            .build()

        val asyncResult = async(Dispatchers.IO) {
            authenticator.authenticate(null, response)
        }

        val challengeEvent = authenticator.challengeEvent.first()
        challengeEvent.deferredCredential.complete(null)

        val retriedRequest = asyncResult.await()
        assertNull(retriedRequest)
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
