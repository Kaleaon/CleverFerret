package com.cleverferret.v2.feature.ai.budgeting;

public record BudgetDecision(boolean approved, String reason) {
    public static BudgetDecision approved() {
        return new BudgetDecision(true, "approved");
    }

    public static BudgetDecision rejected(String reason) {
        return new BudgetDecision(false, reason);
    }
}
