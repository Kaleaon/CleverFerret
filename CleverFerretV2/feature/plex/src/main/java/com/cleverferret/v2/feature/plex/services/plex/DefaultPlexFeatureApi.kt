package com.cleverferret.v2.feature.plex.services.plex

import com.cleverferret.v2.core.auth.AuthSessionManager
import com.cleverferret.v2.core.auth.DevicePinAuthClient
import com.cleverferret.v2.core.auth.SensitiveCache
import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.common.error.UserFacingState
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.core.network.plex.AuthenticatedPlexRequestExecutor
import com.cleverferret.v2.core.ui.components.ActionCard
import com.cleverferret.v2.core.ui.components.SemanticStateColor
import com.cleverferret.v2.feature.plex.api.PlexFeatureApi

class DefaultPlexFeatureApi(
    private val authSessionManager: AuthSessionManager,
    private val devicePinAuthClient: DevicePinAuthClient,
    private val requestExecutor: AuthenticatedPlexRequestExecutor,
    private val metadataSyncService: PlexMetadataSyncService,
    private val sensitiveCache: SensitiveCache,
    private val nowEpochMillis: () -> Long,
) : PlexFeatureApi {

    private var connectedAccountId: String? = null
    private var lastHealthCheckEpochMillis: Long? = null

    override fun featureKey(): String = "plex"

    override fun startDevicePinLink() = authSessionManager.beginDevicePinFlow(devicePinAuthClient)

    override fun pollDevicePinLink(deviceCode: String): IntegrationResult<Unit> {
        val result = authSessionManager.completeDevicePinFlow(devicePinAuthClient, deviceCode)
        return when (result) {
            is IntegrationResult.Success -> {
                connectedAccountId = "plex-account"
                IntegrationResult.success(Unit)
            }
            is IntegrationResult.Failure -> result
        }
    }

    override fun signOut(): IntegrationResult<Unit> {
        authSessionManager.signOut(onLocalRevocation = {
            connectedAccountId = null
            lastHealthCheckEpochMillis = null
            metadataSyncService.clearCheckpoint()
        }, sensitiveCache = sensitiveCache)
        return IntegrationResult.success(Unit)
    }

    override fun accountConnectionCardState(): PlexConnectionCardState {
        val connected = connectedAccountId != null
        val accountCard = if (connected) {
            ActionCard(
                title = "Plex Account",
                subtitle = "Connected as $connectedAccountId",
                actionLabel = "Disconnect",
                status = SemanticStateColor.SUCCESS,
            )
        } else {
            ActionCard(
                title = "Plex Account",
                subtitle = "Not connected",
                actionLabel = "Connect",
                status = SemanticStateColor.WARNING,
            )
        }

        val healthIsRecent = lastHealthCheckEpochMillis?.let { nowEpochMillis() - it < 5 * 60 * 1000 } ?: false
        val serverCard = when {
            !connected -> ActionCard("Connection Health", "Sign in to verify server health", "Verify", SemanticStateColor.NEUTRAL)
            healthIsRecent -> ActionCard("Connection Health", "Healthy", "Re-check", SemanticStateColor.SUCCESS)
            else -> ActionCard("Connection Health", "Needs verification", "Check now", SemanticStateColor.WARNING)
        }

        return PlexConnectionCardState(accountCard = accountCard, serverCard = serverCard)
    }

    override fun syncLibrary(accessToken: String?): IntegrationResult<PlexSyncResultV1> {
        val syncResult = requestExecutor.execute("plex.sync.metadata") { token ->
            metadataSyncService.importMetadata(accessToken ?: token)
        }

        return when (syncResult) {
            is IntegrationResult.Success -> {
                lastHealthCheckEpochMillis = nowEpochMillis()
                IntegrationResult.success(
                    PlexSyncResultV1(
                        accountId = connectedAccountId ?: "plex-account",
                        syncedItems = syncResult.value.importedItems,
                        syncedAtEpochMillis = nowEpochMillis(),
                        checkpoint = syncResult.value.checkpoint,
                    ),
                )
            }
            is IntegrationResult.Failure -> {
                IntegrationResult.failure(
                    AppError.ExternalServiceFailure(syncResult.error.message, "plex", "SYNC_FAILURE"),
                    UserFacingState.TEMPORARILY_DEGRADED,
                )
            }
        }
    }
}
