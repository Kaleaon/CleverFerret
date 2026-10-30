package com.universalmedialibrary.di

import com.cleverferret.v2.feature.ai.api.AiFeatureApi
import com.cleverferret.v2.feature.ai.api.MetadataAiUseCases
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.di.AiFeatureModule
import com.cleverferret.v2.feature.ai.model.AiGenerationResult
import com.cleverferret.v2.feature.audio.api.AudioFeatureApi
import com.cleverferret.v2.feature.audio.di.AudioFeatureModule
import com.cleverferret.v2.feature.collections.api.CollectionsFeatureApi
import com.cleverferret.v2.feature.collections.di.CollectionsFeatureModule
import com.cleverferret.v2.feature.library.api.LibraryFeatureApi
import com.cleverferret.v2.feature.library.di.LibraryFeatureModule
import com.cleverferret.v2.feature.metadata.api.MetadataFeatureApi
import com.cleverferret.v2.feature.metadata.di.MetadataFeatureModule
import com.cleverferret.v2.feature.opds.api.OpdsFeatureApi
import com.cleverferret.v2.feature.opds.di.OpdsFeatureModule
import com.cleverferret.v2.feature.plex.api.PlexFeatureApi
import com.cleverferret.v2.feature.plex.di.PlexFeatureModule
import com.cleverferret.v2.feature.podcast.api.PodcastFeatureApi
import com.cleverferret.v2.feature.podcast.di.PodcastFeatureModule
import com.cleverferret.v2.feature.radio.api.RadioFeatureApi
import com.cleverferret.v2.feature.radio.di.RadioFeatureModule
import com.cleverferret.v2.feature.reader.api.ReaderFeatureApi
import com.cleverferret.v2.feature.reader.di.ReaderFeatureModule
import com.cleverferret.v2.feature.search.api.SearchFeatureApi
import com.cleverferret.v2.feature.search.di.SearchFeatureModule
import com.cleverferret.v2.feature.settings.api.SettingsFeatureApi
import com.cleverferret.v2.feature.settings.di.SettingsFeatureModule
import com.cleverferret.v2.feature.stats.api.StatsFeatureApi
import com.cleverferret.v2.feature.stats.di.StatsFeatureModule
import com.cleverferret.v2.feature.sync.api.SyncFeatureApi
import com.cleverferret.v2.feature.sync.di.SyncFeatureModule
import com.cleverferret.v2.feature.webfiction.api.WebfictionFeatureApi
import com.cleverferret.v2.feature.webfiction.di.WebfictionFeatureModule
import com.cleverferret.v2.feature.widgets.api.WidgetsFeatureApi
import com.cleverferret.v2.feature.widgets.di.WidgetsFeatureModule
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object FeatureApiModule {

    @Provides
    @Singleton
    fun provideAiFeatureApi(): AiFeatureApi = AiFeatureModule.provideAiFeatureApi(
        readerAiUseCases = object : ReaderAiUseCases {
            override fun summarizeSelection(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("Summary", "fallback", 0, 0, 0.0, true))
            override fun analyzeCharacters(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("Characters", "fallback", 0, 0, 0.0, true))
            override fun generateMindMap(requester: String, text: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("MindMap", "fallback", 0, 0, 0.0, true))
        },
        metadataAiUseCases = object : MetadataAiUseCases {
            override fun summarizeMetadata(requester: String, metadataText: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("Summary", "fallback", 0, 0, 0.0, true))
            override fun recommendFromMetadata(requester: String, metadataText: String) =
                com.cleverferret.v2.core.common.result.IntegrationResult.success(AiGenerationResult("Recommendations", "fallback", 0, 0, 0.0, true))
        }
    )

    @Provides
    @Singleton
    fun provideAudioFeatureApi(): AudioFeatureApi = AudioFeatureModule.provideAudioFeatureApi()

    @Provides
    @Singleton
    fun provideCollectionsFeatureApi(): CollectionsFeatureApi = CollectionsFeatureModule.provideCollectionsFeatureApi()

    @Provides
    @Singleton
    fun provideLibraryFeatureApi(): LibraryFeatureApi = LibraryFeatureModule.provideLibraryFeatureApi()

    @Provides
    @Singleton
    fun provideMetadataFeatureApi(): MetadataFeatureApi = MetadataFeatureModule.provideMetadataFeatureApi()

    @Provides
    @Singleton
    fun provideOpdsFeatureApi(): OpdsFeatureApi = OpdsFeatureModule.provideOpdsFeatureApi()

    @Provides
    @Singleton
    fun providePlexFeatureApi(): PlexFeatureApi = PlexFeatureModule.providePlexFeatureApi()

    @Provides
    @Singleton
    fun providePodcastFeatureApi(): PodcastFeatureApi = PodcastFeatureModule.providePodcastFeatureApi()

    @Provides
    @Singleton
    fun provideRadioFeatureApi(): RadioFeatureApi = RadioFeatureModule.provideRadioFeatureApi()

    @Provides
    @Singleton
    fun provideReaderFeatureApi(): ReaderFeatureApi = ReaderFeatureModule.provideReaderFeatureApi()

    @Provides
    @Singleton
    fun provideSearchFeatureApi(): SearchFeatureApi = SearchFeatureModule.provideSearchFeatureApi()

    @Provides
    @Singleton
    fun provideSettingsFeatureApi(): SettingsFeatureApi = SettingsFeatureModule.provideSettingsFeatureApi()

    @Provides
    @Singleton
    fun provideStatsFeatureApi(): StatsFeatureApi = StatsFeatureModule.provideStatsFeatureApi()

    @Provides
    @Singleton
    fun provideSyncFeatureApi(): SyncFeatureApi = SyncFeatureModule.provideSyncFeatureApi()

    @Provides
    @Singleton
    fun provideWebfictionFeatureApi(): WebfictionFeatureApi = WebfictionFeatureModule.provideWebfictionFeatureApi()

    @Provides
    @Singleton
    fun provideWidgetsFeatureApi(): WidgetsFeatureApi = WidgetsFeatureModule.provideWidgetsFeatureApi()
}
