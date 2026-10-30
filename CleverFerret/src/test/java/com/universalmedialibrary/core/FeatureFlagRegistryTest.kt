package com.universalmedialibrary.core

import android.content.Context
import android.content.SharedPreferences
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.ArgumentMatchers.anyInt
import org.mockito.ArgumentMatchers.anyString
import org.mockito.Mockito.`when`
import org.mockito.kotlin.mock

class FeatureFlagRegistryTest {

    private lateinit var mockContext: Context
    private lateinit var mockPrefs: SharedPreferences
    private lateinit var mockEditor: SharedPreferences.Editor
    private val prefValues = mutableMapOf<String, Boolean>()

    @Before
    fun setUp() {
        mockContext = mock()
        mockPrefs = mock()
        mockEditor = mock()
        prefValues.clear()

        `when`(mockContext.getSharedPreferences(anyString(), anyInt())).thenReturn(mockPrefs)
        `when`(mockPrefs.edit()).thenReturn(mockEditor)

        `when`(mockPrefs.getBoolean(anyString(), anyBoolean())).thenAnswer { invocation ->
            val key = invocation.getArgument<String>(0)
            val defaultVal = invocation.getArgument<Boolean>(1)
            prefValues[key] ?: defaultVal
        }

        `when`(mockEditor.putBoolean(anyString(), anyBoolean())).thenAnswer { invocation ->
            val key = invocation.getArgument<String>(0)
            val value = invocation.getArgument<Boolean>(1)
            prefValues[key] = value
            mockEditor
        }
    }

    @Test
    fun releaseRegistry_enforcesImmutableTrueForMatureCapabilities() {
        val registry = ReleaseFeatureFlagRegistry()

        // Mature capabilities must return true in Release
        assertTrue("USE_EPUB4J must be true", registry.isEpub4jEnabled)
        assertTrue("ENABLE_EXOPLAYER must be true", registry.isExoPlayerEnabled)
        assertTrue("ENABLE_PODCASTS must be true", registry.isPodcastsEnabled)
        assertTrue("ENABLE_ADVANCED_READER must be true", registry.isAdvancedReaderEnabled)
        assertTrue("ENABLE_AUDIOBOOK_PLAYER must be true", registry.isAudiobookPlayerEnabled)
        assertTrue("ENABLE_SYNCHRONIZED_READING must be true", registry.isSynchronizedReadingEnabled)

        // Attempting to toggle mature flags in Release must be ignored
        registry.setFlag(FeatureFlags.FeatureFlag.USE_EPUB4J, false)
        registry.setFlag(FeatureFlags.FeatureFlag.ENABLE_EXOPLAYER, false)
        registry.setFlag(FeatureFlags.FeatureFlag.ENABLE_PODCASTS, false)

        assertTrue("USE_EPUB4J must remain true after setFlag(false)", registry.isEpub4jEnabled)
        assertTrue("ENABLE_EXOPLAYER must remain true after setFlag(false)", registry.isExoPlayerEnabled)
        assertTrue("ENABLE_PODCASTS must remain true after setFlag(false)", registry.isPodcastsEnabled)
    }

    @Test
    fun releaseRegistry_returnsFalseForExperimental() {
        val registry = ReleaseFeatureFlagRegistry()
        assertFalse("ENABLE_EXPERIMENTAL must be false in Release", registry.isExperimentalEnabled)
    }

    @Test
    fun debugRegistry_allowsMutableOverrides() {
        val registry = DebugFeatureFlagRegistry(mockContext)

        // Default values
        assertTrue(registry.isEpub4jEnabled)

        // Override flag to false
        registry.setFlag(FeatureFlags.FeatureFlag.USE_EPUB4J, false)
        assertFalse("USE_EPUB4J should be updated to false in Debug", registry.isEpub4jEnabled)

        // Override flag back to true
        registry.setFlag(FeatureFlags.FeatureFlag.USE_EPUB4J, true)
        assertTrue("USE_EPUB4J should be updated back to true in Debug", registry.isEpub4jEnabled)
    }

    @Test
    fun featureFlagsObject_delegatesToActiveRegistry() {
        val releaseRegistry = ReleaseFeatureFlagRegistry()
        FeatureFlags.setRegistry(releaseRegistry)

        assertTrue(FeatureFlags.USE_EPUB4J)
        assertTrue(FeatureFlags.ENABLE_EXOPLAYER)

        FeatureFlags.setFlag(FeatureFlags.FeatureFlag.USE_EPUB4J, false)
        assertTrue("FeatureFlags static getter must reflect ReleaseRegistry immutability", FeatureFlags.USE_EPUB4J)
    }
}
