package com.universalmedialibrary.ui.media

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.font.FontWeight
import com.universalmedialibrary.ui.modern.theme.cfContrastInk
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.navigation.MediaNavDestination
import com.universalmedialibrary.ui.media.navigation.MediaNavDestinations
import com.universalmedialibrary.ui.media.navigation.isDestinationSelected
import com.universalmedialibrary.ui.media.navigation.resolveMediaBottomBarLayout
import com.universalmedialibrary.ui.modern.theme.CFLayout
import com.universalmedialibrary.ui.modern.theme.LocalCFLayout
import com.universalmedialibrary.ui.modern.theme.LocalCFLayoutStandard
import java.util.Locale

private val StandardRailWidth = 72.dp
private val NavigationGap = 4.dp
private val NavigationPadding = 4.dp

@Composable
internal fun CFLayoutNavigation(state: CFMediaNavigationState, onNavigate: (String) -> Unit, vertical: Boolean) {
    val resolved = resolveMediaBottomBarLayout(MediaNavDestinations.allDestinations, state.preferences)
    // Rail/pivot navigation includes overflow destinations and Settings without requiring a second surface.
    val destinations = (resolved.primaryItems + resolved.overflowItems + MediaNavDestinations.settings).distinctBy { it.id }
    val standard = checkNotNull(LocalCFLayoutStandard.current)
    if (vertical) {
        val railWidth = standard.frame?.rail?.dp ?: StandardRailWidth
        LazyColumn(Modifier.width(railWidth).fillMaxHeight(), verticalArrangement = Arrangement.spacedBy(NavigationGap)) {
            items(destinations, key = { it.id }) { destination -> CFLayoutDestination(destination, state.route, onNavigate, true) }
        }
    } else {
        LazyRow(Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.spacedBy(NavigationGap)) {
            items(destinations, key = { it.id }) { destination -> CFLayoutDestination(destination, state.route, onNavigate, false) }
        }
    }
}

@Composable
private fun CFLayoutDestination(destination: MediaNavDestination, route: String, onNavigate: (String) -> Unit, vertical: Boolean) {
    val standard = checkNotNull(LocalCFLayoutStandard.current)
    val layout = LocalCFLayout.current
    val selected = isDestinationSelected(route, destination.route)
    val cs = MaterialTheme.colorScheme
    val sweep = layout == CFLayout.Lcars
    val fill = when {
        sweep && !selected -> cs.secondary
        sweep || selected -> cs.primary
        else -> cs.surface
    }
    val ink = if (sweep || selected) cfContrastInk(fill) else cs.onSurface
    val label = navigationLabel(destination.label, standard.navigationCase)
    val width = if (vertical) Modifier.fillMaxWidth() else Modifier
    Button(onClick = { onNavigate(destination.route) }, enabled = destination.enabled,
        modifier = width.heightIn(min = standard.minimumTarget.dp).semantics { this.selected = selected },
        shape = RoundedCornerShape(standard.corners.control.dp),
        contentPadding = androidx.compose.foundation.layout.PaddingValues(NavigationPadding),
        colors = ButtonDefaults.buttonColors(containerColor = fill, contentColor = ink)) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            if (!sweep && vertical) Icon(destination.icon, contentDescription = null)
            Text(label, style = MaterialTheme.typography.labelSmall, textAlign = TextAlign.Center,
                fontWeight = if (selected) FontWeight.Bold else FontWeight.Normal)
        }
    }
}

internal fun navigationLabel(label: String, case: String): String = when (case) {
    "uppercase" -> label.uppercase(Locale.ROOT)
    "lowercase" -> label.lowercase(Locale.ROOT)
    else -> label
}
