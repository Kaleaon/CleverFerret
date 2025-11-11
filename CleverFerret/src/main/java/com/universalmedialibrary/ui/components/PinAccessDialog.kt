package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.Warning
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import kotlinx.coroutines.launch

/**
 * Reusable PIN access dialog for adult content protection
 * 
 * Shows when user tries to access mature/explicit content
 * Verifies PIN before allowing access
 */
@Composable
fun PinAccessDialog(
    contentTitle: String = "Adult Content",
    contentRating: String? = null,
    onDismiss: () -> Unit,
    onAccessGranted: () -> Unit,
    parentalControlsSettings: ParentalControlsSettings
) {
    var pin by remember { mutableStateOf("") }
    var error by remember { mutableStateOf<String?>(null) }
    var isVerifying by remember { mutableStateOf(false) }
    val scope = rememberCoroutineScope()

    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(
                Icons.Default.Lock,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.error,
                modifier = Modifier.size(32.dp)
            )
        },
        title = {
            Text(
                "Content Locked",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
        },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Warning info
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.errorContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Icon(
                            Icons.Default.Warning,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.error
                        )
                        Column {
                            Text(
                                "Adult Content",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.onErrorContainer
                            )
                            if (contentRating != null) {
                                Text(
                                    "Rating: $contentRating",
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onErrorContainer
                                )
                            }
                        }
                    }
                }

                Text(
                    "\"$contentTitle\" contains mature content and is protected by parental controls.",
                    style = MaterialTheme.typography.bodyMedium
                )

                Text(
                    "Enter your PIN to access this content:",
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium
                )

                OutlinedTextField(
                    value = pin,
                    onValueChange = { 
                        if (it.length <= 4 && it.all { char -> char.isDigit() }) {
                            pin = it
                            error = null
                        }
                    },
                    label = { Text("PIN") },
                    visualTransformation = PasswordVisualTransformation(),
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.NumberPassword),
                    singleLine = true,
                    isError = error != null,
                    supportingText = {
                        if (error != null) {
                            Text(
                                error!!,
                                color = MaterialTheme.colorScheme.error,
                                style = MaterialTheme.typography.bodySmall
                            )
                        }
                    },
                    modifier = Modifier.fillMaxWidth(),
                    enabled = !isVerifying
                )

                Text(
                    "If you forgot your PIN, an adult can reset it in Settings → Parental Controls.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    if (pin.length == 4) {
                        isVerifying = true
                        scope.launch {
                            val valid = parentalControlsSettings.verifyPin(pin)
                            if (valid) {
                                onAccessGranted()
                            } else {
                                error = "Incorrect PIN. Please try again."
                                pin = ""
                                isVerifying = false
                            }
                        }
                    }
                },
                enabled = pin.length == 4 && !isVerifying
            ) {
                if (isVerifying) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp,
                        color = MaterialTheme.colorScheme.onPrimary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                }
                Text("Unlock")
            }
        },
        dismissButton = {
            TextButton(
                onClick = onDismiss,
                enabled = !isVerifying
            ) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Simplified PIN verification dialog (for quick checks)
 */
@Composable
fun QuickPinDialog(
    title: String = "Enter PIN",
    message: String = "Enter your PIN to continue",
    onDismiss: () -> Unit,
    onPinVerified: () -> Unit,
    parentalControlsSettings: ParentalControlsSettings
) {
    var pin by remember { mutableStateOf("") }
    var error by remember { mutableStateOf<String?>(null) }
    val scope = rememberCoroutineScope()

    AlertDialog(
        onDismissRequest = onDismiss,
        icon = { Icon(Icons.Default.Lock, contentDescription = null) },
        title = { Text(title) },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                Text(message)
                OutlinedTextField(
                    value = pin,
                    onValueChange = { 
                        if (it.length <= 4 && it.all { char -> char.isDigit() }) {
                            pin = it
                            error = null
                        }
                    },
                    label = { Text("PIN") },
                    visualTransformation = PasswordVisualTransformation(),
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.NumberPassword),
                    singleLine = true,
                    isError = error != null,
                    supportingText = {
                        if (error != null) {
                            Text(error!!, color = MaterialTheme.colorScheme.error)
                        }
                    }
                )
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    if (pin.length == 4) {
                        scope.launch {
                            val valid = parentalControlsSettings.verifyPin(pin)
                            if (valid) {
                                onPinVerified()
                            } else {
                                error = "Incorrect PIN"
                                pin = ""
                            }
                        }
                    }
                },
                enabled = pin.length == 4
            ) {
                Text("Verify")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

/**
 * Helper function to check and show PIN dialog if needed
 */
@Composable
fun rememberPinDialogState(
    parentalControlsSettings: ParentalControlsSettings
): PinDialogState {
    return remember { PinDialogState(parentalControlsSettings) }
}

/**
 * State holder for PIN dialog
 */
class PinDialogState(
    private val parentalControlsSettings: ParentalControlsSettings
) {
    var showDialog by mutableStateOf(false)
        private set
    
    var contentTitle by mutableStateOf("")
        private set
    
    var contentRating by mutableStateOf<String?>(null)
        private set
    
    private var onGranted: (() -> Unit)? = null

    /**
     * Check if content requires PIN and show dialog if needed
     * Returns true if access granted, false if PIN required
     */
    suspend fun checkAccess(
        rating: String?,
        title: String,
        mediaType: String? = null,
        tags: Collection<String> = emptyList(),
        onAccessGranted: () -> Unit
    ): Boolean {
        val requiresPin = parentalControlsSettings.requiresPinForAccess(rating, mediaType, tags)
        
        if (requiresPin) {
            contentTitle = title
            contentRating = rating
            onGranted = onAccessGranted
            showDialog = true
            return false
        }
        
        return true
    }

    fun dismiss() {
        showDialog = false
    }

    fun grantAccess() {
        showDialog = false
        onGranted?.invoke()
    }
}
