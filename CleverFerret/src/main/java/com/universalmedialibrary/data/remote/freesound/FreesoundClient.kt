package com.universalmedialibrary.data.remote.freesound

import javax.inject.Inject
import javax.inject.Singleton

/**
 * Client for interacting with the Freesound API.
 * Mimics the functionality of the freesound.js library.
 */
@Singleton
class FreesoundClient @Inject constructor(
    private val service: FreesoundService
) {
    /**
     * Search for sounds using text query and optional filters/sorting.
     */
    suspend fun textSearch(
        query: String,
        filter: String? = null,
        sort: String? = null,
        page: Int? = null,
        pageSize: Int? = null,
        fields: String? = null
    ): FreesoundSearchResponse {
        return service.search(query, filter, sort, page, pageSize, fields)
    }

    /**
     * Get details for a specific sound.
     */
    suspend fun getSound(soundId: Int): FreesoundSound {
        return service.getSound(soundId)
    }

    /**
     * Get sounds similar to the specified sound.
     */
    suspend fun getSimilarSounds(
        soundId: Int,
        page: Int? = null,
        pageSize: Int? = null,
        fields: String? = null
    ): FreesoundSearchResponse {
        return service.getSimilarSounds(soundId, page, pageSize, fields)
    }
}
