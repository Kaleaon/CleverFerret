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
internal fun AddLibraryDialog(
    folderPath: String,
    onConfirm: (LibraryType) -> Unit,
    onDismiss: () -> Unit
) {
    var selectedType by remember { mutableStateOf(LibraryType.BOOKS) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Add Library", color = MediaColors.TextPrimary)
        },
        text = {
            Column {
                Text(
                    "Add folder as library:",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary
                )
                Text(
                    folderPath.split("/").lastOrNull() ?: folderPath,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextTertiary
                )
                
                Spacer(Modifier.height(MediaSpacing.MD))
                
                Text(
                    "Library Type:",
                    style = MediaTypography.LabelMedium,
                    color = MediaColors.TextPrimary
                )
                
                Spacer(Modifier.height(MediaSpacing.SM))
                
                LibraryType.entries.forEach { type ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { selectedType = type }
                            .padding(vertical = MediaSpacing.SM),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        RadioButton(
                            selected = selectedType == type,
                            onClick = { selectedType = type },
                            colors = RadioButtonDefaults.colors(
                                selectedColor = MediaColors.AccentPrimary
                            )
                        )
                        Spacer(Modifier.width(MediaSpacing.SM))
                        Icon(
                            type.icon,
                            null,
                            tint = type.color,
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(Modifier.width(MediaSpacing.SM))
                        Text(
                            type.displayName,
                            style = MediaTypography.BodyMedium,
                            color = MediaColors.TextPrimary
                        )
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = { onConfirm(selectedType) },
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text("Add Library")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}
