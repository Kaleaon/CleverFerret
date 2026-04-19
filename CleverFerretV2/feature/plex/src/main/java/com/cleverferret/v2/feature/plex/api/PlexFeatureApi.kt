package com.cleverferret.v2.feature.plex.api

import com.cleverferret.v2.core.auth.DevicePinChallenge
import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.plex.services.plex.PlexConnectionCardState
import com.cleverferret.v2.feature.plex.services.plex.PlexSyncResultV1

interface PlexFeatureApi {
    fun featureKey(): String

    fun startDevicePinLink(): IntegrationResult<DevicePinChallenge>
    fun pollDevicePinLink(deviceCode: String): IntegrationResult<Unit>
    fun signOut(): IntegrationResult<Unit>

    fun accountConnectionCardState(): PlexConnectionCardState
    fun syncLibrary(accessToken: String? = null): IntegrationResult<PlexSyncResultV1>
}
