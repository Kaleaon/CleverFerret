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

@OptIn(ExperimentalFoundationApi::class)
@Composable
internal fun FileListItem(
    item: FileItem,
    isSelected: Boolean,
    showCheckbox: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.SM))
            .combinedClickable(
                onClick = onClick,
                onLongClick = onLongClick
            ),
        color = if (isSelected)
            MediaColors.AccentPrimary.copy(alpha = 0.2f)
        else
            Color.Transparent
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Checkbox (multi-select mode)
            if (showCheckbox) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = { onClick() },
                    colors = CheckboxDefaults.colors(
                        checkedColor = MediaColors.AccentPrimary
                    )
                )
                Spacer(Modifier.width(MediaSpacing.SM))
            }
            
            // Icon
            Surface(
                shape = RoundedCornerShape(MediaCorners.SM),
                color = item.fileType.color.copy(alpha = 0.15f),
                modifier = Modifier.size(44.dp)
            ) {
                Icon(
                    item.fileType.icon,
                    null,
                    tint = item.fileType.color,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
            
            Spacer(Modifier.width(MediaSpacing.MD))
            
            // File info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    item.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                Row(
                    horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
                ) {
                    if (!item.isDirectory) {
                        Text(
                            formatSize(item.size),
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    } else {
                        Text(
                            "${item.childCount} items",
                            style = MediaTypography.LabelSmall,
                            color = MediaColors.TextTertiary
                        )
                    }
                    Text(
                        item.modifiedDate,
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary
                    )
                }
            }
            
            // Navigate icon for folders
            if (item.isDirectory) {
                Icon(
                    Icons.Default.ChevronRight,
                    "Open",
                    tint = MediaColors.TextTertiary
                )
            }
        }
    }
}
