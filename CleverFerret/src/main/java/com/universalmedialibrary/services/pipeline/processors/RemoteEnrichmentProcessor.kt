package com.universalmedialibrary.services.pipeline.processors

import com.universalmedialibrary.services.pipeline.CatalogingPipelineContext
import com.universalmedialibrary.services.pipeline.MetadataPipelineProcessor
import com.universalmedialibrary.services.pipeline.PipelineStage
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Stage 3 Processor: Remote Provider Enrichment
 *
 * Pipeline stage processor for remote provider enrichment.
 */
@Singleton
class RemoteEnrichmentProcessor @Inject constructor() : MetadataPipelineProcessor {

    override val stage: PipelineStage = PipelineStage.REMOTE_ENRICHMENT
    override val name: String = "RemoteEnrichmentProcessor"

    override suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext {
        return context
    }
}
