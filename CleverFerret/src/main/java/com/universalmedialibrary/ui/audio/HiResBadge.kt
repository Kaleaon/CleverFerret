package com.universalmedialibrary.ui.audio

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.HighQuality
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.audio.AudioSpecs
import com.universalmedialibrary.audio.AudioFormatDetector

/**
 * Hi-Res Audio Quality Badge
 * Displays audio quality indicator with color coding
 */
@Composable
fun HiResBadge(
    audioSpecs: AudioSpecs,
    modifier: Modifier = Modifier
) {
    if (audioSpecs.isHiRes || audioSpecs.isLossless || audioSpecs.isDSD) {
        val backgroundColor = Color(AudioFormatDetector.getQualityBadgeColor(audioSpecs))
        
        Surface(
            modifier = modifier,
            shape = RoundedCornerShape(4.dp),
            color = backgroundColor
        ) {
            Row(
                modifier = Modifier.padding(horizontal = 6.dp, vertical = 3.dp),
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(3.dp)
            ) {
                Icon(
                    Icons.Default.HighQuality,
                    contentDescription = null,
                    tint = Color.White,
                    modifier = Modifier.size(14.dp)
                )
                
                Text(
                    text = audioSpecs.displayFormat,
                    color = Color.White,
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold
                )
            }
        }
    }
}

/**
 * Detailed audio specs display
 */
@Composable
fun AudioSpecsCard(
    audioSpecs: AudioSpecs,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            // Quality badge
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Audio Quality",
                    style = MaterialTheme.typography.titleMedium
                )
                
                HiResBadge(audioSpecs)
            }
            
            Divider()
            
            // Codec
            AudioSpecRow("Codec", audioSpecs.codec)
            
            // Sample rate
            AudioSpecRow(
                "Sample Rate",
                "${audioSpecs.sampleRate / 1000} kHz"
            )
            
            // Bit depth
            audioSpecs.bitDepth?.let {
                AudioSpecRow("Bit Depth", "$it-bit")
            }
            
            // Bitrate
            audioSpecs.bitrate?.let {
                AudioSpecRow("Bitrate", "${it / 1000} kbps")
            }
            
            // Channels
            AudioSpecRow(
                "Channels",
                when (audioSpecs.channels) {
                    1 -> "Mono"
                    2 -> "Stereo"
                    6 -> "5.1 Surround"
                    8 -> "7.1 Surround"
                    else -> "${audioSpecs.channels} channels"
                }
            )
            
            // Quality label
            Divider()
            
            Text(
                text = audioSpecs.qualityLabel,
                style = MaterialTheme.typography.bodyLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
private fun AudioSpecRow(
    label: String,
    value: String
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium
        )
    }
}

/**
 * Compact quality indicator for Now Playing
 */
@Composable
fun QualityIndicator(
    audioSpecs: AudioSpecs,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier,
        horizontalArrangement = Arrangement.spacedBy(4.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Codec
        Text(
            text = audioSpecs.codec,
            style = MaterialTheme.typography.labelSmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        // Quality badge if hi-res
        if (audioSpecs.isHiRes || audioSpecs.isDSD) {
            Text(
                text = "•",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            HiResBadge(audioSpecs)
        }
        
        // Lossless indicator
        if (audioSpecs.isLossless && !audioSpecs.isHiRes) {
            Text(
                text = "•",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Text(
                text = "Lossless",
                style = MaterialTheme.typography.labelSmall,
                color = Color(AudioFormatDetector.getQualityBadgeColor(audioSpecs))
            )
        }
    }
}
