package com.universalmedialibrary.ui.components

import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.LocalTextStyle
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.OutlinedTextFieldDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextFieldColors
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.autofill.AutofillNode
import androidx.compose.ui.autofill.AutofillType
import androidx.compose.ui.autofill.ContentType
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.layout.boundsInWindow
import androidx.compose.ui.layout.onGloballyPositioned
import androidx.compose.ui.platform.LocalAutofill
import androidx.compose.ui.platform.LocalAutofillTree
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.SemanticsPropertyKey
import androidx.compose.ui.semantics.SemanticsPropertyReceiver
import androidx.compose.ui.semantics.contentType
import androidx.compose.ui.semantics.error
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.input.VisualTransformation

val AutofillNodeSemanticsKey = SemanticsPropertyKey<AutofillNode>("AutofillNode")
var SemanticsPropertyReceiver.autofillNode: AutofillNode by AutofillNodeSemanticsKey

val AutofillTypesSemanticsKey = SemanticsPropertyKey<List<AutofillType>>("AutofillTypes")
var SemanticsPropertyReceiver.autofillTypes: List<AutofillType> by AutofillTypesSemanticsKey

val AutofillTypeSemanticsKey = SemanticsPropertyKey<AutofillType>("AutofillType")
var SemanticsPropertyReceiver.autofillType: AutofillType by AutofillTypeSemanticsKey

@OptIn(ExperimentalComposeUiApi::class)
private val AutofillToContentTypeMap: Map<AutofillType, ContentType> = mapOf(
    AutofillType.EmailAddress to ContentType.EmailAddress,
    AutofillType.Username to ContentType.Username,
    AutofillType.Password to ContentType.Password,
    AutofillType.NewUsername to ContentType.NewUsername,
    AutofillType.NewPassword to ContentType.NewPassword,
    AutofillType.PostalAddress to ContentType.PostalAddress,
    AutofillType.PostalCode to ContentType.PostalCode,
    AutofillType.CreditCardNumber to ContentType.CreditCardNumber,
    AutofillType.CreditCardSecurityCode to ContentType.CreditCardSecurityCode,
    AutofillType.CreditCardExpirationDate to ContentType.CreditCardExpirationDate,
    AutofillType.CreditCardExpirationMonth to ContentType.CreditCardExpirationMonth,
    AutofillType.CreditCardExpirationYear to ContentType.CreditCardExpirationYear,
    AutofillType.CreditCardExpirationDay to ContentType.CreditCardExpirationDay,
    AutofillType.AddressCountry to ContentType.AddressCountry,
    AutofillType.AddressRegion to ContentType.AddressRegion,
    AutofillType.AddressLocality to ContentType.AddressLocality,
    AutofillType.AddressStreet to ContentType.AddressStreet,
    AutofillType.AddressAuxiliaryDetails to ContentType.AddressAuxiliaryDetails,
    AutofillType.PostalCodeExtended to ContentType.PostalCodeExtended,
    AutofillType.PersonFullName to ContentType.PersonFullName,
    AutofillType.PersonFirstName to ContentType.PersonFirstName,
    AutofillType.PersonLastName to ContentType.PersonLastName,
    AutofillType.PersonMiddleName to ContentType.PersonMiddleName,
    AutofillType.PersonMiddleInitial to ContentType.PersonMiddleInitial,
    AutofillType.PersonNamePrefix to ContentType.PersonNamePrefix,
    AutofillType.PersonNameSuffix to ContentType.PersonNameSuffix,
    AutofillType.PhoneNumber to ContentType.PhoneNumber,
    AutofillType.PhoneNumberDevice to ContentType.PhoneNumberDevice,
    AutofillType.PhoneCountryCode to ContentType.PhoneCountryCode,
    AutofillType.PhoneNumberNational to ContentType.PhoneNumberNational,
    AutofillType.Gender to ContentType.Gender,
    AutofillType.BirthDateFull to ContentType.BirthDateFull,
    AutofillType.BirthDateDay to ContentType.BirthDateDay,
    AutofillType.BirthDateMonth to ContentType.BirthDateMonth,
    AutofillType.BirthDateYear to ContentType.BirthDateYear,
    AutofillType.SmsOtpCode to ContentType.SmsOtpCode
)

@OptIn(ExperimentalComposeUiApi::class)
internal fun AutofillType.toContentType(): ContentType =
    AutofillToContentTypeMap[this] ?: ContentType.Username

@OptIn(ExperimentalComposeUiApi::class)
@Suppress("LongParameterList")
internal fun buildFieldModifier(
    modifier: Modifier,
    autofillModifier: Modifier,
    hasError: Boolean,
    errorMessage: String?,
    effectiveAutofillTypes: List<AutofillType>,
    autofillNode: AutofillNode?
): Modifier {
    if (!hasError && effectiveAutofillTypes.isEmpty()) {
        return modifier.then(autofillModifier)
    }
    return modifier
        .then(autofillModifier)
        .semantics {
            if (hasError && errorMessage != null) {
                error(errorMessage)
            }
            if (effectiveAutofillTypes.isNotEmpty()) {
                autofillTypes = effectiveAutofillTypes
                autofillType = effectiveAutofillTypes.first()
                if (autofillNode != null) {
                    this.autofillNode = autofillNode
                }
                val combinedContentType = effectiveAutofillTypes
                    .map { it.toContentType() }
                    .reduceOrNull { acc, next -> acc + next }
                if (combinedContentType != null) {
                    this.contentType = combinedContentType
                }
            }
        }
}

