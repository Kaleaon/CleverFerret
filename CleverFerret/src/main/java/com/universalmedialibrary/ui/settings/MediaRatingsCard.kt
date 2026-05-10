package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.ui.components.PinEntryDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun MediaRatingsCard(
    movieLimit: ParentalControlsSettings.MovieRatingLevel,
    tvLimit: ParentalControlsSettings.TvRatingLevel,
    gameLimit: ParentalControlsSettings.GameRatingLevel,
    bookLimit: ParentalControlsSettings.BookRatingLevel,
    onMovieLimitChange: (ParentalControlsSettings.MovieRatingLevel) -> Unit,
    onTvLimitChange: (ParentalControlsSettings.TvRatingLevel) -> Unit,
    onGameLimitChange: (ParentalControlsSettings.GameRatingLevel) -> Unit,
    onBookLimitChange: (ParentalControlsSettings.BookRatingLevel) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp)
        ) {
            RatingLimitSelector<ParentalControlsSettings.MovieRatingLevel>(
                icon = Icons.Default.Movie,
                title = "Films & Movies",
                subtitle = "Set the highest MPAA rating that can be accessed.",
                options = ParentalControlsSettings.MovieRatingLevel.values(),
                selected = movieLimit,
                labelProvider = { it.displayName },
                onSelected = onMovieLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.TvRatingLevel>(
                icon = Icons.Default.Tv,
                title = "TV & Streaming",
                subtitle = "Choose the maximum TV rating (TV-Y through TV-MA).",
                options = ParentalControlsSettings.TvRatingLevel.values(),
                selected = tvLimit,
                labelProvider = { it.displayName },
                onSelected = onTvLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.GameRatingLevel>(
                icon = Icons.Default.SportsEsports,
                title = "Games & Interactive Media",
                subtitle = "Limit ESRB ratings for games and interactive content.",
                options = ParentalControlsSettings.GameRatingLevel.values(),
                selected = gameLimit,
                labelProvider = { it.displayName },
                onSelected = onGameLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.BookRatingLevel>(
                icon = Icons.AutoMirrored.Filled.MenuBook,
                title = "Books & Stories",
                subtitle = "Control access to Mature or Explicit fiction.",
                options = ParentalControlsSettings.BookRatingLevel.values(),
                selected = bookLimit,
                labelProvider = { it.displayName },
                onSelected = onBookLimitChange
            )
        }
    }
}
