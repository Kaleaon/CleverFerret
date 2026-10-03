package com.cleverferret.v2.feature.ai.budgeting

class TokenCostBudgeter(
    private val maxPromptTokens: Int,
    private val maxCompletionTokens: Int,
    private val maxCostUsd: Double,
) {
    fun evaluate(promptTokens: Int, completionTokens: Int, expectedCostUsd: Double): BudgetDecision {
        if (promptTokens > maxPromptTokens) return BudgetDecision.rejected("prompt token budget exceeded")
        if (completionTokens > maxCompletionTokens) return BudgetDecision.rejected("completion token budget exceeded")
        if (expectedCostUsd > maxCostUsd) return BudgetDecision.rejected("cost budget exceeded")
        return BudgetDecision.approved()
    }
}
