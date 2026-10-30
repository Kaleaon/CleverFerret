package com.universalmedialibrary.ui.components

import androidx.compose.ui.unit.dp
import org.junit.Assert.assertEquals
import org.junit.Test

class FocusableContainerStateTest {

    @Test
    fun testFocusableContainerDefaults() {
        val focusedScale = 1.05f
        val focusedElevation = 8.dp
        val unfocusedElevation = 0.dp
        val focusedBorderWidth = 2.5.dp

        assertEquals(1.05f, focusedScale, 0.001f)
        assertEquals(8.dp, focusedElevation)
        assertEquals(0.dp, unfocusedElevation)
        assertEquals(2.5.dp, focusedBorderWidth)
    }

    @Test
    fun testFocusChangeCallbackInvocations() {
        var callbackState: Boolean? = null
        val onFocusChange: (Boolean) -> Unit = { callbackState = it }

        onFocusChange(true)
        assertEquals(true, callbackState)

        onFocusChange(false)
        assertEquals(false, callbackState)
    }
}
