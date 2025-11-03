package com.universalmedialibrary.services.music

import android.util.Log
import java.io.File
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Parser for .lrc (Lyric) files - synced lyrics format
 * 
 * Supports:
 * - Simple format: [mm:ss.xx]lyrics
 * - Extended format with metadata: [ar:Artist][ti:Title][al:Album]
 * - Multiple timestamps per line: [00:12.00][00:17.20]Same lyrics
 */
@Singleton
class LrcParser @Inject constructor() {
    
    private val TAG = "LrcParser"
    
    // Regex patterns
    private val TIME_TAG_PATTERN = Regex("""\[(\d{2,}):(\d{2})\.(\d{2,3})\]""")
    private val METADATA_PATTERN = Regex("""\[([a-z]{2}):(.*?)\]""")
    
    /**
     * Parse .lrc file from path
     */
    fun parseFile(filePath: String): LrcData? {
        return try {
            val file = File(filePath)
            if (!file.exists()) return null
            
            val content = file.readText()
            parseContent(content)
        } catch (e: Exception) {
            Log.e(TAG, "Failed to parse LRC file: $filePath", e)
            null
        }
    }
    
    /**
     * Parse .lrc content string
     */
    fun parseContent(content: String): LrcData {
        val metadata = mutableMapOf<String, String>()
        val lines = mutableListOf<LrcLine>()
        
        content.lines().forEach { line ->
            val trimmed = line.trim()
            if (trimmed.isEmpty()) return@forEach
            
            // Try to parse metadata tags first
            val metadataMatch = METADATA_PATTERN.find(trimmed)
            if (metadataMatch != null && !trimmed.contains(TIME_TAG_PATTERN)) {
                val tag = metadataMatch.groupValues[1]
                val value = metadataMatch.groupValues[2]
                metadata[tag] = value
                return@forEach
            }
            
            // Parse time tags and lyrics
            val timestamps = mutableListOf<Long>()
            var lyrics = trimmed
            
            var match = TIME_TAG_PATTERN.find(lyrics)
            while (match != null) {
                val minutes = match.groupValues[1].toLong()
                val seconds = match.groupValues[2].toLong()
                val centiseconds = match.groupValues[3].padEnd(3, '0').take(3).toLong()
                
                val timeMs = (minutes * 60 * 1000) + (seconds * 1000) + (centiseconds * 10)
                timestamps.add(timeMs)
                
                // Remove this timestamp from lyrics
                lyrics = lyrics.replaceFirst(match.value, "").trim()
                match = TIME_TAG_PATTERN.find(lyrics)
            }
            
            // Create LrcLine for each timestamp (handles multiple timestamps per line)
            if (timestamps.isNotEmpty() && lyrics.isNotEmpty()) {
                timestamps.forEach { timestamp ->
                    lines.add(LrcLine(timestamp, lyrics))
                }
            }
        }
        
        // Sort lines by timestamp
        lines.sortBy { it.timestamp }
        
        return LrcData(
            lines = lines,
            metadata = metadata
        )
    }
    
    /**
     * Find .lrc file for audio file
     * Checks:
     * 1. Same directory with same name
     * 2. Same directory with track name
     */
    fun findLrcFile(audioFilePath: String, trackName: String? = null): String? {
        val audioFile = File(audioFilePath)
        val directory = audioFile.parentFile ?: return null
        val baseName = audioFile.nameWithoutExtension
        
        // Try same name with .lrc extension
        val sameName = File(directory, "$baseName.lrc")
        if (sameName.exists()) return sameName.absolutePath
        
        // Try track name if provided
        if (trackName != null) {
            val trackFile = File(directory, "$trackName.lrc")
            if (trackFile.exists()) return trackFile.absolutePath
        }
        
        return null
    }
    
    /**
     * Get current lyric line for a given timestamp
     */
    fun getCurrentLine(lrcData: LrcData, currentTimeMs: Long): LrcLine? {
        if (lrcData.lines.isEmpty()) return null
        
        // Find the line where timestamp <= currentTime and next line timestamp > currentTime
        var currentLine: LrcLine? = null
        
        for (i in lrcData.lines.indices) {
            val line = lrcData.lines[i]
            if (line.timestamp <= currentTimeMs) {
                currentLine = line
            } else {
                break
            }
        }
        
        return currentLine
    }
    
    /**
     * Get next lyric line after current timestamp
     */
    fun getNextLine(lrcData: LrcData, currentTimeMs: Long): LrcLine? {
        return lrcData.lines.firstOrNull { it.timestamp > currentTimeMs }
    }
    
    /**
     * Get all lyrics as plain text (for non-synced display)
     */
    fun getPlainText(lrcData: LrcData): String {
        // Remove duplicate lines (from multiple timestamps)
        val uniqueLines = lrcData.lines.distinctBy { it.text }
        return uniqueLines.joinToString("\n") { it.text }
    }
}

/**
 * Parsed LRC data
 */
data class LrcData(
    val lines: List<LrcLine>,
    val metadata: Map<String, String>
) {
    val title: String?
        get() = metadata["ti"]
    
    val artist: String?
        get() = metadata["ar"]
    
    val album: String?
        get() = metadata["al"]
    
    val author: String?
        get() = metadata["au"]
    
    val length: String?
        get() = metadata["length"]
    
    val by: String?
        get() = metadata["by"]
    
    val offset: Long
        get() = metadata["offset"]?.toLongOrNull() ?: 0L
}

/**
 * Single line of synced lyrics
 */
data class LrcLine(
    val timestamp: Long, // milliseconds
    val text: String
) {
    /**
     * Formatted time string (mm:ss)
     */
    val timeString: String
        get() {
            val totalSeconds = timestamp / 1000
            val minutes = totalSeconds / 60
            val seconds = totalSeconds % 60
            return "%02d:%02d".format(minutes, seconds)
        }
}
