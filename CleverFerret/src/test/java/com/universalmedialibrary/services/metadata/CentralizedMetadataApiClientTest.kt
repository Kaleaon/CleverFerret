package com.universalmedialibrary.services.metadata

import com.universalmedialibrary.data.repository.APIKeyRepository
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.mockito.Mockito.mock

class CentralizedMetadataApiClientTest {

    private lateinit var apiKeyRepository: APIKeyRepository
    private lateinit var client: CentralizedMetadataApiClient

    @Before
    fun setUp() {
        apiKeyRepository = mock(APIKeyRepository::class.java)
        client = CentralizedMetadataApiClient(apiKeyRepository)
    }

    @Test
    fun testUserAgentConstant() {
        assertTrue(CentralizedMetadataApiClient.USER_AGENT.contains("CleverFerret"))
    }

    @Test
    fun testApiClientsInitialized() {
        assertNotNull(client.googleBooksApi)
        assertNotNull(client.openLibraryApi)
        assertNotNull(client.tmdbApi)
        assertNotNull(client.omdbApi)
        assertNotNull(client.musicBrainzApi)
    }
}
