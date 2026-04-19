package com.cleverferret.v2.feature.metadata.ai

object MetadataAiPromptFactory {
    fun buildPrompt(contract: MetadataAiContract, metadataText: String): String {
        val schema = when (contract) {
            MetadataAiContract.BOOK_INSIGHTS_SUMMARY -> "{\"summary\":string,\"insights\":[string]}"
            MetadataAiContract.CHARACTER_THEME_EXTRACTION -> "{\"characters\":[{\"name\":string,\"role\":string}],\"themes\":[string]}"
            MetadataAiContract.MIND_MAP_GRAPH -> "{\"nodes\":[{\"id\":string,\"label\":string}],\"edges\":[{\"from\":string,\"to\":string,\"relation\":string}]}"
            MetadataAiContract.RECOMMENDATION_REASONING -> "{\"recommendations\":[{\"title\":string,\"why\":string}],\"reasoning\":string}"
        }
        return """
            You are a metadata assistant.
            Contract: ${contract.contractId}
            Output ONLY valid JSON matching schema: $schema
            Metadata:
            $metadataText
        """.trimIndent()
    }
}
