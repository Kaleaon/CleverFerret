package com.cleverferret.v2.feature.reader.usecase;

import com.cleverferret.v2.core.common.result.IntegrationResult;
import com.cleverferret.v2.feature.ai.api.ReaderAiUseCases;
import com.cleverferret.v2.feature.ai.model.AiGenerationResult;

public final class ReaderAiIntegrationUseCase {
    private final ReaderAiUseCases readerAiUseCases;

    public ReaderAiIntegrationUseCase(ReaderAiUseCases readerAiUseCases) {
        this.readerAiUseCases = readerAiUseCases;
    }

    public IntegrationResult<AiGenerationResult> summarizeCurrentChapter(String chapterText) {
        return readerAiUseCases.summarizeSelection("feature:reader", chapterText);
    }

    public IntegrationResult<AiGenerationResult> analyzeCurrentCharacters(String chapterText) {
        return readerAiUseCases.analyzeCharacters("feature:reader", chapterText);
    }

    public IntegrationResult<AiGenerationResult> buildChapterMindMap(String chapterText) {
        return readerAiUseCases.generateMindMap("feature:reader", chapterText);
    }
}
