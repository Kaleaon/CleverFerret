package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
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
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

data class WebFictionChapter(
    val id: String,
    val storyId: String,
    val title: String,
    val chapterNumber: Int,
    val wordCount: Long? = null,
    val publishedDate: String,
    val url: String
)

data class WebFictionUpdate(
    val storyId: String,
    val storyTitle: String,
    val storyCoverUrl: String?,
    val source: WebFictionSource,
    val chapter: WebFictionChapter,
    val timestamp: String,
    val isRead: Boolean = false
)

data class WebFictionSource(
    val id: String,
    val displayName: String,
    val description: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector,
    val color: Color,
    val categories: List<String>,
    val baseUrl: String,
    val supportsDownload: Boolean = true
) {
    companion object {
        val ROYAL_ROAD = WebFictionSource(
            id = "royalroad",
            displayName = "Royal Road",
            description = "Home of web serials, LitRPG, and progression fantasy",
            icon = Icons.Default.AutoStories,
            color = Color(0xFF2E7D32),  // Green
            categories = listOf("LitRPG", "Fantasy", "Sci-Fi"),
            baseUrl = "https://www.royalroad.com"
        )
        
        val AO3 = WebFictionSource(
            id = "ao3",
            displayName = "Archive of Our Own",
            description = "Fan-created works across all fandoms",
            icon = Icons.Default.Favorite,
            color = Color(0xFF990000),  // AO3 Red
            categories = listOf("Fanfiction", "Original Works"),
            baseUrl = "https://archiveofourown.org"
        )
        
        val FFN = WebFictionSource(
            id = "ffn",
            displayName = "FanFiction.Net",
            description = "The largest archive of fanfiction stories",
            icon = Icons.Default.MenuBook,
            color = Color(0xFF0066CC),  // FFN Blue
            categories = listOf("Anime", "Books", "Games", "Movies"),
            baseUrl = "https://www.fanfiction.net"
        )
        
        val WATTPAD = WebFictionSource(
            id = "wattpad",
            displayName = "Wattpad",
            description = "Social storytelling platform",
            icon = Icons.Default.Edit,
            color = Color(0xFFFF500A),  // Wattpad Orange
            categories = listOf("Romance", "Teen Fiction", "Werewolf"),
            baseUrl = "https://www.wattpad.com"
        )
        
        val SCRIBBLEHUB = WebFictionSource(
            id = "scribblehub",
            displayName = "ScribbleHub",
            description = "Reading and writing community for web novels",
            icon = Icons.Default.Create,
            color = Color(0xFF9C27B0),  // Purple
            categories = listOf("Fantasy", "Isekai", "LitRPG"),
            baseUrl = "https://www.scribblehub.com"
        )
        
        val SPACEBATTLES = WebFictionSource(
            id = "spacebattles",
            displayName = "SpaceBattles",
            description = "Forums for creative writing and discussion",
            icon = Icons.Default.RocketLaunch,
            color = Color(0xFF455A64),  // Blue Grey
            categories = listOf("Crossover", "Alt-History", "Sci-Fi"),
            baseUrl = "https://forums.spacebattles.com"
        )
    }
}
