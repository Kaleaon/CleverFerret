package com.universalmedialibrary.ui.media

import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.safeDrawing
import androidx.compose.foundation.layout.windowInsetsPadding
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.media.navigation.MediaBottomNavigation
import com.universalmedialibrary.ui.modern.theme.CFLayout
import com.universalmedialibrary.ui.modern.theme.LocalCFLayoutStandard
import com.universalmedialibrary.ui.modern.theme.LocalCFLayout


/** Playback and feedback occupy measured rows, so neither covers the navigation content. */
@Composable
internal fun CFMediaScaffold(
    navigation: CFMediaNavigationState,
    onNavigate: (String) -> Unit,
    player: @Composable () -> Unit,
    feedback: @Composable () -> Unit,
    content: @Composable () -> Unit
) {
    val layout = LocalCFLayout.current
    Surface(color = MaterialTheme.colorScheme.background, modifier = Modifier.fillMaxSize().windowInsetsPadding(WindowInsets.safeDrawing)) {
        BoxWithConstraints(Modifier.fillMaxSize()) {
            if (layout == CFLayout.Lcars && navigation.visible) {
                CFSweepScaffold(navigation, onNavigate, player, feedback, content)
            } else {
                CFAdaptiveScaffold(navigation, onNavigate, player, feedback, content)
            }
        }
    }
}

@Composable
private fun CFAdaptiveScaffold(
    navigation: CFMediaNavigationState,
    onNavigate: (String) -> Unit,
    player: @Composable () -> Unit,
    feedback: @Composable () -> Unit,
    content: @Composable () -> Unit
) {
    val standard = checkNotNull(LocalCFLayoutStandard.current)
    BoxWithConstraints(Modifier.fillMaxSize()) {
    val kind = if (maxWidth.value < standard.adaptiveWidth) standard.navigationPhone else standard.navigationWide
    Row(Modifier.fillMaxSize()) {
        if (kind == "rail" && navigation.visible) CFLayoutNavigation(navigation, onNavigate, vertical = true)
        Column(Modifier.weight(1f).fillMaxHeight()) {
            if (kind == "pivot-appbar" && navigation.visible) CFLayoutNavigation(navigation, onNavigate, vertical = false)
            androidx.compose.foundation.layout.Box(Modifier.weight(1f).fillMaxWidth()) { content() }
            feedback()
            player()
            if (kind == "bar" && navigation.visible) {
                MediaBottomNavigation(currentRoute = navigation.route, onNavigate = onNavigate,
                    bottomBarPreferences = navigation.preferences, gearPosition = navigation.gear)
            }
        }
    }
}
}
