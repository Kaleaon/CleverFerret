# File Browsing Features - Moonreader Integration

## Overview
This document describes the enhanced file browsing capabilities added to Clever Ferret, inspired by Moonreader's comprehensive file management system.

## Features Implemented

### 1. Enhanced File Browser (`EnhancedFileBrowser.kt`)

**Core Features:**
- ✅ **Breadcrumb Navigation**: Navigate through folder hierarchy with clickable breadcrumbs
- ✅ **Quick Access Buttons**: One-tap access to Downloads, SD Card, Documents folders
- ✅ **File Type Filtering**: Filter by EPUB, PDF, FB2, MOBI, CHM, DOCX, TXT, HTML, CBZ
- ✅ **File Size Filtering**: Filter files by minimum and maximum size (KB)
- ✅ **Sort Options**: Sort by time, location, filename, or size
- ✅ **View Modes**: Toggle between List and Grid views
- ✅ **Multi-Selection**: Select multiple files for batch operations
- ✅ **File Operations**: Copy, move, delete selected files
- ✅ **Favorite Folders**: Save and quickly access favorite folders
- ✅ **Hidden Files**: Option to show/hide hidden files

**UI Components:**
- Breadcrumb trail with home button
- Quick access bar with common folders
- Sort bar with multiple sort options
- Selection bar for batch operations
- Settings dialog for filters
- Favorite folders dialog

### 2. Auto-Import Folders (`AutoImportFolders.kt`)

**Features:**
- ✅ **Folder Management**: Add/remove folders for auto-import
- ✅ **Enable/Disable**: Toggle auto-import per folder
- ✅ **Manual Scan**: Trigger immediate scan of folder
- ✅ **Import Statistics**: Track number of imported files per folder
- ✅ **Last Scan Time**: Display when folder was last scanned

## File Type Support

The browser recognizes and filters these file types:

| Type | Extensions | Display Name |
|------|-----------|--------------|
| EPUB | epub | EPUB |
| PDF | pdf, djvu | PDF/DJVU |
| FB2 | fb2, fb2.zip | FB2 |
| MOBI | mobi, azw3, prc | MOBI/AZW3/PRC |
| CHM | chm, umd | CHM/UMD |
| DOCX | docx, odt, rtf | DOCX/ODT/RTF |
| TXT | txt, md | TXT/MD |
| HTML | html, htm, mhtml | HTML/MHTML |
| CBZ | cbz, cbr | CBZ/CBR |

## Usage Examples

### Basic File Browser
```kotlin
EnhancedFileBrowser(
    initialPath = "/sdcard/Books",
    onFileSelected = { file ->
        // Handle file selection
        viewModel.openFile(file)
    },
    onFolderSelected = { folder ->
        // Handle folder navigation
    },
    allowMultipleSelection = true
)
```

### Auto-Import Folders
```kotlin
AutoImportFoldersScreen(
    folders = autoImportFolders,
    onAddFolder = { path ->
        viewModel.addAutoImportFolder(path)
    },
    onRemoveFolder = { path ->
        viewModel.removeAutoImportFolder(path)
    },
    onToggleFolder = { path, enabled ->
        viewModel.toggleAutoImportFolder(path, enabled)
    },
    onScanNow = { path ->
        viewModel.scanFolderForNewBooks(path)
    },
    onNavigateBack = { navController.popBackStack() }
)
```

## Integration with Existing Code

The enhanced file browser can be integrated with:
- `StorageBrowserScreen.kt` - Replace or enhance existing browser
- `ImportExportScreen.kt` - Use for importing books
- Library screens - Use for adding books from file system

## Moonreader Features Comparison

| Feature | Moonreader | Clever Ferret | Status |
|---------|-----------|---------------|--------|
| Breadcrumb navigation | ✅ | ✅ | Complete |
| Quick access folders | ✅ | ✅ | Complete |
| File type filtering | ✅ | ✅ | Complete |
| File size filtering | ✅ | ✅ | Complete |
| Sort options | ✅ | ✅ | Complete |
| Grid/List view | ✅ | ✅ | Complete |
| Multi-selection | ✅ | ✅ | Complete |
| Copy/Move/Delete | ✅ | ✅ | Complete |
| Favorite folders | ✅ | ✅ | Complete |
| Auto-import | ✅ | ✅ | Complete |
| Recent files | ✅ | ⚠️ | Partial* |

*Recent files tracking can be added to ViewModel

## Future Enhancements

1. **Recent Files**: Track and display recently accessed files
2. **File Preview**: Preview files before opening
3. **Search**: Search files by name within current directory
4. **File Details**: Show detailed file information dialog
5. **Cloud Storage**: Support for cloud storage providers
6. **File Sharing**: Share files directly from browser
7. **Batch Rename**: Rename multiple files at once
8. **File Compression**: Compress/decompress files

## Technical Notes

- Uses Material 3 design system
- Fully Compose-based UI
- Handles file permissions properly
- Supports Android 10+ scoped storage
- Efficient file loading with coroutines
- Proper error handling for inaccessible folders

## Files Created

1. `EnhancedFileBrowser.kt` - Main file browser component
2. `AutoImportFolders.kt` - Auto-import folder management

## Integration Points

To integrate the enhanced file browser:

1. **Replace existing browser**:
```kotlin
// In navigation
composable("fileBrowser") {
    EnhancedFileBrowser(
        initialPath = null,
        onFileSelected = { file -> /* handle */ },
        onFolderSelected = { folder -> /* handle */ }
    )
}
```

2. **Add to settings**:
```kotlin
// In settings screen
NavigationItem(
    icon = Icons.Default.Folder,
    label = "File Browser",
    onClick = { navController.navigate("fileBrowser") }
)
```

3. **Use for import**:
```kotlin
// In import screen
Button(onClick = { showFileBrowser = true }) {
    Text("Browse Files")
}

if (showFileBrowser) {
    EnhancedFileBrowser(
        onFileSelected = { file ->
            viewModel.importFile(file)
            showFileBrowser = false
        },
        onFolderSelected = { /* navigate */ }
    )
}
```
