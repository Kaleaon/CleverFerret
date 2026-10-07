package com.universalmedialibrary.ui.theme

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class FocusHighlightIndicationTest {

    @Test
    fun focusHighlightIndication_equalityAndHashCode() {
        val indication1 = FocusHighlightIndication(focusColor = Color.Red, strokeWidth = 2.5.dp, drawRipple = true)
        val indication2 = FocusHighlightIndication(focusColor = Color.Red, strokeWidth = 2.5.dp, drawRipple = true)
        val indication3 = FocusHighlightIndication(focusColor = Color.Blue, strokeWidth = 2.5.dp, drawRipple = true)
        val indication4 = FocusHighlightIndication(focusColor = Color.Red, strokeWidth = 3.0.dp, drawRipple = false)

        assertEquals("Identical FocusHighlightIndication instances must be equal", indication1, indication2)
        assertEquals("Identical instances must have matching hash codes", indication1.hashCode(), indication2.hashCode())

        assertNotEquals("Different focus colors must not be equal", indication1, indication3)
        assertNotEquals("Different stroke width or drawRipple must not be equal", indication1, indication4)
    }

    @Test
    fun focusHighlightIndication_createsNodeInstance() {
        val indication = FocusHighlightIndication(focusColor = Color.Cyan)
        val interactionSource = androidx.compose.foundation.interaction.MutableInteractionSource()

        val node = indication.create(interactionSource)
        assertNotNull("DelegatableNode should be created successfully", node)
    }
}
