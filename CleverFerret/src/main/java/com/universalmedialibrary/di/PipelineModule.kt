package com.universalmedialibrary.di

import com.universalmedialibrary.services.pipeline.CatalogingPipelineEngine
import com.universalmedialibrary.services.pipeline.CatalogingPipelineEngineImpl
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.processors.RawExtractionProcessor
import com.universalmedialibrary.services.pipeline.processors.RemoteEnrichmentProcessor
import com.universalmedialibrary.services.pipeline.processors.SchemaNormalizationProcessor
import com.universalmedialibrary.services.pipeline.processors.StagingPersistenceProcessor
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object PipelineModule {

    @Provides
    @Singleton
    fun providePipelineProcessors(
        rawExtractionProcessor: RawExtractionProcessor,
        schemaNormalizationProcessor: SchemaNormalizationProcessor,
        remoteEnrichmentProcessor: RemoteEnrichmentProcessor,
        stagingPersistenceProcessor: StagingPersistenceProcessor
    ): List<MetadataPipelineProcessor> {
        return listOf(
            rawExtractionProcessor,
            schemaNormalizationProcessor,
            remoteEnrichmentProcessor,
            stagingPersistenceProcessor
        )
    }

    @Provides
    @Singleton
    fun provideCatalogingPipelineEngine(
        processors: List<MetadataPipelineProcessor>
    ): CatalogingPipelineEngine {
        return CatalogingPipelineEngineImpl(processors)
    }
}
