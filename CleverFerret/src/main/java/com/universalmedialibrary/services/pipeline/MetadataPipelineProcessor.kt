package com.universalmedialibrary.services.pipeline

/**
 * Interface contract for individual processing stages within the CatalogingPipelineEngine.
 */
interface MetadataPipelineProcessor {
    val stage: PipelineStage
    val name: String

    /**
     * Executes the processing logic for this pipeline stage.
     *
     * @param context Current cataloging pipeline context
     * @return Updated cataloging pipeline context
     */
    suspend fun process(context: CatalogingPipelineContext): CatalogingPipelineContext
}
