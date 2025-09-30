package com.universalmedialibrary

import android.content.Context
import com.universalmedialibrary.services.plex.PlexAuthService
import com.universalmedialibrary.services.plex.SecureTokenStorage
import io.mockk.mockk
import io.mockk.verify
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test

/**
 * Test class for PlexAuthService
 */
class PlexAuthServiceTest {
    
    private lateinit var context: Context
    private lateinit var tokenStorage: SecureTokenStorage
    private lateinit var authService: PlexAuthService
    
    @Before
    fun setup() {
        context = mockk(relaxed = true)
        tokenStorage = mockk(relaxed = true)
        authService = PlexAuthService(context, tokenStorage)
    }
    
    @Test
    fun testAuthServiceCreation() {
        // Test that the service can be created
        assert(authService != null)
    }
    
    @Test
    fun testIsAuthenticated_whenNoToken_returnsFalse() = runBlocking {
        // Given
        io.mockk.every { tokenStorage.isAuthenticated() } returns false
        
        // When
        val result = authService.isAuthenticated()
        
        // Then
        assert(!result)
    }
    
    @Test
    fun testIsAuthenticated_whenTokenExists_returnsTrue() = runBlocking {
        // Given
        io.mockk.every { tokenStorage.isAuthenticated() } returns true
        
        // When
        val result = authService.isAuthenticated()
        
        // Then
        assert(result)
    }
    
    @Test
    fun testSignOut_clearsToken() {
        // When
        authService.signOut()
        
        // Then
        verify { tokenStorage.clearAuth() }
    }
}
