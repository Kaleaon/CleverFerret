// ModernAuthenticationScreen — generic OAuth / username+password / token
// sign-in surface used by Plex, Jellyfin, Last.fm, Calibre web, OPDS,
// Reddit, etc. The provider's color/logo paints the hero; the form
// fields are configured per provider.

package com.universalmedialibrary.ui.modern.auth

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class AuthMethod { UsernamePassword, OAuth, Token, ApiKey, MagicLink }

data class AuthFieldDef(val key: String, val label: String, val secret: Boolean = false, val placeholder: String = "")

data class ModernAuthUiState(
    val providerName: String,
    val providerLogo: ImageVector,
    val providerColor: Color,
    val description: String,
    val method: AuthMethod,
    val fields: List<AuthFieldDef> = emptyList(),
    val values: Map<String, String> = emptyMap(),
    val isAuthenticating: Boolean = false,
    val errorMessage: String? = null,
    val helpUrl: String? = null,
)

@Composable
fun ModernAuthenticationScreen(
    state: ModernAuthUiState,
    onBack: () -> Unit,
    onChangeField: (key: String, value: String) -> Unit,
    onLaunchOAuth: () -> Unit,
    onSubmit: () -> Unit,
    onOpenHelp: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = { CFTopBar(title = "Sign in", onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        Column(
            Modifier.fillMaxSize().padding(padding).padding(CFSpacing.lg),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
            horizontalAlignment = Alignment.CenterHorizontally,
        ) {
            Box(
                Modifier
                    .size(96.dp)
                    .clip(CircleShape)
                    .background(state.providerColor),
                contentAlignment = Alignment.Center,
            ) { Icon(state.providerLogo, contentDescription = null, tint = Color.White, modifier = Modifier.size(40.dp)) }
            Text(state.providerName, style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Black)
            Text(state.description, style = MaterialTheme.typography.bodyMedium, color = cs.onSurfaceVariant, textAlign = TextAlign.Center)

            when (state.method) {
                AuthMethod.OAuth -> {
                    Spacer(Modifier.height(CFSpacing.lg))
                    CFMetalButton(
                        text = if (state.isAuthenticating) "Opening browser..." else "Sign in with ${state.providerName}",
                        onClick = onLaunchOAuth,
                        enabled = !state.isAuthenticating,
                        leadingIcon = Icons.Default.Login,
                    )
                }
                AuthMethod.MagicLink -> {
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                            .padding(CFSpacing.md),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    ) {
                        val emailField = state.fields.firstOrNull { it.key == "email" }
                            ?: AuthFieldDef(key = "email", label = "Email address", placeholder = "you@example.com")
                        OutlinedTextField(
                            value = state.values["email"] ?: "",
                            onValueChange = { onChangeField("email", it) },
                            label = { Text(emailField.label) },
                            placeholder = { Text(emailField.placeholder) },
                            singleLine = true,
                            modifier = Modifier.fillMaxWidth(),
                        )
                    }
                    state.errorMessage?.let { Text(it, color = cs.error, style = MaterialTheme.typography.bodySmall) }
                    Spacer(Modifier.height(CFSpacing.sm))
                    CFMetalButton(
                        text = if (state.isAuthenticating) "Sending..." else "Email me a magic link",
                        onClick = onSubmit,
                        enabled = !state.isAuthenticating,
                        leadingIcon = Icons.Default.Email,
                    )
                }
                else -> {
                    Column(
                        Modifier
                            .fillMaxWidth()
                            .clip(RoundedCornerShape(14.dp))
                            .background(cs.surface)
                            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                            .padding(CFSpacing.md),
                        verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                    ) {
                        state.fields.forEach { field ->
                            OutlinedTextField(
                                value = state.values[field.key] ?: "",
                                onValueChange = { onChangeField(field.key, it) },
                                label = { Text(field.label) },
                                placeholder = { Text(field.placeholder) },
                                singleLine = true,
                                visualTransformation = if (field.secret) PasswordVisualTransformation() else androidx.compose.ui.text.input.VisualTransformation.None,
                                modifier = Modifier.fillMaxWidth(),
                            )
                        }
                    }
                    state.errorMessage?.let { Text(it, color = cs.error, style = MaterialTheme.typography.bodySmall) }
                    CFMetalButton(
                        text = if (state.isAuthenticating) "Signing in..." else "Sign in",
                        onClick = onSubmit,
                        enabled = !state.isAuthenticating,
                        leadingIcon = Icons.Default.Login,
                    )
                }
            }

            if (state.helpUrl != null) {
                TextButton(onClick = onOpenHelp) {
                    Icon(Icons.Default.HelpOutline, contentDescription = null); Spacer(Modifier.width(4.dp)); Text("Need help signing in?")
                }
            }
        }
    }
}
