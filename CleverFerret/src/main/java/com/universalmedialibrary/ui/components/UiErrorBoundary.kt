package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.key
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.SubcomposeLayout
import com.universalmedialibrary.core.logging.AppLogger
import kotlinx.coroutines.CancellationException

/**
 * Compose-safe error boundary used to isolate high-risk UI regions.
 *
 * Wraps child composition in [SubcomposeLayout] to catch rendering exceptions
 * and isolate failure boundaries. Technical exception details are logged via [AppLogger],
 * while standard recovery actions and user-centric messages are rendered via [EnhancedErrorState].
 */
@Composable
fun UiErrorBoundary(
    boundaryName: String,
    modifier: Modifier = Modifier,
    onGoHome: (() -> Unit)? = null,
    onReloadSection: (() -> Unit)? = null,
    onReportIssue: ((Throwable) -> Unit)? = null,
    content: @Composable () -> Unit,
) {
    var capturedError by remember(boundaryName) { mutableStateOf<Throwable?>(null) }
    var reloadKey by remember(boundaryName) { mutableIntStateOf(0) }

    SubcomposeLayout(modifier = modifier) { constraints ->
        val activeError = capturedError
        val placeables = if (activeError != null) {
            subcompose(UiErrorBoundarySlot.Fallback) {
                ErrorBoundaryFallback(
                    onGoHome = onGoHome,
                    onReloadSection = {
                        capturedError = null
                        reloadKey += 1
                        onReloadSection?.invoke()
                    },
                )
            }.map { it.measure(constraints) }
        } else {
            try {
                subcompose(UiErrorBoundarySlot.Content) {
                    key(reloadKey) {
                        content()
                    }
                }.map { it.measure(constraints) }
            } catch (e: Throwable) {
                if (e is CancellationException) {
                    throw e
                }
                AppLogger.error(
                    tag = "UiErrorBoundary",
                    message = "UI rendering error in boundary $boundaryName",
                    throwable = e,
                    context = mapOf("boundary" to boundaryName)
                )
                onReportIssue?.invoke(e)
                capturedError = e
                subcompose(UiErrorBoundarySlot.Fallback) {
                    ErrorBoundaryFallback(
                        onGoHome = onGoHome,
                        onReloadSection = {
                            capturedError = null
                            reloadKey += 1
                            onReloadSection?.invoke()
                        },
                    )
                }.map { it.measure(constraints) }
            }
        }

        val width = placeables.maxOfOrNull { it.width }?.coerceIn(constraints.minWidth, constraints.maxWidth)
            ?: constraints.minWidth
        val height = placeables.maxOfOrNull { it.height }?.coerceIn(constraints.minHeight, constraints.maxHeight)
            ?: constraints.minHeight

        layout(width, height) {
            placeables.forEach { it.place(0, 0) }
        }
    }
}

private enum class UiErrorBoundarySlot {
    Content,
    Fallback
}

@Composable
private fun ErrorBoundaryFallback(
    modifier: Modifier = Modifier,
    onGoHome: (() -> Unit)? = null,
    onReloadSection: (() -> Unit)? = null,
) {
    EnhancedErrorState(
        title = "Something Went Wrong",
        message = "We encountered an issue while displaying this section. Please try reloading the section or returning home.",
        onRetry = onReloadSection,
        retryLabel = "Reload Section",
        onDismiss = onGoHome,
        dismissLabel = "Go Home",
        modifier = modifier.fillMaxSize(),
    )
}
