package com.cleverferret.v2.core.ui.components

enum class SemanticStateColor {
    SUCCESS,
    WARNING,
    ERROR,
    NEUTRAL,
}

data class ActionCard(
    val title: String,
    val subtitle: String,
    val actionLabel: String,
    val status: SemanticStateColor,
)
