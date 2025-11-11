package com.universalmedialibrary.ui.components

import androidx.compose.runtime.*
import com.universalmedialibrary.ui.components.pin.PinChallenge
import kotlinx.coroutines.launch

/**
 * Full-screen PIN challenge dialog for parental controls.
 *
 * @param challenge Details about the content being unlocked.
 * @param onDismiss Invoked when the dialog is dismissed without unlocking.
 * @param onAccessGranted Invoked when the entered PIN is correct.
 * @param verifyPin Suspended lambda that returns true when the provided PIN is valid.
 */
@Composable
fun PinAccessDialog(
    challenge: PinChallenge,
    onDismiss: () -> Unit,
    onAccessGranted: () -> Unit,
    verifyPin: suspend (String) -> Boolean
) {
    val scope = rememberCoroutineScope()
    var errorMessage by remember { mutableStateOf<String?>(null) }
    var isVerifying by remember { mutableStateOf(false) }

    val prompt = challenge.description ?: "Enter your PIN to unlock \"${challenge.title}\"."
    val supporting = buildList {
        challenge.rating?.let { add("Rating: $it") }
        challenge.mediaType?.let {
            val cleaned = it
                .replace('_', ' ')
                .lowercase()
                .replaceFirstChar { ch -> ch.titlecase() }
            add("Media: $cleaned")
        }
    }.takeIf { it.isNotEmpty() }?.joinToString(" • ")

    PinEntryDialog(
        title = "PIN Required",
        initialPrompt = prompt,
        confirmPrompt = null,
        supportingText = supporting,
        error = errorMessage,
        onDismiss = {
            if (!isVerifying) {
                errorMessage = null
                onDismiss()
            }
        },
        onPinComplete = { pin ->
            if (isVerifying) return@PinEntryDialog
            scope.launch {
                isVerifying = true
                val success = verifyPin(pin)
                if (success) {
                    errorMessage = null
                    isVerifying = false
                    onAccessGranted()
                } else {
                    errorMessage = "Incorrect PIN. Please try again."
                    isVerifying = false
                }
            }
        }
    )
}
