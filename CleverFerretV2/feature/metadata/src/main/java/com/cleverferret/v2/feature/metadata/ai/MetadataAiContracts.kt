package com.cleverferret.v2.feature.metadata.ai

enum class MetadataAiContract(val contractId: String) {
    BOOK_INSIGHTS_SUMMARY("book-insights-summary.v1"),
    CHARACTER_THEME_EXTRACTION("character-theme-extraction.v1"),
    MIND_MAP_GRAPH("mind-map-graph.v1"),
    RECOMMENDATION_REASONING("recommendation-reasoning.v1"),
}

data class ContractValidationResult(
    val valid: Boolean,
    val fallbackPayload: String,
    val reason: String,
)

object MetadataAiSchemaValidator {
    fun validate(contract: MetadataAiContract, payload: String): ContractValidationResult = when (contract) {
        MetadataAiContract.BOOK_INSIGHTS_SUMMARY -> {
            val valid = payload.contains("\"summary\"") && payload.contains("\"insights\"")
            fallback(valid, payload, "{\"summary\":\"Unavailable\",\"insights\":[]}", "Missing summary/insights keys")
        }

        MetadataAiContract.CHARACTER_THEME_EXTRACTION -> {
            val valid = payload.contains("\"characters\"") && payload.contains("\"themes\"")
            fallback(valid, payload, "{\"characters\":[],\"themes\":[]}", "Missing characters/themes keys")
        }

        MetadataAiContract.MIND_MAP_GRAPH -> {
            val valid = payload.contains("\"nodes\"") && payload.contains("\"edges\"")
            fallback(valid, payload, "{\"nodes\":[],\"edges\":[]}", "Missing nodes/edges keys")
        }

        MetadataAiContract.RECOMMENDATION_REASONING -> {
            val valid = payload.contains("\"recommendations\"") && payload.contains("\"reasoning\"")
            fallback(valid, payload, "{\"recommendations\":[],\"reasoning\":\"Unavailable\"}", "Missing recommendations/reasoning keys")
        }
    }

    private fun fallback(valid: Boolean, payload: String, fallback: String, reason: String): ContractValidationResult =
        if (valid) ContractValidationResult(true, payload, "valid") else ContractValidationResult(false, fallback, reason)
}
