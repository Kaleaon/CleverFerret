package com.universalmedialibrary.ui.components

import androidx.compose.material3.SnackbarDuration
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.SnackbarResult
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

enum class UserFeedbackSeverity {
    INFO,
    SUCCESS,
    WARNING,
    ERROR
}

data class UserFeedbackMessage(
    val title: String,
    val body: String,
    val severity: UserFeedbackSeverity,
    val actionLabel: String? = null,
    val withDismissAction: Boolean = true,
    val duration: SnackbarDuration = SnackbarDuration.Long
) {
    val text: String
        get() = "$title: $body"
}

suspend fun SnackbarHostState.showUserFeedback(message: UserFeedbackMessage): SnackbarResult {
    return showSnackbar(
        message = message.text,
        actionLabel = message.actionLabel,
        withDismissAction = message.withDismissAction,
        duration = message.duration
    )
}

@Composable
fun UserFeedbackSnackbarHost(
    hostState: SnackbarHostState,
    modifier: Modifier = Modifier
) {
    SnackbarHost(
        hostState = hostState,
        modifier = modifier
    )
}
