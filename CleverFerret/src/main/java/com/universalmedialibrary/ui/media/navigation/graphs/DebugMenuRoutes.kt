package com.universalmedialibrary.ui.media.navigation.graphs

import android.net.Uri
import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.*
import androidx.navigation.compose.*
import com.universalmedialibrary.BuildConfig
import com.universalmedialibrary.R
import com.universalmedialibrary.ui.media.components.MediaType
import com.universalmedialibrary.ui.media.player.*
import com.universalmedialibrary.ui.media.screens.*
import com.universalmedialibrary.ui.media.viewmodels.*
import com.universalmedialibrary.debug.ui.DebugMenuScreen
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.components.UiErrorBoundary
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.ui.theme.toCleverFerretTheme
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import kotlinx.coroutines.launch
import java.io.File
import com.universalmedialibrary.ui.media.navigation.MediaRoutes

fun NavGraphBuilder.debugMenuRoutes(
    navController: NavHostController,
    onShowSnackbar: (String) -> Unit
) {
    if (BuildConfig.SHOW_DEBUG_MENU) {
        composable(MediaRoutes.DEBUG_MENU) {
            DebugMenuScreen(
                onBack = { navController.popBackStack() }
            )
        }
    }
    }
}

// Extension to get route name from MediaType
private val MediaType.routeName: String
    get() = when (this) {
    MediaType.BOOK -> "book"
    MediaType.AUDIOBOOK -> "audiobook"
    MediaType.MUSIC -> "music"
    MediaType.PODCAST -> "podcast"
    MediaType.COMIC -> "comic"
    MediaType.MOVIE -> "movie"
    MediaType.TV_SHOW -> "tv_show"
    MediaType.FANFICTION -> "webfiction"
    MediaType.DOCUMENT -> "document"
    MediaType.RADIO -> "radio"
    MediaType.NEWS -> "news"
    MediaType.UNKNOWN -> "unknown"
    }
}
