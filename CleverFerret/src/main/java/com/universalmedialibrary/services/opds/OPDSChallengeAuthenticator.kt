package com.universalmedialibrary.services.opds

import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.runBlocking
import okhttp3.Authenticator
import okhttp3.Credentials
import okhttp3.Request
import okhttp3.Response
import okhttp3.Route
import java.io.IOException
import java.util.concurrent.ConcurrentHashMap
import javax.inject.Inject
import javax.inject.Provider
import javax.inject.Singleton

/**
 * Exception thrown when a background request receives HTTP 401
 * and cannot present interactive UI challenge dialogs.
 */
class RequiresAuthenticationException(
    message: String = "Authentication required (HTTP 401)"
) : IOException(message)

/**
 * OPDS Request Context attached via Request.tag(OPDSAuthContext::class.java)
 */
data class OPDSAuthContext(
    val isBackground: Boolean = false,
    val catalogId: Long? = null,
    val catalogName: String? = null
)

/**
 * Event emitted when an HTTP 401 authentication challenge occurs during active UI browsing.
 */
data class OPDSAuthChallengeEvent(
    val catalogId: Long?,
    val catalogName: String?,
    val host: String,
    val realm: String? = null,
    val deferredCredential: CompletableDeferred<OPDSCredential?>
)

/**
 * OPDSChallengeAuthenticator
 *
 * Intercepts HTTP 401 responses, checks OPDSCredentialVault for existing credentials,
 * enforces immediate failure for background tasks via RequiresAuthenticationException,
 * and emits a reactive challenge event for interactive UI dialog prompting with per-host synchronization.
 */
@Singleton
class OPDSChallengeAuthenticator @Inject constructor(
    private val credentialVault: OPDSCredentialVault,
    private val catalogDaoProvider: Provider<com.universalmedialibrary.data.local.dao.OPDSCatalogDao>
) : Authenticator {

    private val _challengeEvent = MutableSharedFlow<OPDSAuthChallengeEvent>(extraBufferCapacity = 1)
    val challengeEvent: SharedFlow<OPDSAuthChallengeEvent> = _challengeEvent.asSharedFlow()

    private val activeHostDeferreds = ConcurrentHashMap<String, Deferred<OPDSCredential?>>()

    override fun authenticate(route: Route?, response: Response): Request? {
        // Prevent infinite retry loops (max 3 response attempts)
        if (responseCount(response) >= 3) {
            val host = response.request.url.host
            credentialVault.removeCredentialsForHost(host)
            val authContext = response.request.tag(OPDSAuthContext::class.java)
            authContext?.catalogId?.let { credentialVault.removeCredentials(it) }
            return null
        }

        val request = response.request
        val authContext = request.tag(OPDSAuthContext::class.java)
        val isBackground = authContext?.isBackground == true || request.header("X-OPDS-Background") == "true"
        val host = request.url.host.lowercase().trim()

        // Background execution constraint: fail immediately without popping UI
        if (isBackground) {
            throw RequiresAuthenticationException("Authentication required for background OPDS task on $host")
        }

        val catalogId = authContext?.catalogId ?: 0L
        val currentAuthHeader = request.header("Authorization")
        val existingCreds = (if (catalogId != 0L) credentialVault.getCredentials(catalogId) else null)
            ?: credentialVault.getCredentialsForHost(host)

        if (existingCreds != null) {
            val basicHeader = Credentials.basic(existingCreds.username, existingCreds.password)
            if (basicHeader != currentAuthHeader) {
                return request.newBuilder()
                    .header("Authorization", basicHeader)
                    .build()
            }
        }

        // Host-level synchronization for parallel calls
        val credential = getOrPromptCredentialForHost(host, catalogId, authContext?.catalogName, response)
            ?: return null

        return request.newBuilder()
            .header("Authorization", Credentials.basic(credential.username, credential.password))
            .build()
    }

    private fun getOrPromptCredentialForHost(
        host: String,
        catalogId: Long,
        catalogName: String?,
        response: Response
    ): OPDSCredential? {
        var existingDeferred = activeHostDeferreds[host]
        if (existingDeferred != null) {
            return runBlocking { existingDeferred.await() }
        }

        val deferred = CompletableDeferred<OPDSCredential?>()
        val prevDeferred = activeHostDeferreds.putIfAbsent(host, deferred)
        if (prevDeferred != null) {
            return runBlocking { prevDeferred.await() }
        }

        try {
            val finalCatalogName = catalogName ?: lookupCatalogName(catalogId, host)
            val realm = parseRealm(response.header("WWW-Authenticate"))
            val event = OPDSAuthChallengeEvent(
                catalogId = catalogId.takeIf { it != 0L },
                catalogName = finalCatalogName,
                host = host,
                realm = realm,
                deferredCredential = deferred
            )

            val emitted = _challengeEvent.tryEmit(event)
            if (!emitted) {
                runBlocking { _challengeEvent.emit(event) }
            }

            val credential = runBlocking { deferred.await() }
            if (credential != null) {
                credentialVault.saveCredentials(catalogId, credential.username, credential.password, host)
            }
            return credential
        } finally {
            activeHostDeferreds.remove(host, deferred)
        }
    }

    private fun responseCount(response: Response): Int {
        var count = 1
        var prior = response.priorResponse
        while (prior != null) {
            count++
            prior = prior.priorResponse
        }
        return count
    }

    private fun parseRealm(authHeader: String?): String? {
        if (authHeader == null) return null
        val match = Regex("realm=\"([^\"]+)\"", RegexOption.IGNORE_CASE).find(authHeader)
        return match?.groupValues?.get(1)
    }

    private fun lookupCatalogName(catalogId: Long, host: String): String {
        return try {
            val dao = catalogDaoProvider.get()
            if (catalogId != 0L) {
                runBlocking { dao.getCatalogById(catalogId)?.name } ?: host
            } else {
                runBlocking { dao.getAllCatalogsOnce().firstOrNull { it.url.contains(host, ignoreCase = true) }?.name } ?: host
            }
        } catch (e: Exception) {
            host
        }
    }
}
