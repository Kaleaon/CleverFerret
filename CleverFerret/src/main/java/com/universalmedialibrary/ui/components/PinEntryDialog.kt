package com.universalmedialibrary.ui.components

import androidx.compose.animation.core.Animatable
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Backspace
import androidx.compose.material3.BasicAlertDialog
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.runtime.saveable.canBeSaved
import androidx.compose.runtime.saveable.listSaver
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.compose.runtime.toMutableStateList
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.IntOffset
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.launch
import kotlin.math.roundToInt
import androidx.compose.ui.window.DialogProperties

private const val PIN_LENGTH = 4

/**
 * Full-screen PIN entry dialog that supports verification and confirmation flows.
 *
 * @param title Title displayed at the top of the dialog.
 * @param initialPrompt Prompt text shown while entering the first PIN sequence.
 * @param confirmPrompt Optional prompt shown when confirmation is required.
 * @param supportingText Optional supporting text shown below the prompt.
 * @param error External error message to display (e.g., incorrect PIN).
 * @param onDismiss Invoked when the dialog should be closed without completing entry.
 * @param onPinComplete Invoked when the user completes the required PIN entry.
 */
@Composable
fun PinEntryDialog(
    title: String,
    initialPrompt: String,
    confirmPrompt: String? = null,
    supportingText: String? = null,
    error: String?,
    onDismiss: () -> Unit,
    onPinComplete: (String) -> Unit
) {
    val requireConfirmation = !confirmPrompt.isNullOrBlank()
    val controller = rememberShakeController()
    val digits = rememberMutableStateListOf<Int>()
    var stage by remember { mutableStateOf(PinEntryStage.Enter) }
    var firstPin by remember { mutableStateOf<String?>(null) }
    var localError by remember { mutableStateOf<String?>(null) }
    val displayError = localError ?: error

    LaunchedEffect(title, confirmPrompt) {
        digits.clear()
        stage = PinEntryStage.Enter
        firstPin = null
        localError = null
    }

    LaunchedEffect(error) {
        if (error != null) {
            digits.clear()
            controller.shake()
        }
    }

    BasicAlertDialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(Color.Black.copy(alpha = 0.45f)),
            contentAlignment = Alignment.Center
        ) {
            Surface(
                tonalElevation = 6.dp,
                modifier = Modifier
                    .padding(horizontal = 24.dp)
                    .fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(horizontal = 24.dp, vertical = 32.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(24.dp)
                ) {
                    Column(horizontalAlignment = Alignment.CenterHorizontally) {
                        Text(
                            text = title,
                            style = androidx.compose.material3.MaterialTheme.typography.titleLarge,
                            fontWeight = FontWeight.Bold,
                            modifier = Modifier
                                .padding(bottom = 12.dp)
                                .shake(controller)
                        )

                        val prompt = when (stage) {
                            PinEntryStage.Enter -> initialPrompt
                            PinEntryStage.Confirm -> confirmPrompt ?: initialPrompt
                        }
                        Text(
                            text = prompt,
                            style = androidx.compose.material3.MaterialTheme.typography.bodyLarge,
                            textAlign = TextAlign.Center,
                            modifier = Modifier.shake(controller)
                        )

                        if (stage == PinEntryStage.Enter && !supportingText.isNullOrBlank()) {
                            Spacer(modifier = Modifier.size(12.dp))
                            Text(
                                text = supportingText,
                                style = androidx.compose.material3.MaterialTheme.typography.bodySmall,
                                textAlign = TextAlign.Center,
                                color = androidx.compose.material3.MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }

                    PinIndicatorRow(
                        filledCount = digits.size,
                        controller = controller
                    )

                    if (!displayError.isNullOrBlank()) {
                        Text(
                            text = displayError,
                            style = androidx.compose.material3.MaterialTheme.typography.bodySmall,
                            color = androidx.compose.material3.MaterialTheme.colorScheme.error,
                            modifier = Modifier
                                .padding(top = 4.dp)
                                .shake(controller)
                        )
                    }

                    PinNumberPad(
                        onNumber = { number ->
                            if (digits.size < PIN_LENGTH) {
                                digits.add(number)
                                localError = null
                            }
                            if (digits.size == PIN_LENGTH) {
                                val pin = digits.joinToString("")
                                handlePinCompletion(
                                    requireConfirmation = requireConfirmation,
                                    stage = stage,
                                    firstPin = firstPin,
                                    enteredPin = pin,
                                    onRequireConfirmation = { saved ->
                                        firstPin = saved
                                        stage = PinEntryStage.Confirm
                                        digits.clear()
                                    },
                                    onMismatch = {
                                        localError = it
                                        controller.shake()
                                        digits.clear()
                                    },
                                    onComplete = {
                                        digits.clear()
                                        stage = PinEntryStage.Enter
                                        firstPin = null
                                        localError = null
                                        onPinComplete(it)
                                    }
                                )
                            }
                        },
                        onBackspace = {
                            if (digits.isNotEmpty()) {
                                digits.removeLast()
                                localError = null
                            }
                        }
                    )

                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        TextButton(onClick = {
                            digits.clear()
                            localError = null
                            stage = PinEntryStage.Enter
                            firstPin = null
                            onDismiss()
                        }) {
                            Text("Cancel")
                        }
                        OutlinedButton(onClick = {
                            digits.clear()
                            localError = null
                            stage = PinEntryStage.Enter
                            firstPin = null
                        }) {
                            Text("Clear")
                        }
                    }
                }
            }
        }
    }
}

