package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
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
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@Composable
internal fun SelectFolderBottomBar(
    currentPath: String,
    onSelect: () -> Unit,
    onAddAsLibrary: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.LG
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD),
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            OutlinedButton(
                onClick = onAddAsLibrary,
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.LibraryAdd, null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Add as Library")
            }
            
            Button(
                onClick = onSelect,
                modifier = Modifier.weight(1f),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp))
                Spacer(Modifier.width(MediaSpacing.SM))
                Text("Select Folder")
            }
        }
    }
}
