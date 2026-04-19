package com.universalmedialibrary.ui.media.navigation

import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class MediaNavDestinationsContractTest {

    @Test
    fun allDestinations_useOutlinedIconByDefaultAndFilledWhenSelected() {
        MediaNavDestinations.allDestinations.forEach { destination ->
            assertNotNull("${destination.label} should define a default icon", destination.icon)
            assertNotNull("${destination.label} should define a selected icon", destination.selectedIcon)
            assertNotEquals(
                "${destination.label} should use a different icon for selected state",
                destination.icon,
                destination.selectedIcon
            )
        }
    }
}
