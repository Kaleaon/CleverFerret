package com.universalmedialibrary.ui.folderimport

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.documentfile.provider.DocumentFile
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import kotlinx.coroutines.launch
import java.net.URI

@Composable
internal fun SupportedFormatsCard() {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Supported Formats",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.SemiBold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            FormatRow(
                icon = Icons.AutoMirrored.Filled.MenuBook,
                label = "Books",
                formats = "EPUB, PDF, MOBI, AZW, FB2, TXT, RTF, DJVU"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.Image,
                label = "Comics",
                formats = "CBZ, CBR, CB7, PDF"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.MusicNote,
                label = "Audio",
                formats = "MP3, M4A, M4B, AAC, OGG, FLAC, WAV"
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            FormatRow(
                icon = Icons.Default.VideoLibrary,
                label = "Video",
                formats = "MP4, MKV, AVI, MOV, WEBM"
            )

            Spacer(modifier = Modifier.height(12.dp))
            Text(
                text = "Unsupported files are skipped during scan. If import fails, verify the file is readable and you granted storage access.",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}
