package com.cleverferret.v2.feature.reader.usecase

import com.cleverferret.v2.core.common.result.IntegrationResult
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases
import com.cleverferret.v2.feature.ai.model.AiGenerationResult

class ReaderAiIntegrationUseCase(private val readerAiUseCases: ReaderAiUseCases) {
    fun summarizeCurrentChapter(chapterText: String): IntegrationResult<AiGenerationResult> =
        readerAiUseCases.summarizeSelection("feature:reader", chapterText)

    fun analyzeCurrentCharacters(chapterText: String): IntegrationResult<AiGenerationResult> =
        readerAiUseCases.analyzeCharacters("feature:reader", chapterText)

    fun buildChapterMindMap(chapterText: String): IntegrationResult<AiGenerationResult> =
        readerAiUseCases.generateMindMap("feature:reader", chapterText)
}
