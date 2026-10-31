package com.ktheme.compose

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class AccessibilityFoundationTest {

    @Test
    fun accessibilityFoundationFunctions_areInstantiableAndNotNull() {
        assertNotNull(AccessibilityFoundationTest::class.java)
    }

    @Test
    fun modifierExtensions_returnValidModifierChain() {
        val base = androidx.compose.ui.Modifier
        val buttonMod = base.accessibleButton(onClickLabel = "Test", onClick = {})
        assertNotNull(buttonMod)
        val selectableMod = base.accessibleSelectable(selected = true, onClick = {})
        assertNotNull(selectableMod)
    }
}
