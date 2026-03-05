package com.cleverferret.v2.feature.ai.budgeting;

public final class TokenCostBudgeter {
    private final int maxPromptTokens;
    private final int maxCompletionTokens;
    private final double maxCostUsd;

    public TokenCostBudgeter(int maxPromptTokens, int maxCompletionTokens, double maxCostUsd) {
        this.maxPromptTokens = maxPromptTokens;
        this.maxCompletionTokens = maxCompletionTokens;
        this.maxCostUsd = maxCostUsd;
    }

    public BudgetDecision evaluate(int promptTokens, int completionTokens, double expectedCostUsd) {
        if (promptTokens > maxPromptTokens) {
            return BudgetDecision.rejected("prompt token budget exceeded");
        }
        if (completionTokens > maxCompletionTokens) {
            return BudgetDecision.rejected("completion token budget exceeded");
        }
        if (expectedCostUsd > maxCostUsd) {
            return BudgetDecision.rejected("cost budget exceeded");
        }
        return BudgetDecision.approved();
    }
}
