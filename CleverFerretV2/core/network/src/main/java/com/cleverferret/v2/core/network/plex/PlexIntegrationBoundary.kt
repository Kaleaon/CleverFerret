package com.cleverferret.v2.core.network.plex

import com.cleverferret.v2.core.auth.AuthTokens
import com.cleverferret.v2.core.auth.DevicePinChallenge
import com.cleverferret.v2.core.common.result.IntegrationResult

interface PlexAuthBoundary {
    fun startDevicePinFlow(): IntegrationResult<DevicePinChallenge>
    fun pollDevicePin(deviceCode: String): IntegrationResult<AuthTokens>
    fun refreshToken(refreshToken: String): IntegrationResult<AuthTokens>
}

interface PlexMetadataBoundary {
    fun fetchMetadataPage(accessToken: String, pageCursor: String?): IntegrationResult<PlexMetadataPage>
}

data class PlexMetadataRecord(
    val ratingKey: String,
    val title: String,
    val mediaType: String,
    val updatedAtEpochMillis: Long,
)

data class PlexMetadataPage(
    val records: List<PlexMetadataRecord>,
    val nextCursor: String?,
    val syncCheckpoint: String,
)
