package com.universalmedialibrary.ui.components

import androidx.compose.ui.ExperimentalComposeUiApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.autofill.AutofillNode
import androidx.compose.ui.autofill.AutofillType
import androidx.compose.ui.autofill.ContentType
import androidx.compose.ui.semantics.SemanticsConfiguration
import androidx.compose.ui.semantics.SemanticsModifier
import androidx.compose.ui.semantics.SemanticsProperties
import androidx.compose.ui.semantics.getOrNull
import com.universalmedialibrary.ui.modern.auth.AuthFieldDef
import com.universalmedialibrary.ui.modern.auth.AuthMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Test suite verifying AccessibleOutlinedTextField autofill binding and attribute propagation
 * to satisfy WCAG 2.2 SC 1.3.5 (Identify Input Purpose).
 */
@OptIn(ExperimentalComposeUiApi::class)
class AccessibleAutofillSemanticsTest {

    private fun extractSemanticsConfiguration(modifier: Modifier): SemanticsConfiguration? {
        var semanticsConfig: SemanticsConfiguration? = null
        modifier.foldIn(Unit) { _, element ->
            if (element is SemanticsModifier) {
                semanticsConfig = element.semanticsConfiguration
            }
        }
        return semanticsConfig
    }

    @Test
    fun toContentType_correctlyMapsCommonAutofillTypes() {
        assertEquals(ContentType.EmailAddress, AutofillType.EmailAddress.toContentType())
        assertEquals(ContentType.Password, AutofillType.Password.toContentType())
        assertEquals(ContentType.NewPassword, AutofillType.NewPassword.toContentType())
        assertEquals(ContentType.Username, AutofillType.Username.toContentType())
        assertEquals(ContentType.PostalAddress, AutofillType.PostalAddress.toContentType())
        assertEquals(ContentType.PersonFullName, AutofillType.PersonFullName.toContentType())
        assertEquals(ContentType.PhoneNumber, AutofillType.PhoneNumber.toContentType())
        assertEquals(ContentType.SmsOtpCode, AutofillType.SmsOtpCode.toContentType())
    }

    @Test
    fun autofillNode_onFillCallbackUpdatesValue() {
        var updatedText = ""
        val node = AutofillNode(
            onFill = { updatedText = it },
            autofillTypes = listOf(AutofillType.EmailAddress)
        )

        assertEquals(listOf(AutofillType.EmailAddress), node.autofillTypes)
        node.onFill?.invoke("autofilled@cleverferret.org")
        assertEquals("autofilled@cleverferret.org", updatedText)
    }

    @Test
    fun buildFieldModifier_whenAutofillProvided_attachesAutofillSemantics() {
        var updatedText = ""
        val autofillTypes = listOf(AutofillType.EmailAddress)
        val node = AutofillNode(
            onFill = { updatedText = it },
            autofillTypes = autofillTypes
        )

        val modifier = buildFieldModifier(
            modifier = Modifier,
            autofillModifier = Modifier,
            hasError = false,
            errorMessage = null,
            effectiveAutofillTypes = autofillTypes,
            autofillNode = node
        )

        val semanticsConfig = extractSemanticsConfiguration(modifier)
        assertNotNull("SemanticsConfiguration must be present on field modifier", semanticsConfig)

        assertEquals(
            "Primary autofillType must equal AutofillType.EmailAddress",
            AutofillType.EmailAddress,
            semanticsConfig?.getOrNull(AutofillTypeSemanticsKey)
        )

        assertEquals(
            "AutofillTypes list must equal listOf(AutofillType.EmailAddress)",
            autofillTypes,
            semanticsConfig?.getOrNull(AutofillTypesSemanticsKey)
        )

        assertEquals(
            "ContentType must equal ContentType.EmailAddress",
            ContentType.EmailAddress,
            semanticsConfig?.getOrNull(SemanticsProperties.ContentType)
        )

        val attachedNode = semanticsConfig?.getOrNull(AutofillNodeSemanticsKey)
        assertNotNull("AutofillNode must be attached in semantics", attachedNode)
        assertEquals(node, attachedNode)
    }

    @Test
    fun buildFieldModifier_whenErrorAndAutofillProvided_preservesBothSemantics() {
        val errorMessage = "Invalid credentials entered"
        val autofillTypes = listOf(AutofillType.Password)
        val node = AutofillNode(
            onFill = {},
            autofillTypes = autofillTypes
        )

        val modifier = buildFieldModifier(
            modifier = Modifier,
            autofillModifier = Modifier,
            hasError = true,
            errorMessage = errorMessage,
            effectiveAutofillTypes = autofillTypes,
            autofillNode = node
        )

        val semanticsConfig = extractSemanticsConfiguration(modifier)
        assertNotNull(semanticsConfig)

        assertEquals(
            "Error semantics must be preserved when autofill is present",
            errorMessage,
            semanticsConfig?.getOrNull(SemanticsProperties.Error)
        )

        assertEquals(
            "AutofillType.Password must be attached in semantics",
            AutofillType.Password,
            semanticsConfig?.getOrNull(AutofillTypeSemanticsKey)
        )

        assertEquals(
            "ContentType.Password must be attached in semantics",
            ContentType.Password,
            semanticsConfig?.getOrNull(SemanticsProperties.ContentType)
        )
    }

    @Test
    fun buildFieldModifier_whenNoErrorAndNoAutofill_returnsCleanModifier() {
        val modifier = buildFieldModifier(
            modifier = Modifier,
            autofillModifier = Modifier,
            hasError = false,
            errorMessage = null,
            effectiveAutofillTypes = emptyList(),
            autofillNode = null
        )

        val semanticsConfig = extractSemanticsConfiguration(modifier)
        assertNull("Modifier without error or autofill should have no extra semantics", semanticsConfig)
    }

    @Test
    fun modernAuthenticationScreen_fieldAutofillMapping_resolvesExpectedTypes() {
        fun resolveAutofillTypes(field: AuthFieldDef): List<AutofillType> = when {
            field.secret -> listOf(AutofillType.Password)
            field.label.contains("email", ignoreCase = true) -> listOf(AutofillType.EmailAddress)
            else -> listOf(AutofillType.Username, AutofillType.EmailAddress)
        }

        val secretField = AuthFieldDef(key = "pass", label = "Password", secret = true)
        val emailField = AuthFieldDef(key = "mail", label = "Email Address", secret = false)
        val userField = AuthFieldDef(key = "user", label = "Account Name", secret = false)

        assertEquals(listOf(AutofillType.Password), resolveAutofillTypes(secretField))
        assertEquals(listOf(AutofillType.EmailAddress), resolveAutofillTypes(emailField))
        assertEquals(
            listOf(AutofillType.Username, AutofillType.EmailAddress),
            resolveAutofillTypes(userField)
        )
    }
}
