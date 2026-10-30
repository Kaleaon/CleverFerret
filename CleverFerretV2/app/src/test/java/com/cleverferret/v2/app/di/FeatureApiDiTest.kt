package com.cleverferret.v2.app.di

import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.di.AiFeatureModule
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.audio.di.AudioFeatureModule
import com.cleverferret.v2.feature.collections.di.CollectionsFeatureModule
import com.cleverferret.v2.feature.library.di.LibraryFeatureModule
import com.cleverferret.v2.feature.metadata.di.MetadataFeatureModule
import com.cleverferret.v2.feature.opds.di.OpdsFeatureModule
import com.cleverferret.v2.feature.plex.di.PlexFeatureModule
import com.cleverferret.v2.feature.podcast.di.PodcastFeatureModule
import com.cleverferret.v2.feature.radio.di.RadioFeatureModule
import com.cleverferret.v2.feature.reader.di.ReaderFeatureModule
import com.cleverferret.v2.feature.search.di.SearchFeatureModule
import com.cleverferret.v2.feature.settings.di.SettingsFeatureModule
import com.cleverferret.v2.feature.stats.di.StatsFeatureModule
import com.cleverferret.v2.feature.sync.di.SyncFeatureModule
import com.cleverferret.v2.feature.webfiction.di.WebfictionFeatureModule
import com.cleverferret.v2.feature.widgets.di.WidgetsFeatureModule
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull

class FeatureApiDiTest {

    @Test
    fun `all 16 feature modules provide bound FeatureApi instances via DI`() {
        val dummyReaderAi = object : ReaderAiUseCases {
            override fun summarizeSelection(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("summary", "model", 0, 0, 0.0, true))
            override fun analyzeCharacters(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("chars", "model", 0, 0, 0.0, true))
            override fun generateMindMap(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("mindmap", "model", 0, 0, 0.0, true))
        }

        val dummyMetadataAi = object : MetadataAiUseCases {
            override fun summarizeMetadata(requester: String, metadataText: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("summary", "model", 0, 0, 0.0, true))
            override fun recommendFromMetadata(requester: String, metadataText: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("recs", "model", 0, 0, 0.0, true))
        }

        val aiApi = AiFeatureModule.provideAiFeatureApi(dummyReaderAi, dummyMetadataAi)
        val audioApi = AudioFeatureModule.provideAudioFeatureApi()
        val collectionsApi = CollectionsFeatureModule.provideCollectionsFeatureApi()
        val libraryApi = LibraryFeatureModule.provideLibraryFeatureApi()
        val metadataApi = MetadataFeatureModule.provideMetadataFeatureApi()
        val opdsApi = OpdsFeatureModule.provideOpdsFeatureApi()
        val plexApi = PlexFeatureModule.providePlexFeatureApi()
        val podcastApi = PodcastFeatureModule.providePodcastFeatureApi()
        val radioApi = RadioFeatureModule.provideRadioFeatureApi()
        val readerApi = ReaderFeatureModule.provideReaderFeatureApi()
        val searchApi = SearchFeatureModule.provideSearchFeatureApi()
        val settingsApi = SettingsFeatureModule.provideSettingsFeatureApi()
        val statsApi = StatsFeatureModule.provideStatsFeatureApi()
        val syncApi = SyncFeatureModule.provideSyncFeatureApi()
        val webfictionApi = WebfictionFeatureModule.provideWebfictionFeatureApi()
        val widgetsApi = WidgetsFeatureModule.provideWidgetsFeatureApi()

        assertNotNull(aiApi)
        assertNotNull(audioApi)
        assertNotNull(collectionsApi)
        assertNotNull(libraryApi)
        assertNotNull(metadataApi)
        assertNotNull(opdsApi)
        assertNotNull(plexApi)
        assertNotNull(podcastApi)
        assertNotNull(radioApi)
        assertNotNull(readerApi)
        assertNotNull(searchApi)
        assertNotNull(settingsApi)
        assertNotNull(statsApi)
        assertNotNull(syncApi)
        assertNotNull(webfictionApi)
        assertNotNull(widgetsApi)

        assertEquals("feature:ai", aiApi.featureKey())
        assertEquals("feature:audio", audioApi.featureKey())
        assertEquals("feature:collections", collectionsApi.featureKey())
        assertEquals("feature:library", libraryApi.featureKey())
        assertEquals("feature:metadata", metadataApi.featureKey())
        assertEquals("feature.opds", opdsApi.featureKey())
        assertEquals("feature:plex", plexApi.featureKey())
        assertEquals("feature:podcast", podcastApi.featureKey())
        assertEquals("feature:radio", radioApi.featureKey())
        assertEquals("feature:reader", readerApi.featureKey())
        assertEquals("feature:search", searchApi.featureKey())
        assertEquals("feature:settings", settingsApi.featureKey())
        assertEquals("feature:stats", statsApi.featureKey())
        assertEquals("feature:sync", syncApi.featureKey())
        assertEquals("feature:webfiction", webfictionApi.featureKey())
        assertEquals("media-library-widget", widgetsApi.featureKey())
    }
}