/**
 * Standardized accessible OutlinedTextField component wrapping Material3 [OutlinedTextField].
 *
 * Exposes error semantics ([SemanticsProperties.Error]) and polite live region feedback ([LiveRegionMode.Polite])
 * when an error message is present, satisfying WCAG 2.1 SC 3.3.1 (Error Identification) and SC 4.1.3 (Status Messages).
 * Binds AutofillNode and ContentType semantics for WCAG 2.2 SC 1.3.5 (Identify Input Purpose).
 */
@OptIn(ExperimentalComposeUiApi::class)
@Suppress("LongParameterList", "LongMethod", "FunctionNaming", "CyclomaticComplexMethod")
@Composable
fun AccessibleOutlinedTextField(
    value: String,
    onValueChange: (String) -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    readOnly: Boolean = false,
    textStyle: TextStyle = LocalTextStyle.current,
    label: @Composable (() -> Unit)? = null,
    placeholder: @Composable (() -> Unit)? = null,
    leadingIcon: @Composable (() -> Unit)? = null,
    trailingIcon: @Composable (() -> Unit)? = null,
    prefix: @Composable (() -> Unit)? = null,
    suffix: @Composable (() -> Unit)? = null,
    supportingText: @Composable (() -> Unit)? = null,
    helperText: String? = null,
    errorMessage: String? = null,
    isError: Boolean = !errorMessage.isNullOrBlank(),
    visualTransformation: VisualTransformation = VisualTransformation.None,
    keyboardOptions: KeyboardOptions = KeyboardOptions.Default,
    keyboardActions: KeyboardActions = KeyboardActions.Default,
    singleLine: Boolean = false,
    maxLines: Int = if (singleLine) 1 else Int.MAX_VALUE,
    minLines: Int = 1,
    interactionSource: MutableInteractionSource? = null,
    shape: Shape = OutlinedTextFieldDefaults.shape,
    colors: TextFieldColors = OutlinedTextFieldDefaults.colors(),
    autofillTypes: List<AutofillType>? = null
) {
    val effectiveInteractionSource = interactionSource ?: remember { MutableInteractionSource() }
    val hasError = isError && !errorMessage.isNullOrBlank()
    val effectiveAutofillTypes = autofillTypes.orEmpty()

    val autofill = LocalAutofill.current
    val autofillTree = LocalAutofillTree.current

    val autofillNode = remember(effectiveAutofillTypes) {
        if (effectiveAutofillTypes.isNotEmpty()) {
            AutofillNode(
                onFill = onValueChange,
                autofillTypes = effectiveAutofillTypes
            )
        } else {
            null
        }
    }

    if (autofillNode != null) {
        DisposableEffect(autofillNode) {
            autofillTree += autofillNode
            onDispose { }
        }
    }

    val autofillModifier = if (autofillNode != null) {
        Modifier
            .onGloballyPositioned { coordinates ->
                autofillNode.boundingBox = coordinates.boundsInWindow()
            }
            .onFocusChanged { focusState ->
                if (focusState.isFocused) {
                    autofill?.requestAutofillForNode(autofillNode)
                } else {
                    autofill?.cancelAutofillForNode(autofillNode)
                }
            }
    } else {
        Modifier
    }

    val fieldModifier = buildFieldModifier(
        modifier = modifier,
        autofillModifier = autofillModifier,
        hasError = hasError,
        errorMessage = errorMessage,
        effectiveAutofillTypes = effectiveAutofillTypes,
        autofillNode = autofillNode
    )

    val supportingTextComposable: @Composable (() -> Unit)? = when {
        hasError -> {
            {
                Text(
                    text = errorMessage!!,
                    color = MaterialTheme.colorScheme.error,
                    style = MaterialTheme.typography.bodySmall,
                    modifier = Modifier.semantics {
                        liveRegion = LiveRegionMode.Polite
                    }
                )
            }
        }
        supportingText != null -> supportingText
        !helperText.isNullOrBlank() -> {
            {
                Text(
                    text = helperText,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        else -> null
    }

    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        modifier = fieldModifier,
        enabled = enabled,
        readOnly = readOnly,
        textStyle = textStyle,
        label = label,
        placeholder = placeholder,
        leadingIcon = leadingIcon,
        trailingIcon = trailingIcon,
        prefix = prefix,
        suffix = suffix,
        supportingText = supportingTextComposable,
        isError = isError,
        visualTransformation = visualTransformation,
        keyboardOptions = keyboardOptions,
        keyboardActions = keyboardActions,
        singleLine = singleLine,
        maxLines = maxLines,
        minLines = minLines,
        interactionSource = effectiveInteractionSource,
        shape = shape,
        colors = colors
    )
}
