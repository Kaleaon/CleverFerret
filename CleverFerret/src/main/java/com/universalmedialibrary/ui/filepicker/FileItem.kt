package com.universalmedialibrary.ui.filepicker

import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

/**
 * Enhanced File Browser
 * Inspired by Moonreader's comprehensive file browsing features
 * 
 * Features:
 * - Folder navigation with breadcrumb trail
 * - File type filtering (EPUB, PDF, FB2, MOBI, etc.)
 * - File size filtering
 * - Sort by time, location, filename
 * - Grid/List view toggle
 * - Favorite folders
 * - Recent files
 * - File operations (copy, move, delete)
 * - Quick access to Downloads, SD card, etc.
 */

data class FileItem(
    val file: File,
    val name: String,
    val isDirectory: Boolean,
    val size: Long,
    val modifiedDate: Long,
    val fileType: FileType? = null
)

enum class FileType(val extensions: List<String>, val displayName: String) {
    EPUB(listOf("epub"), "EPUB"),
    PDF(listOf("pdf"), "PDF"),
    DJVU(listOf("djvu", "djv"), "DJVU"),
    FB2(listOf("fb2", "fb2.zip"), "FB2"),
    MOBI(listOf("mobi", "prc", "azw"), "MOBI/PRC/AZW"),
    AZW3(listOf("azw3", "kfx"), "AZW3/KFX"),
    CHM(listOf("chm"), "CHM"),
    UMD(listOf("umd"), "UMD"),
    DOCX(listOf("docx"), "DOCX"),
    DOC(listOf("doc"), "DOC"),
    ODT(listOf("odt"), "ODT"),
    RTF(listOf("rtf"), "RTF"),
    TXT(listOf("txt", "text"), "TXT"),
    MD(listOf("md", "markdown"), "Markdown"),
    HTML(listOf("html", "htm"), "HTML"),
    XHTML(listOf("xhtml", "xht"), "XHTML"),
    MHTML(listOf("mhtml", "mht"), "MHTML"),
    CBZ(listOf("cbz"), "CBZ"),
    CBR(listOf("cbr"), "CBR"),
    CBT(listOf("cbt"), "CBT"),
    CB7(listOf("cb7"), "CB7"),
    LIT(listOf("lit"), "LIT"),
    PDB(listOf("pdb"), "PDB"),
    RB(listOf("rb"), "RB"),
    SNB(listOf("snb"), "SNB");
    
    companion object {
        fun fromFile(file: File): FileType? {
            val extension = file.extension.lowercase()
            return values().find { it.extensions.contains(extension) }
        }
        
        fun allBookTypes(): List<FileType> = values().toList()
        
        fun getEbookTypes(): List<FileType> = listOf(
            EPUB, PDF, DJVU, FB2, MOBI, AZW3, CHM, UMD, LIT, PDB, RB, SNB
        )
        
        fun getDocumentTypes(): List<FileType> = listOf(
            DOCX, DOC, RTF, ODT, TXT, MD
        )
        
        fun getWebTypes(): List<FileType> = listOf(
            HTML, XHTML, MHTML
        )
        
        fun getComicTypes(): List<FileType> = listOf(
            CBZ, CBR, CBT, CB7
        )
    }
}
