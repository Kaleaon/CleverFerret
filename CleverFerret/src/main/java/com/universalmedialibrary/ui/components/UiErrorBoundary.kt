package com.universalmedialibrary.ui.components

import kotlinx.coroutines.CancellationException
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.key
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.core.logging.AppLogger

/**
 * Compose-safe error boundary used to isolate high-risk UI regions.
 *
 * When a rendering exception is thrown by [content], we log it through [AppLogger]
 * and swap to recovery UI with actions for:
 * - Navigate home
 * - Reload this section
 * - Report issue
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

    capturedError?.let { throwable ->
        ErrorBoundaryFallback(
            boundaryName = boundaryName,
            throwable = throwable,
            modifier = modifier,
            onGoHome = onGoHome,
            onReloadSection = {
                capturedError = null
                reloadKey += 1
                onReloadSection?.invoke()
            },
            onReportIssue = {
                onReportIssue?.invoke(throwable)
                    ?: AppLogger.error(
                        tag = "UiErrorBoundary",
                        message = "Issue reported from boundary=$boundaryName",
                        throwable = throwable,
                    )
            },
        )
        return
    }

    key(reloadKey) {
        try {
            content()
        } catch (throwable: Throwable) {
            if (throwable is CancellationException) throw throwable
            AppLogger.error(
                tag = "UiErrorBoundary",
                message = "Boundary caught UI exception (boundary=$boundaryName)",
                throwable = throwable,
            )
            capturedError = throwable
        }
    }
}

@Composable
private fun ErrorBoundaryFallback(
    boundaryName: String,
    throwable: Throwable,
    modifier: Modifier = Modifier,
    onGoHome: (() -> Unit)? = null,
    onReloadSection: (() -> Unit)? = null,
    onReportIssue: (() -> Unit)? = null,
) {
    Surface(modifier = modifier.fillMaxSize()) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(horizontal = 24.dp, vertical = 32.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp, Alignment.CenterVertically),
        ) {
            Text(
                text = "Something went wrong in this section",
                style = MaterialTheme.typography.headlineSmall,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.SemiBold,
            )
            Text(
                text = "Boundary: $boundaryName",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
            )
            Text(
                text = throwable.message ?: "Unexpected rendering error.",
                style = MaterialTheme.typography.bodyMedium,
                textAlign = TextAlign.Center,
            )

            Row(
                horizontalArrangement = Arrangement.spacedBy(12.dp),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                onGoHome?.let {
                    Button(onClick = it) {
                        Text("Go Home")
                    }
                }

                onReloadSection?.let {
                    OutlinedButton(onClick = it) {
                        Text("Reload Section")
                    }
                }

                onReportIssue?.let {
                    OutlinedButton(onClick = it) {
                        Text("Report Issue")
                    }
                }
            }
        }
    }
}
