package com.cleverferret.v2.feature.ai.budgeting

data class BudgetDecision(val approved: Boolean, val reason: String) {
    companion object {
        fun approved() = BudgetDecision(true, "approved")
        fun rejected(reason: String) = BudgetDecision(false, reason)
    }
}
