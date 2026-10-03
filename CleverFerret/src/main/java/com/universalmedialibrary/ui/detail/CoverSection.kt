package com.universalmedialibrary.ui.detail

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.platform.LocalContext
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.data.local.entity.UnifiedTag
import java.text.DecimalFormat
import kotlin.math.log10
import kotlin.math.pow

@Composable
internal fun CoverSection(
    coverPath: String?,
    mediaType: String,
    cacheVersion: Long
) {
    val context = LocalContext.current
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(300.dp),
        shape = RoundedCornerShape(16.dp)
    ) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            if (coverPath != null) {
                AsyncImage(
                    model = ImageRequest.Builder(context)
                        .data(coverPath)
                        .memoryCacheKey("$coverPath#$cacheVersion")
                        .diskCacheKey("$coverPath#$cacheVersion")
                        .setParameter("cache_buster", cacheVersion)
                        .build(),
                    contentDescription = "Cover",
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )
            } else {
                // Placeholder with gradient based on media type
                val colors = when (mediaType) {
                    "BOOK" -> listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
                    "MUSIC" -> listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
                    "MOVIE" -> listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
                    else -> listOf(Color(0xFF37474F), Color(0xFF78909C))
                }
                
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(Brush.linearGradient(colors)),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = when (mediaType) {
                            "BOOK" -> Icons.Default.Book
                            "MUSIC" -> Icons.Default.MusicNote
                            "MOVIE" -> Icons.Default.Movie
                            else -> Icons.Default.InsertDriveFile
                        },
                        contentDescription = "Media image",
                        modifier = Modifier.size(80.dp),
                        tint = Color.White.copy(alpha = 0.7f)
                    )
                }
            }
        }
    }
}