private fun handlePinCompletion(
    requireConfirmation: Boolean,
    stage: PinEntryStage,
    firstPin: String?,
    enteredPin: String,
    onRequireConfirmation: (String) -> Unit,
    onMismatch: (String) -> Unit,
    onComplete: (String) -> Unit
) {
    if (!requireConfirmation) {
        onComplete(enteredPin)
        return
    }

    if (stage == PinEntryStage.Enter) {
        onRequireConfirmation(enteredPin)
    } else {
        if (firstPin == enteredPin) {
            onComplete(enteredPin)
        } else {
            onMismatch("PINs do not match. Try again.")
        }
    }
}

private enum class PinEntryStage {
    Enter,
    Confirm
}

@Composable
private fun PinIndicatorRow(
    filledCount: Int,
    controller: PinShakeController
) {
    Row(
        horizontalArrangement = Arrangement.spacedBy(16.dp),
        modifier = Modifier.shake(controller)
    ) {
        repeat(PIN_LENGTH) { index ->
            val filled = index < filledCount
            Box(
                modifier = Modifier
                    .size(16.dp)
                    .clip(CircleShape)
                    .background(
                        color = if (filled) {
                            androidx.compose.material3.MaterialTheme.colorScheme.primary
                        } else {
                            androidx.compose.material3.MaterialTheme.colorScheme.surfaceVariant
                        }
                    )
            )
        }
    }
}

@Composable
private fun PinNumberPad(
    onNumber: (Int) -> Unit,
    onBackspace: () -> Unit
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        listOf(
            listOf(1, 2, 3),
            listOf(4, 5, 6),
            listOf(7, 8, 9)
        ).forEach { row ->
            Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                row.forEach { number ->
                    PinNumberButton(number = number, onClick = onNumber)
                }
            }
        }

        Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
            Spacer(modifier = Modifier.size(64.dp))
            PinNumberButton(number = 0, onClick = onNumber)
            PinIconButton(onClick = onBackspace)
        }
    }
}

@Composable
private fun PinNumberButton(
    number: Int,
    onClick: (Int) -> Unit
) {
    androidx.compose.material3.Button(
        onClick = { onClick(number) },
        colors = ButtonDefaults.filledTonalButtonColors(),
        modifier = Modifier
            .size(64.dp)
            .shadow(elevation = 4.dp, shape = CircleShape),
        shape = CircleShape,
        contentPadding = androidx.compose.foundation.layout.PaddingValues(0.dp)
    ) {
        Text(
            text = number.toString(),
            fontSize = 24.sp,
            fontWeight = FontWeight.SemiBold
        )
    }
}

@Composable
private fun PinIconButton(
    onClick: () -> Unit
) {
    androidx.compose.material3.FilledTonalIconButton(
        onClick = onClick,
        modifier = Modifier.size(64.dp),
        shape = CircleShape,
        colors = androidx.compose.material3.IconButtonDefaults.filledTonalIconButtonColors()
    ) {
        androidx.compose.material3.Icon(
            imageVector = Icons.Default.Backspace,
            contentDescription = "Backspace"
        )
    }
}

private class PinShakeController {
    var trigger by mutableIntStateOf(0)
        private set

    fun shake() {
        trigger++
    }
}

@Composable
private fun rememberShakeController(): PinShakeController {
    return remember { PinShakeController() }
}

@Composable
private fun Modifier.shake(controller: PinShakeController): Modifier {
    val scope = rememberCoroutineScope()
    val offsetX = remember { Animatable(0f) }

    LaunchedEffect(controller.trigger) {
        if (controller.trigger == 0) return@LaunchedEffect
        scope.launch {
            val sequence = listOf(0f, 12f, -12f, 8f, -8f, 4f, -4f, 0f)
            for (value in sequence) {
                offsetX.animateTo(value, tween(durationMillis = 50))
            }
        }
    }

    return this.offset { IntOffset(offsetX.value.roundToInt(), 0) }
}

@Composable
private fun <T : Any> rememberMutableStateListOf(vararg elements: T): SnapshotStateList<T> {
    return rememberSaveable(
        saver = listSaver(
            save = { stateList ->
                if (stateList.isNotEmpty()) {
                    val first = stateList.first()
                    if (!canBeSaved(first)) {
                        error("${first::class} cannot be saved. Only types supported by Bundle can be saved.")
                    }
                }
                stateList.toList()
            },
            restore = { it.toMutableStateList() }
        )
    ) {
        elements.toList().toMutableStateList()
    }
}
