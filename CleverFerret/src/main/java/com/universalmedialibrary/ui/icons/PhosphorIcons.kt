package com.universalmedialibrary.ui.icons

import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.materialIcon
import androidx.compose.material.icons.materialPath
import androidx.compose.ui.graphics.vector.ImageVector

/**
 * Custom Phosphor-inspired icons for CleverFerret
 * These icons provide better semantic meaning than generic Material icons
 */
object PhosphorIcons {
    
    val Book: ImageVector
        get() {
            if (_book != null) {
                return _book!!
            }
            _book = materialIcon(name = "Book") {
                materialPath {
                    moveTo(6.0f, 2.0f)
                    curveTo(4.9f, 2.0f, 4.0f, 2.9f, 4.0f, 4.0f)
                    verticalLineTo(20.0f)
                    curveTo(4.0f, 21.1f, 4.9f, 22.0f, 6.0f, 22.0f)
                    horizontalLineTo(18.0f)
                    curveTo(19.1f, 22.0f, 20.0f, 21.1f, 20.0f, 20.0f)
                    verticalLineTo(4.0f)
                    curveTo(20.0f, 2.9f, 19.1f, 2.0f, 18.0f, 2.0f)
                    horizontalLineTo(6.0f)
                    close()
                    moveTo(6.0f, 4.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(12.0f)
                    lineTo(8.5f, 10.5f)
                    lineTo(6.0f, 12.0f)
                    verticalLineTo(4.0f)
                    close()
                    moveTo(13.0f, 4.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(14.83f)
                    lineTo(8.5f, 13.33f)
                    lineTo(11.0f, 14.83f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(20.0f)
                    close()
                }
            }
            return _book!!
        }
    
    val FilmStrip: ImageVector
        get() {
            if (_filmStrip != null) {
                return _filmStrip!!
            }
            _filmStrip = materialIcon(name = "FilmStrip") {
                materialPath {
                    moveTo(18.0f, 3.0f)
                    verticalLineTo(21.0f)
                    curveTo(18.0f, 21.55f, 17.55f, 22.0f, 17.0f, 22.0f)
                    horizontalLineTo(7.0f)
                    curveTo(6.45f, 22.0f, 6.0f, 21.55f, 6.0f, 21.0f)
                    verticalLineTo(3.0f)
                    curveTo(6.0f, 2.45f, 6.45f, 2.0f, 7.0f, 2.0f)
                    horizontalLineTo(17.0f)
                    curveTo(17.55f, 2.0f, 18.0f, 2.45f, 18.0f, 3.0f)
                    close()
                    moveTo(8.0f, 4.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(8.0f)
                    close()
                    moveTo(14.0f, 4.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(14.0f)
                    close()
                    moveTo(8.0f, 8.0f)
                    verticalLineTo(16.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(8.0f)
                    close()
                    moveTo(8.0f, 18.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(8.0f)
                    close()
                    moveTo(14.0f, 18.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(14.0f)
                    close()
                }
            }
            return _filmStrip!!
        }
    
    val MusicNote: ImageVector
        get() {
            if (_musicNote != null) {
                return _musicNote!!
            }
            _musicNote = materialIcon(name = "MusicNote") {
                materialPath {
                    moveTo(12.0f, 3.0f)
                    verticalLineTo(13.55f)
                    curveTo(11.41f, 13.21f, 10.73f, 13.0f, 10.0f, 13.0f)
                    curveTo(7.79f, 13.0f, 6.0f, 14.79f, 6.0f, 17.0f)
                    reflectiveCurveTo(7.79f, 21.0f, 10.0f, 21.0f)
                    reflectiveCurveTo(14.0f, 19.21f, 14.0f, 17.0f)
                    verticalLineTo(7.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(12.0f)
                    verticalLineTo(3.0f)
                    close()
                }
            }
            return _musicNote!!
        }
    
    val Microphone: ImageVector
        get() {
            if (_microphone != null) {
                return _microphone!!
            }
            _microphone = materialIcon(name = "Microphone") {
                materialPath {
                    moveTo(12.0f, 2.0f)
                    curveTo(10.34f, 2.0f, 9.0f, 3.34f, 9.0f, 5.0f)
                    verticalLineTo(11.0f)
                    curveTo(9.0f, 12.66f, 10.34f, 14.0f, 12.0f, 14.0f)
                    curveTo(13.66f, 14.0f, 15.0f, 12.66f, 15.0f, 11.0f)
                    verticalLineTo(5.0f)
                    curveTo(15.0f, 3.34f, 13.66f, 2.0f, 12.0f, 2.0f)
                    close()
                    moveTo(19.0f, 11.0f)
                    curveTo(19.0f, 14.53f, 16.39f, 17.44f, 13.0f, 17.93f)
                    verticalLineTo(21.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(17.93f)
                    curveTo(7.61f, 17.44f, 5.0f, 14.53f, 5.0f, 11.0f)
                    horizontalLineTo(7.0f)
                    curveTo(7.0f, 13.76f, 9.24f, 16.0f, 12.0f, 16.0f)
                    reflectiveCurveTo(17.0f, 13.76f, 17.0f, 11.0f)
                    horizontalLineTo(19.0f)
                    close()
                }
            }
            return _microphone!!
        }
    
    val Newspaper: ImageVector
        get() {
            if (_newspaper != null) {
                return _newspaper!!
            }
            _newspaper = materialIcon(name = "Newspaper") {
                materialPath {
                    moveTo(4.0f, 6.0f)
                    horizontalLineTo(2.0f)
                    verticalLineTo(20.0f)
                    curveTo(2.0f, 21.1f, 2.9f, 22.0f, 4.0f, 22.0f)
                    horizontalLineTo(18.0f)
                    curveTo(19.1f, 22.0f, 20.0f, 21.1f, 20.0f, 20.0f)
                    verticalLineTo(4.0f)
                    curveTo(20.0f, 2.9f, 19.1f, 2.0f, 18.0f, 2.0f)
                    horizontalLineTo(6.0f)
                    curveTo(4.9f, 2.0f, 4.0f, 2.9f, 4.0f, 4.0f)
                    verticalLineTo(6.0f)
                    close()
                    moveTo(18.0f, 4.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(4.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(4.0f)
                    close()
                    moveTo(8.0f, 6.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(8.0f)
                    close()
                    moveTo(12.0f, 6.0f)
                    verticalLineTo(10.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(12.0f)
                    close()
                    moveTo(12.0f, 12.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(12.0f)
                    close()
                }
            }
            return _newspaper!!
        }
    
    val FileText: ImageVector
        get() {
            if (_fileText != null) {
                return _fileText!!
            }
            _fileText = materialIcon(name = "FileText") {
                materialPath {
                    moveTo(14.0f, 2.0f)
                    horizontalLineTo(6.0f)
                    curveTo(4.9f, 2.0f, 4.0f, 2.9f, 4.0f, 4.0f)
                    verticalLineTo(20.0f)
                    curveTo(4.0f, 21.1f, 4.9f, 22.0f, 6.0f, 22.0f)
                    horizontalLineTo(18.0f)
                    curveTo(19.1f, 22.0f, 20.0f, 21.1f, 20.0f, 20.0f)
                    verticalLineTo(8.0f)
                    lineTo(14.0f, 2.0f)
                    close()
                    moveTo(18.0f, 20.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(20.0f)
                    close()
                    moveTo(8.0f, 12.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(12.0f)
                    close()
                    moveTo(8.0f, 16.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(16.0f)
                    close()
                }
            }
            return _fileText!!
        }
    
    val ArrowClockwise: ImageVector
        get() {
            if (_arrowClockwise != null) {
                return _arrowClockwise!!
            }
            _arrowClockwise = materialIcon(name = "ArrowClockwise") {
                materialPath {
                    moveTo(17.65f, 6.35f)
                    curveTo(16.2f, 4.9f, 14.21f, 4.0f, 12.0f, 4.0f)
                    curveTo(7.58f, 4.0f, 4.0f, 7.58f, 4.0f, 12.0f)
                    reflectiveCurveTo(7.58f, 20.0f, 12.0f, 20.0f)
                    curveTo(15.73f, 20.0f, 18.84f, 17.45f, 19.73f, 14.0f)
                    horizontalLineTo(17.65f)
                    curveTo(16.83f, 16.33f, 14.61f, 18.0f, 12.0f, 18.0f)
                    curveTo(8.69f, 18.0f, 6.0f, 15.31f, 6.0f, 12.0f)
                    reflectiveCurveTo(8.69f, 6.0f, 12.0f, 6.0f)
                    curveTo(13.66f, 6.0f, 15.14f, 6.69f, 16.22f, 7.78f)
                    lineTo(13.0f, 11.0f)
                    horizontalLineTo(20.0f)
                    verticalLineTo(4.0f)
                    lineTo(17.65f, 6.35f)
                    close()
                }
            }
            return _arrowClockwise!!
        }
    
    val Gear: ImageVector
        get() {
            if (_gear != null) {
                return _gear!!
            }
            _gear = materialIcon(name = "Gear") {
                materialPath {
                    moveTo(12.0f, 15.5f)
                    curveTo(14.21f, 15.5f, 16.0f, 13.71f, 16.0f, 11.5f)
                    reflectiveCurveTo(14.21f, 7.5f, 12.0f, 7.5f)
                    reflectiveCurveTo(8.0f, 9.29f, 8.0f, 11.5f)
                    reflectiveCurveTo(9.79f, 15.5f, 12.0f, 15.5f)
                    close()
                    moveTo(19.43f, 12.98f)
                    curveTo(19.47f, 12.66f, 19.5f, 12.34f, 19.5f, 12.0f)
                    reflectiveCurveTo(19.47f, 11.34f, 19.43f, 11.02f)
                    lineTo(21.54f, 9.37f)
                    curveTo(21.73f, 9.22f, 21.78f, 8.95f, 21.66f, 8.73f)
                    lineTo(19.66f, 5.27f)
                    curveTo(19.54f, 5.05f, 19.27f, 4.97f, 19.05f, 5.05f)
                    lineTo(16.56f, 6.05f)
                    curveTo(16.04f, 5.65f, 15.48f, 5.32f, 14.87f, 5.07f)
                    lineTo(14.49f, 2.42f)
                    curveTo(14.46f, 2.18f, 14.25f, 2.0f, 14.0f, 2.0f)
                    horizontalLineTo(10.0f)
                    curveTo(9.75f, 2.0f, 9.54f, 2.18f, 9.51f, 2.42f)
                    lineTo(9.13f, 5.07f)
                    curveTo(8.52f, 5.32f, 7.96f, 5.66f, 7.44f, 6.05f)
                    lineTo(4.95f, 5.05f)
                    curveTo(4.73f, 4.96f, 4.46f, 5.05f, 4.34f, 5.27f)
                    lineTo(2.34f, 8.73f)
                    curveTo(2.21f, 8.95f, 2.27f, 9.22f, 2.46f, 9.37f)
                    lineTo(4.57f, 11.02f)
                    curveTo(4.53f, 11.34f, 4.5f, 11.67f, 4.5f, 12.0f)
                    reflectiveCurveTo(4.53f, 12.66f, 4.57f, 12.98f)
                    lineTo(2.46f, 14.63f)
                    curveTo(2.27f, 14.78f, 2.21f, 15.05f, 2.34f, 15.27f)
                    lineTo(4.34f, 18.73f)
                    curveTo(4.46f, 18.95f, 4.73f, 19.03f, 4.95f, 18.95f)
                    lineTo(7.44f, 17.95f)
                    curveTo(7.96f, 18.35f, 8.52f, 18.68f, 9.13f, 18.93f)
                    lineTo(9.51f, 21.58f)
                    curveTo(9.54f, 21.82f, 9.75f, 22.0f, 10.0f, 22.0f)
                    horizontalLineTo(14.0f)
                    curveTo(14.25f, 22.0f, 14.46f, 21.82f, 14.49f, 21.58f)
                    lineTo(14.87f, 18.93f)
                    curveTo(15.48f, 18.68f, 16.04f, 18.34f, 16.56f, 17.95f)
                    lineTo(19.05f, 18.95f)
                    curveTo(19.27f, 19.04f, 19.54f, 18.95f, 19.66f, 18.73f)
                    lineTo(21.66f, 15.27f)
                    curveTo(21.78f, 15.05f, 21.73f, 14.78f, 21.54f, 14.63f)
                    lineTo(19.43f, 12.98f)
                    close()
                }
            }
            return _gear!!
        }
    
    val Plus: ImageVector
        get() {
            if (_plus != null) {
                return _plus!!
            }
            _plus = materialIcon(name = "Plus") {
                materialPath {
                    moveTo(19.0f, 13.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(19.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(13.0f)
                    horizontalLineTo(5.0f)
                    verticalLineTo(11.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(11.0f)
                    horizontalLineTo(19.0f)
                    verticalLineTo(13.0f)
                    close()
                }
            }
            return _plus!!
        }
    
    val ArrowLeft: ImageVector
        get() {
            if (_arrowLeft != null) {
                return _arrowLeft!!
            }
            _arrowLeft = materialIcon(name = "ArrowLeft") {
                materialPath {
                    moveTo(20.0f, 11.0f)
                    horizontalLineTo(7.83f)
                    lineTo(13.42f, 5.41f)
                    lineTo(12.0f, 4.0f)
                    lineTo(4.0f, 12.0f)
                    lineTo(12.0f, 20.0f)
                    lineTo(13.41f, 18.59f)
                    lineTo(7.83f, 13.0f)
                    horizontalLineTo(20.0f)
                    verticalLineTo(11.0f)
                    close()
                }
            }
            return _arrowLeft!!
        }
    
    val Play: ImageVector
        get() {
            if (_play != null) {
                return _play!!
            }
            _play = materialIcon(name = "Play") {
                materialPath {
                    moveTo(8.0f, 5.0f)
                    verticalLineTo(19.0f)
                    lineTo(19.0f, 12.0f)
                    lineTo(8.0f, 5.0f)
                    close()
                }
            }
            return _play!!
        }
    
    val Star: ImageVector
        get() {
            if (_star != null) {
                return _star!!
            }
            _star = materialIcon(name = "Star") {
                materialPath {
                    moveTo(12.0f, 17.27f)
                    lineTo(18.18f, 21.0f)
                    lineTo(16.54f, 13.97f)
                    lineTo(22.0f, 9.24f)
                    lineTo(14.81f, 8.63f)
                    lineTo(12.0f, 2.0f)
                    lineTo(9.19f, 8.63f)
                    lineTo(2.0f, 9.24f)
                    lineTo(7.46f, 13.97f)
                    lineTo(5.82f, 21.0f)
                    lineTo(12.0f, 17.27f)
                    close()
                }
            }
            return _star!!
        }
    
    val FolderOpen: ImageVector
        get() {
            if (_folderOpen != null) {
                return _folderOpen!!
            }
            _folderOpen = materialIcon(name = "FolderOpen") {
                materialPath {
                    moveTo(20.0f, 6.0f)
                    horizontalLineTo(12.0f)
                    lineTo(10.0f, 4.0f)
                    horizontalLineTo(4.0f)
                    curveTo(2.9f, 4.0f, 2.01f, 4.9f, 2.01f, 6.0f)
                    lineTo(2.0f, 18.0f)
                    curveTo(2.0f, 19.1f, 2.9f, 20.0f, 4.0f, 20.0f)
                    horizontalLineTo(20.0f)
                    curveTo(21.1f, 20.0f, 22.0f, 19.1f, 22.0f, 18.0f)
                    verticalLineTo(8.0f)
                    curveTo(22.0f, 6.9f, 21.1f, 6.0f, 20.0f, 6.0f)
                    close()
                    moveTo(20.0f, 18.0f)
                    horizontalLineTo(4.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(20.0f)
                    verticalLineTo(18.0f)
                    close()
                }
            }
            return _folderOpen!!
        }
    
    val Warning: ImageVector
        get() {
            if (_warning != null) {
                return _warning!!
            }
            _warning = materialIcon(name = "Warning") {
                materialPath {
                    moveTo(1.0f, 21.0f)
                    horizontalLineTo(23.0f)
                    lineTo(12.0f, 2.0f)
                    lineTo(1.0f, 21.0f)
                    close()
                    moveTo(13.0f, 18.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(16.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(18.0f)
                    close()
                    moveTo(13.0f, 14.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(10.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(14.0f)
                    close()
                }
            }
            return _warning!!
        }
    
    val House: ImageVector
        get() {
            if (_house != null) {
                return _house!!
            }
            _house = materialIcon(name = "House") {
                materialPath {
                    moveTo(10.0f, 20.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(14.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(19.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(22.0f)
                    lineTo(12.0f, 3.0f)
                    lineTo(2.0f, 12.0f)
                    horizontalLineTo(5.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(10.0f)
                    close()
                }
            }
            return _house!!
        }
    
    val PencilSimple: ImageVector
        get() {
            if (_pencilSimple != null) {
                return _pencilSimple!!
            }
            _pencilSimple = materialIcon(name = "PencilSimple") {
                materialPath {
                    moveTo(3.0f, 17.25f)
                    verticalLineTo(21.0f)
                    horizontalLineTo(6.75f)
                    lineTo(17.81f, 9.94f)
                    lineTo(14.06f, 6.19f)
                    lineTo(3.0f, 17.25f)
                    close()
                    moveTo(20.71f, 7.04f)
                    curveTo(21.1f, 6.65f, 21.1f, 6.02f, 20.71f, 5.63f)
                    lineTo(18.37f, 3.29f)
                    curveTo(17.98f, 2.9f, 17.35f, 2.9f, 16.96f, 3.29f)
                    lineTo(15.13f, 5.12f)
                    lineTo(18.88f, 8.87f)
                    lineTo(20.71f, 7.04f)
                    close()
                }
            }
            return _pencilSimple!!
        }

    val MagnifyingGlass: ImageVector
        get() {
            if (_magnifyingGlass != null) {
                return _magnifyingGlass!!
            }
            _magnifyingGlass = materialIcon(name = "MagnifyingGlass") {
                materialPath {
                    moveTo(15.5f, 14.0f)
                    horizontalLineTo(14.71f)
                    lineTo(14.43f, 13.73f)
                    curveTo(15.41f, 12.59f, 16.0f, 11.11f, 16.0f, 9.5f)
                    curveTo(16.0f, 5.91f, 13.09f, 3.0f, 9.5f, 3.0f)
                    reflectiveCurveTo(3.0f, 5.91f, 3.0f, 9.5f)
                    reflectiveCurveTo(5.91f, 16.0f, 9.5f, 16.0f)
                    curveTo(11.11f, 16.0f, 12.59f, 15.41f, 13.73f, 14.43f)
                    lineTo(14.0f, 14.71f)
                    verticalLineTo(15.5f)
                    lineTo(19.0f, 20.49f)
                    lineTo(20.49f, 19.0f)
                    lineTo(15.5f, 14.0f)
                    close()
                    moveTo(9.5f, 14.0f)
                    curveTo(7.01f, 14.0f, 5.0f, 11.99f, 5.0f, 9.5f)
                    reflectiveCurveTo(7.01f, 5.0f, 9.5f, 5.0f)
                    reflectiveCurveTo(14.0f, 7.01f, 14.0f, 9.5f)
                    reflectiveCurveTo(11.99f, 14.0f, 9.5f, 14.0f)
                    close()
                }
            }
            return _magnifyingGlass!!
        }

    val Pencil: ImageVector
        get() {
            if (_pencil != null) {
                return _pencil!!
            }
            _pencil = materialIcon(name = "Pencil") {
                materialPath {
                    moveTo(14.06f, 9.02f)
                    lineTo(14.98f, 9.94f)
                    lineTo(5.92f, 19.0f)
                    horizontalLineTo(5.0f)
                    verticalLineTo(18.08f)
                    lineTo(14.06f, 9.02f)
                    close()
                    moveTo(17.66f, 3.0f)
                    curveTo(17.41f, 3.0f, 17.15f, 3.1f, 16.96f, 3.29f)
                    lineTo(15.13f, 5.12f)
                    lineTo(18.88f, 8.87f)
                    lineTo(20.71f, 7.04f)
                    curveTo(21.1f, 6.65f, 21.1f, 6.02f, 20.71f, 5.63f)
                    lineTo(18.37f, 3.29f)
                    curveTo(18.17f, 3.09f, 17.92f, 3.0f, 17.66f, 3.0f)
                    close()
                    moveTo(14.06f, 6.19f)
                    lineTo(3.0f, 17.25f)
                    verticalLineTo(21.0f)
                    horizontalLineTo(6.75f)
                    lineTo(17.81f, 9.94f)
                    lineTo(14.06f, 6.19f)
                    close()
                }
            }
            return _pencil!!
        }

    // New icons for missing references
    val AccessTime: ImageVector
        get() {
            if (_accessTime != null) {
                return _accessTime!!
            }
            _accessTime = materialIcon(name = "AccessTime") {
                materialPath {
                    moveTo(11.99f, 2.0f)
                    curveTo(6.47f, 2.0f, 2.0f, 6.48f, 2.0f, 12.0f)
                    reflectiveCurveTo(6.47f, 22.0f, 11.99f, 22.0f)
                    curveTo(17.52f, 22.0f, 22.0f, 17.52f, 22.0f, 12.0f)
                    reflectiveCurveTo(17.52f, 2.0f, 11.99f, 2.0f)
                    close()
                    moveTo(12.0f, 20.0f)
                    curveTo(7.58f, 20.0f, 4.0f, 16.42f, 4.0f, 12.0f)
                    reflectiveCurveTo(7.58f, 4.0f, 12.0f, 4.0f)
                    reflectiveCurveTo(20.0f, 7.58f, 20.0f, 12.0f)
                    reflectiveCurveTo(16.42f, 20.0f, 12.0f, 20.0f)
                    close()
                    moveTo(12.5f, 7.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(13.0f)
                    lineTo(16.25f, 15.85f)
                    lineTo(17.0f, 14.65f)
                    lineTo(12.5f, 12.25f)
                    verticalLineTo(7.0f)
                    close()
                }
            }
            return _accessTime!!
        }

    val MenuBook: ImageVector
        get() {
            if (_menuBook != null) {
                return _menuBook!!
            }
            _menuBook = materialIcon(name = "MenuBook") {
                materialPath {
                    moveTo(21.0f, 5.0f)
                    curveTo(19.89f, 4.65f, 18.67f, 4.5f, 17.5f, 4.5f)
                    curveTo(15.55f, 4.5f, 13.45f, 4.9f, 12.0f, 6.0f)
                    curveTo(10.55f, 4.9f, 8.45f, 4.5f, 6.5f, 4.5f)
                    curveTo(5.33f, 4.5f, 4.11f, 4.65f, 3.0f, 5.0f)
                    verticalLineTo(18.5f)
                    curveTo(4.11f, 18.15f, 5.33f, 18.0f, 6.5f, 18.0f)
                    curveTo(8.45f, 18.0f, 10.55f, 18.4f, 12.0f, 19.5f)
                    curveTo(13.45f, 18.4f, 15.55f, 18.0f, 17.5f, 18.0f)
                    curveTo(18.67f, 18.0f, 19.89f, 18.15f, 21.0f, 18.5f)
                    verticalLineTo(5.0f)
                    close()
                    moveTo(11.0f, 17.08f)
                    curveTo(9.24f, 16.29f, 7.5f, 16.0f, 6.5f, 16.0f)
                    curveTo(5.33f, 16.0f, 4.11f, 16.15f, 3.0f, 16.5f)
                    verticalLineTo(7.08f)
                    curveTo(4.11f, 6.73f, 5.33f, 6.58f, 6.5f, 6.58f)
                    curveTo(7.5f, 6.58f, 9.24f, 6.87f, 11.0f, 7.66f)
                    verticalLineTo(17.08f)
                    close()
                    moveTo(21.0f, 16.5f)
                    curveTo(19.89f, 16.15f, 18.67f, 16.0f, 17.5f, 16.0f)
                    curveTo(16.5f, 16.0f, 14.76f, 16.29f, 13.0f, 17.08f)
                    verticalLineTo(7.66f)
                    curveTo(14.76f, 6.87f, 16.5f, 6.58f, 17.5f, 6.58f)
                    curveTo(18.67f, 6.58f, 19.89f, 6.73f, 21.0f, 7.08f)
                    verticalLineTo(16.5f)
                    close()
                }
            }
            return _menuBook!!
        }

    val History: ImageVector
        get() {
            if (_history != null) {
                return _history!!
            }
            _history = materialIcon(name = "History") {
                materialPath {
                    moveTo(13.0f, 3.0f)
                    curveTo(16.31f, 3.0f, 19.0f, 5.69f, 19.0f, 9.0f)
                    horizontalLineTo(21.0f)
                    lineTo(17.5f, 13.5f)
                    lineTo(14.0f, 9.0f)
                    horizontalLineTo(16.0f)
                    curveTo(16.0f, 7.34f, 14.66f, 6.0f, 13.0f, 6.0f)
                    reflectiveCurveTo(10.0f, 7.34f, 10.0f, 9.0f)
                    reflectiveCurveTo(11.34f, 12.0f, 13.0f, 12.0f)
                    curveTo(13.35f, 12.0f, 13.69f, 11.93f, 14.0f, 11.79f)
                    lineTo(15.42f, 13.21f)
                    curveTo(14.66f, 13.75f, 13.87f, 14.0f, 13.0f, 14.0f)
                    curveTo(10.24f, 14.0f, 8.0f, 11.76f, 8.0f, 9.0f)
                    reflectiveCurveTo(10.24f, 4.0f, 13.0f, 4.0f)
                    close()
                    moveTo(12.0f, 7.0f)
                    verticalLineTo(9.0f)
                    lineTo(13.5f, 10.5f)
                    lineTo(14.5f, 9.5f)
                    lineTo(13.0f, 8.0f)
                    verticalLineTo(7.0f)
                    horizontalLineTo(12.0f)
                    close()
                    moveTo(7.88f, 3.39f)
                    lineTo(6.6f, 1.86f)
                    curveTo(5.29f, 2.82f, 4.19f, 4.05f, 3.41f, 5.5f)
                    lineTo(5.03f, 6.5f)
                    curveTo(5.6f, 5.37f, 6.37f, 4.34f, 7.88f, 3.39f)
                    close()
                    moveTo(1.0f, 11.0f)
                    horizontalLineTo(3.0f)
                    curveTo(3.0f, 7.13f, 4.73f, 3.78f, 7.4f, 1.86f)
                    curveTo(3.74f, 4.0f, 2.0f, 7.26f, 2.0f, 11.0f)
                    horizontalLineTo(1.0f)
                    close()
                }
            }
            return _history!!
        }

    val BookmarkAdd: ImageVector
        get() {
            if (_bookmarkAdd != null) {
                return _bookmarkAdd!!
            }
            _bookmarkAdd = materialIcon(name = "BookmarkAdd") {
                materialPath {
                    moveTo(17.0f, 3.0f)
                    horizontalLineTo(7.0f)
                    curveTo(5.9f, 3.0f, 5.0f, 3.9f, 5.0f, 5.0f)
                    verticalLineTo(21.0f)
                    lineTo(12.0f, 18.0f)
                    lineTo(19.0f, 21.0f)
                    verticalLineTo(5.0f)
                    curveTo(19.0f, 3.9f, 18.1f, 3.0f, 17.0f, 3.0f)
                    close()
                    moveTo(17.0f, 18.0f)
                    lineTo(12.0f, 15.82f)
                    lineTo(7.0f, 18.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(18.0f)
                    close()
                    moveTo(13.0f, 7.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(10.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(10.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(7.0f)
                    close()
                }
            }
            return _bookmarkAdd!!
        }

    val Pause: ImageVector
        get() {
            if (_pause != null) {
                return _pause!!
            }
            _pause = materialIcon(name = "Pause") {
                materialPath {
                    moveTo(6.0f, 19.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(19.0f)
                    close()
                    moveTo(14.0f, 5.0f)
                    verticalLineTo(19.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(14.0f)
                    close()
                }
            }
            return _pause!!
        }

    val CloudSync: ImageVector
        get() {
            if (_cloudSync != null) {
                return _cloudSync!!
            }
            _cloudSync = materialIcon(name = "CloudSync") {
                materialPath {
                    moveTo(6.5f, 20.0f)
                    curveTo(4.25f, 20.0f, 2.36f, 18.7f, 1.68f, 16.84f)
                    curveTo(0.68f, 16.54f, 0.0f, 15.6f, 0.0f, 14.5f)
                    curveTo(0.0f, 13.12f, 1.12f, 12.0f, 2.5f, 12.0f)
                    curveTo(2.92f, 12.0f, 3.31f, 12.13f, 3.63f, 12.35f)
                    curveTo(4.26f, 9.22f, 7.03f, 7.0f, 10.5f, 7.0f)
                    curveTo(14.64f, 7.0f, 18.0f, 10.36f, 18.0f, 14.5f)
                    curveTo(19.66f, 14.5f, 21.0f, 15.84f, 21.0f, 17.5f)
                    reflectiveCurveTo(19.66f, 20.5f, 18.0f, 20.5f)
                    horizontalLineTo(6.5f)
                    verticalLineTo(20.0f)
                    close()
                    moveTo(12.0f, 15.5f)
                    lineTo(16.0f, 11.5f)
                    horizontalLineTo(13.5f)
                    verticalLineTo(8.5f)
                    horizontalLineTo(10.5f)
                    verticalLineTo(11.5f)
                    horizontalLineTo(8.0f)
                    lineTo(12.0f, 15.5f)
                    close()
                }
            }
            return _cloudSync!!
        }

    val CloudOff: ImageVector
        get() {
            if (_cloudOff != null) {
                return _cloudOff!!
            }
            _cloudOff = materialIcon(name = "CloudOff") {
                materialPath {
                    moveTo(21.9f, 21.9f)
                    lineTo(2.1f, 2.1f)
                    lineTo(0.69f, 3.51f)
                    lineTo(5.55f, 8.37f)
                    curveTo(5.2f, 9.23f, 5.0f, 10.18f, 5.0f, 11.18f)
                    curveTo(2.79f, 11.86f, 1.0f, 13.8f, 1.0f, 16.18f)
                    curveTo(1.0f, 19.0f, 3.24f, 21.18f, 6.0f, 21.18f)
                    horizontalLineTo(18.0f)
                    curveTo(18.35f, 21.18f, 18.68f, 21.12f, 19.0f, 21.02f)
                    lineTo(20.49f, 22.51f)
                    lineTo(21.9f, 21.1f)
                    verticalLineTo(21.9f)
                    close()
                    moveTo(6.0f, 19.18f)
                    curveTo(4.34f, 19.18f, 3.0f, 17.84f, 3.0f, 16.18f)
                    curveTo(3.0f, 14.67f, 4.12f, 13.45f, 5.6f, 13.2f)
                    curveTo(5.71f, 12.3f, 6.05f, 11.5f, 6.56f, 10.85f)
                    lineTo(16.73f, 21.02f)
                    curveTo(16.5f, 21.08f, 16.25f, 21.12f, 16.0f, 21.12f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(19.18f)
                    close()
                }
            }
            return _cloudOff!!
        }

    val BookmarkBorder: ImageVector
        get() {
            if (_bookmarkBorder != null) {
                return _bookmarkBorder!!
            }
            _bookmarkBorder = materialIcon(name = "BookmarkBorder") {
                materialPath {
                    moveTo(17.0f, 3.0f)
                    horizontalLineTo(7.0f)
                    curveTo(5.9f, 3.0f, 5.0f, 3.9f, 5.0f, 5.0f)
                    verticalLineTo(21.0f)
                    lineTo(12.0f, 18.0f)
                    lineTo(19.0f, 21.0f)
                    verticalLineTo(5.0f)
                    curveTo(19.0f, 3.9f, 18.1f, 3.0f, 17.0f, 3.0f)
                    close()
                    moveTo(17.0f, 18.0f)
                    lineTo(12.0f, 15.82f)
                    lineTo(7.0f, 18.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(18.0f)
                    close()
                }
            }
            return _bookmarkBorder!!
        }

    val ErrorOutline: ImageVector
        get() {
            if (_errorOutline != null) {
                return _errorOutline!!
            }
            _errorOutline = materialIcon(name = "ErrorOutline") {
                materialPath {
                    moveTo(11.0f, 15.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(17.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(15.0f)
                    close()
                    moveTo(11.0f, 7.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(13.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(7.0f)
                    close()
                    moveTo(11.99f, 2.0f)
                    curveTo(6.47f, 2.0f, 2.0f, 6.48f, 2.0f, 12.0f)
                    reflectiveCurveTo(6.47f, 22.0f, 11.99f, 22.0f)
                    curveTo(17.52f, 22.0f, 22.0f, 17.52f, 22.0f, 12.0f)
                    reflectiveCurveTo(17.52f, 2.0f, 11.99f, 2.0f)
                    close()
                    moveTo(12.0f, 20.0f)
                    curveTo(7.58f, 20.0f, 4.0f, 16.42f, 4.0f, 12.0f)
                    reflectiveCurveTo(7.58f, 4.0f, 12.0f, 4.0f)
                    reflectiveCurveTo(20.0f, 7.58f, 20.0f, 12.0f)
                    reflectiveCurveTo(16.42f, 20.0f, 12.0f, 20.0f)
                    close()
                }
            }
            return _errorOutline!!
        }

    val Sync: ImageVector
        get() {
            if (_sync != null) {
                return _sync!!
            }
            _sync = materialIcon(name = "Sync") {
                materialPath {
                    moveTo(12.0f, 4.0f)
                    verticalLineTo(1.0f)
                    lineTo(8.0f, 5.0f)
                    lineTo(12.0f, 9.0f)
                    verticalLineTo(6.0f)
                    curveTo(15.31f, 6.0f, 18.0f, 8.69f, 18.0f, 12.0f)
                    reflectiveCurveTo(15.31f, 18.0f, 12.0f, 18.0f)
                    curveTo(10.99f, 18.0f, 10.03f, 17.75f, 9.2f, 17.3f)
                    lineTo(7.74f, 18.76f)
                    curveTo(8.97f, 19.54f, 10.43f, 20.0f, 12.0f, 20.0f)
                    curveTo(16.42f, 20.0f, 20.0f, 16.42f, 20.0f, 12.0f)
                    reflectiveCurveTo(16.42f, 4.0f, 12.0f, 4.0f)
                    close()
                    moveTo(12.0f, 14.0f)
                    curveTo(8.69f, 14.0f, 6.0f, 11.31f, 6.0f, 8.0f)
                    reflectiveCurveTo(8.69f, 2.0f, 12.0f, 2.0f)
                    curveTo(13.01f, 2.0f, 13.97f, 2.25f, 14.8f, 2.7f)
                    lineTo(16.26f, 1.24f)
                    curveTo(15.03f, 0.46f, 13.57f, 0.0f, 12.0f, 0.0f)
                    curveTo(7.58f, 0.0f, 4.0f, 3.58f, 4.0f, 8.0f)
                    reflectiveCurveTo(7.58f, 16.0f, 12.0f, 16.0f)
                    verticalLineTo(19.0f)
                    lineTo(16.0f, 15.0f)
                    lineTo(12.0f, 11.0f)
                    verticalLineTo(14.0f)
                    close()
                }
            }
            return _sync!!
        }

    // Missing icons for audiobook and music player
    val SkipPrevious: ImageVector
        get() {
            if (_skipPrevious != null) {
                return _skipPrevious!!
            }
            _skipPrevious = materialIcon(name = "SkipPrevious") {
                materialPath {
                    moveTo(6.0f, 6.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(6.0f)
                    close()
                    moveTo(9.5f, 12.0f)
                    lineTo(18.0f, 6.0f)
                    verticalLineTo(18.0f)
                    lineTo(9.5f, 12.0f)
                    close()
                }
            }
            return _skipPrevious!!
        }

    val SkipNext: ImageVector
        get() {
            if (_skipNext != null) {
                return _skipNext!!
            }
            _skipNext = materialIcon(name = "SkipNext") {
                materialPath {
                    moveTo(6.0f, 18.0f)
                    lineTo(14.5f, 12.0f)
                    lineTo(6.0f, 6.0f)
                    verticalLineTo(18.0f)
                    close()
                    moveTo(16.0f, 6.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(16.0f)
                    close()
                }
            }
            return _skipNext!!
        }

    val Replay30: ImageVector
        get() {
            if (_replay30 != null) {
                return _replay30!!
            }
            _replay30 = materialIcon(name = "Replay30") {
                materialPath {
                    moveTo(12.0f, 5.0f)
                    verticalLineTo(1.0f)
                    lineTo(7.0f, 6.0f)
                    lineTo(12.0f, 11.0f)
                    verticalLineTo(7.0f)
                    curveTo(15.31f, 7.0f, 18.0f, 9.69f, 18.0f, 13.0f)
                    reflectiveCurveTo(15.31f, 19.0f, 12.0f, 19.0f)
                    reflectiveCurveTo(6.0f, 16.31f, 6.0f, 13.0f)
                    horizontalLineTo(4.0f)
                    curveTo(4.0f, 17.42f, 7.58f, 21.0f, 12.0f, 21.0f)
                    reflectiveCurveTo(20.0f, 17.42f, 20.0f, 13.0f)
                    reflectiveCurveTo(16.42f, 5.0f, 12.0f, 5.0f)
                    close()
                }
            }
            return _replay30!!
        }

    val Forward30: ImageVector
        get() {
            if (_forward30 != null) {
                return _forward30!!
            }
            _forward30 = materialIcon(name = "Forward30") {
                materialPath {
                    moveTo(4.0f, 13.0f)
                    curveTo(4.0f, 17.42f, 7.58f, 21.0f, 12.0f, 21.0f)
                    reflectiveCurveTo(20.0f, 17.42f, 20.0f, 13.0f)
                    horizontalLineTo(18.0f)
                    curveTo(18.0f, 16.31f, 15.31f, 19.0f, 12.0f, 19.0f)
                    reflectiveCurveTo(6.0f, 16.31f, 6.0f, 13.0f)
                    reflectiveCurveTo(8.69f, 7.0f, 12.0f, 7.0f)
                    verticalLineTo(11.0f)
                    lineTo(17.0f, 6.0f)
                    lineTo(12.0f, 1.0f)
                    verticalLineTo(5.0f)
                    curveTo(7.58f, 5.0f, 4.0f, 8.58f, 4.0f, 13.0f)
                    close()
                }
            }
            return _forward30!!
        }

    val VolumeOff: ImageVector
        get() {
            if (_volumeOff != null) {
                return _volumeOff!!
            }
            _volumeOff = materialIcon(name = "VolumeOff") {
                materialPath {
                    moveTo(16.5f, 12.0f)
                    curveTo(16.5f, 10.23f, 15.5f, 8.71f, 14.0f, 7.97f)
                    verticalLineTo(10.18f)
                    lineTo(16.45f, 12.63f)
                    curveTo(16.48f, 12.43f, 16.5f, 12.21f, 16.5f, 12.0f)
                    close()
                    moveTo(19.0f, 12.0f)
                    curveTo(19.0f, 12.94f, 18.8f, 13.82f, 18.46f, 14.64f)
                    lineTo(19.97f, 16.15f)
                    curveTo(20.63f, 14.91f, 21.0f, 13.5f, 21.0f, 12.0f)
                    curveTo(21.0f, 7.72f, 18.0f, 4.14f, 14.0f, 3.23f)
                    verticalLineTo(5.29f)
                    curveTo(16.89f, 6.15f, 19.0f, 8.83f, 19.0f, 12.0f)
                    close()
                    moveTo(4.27f, 3.0f)
                    lineTo(3.0f, 4.27f)
                    lineTo(7.73f, 9.0f)
                    horizontalLineTo(3.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(7.0f)
                    lineTo(12.0f, 20.0f)
                    verticalLineTo(13.27f)
                    lineTo(16.25f, 17.53f)
                    curveTo(15.58f, 18.04f, 14.81f, 18.46f, 13.97f, 18.73f)
                    verticalLineTo(20.77f)
                    curveTo(15.38f, 20.45f, 16.63f, 19.82f, 17.69f, 18.95f)
                    lineTo(19.73f, 21.0f)
                    lineTo(21.0f, 19.73f)
                    lineTo(4.27f, 3.0f)
                    close()
                    moveTo(12.0f, 4.0f)
                    lineTo(9.91f, 6.09f)
                    lineTo(12.0f, 8.18f)
                    verticalLineTo(4.0f)
                    close()
                }
            }
            return _volumeOff!!
        }

    val VolumeUp: ImageVector
        get() {
            if (_volumeUp != null) {
                return _volumeUp!!
            }
            _volumeUp = materialIcon(name = "VolumeUp") {
                materialPath {
                    moveTo(3.0f, 9.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(7.0f)
                    lineTo(12.0f, 20.0f)
                    verticalLineTo(4.0f)
                    lineTo(7.0f, 9.0f)
                    horizontalLineTo(3.0f)
                    close()
                    moveTo(16.5f, 12.0f)
                    curveTo(16.5f, 10.23f, 15.5f, 8.71f, 14.0f, 7.97f)
                    verticalLineTo(16.02f)
                    curveTo(15.5f, 15.29f, 16.5f, 13.76f, 16.5f, 12.0f)
                    close()
                    moveTo(14.0f, 3.23f)
                    verticalLineTo(5.29f)
                    curveTo(16.89f, 6.15f, 19.0f, 8.83f, 19.0f, 12.0f)
                    reflectiveCurveTo(16.89f, 17.85f, 14.0f, 18.71f)
                    verticalLineTo(20.77f)
                    curveTo(18.01f, 19.86f, 21.0f, 16.28f, 21.0f, 12.0f)
                    curveTo(21.0f, 7.72f, 18.01f, 4.14f, 14.0f, 3.23f)
                    close()
                }
            }
            return _volumeUp!!
        }

    val Timer: ImageVector
        get() {
            if (_timer != null) {
                return _timer!!
            }
            _timer = materialIcon(name = "Timer") {
                materialPath {
                    moveTo(15.0f, 1.0f)
                    horizontalLineTo(9.0f)
                    verticalLineTo(3.0f)
                    horizontalLineTo(15.0f)
                    verticalLineTo(1.0f)
                    close()
                    moveTo(11.0f, 14.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(14.0f)
                    close()
                    moveTo(19.03f, 7.39f)
                    lineTo(20.45f, 5.97f)
                    curveTo(20.02f, 5.46f, 19.55f, 4.98f, 19.04f, 4.56f)
                    lineTo(17.62f, 5.98f)
                    curveTo(16.07f, 4.74f, 14.12f, 4.0f, 12.0f, 4.0f)
                    curveTo(7.03f, 4.0f, 3.0f, 8.03f, 3.0f, 13.0f)
                    reflectiveCurveTo(7.03f, 22.0f, 12.0f, 22.0f)
                    reflectiveCurveTo(21.0f, 17.97f, 21.0f, 13.0f)
                    curveTo(21.0f, 10.88f, 20.26f, 8.93f, 19.03f, 7.39f)
                    close()
                    moveTo(12.0f, 20.0f)
                    curveTo(8.13f, 20.0f, 5.0f, 16.87f, 5.0f, 13.0f)
                    reflectiveCurveTo(8.13f, 6.0f, 12.0f, 6.0f)
                    reflectiveCurveTo(19.0f, 9.13f, 19.0f, 13.0f)
                    reflectiveCurveTo(15.87f, 20.0f, 12.0f, 20.0f)
                    close()
                }
            }
            return _timer!!
        }

    val QueueMusic: ImageVector
        get() {
            if (_queueMusic != null) {
                return _queueMusic!!
            }
            _queueMusic = materialIcon(name = "QueueMusic") {
                materialPath {
                    moveTo(15.0f, 6.0f)
                    horizontalLineTo(3.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(15.0f)
                    verticalLineTo(6.0f)
                    close()
                    moveTo(15.0f, 10.0f)
                    horizontalLineTo(3.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(15.0f)
                    verticalLineTo(10.0f)
                    close()
                    moveTo(3.0f, 16.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(3.0f)
                    verticalLineTo(16.0f)
                    close()
                    moveTo(17.0f, 6.0f)
                    verticalLineTo(14.18f)
                    curveTo(16.69f, 14.07f, 16.35f, 14.0f, 16.0f, 14.0f)
                    curveTo(14.34f, 14.0f, 13.0f, 15.34f, 13.0f, 17.0f)
                    reflectiveCurveTo(14.34f, 20.0f, 16.0f, 20.0f)
                    reflectiveCurveTo(19.0f, 18.66f, 19.0f, 17.0f)
                    verticalLineTo(8.0f)
                    horizontalLineTo(22.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(17.0f)
                    close()
                }
            }
            return _queueMusic!!
        }

    val Shuffle: ImageVector
        get() {
            if (_shuffle != null) {
                return _shuffle!!
            }
            _shuffle = materialIcon(name = "Shuffle") {
                materialPath {
                    moveTo(10.59f, 9.17f)
                    lineTo(5.41f, 4.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(6.0f)
                    horizontalLineTo(14.0f)
                    curveTo(15.1f, 6.0f, 16.0f, 6.9f, 16.0f, 8.0f)
                    verticalLineTo(10.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(8.0f)
                    curveTo(18.0f, 5.79f, 16.21f, 4.0f, 14.0f, 4.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(2.0f)
                    lineTo(5.41f, 6.59f)
                    lineTo(10.59f, 9.17f)
                    close()
                    moveTo(14.83f, 13.41f)
                    lineTo(19.0f, 17.59f)
                    verticalLineTo(13.0f)
                    horizontalLineTo(21.0f)
                    verticalLineTo(19.0f)
                    horizontalLineTo(15.0f)
                    verticalLineTo(17.0f)
                    horizontalLineTo(19.59f)
                    lineTo(13.41f, 10.83f)
                    lineTo(14.83f, 13.41f)
                    close()
                    moveTo(14.83f, 10.59f)
                    lineTo(13.41f, 9.17f)
                    lineTo(9.17f, 13.41f)
                    lineTo(10.59f, 14.83f)
                    lineTo(14.83f, 10.59f)
                    close()
                }
            }
            return _shuffle!!
        }

    val Repeat: ImageVector
        get() {
            if (_repeat != null) {
                return _repeat!!
            }
            _repeat = materialIcon(name = "Repeat") {
                materialPath {
                    moveTo(7.0f, 7.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(10.0f)
                    lineTo(21.0f, 6.0f)
                    lineTo(17.0f, 2.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(5.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(7.0f)
                    verticalLineTo(7.0f)
                    close()
                    moveTo(17.0f, 17.0f)
                    horizontalLineTo(7.0f)
                    verticalLineTo(14.0f)
                    lineTo(3.0f, 18.0f)
                    lineTo(7.0f, 22.0f)
                    verticalLineTo(19.0f)
                    horizontalLineTo(19.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(17.0f)
                    close()
                }
            }
            return _repeat!!
        }

    val RepeatOne: ImageVector
        get() {
            if (_repeatOne != null) {
                return _repeatOne!!
            }
            _repeatOne = materialIcon(name = "RepeatOne") {
                materialPath {
                    moveTo(7.0f, 7.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(10.0f)
                    lineTo(21.0f, 6.0f)
                    lineTo(17.0f, 2.0f)
                    verticalLineTo(5.0f)
                    horizontalLineTo(5.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(7.0f)
                    verticalLineTo(7.0f)
                    close()
                    moveTo(17.0f, 17.0f)
                    horizontalLineTo(7.0f)
                    verticalLineTo(14.0f)
                    lineTo(3.0f, 18.0f)
                    lineTo(7.0f, 22.0f)
                    verticalLineTo(19.0f)
                    horizontalLineTo(19.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(17.0f)
                    verticalLineTo(17.0f)
                    close()
                    moveTo(13.0f, 15.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(11.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(13.0f)
                    horizontalLineTo(11.0f)
                    verticalLineTo(15.0f)
                    horizontalLineTo(13.0f)
                    close()
                }
            }
            return _repeatOne!!
        }

    private var _book: ImageVector? = null
    private var _filmStrip: ImageVector? = null
    private var _musicNote: ImageVector? = null
    private var _microphone: ImageVector? = null
    private var _newspaper: ImageVector? = null
    private var _fileText: ImageVector? = null
    private var _arrowClockwise: ImageVector? = null
    private var _gear: ImageVector? = null
    private var _plus: ImageVector? = null
    private var _arrowLeft: ImageVector? = null
    private var _play: ImageVector? = null
    private var _star: ImageVector? = null
    private var _folderOpen: ImageVector? = null
    private var _warning: ImageVector? = null
    private var _house: ImageVector? = null
    private var _pencilSimple: ImageVector? = null
    private var _magnifyingGlass: ImageVector? = null
    private var _pencil: ImageVector? = null
    private var _accessTime: ImageVector? = null
    private var _menuBook: ImageVector? = null
    private var _history: ImageVector? = null
    private var _bookmarkAdd: ImageVector? = null
    private var _pause: ImageVector? = null
    private var _cloudSync: ImageVector? = null
    private var _cloudOff: ImageVector? = null
    private var _bookmarkBorder: ImageVector? = null
    private var _errorOutline: ImageVector? = null
    private var _sync: ImageVector? = null
    private var _skipPrevious: ImageVector? = null
    private var _skipNext: ImageVector? = null
    private var _replay30: ImageVector? = null
    private var _forward30: ImageVector? = null
    private var _volumeOff: ImageVector? = null
    private var _volumeUp: ImageVector? = null
    private var _timer: ImageVector? = null
    private var _queueMusic: ImageVector? = null
    private var _shuffle: ImageVector? = null
    private var _repeat: ImageVector? = null
    private var _repeatOne: ImageVector? = null

    // Missing icons from compilation errors
    val Lightbulb: ImageVector
        get() {
            if (_lightbulb != null) {
                return _lightbulb!!
            }
            _lightbulb = materialIcon(name = "Lightbulb") {
                materialPath {
                    moveTo(9.0f, 21.0f)
                    curveTo(9.0f, 21.55f, 9.45f, 22.0f, 10.0f, 22.0f)
                    horizontalLineTo(14.0f)
                    curveTo(14.55f, 22.0f, 15.0f, 21.55f, 15.0f, 21.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(9.0f)
                    verticalLineTo(21.0f)
                    close()
                    moveTo(12.0f, 2.0f)
                    curveTo(8.14f, 2.0f, 5.0f, 5.14f, 5.0f, 9.0f)
                    curveTo(5.0f, 11.38f, 6.19f, 13.47f, 8.0f, 14.74f)
                    verticalLineTo(17.0f)
                    curveTo(8.0f, 17.55f, 8.45f, 18.0f, 9.0f, 18.0f)
                    horizontalLineTo(15.0f)
                    curveTo(15.55f, 18.0f, 16.0f, 17.55f, 16.0f, 17.0f)
                    verticalLineTo(14.74f)
                    curveTo(17.81f, 13.47f, 19.0f, 11.38f, 19.0f, 9.0f)
                    curveTo(19.0f, 5.14f, 15.86f, 2.0f, 12.0f, 2.0f)
                    close()
                    moveTo(14.85f, 13.1f)
                    lineTo(14.0f, 13.7f)
                    verticalLineTo(16.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(13.7f)
                    lineTo(9.15f, 13.1f)
                    curveTo(7.8f, 12.16f, 7.0f, 10.63f, 7.0f, 9.0f)
                    curveTo(7.0f, 6.24f, 9.24f, 4.0f, 12.0f, 4.0f)
                    reflectiveCurveTo(17.0f, 6.24f, 17.0f, 9.0f)
                    curveTo(17.0f, 10.63f, 16.2f, 12.16f, 14.85f, 13.1f)
                    close()
                }
            }
            return _lightbulb!!
        }

    val Note: ImageVector
        get() {
            if (_note != null) {
                return _note!!
            }
            _note = materialIcon(name = "Note") {
                materialPath {
                    moveTo(14.0f, 2.0f)
                    horizontalLineTo(6.0f)
                    curveTo(4.9f, 2.0f, 4.0f, 2.9f, 4.0f, 4.0f)
                    verticalLineTo(20.0f)
                    curveTo(4.0f, 21.1f, 4.9f, 22.0f, 6.0f, 22.0f)
                    horizontalLineTo(18.0f)
                    curveTo(19.1f, 22.0f, 20.0f, 21.1f, 20.0f, 20.0f)
                    verticalLineTo(8.0f)
                    lineTo(14.0f, 2.0f)
                    close()
                    moveTo(18.0f, 20.0f)
                    horizontalLineTo(6.0f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(18.0f)
                    verticalLineTo(20.0f)
                    close()
                    moveTo(8.0f, 12.0f)
                    horizontalLineTo(16.0f)
                    verticalLineTo(14.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(12.0f)
                    close()
                    moveTo(8.0f, 16.0f)
                    horizontalLineTo(13.0f)
                    verticalLineTo(18.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(16.0f)
                    close()
                }
            }
            return _note!!
        }

    val Bookmark: ImageVector
        get() {
            if (_bookmark != null) {
                return _bookmark!!
            }
            _bookmark = materialIcon(name = "Bookmark") {
                materialPath {
                    moveTo(17.0f, 3.0f)
                    horizontalLineTo(7.0f)
                    curveTo(5.9f, 3.0f, 5.0f, 3.9f, 5.0f, 5.0f)
                    verticalLineTo(21.0f)
                    lineTo(12.0f, 18.0f)
                    lineTo(19.0f, 21.0f)
                    verticalLineTo(5.0f)
                    curveTo(19.0f, 3.9f, 18.1f, 3.0f, 17.0f, 3.0f)
                    close()
                }
            }
            return _bookmark!!
        }

    // Also need to add Share and Equalizer icons mentioned in other files
    val Share: ImageVector
        get() {
            if (_share != null) {
                return _share!!
            }
            _share = materialIcon(name = "Share") {
                materialPath {
                    moveTo(18.0f, 16.08f)
                    curveTo(17.24f, 16.08f, 16.56f, 16.38f, 16.04f, 16.85f)
                    lineTo(8.91f, 12.7f)
                    curveTo(8.96f, 12.47f, 9.0f, 12.24f, 9.0f, 12.0f)
                    reflectiveCurveTo(8.96f, 11.53f, 8.91f, 11.3f)
                    lineTo(15.96f, 7.19f)
                    curveTo(16.5f, 7.69f, 17.21f, 8.0f, 18.0f, 8.0f)
                    curveTo(19.66f, 8.0f, 21.0f, 6.66f, 21.0f, 5.0f)
                    reflectiveCurveTo(19.66f, 2.0f, 18.0f, 2.0f)
                    reflectiveCurveTo(15.0f, 3.34f, 15.0f, 5.0f)
                    curveTo(15.0f, 5.24f, 15.04f, 5.47f, 15.09f, 5.7f)
                    lineTo(8.04f, 9.81f)
                    curveTo(7.5f, 9.31f, 6.79f, 9.0f, 6.0f, 9.0f)
                    curveTo(4.34f, 9.0f, 3.0f, 10.34f, 3.0f, 12.0f)
                    reflectiveCurveTo(4.34f, 15.0f, 6.0f, 15.0f)
                    curveTo(6.79f, 15.0f, 7.5f, 14.69f, 8.04f, 14.19f)
                    lineTo(15.16f, 18.35f)
                    curveTo(15.11f, 18.56f, 15.08f, 18.78f, 15.08f, 19.0f)
                    curveTo(15.08f, 20.61f, 16.39f, 21.92f, 18.0f, 21.92f)
                    reflectiveCurveTo(20.92f, 20.61f, 20.92f, 19.0f)
                    reflectiveCurveTo(19.61f, 16.08f, 18.0f, 16.08f)
                    close()
                }
            }
            return _share!!
        }

    val Equalizer: ImageVector
        get() {
            if (_equalizer != null) {
                return _equalizer!!
            }
            _equalizer = materialIcon(name = "Equalizer") {
                materialPath {
                    moveTo(10.0f, 20.0f)
                    horizontalLineTo(14.0f)
                    verticalLineTo(4.0f)
                    horizontalLineTo(10.0f)
                    verticalLineTo(20.0f)
                    close()
                    moveTo(4.0f, 20.0f)
                    horizontalLineTo(8.0f)
                    verticalLineTo(12.0f)
                    horizontalLineTo(4.0f)
                    verticalLineTo(20.0f)
                    close()
                    moveTo(16.0f, 9.0f)
                    verticalLineTo(20.0f)
                    horizontalLineTo(20.0f)
                    verticalLineTo(9.0f)
                    horizontalLineTo(16.0f)
                    close()
                }
            }
            return _equalizer!!
        }

    // Add CaretUp and CaretDown icons referenced in other screens
    val CaretUp: ImageVector
        get() {
            if (_caretUp != null) {
                return _caretUp!!
            }
            _caretUp = materialIcon(name = "CaretUp") {
                materialPath {
                    moveTo(7.41f, 15.41f)
                    lineTo(12.0f, 10.83f)
                    lineTo(16.59f, 15.41f)
                    lineTo(18.0f, 14.0f)
                    lineTo(12.0f, 8.0f)
                    lineTo(6.0f, 14.0f)
                    lineTo(7.41f, 15.41f)
                    close()
                }
            }
            return _caretUp!!
        }

    val CaretDown: ImageVector
        get() {
            if (_caretDown != null) {
                return _caretDown!!
            }
            _caretDown = materialIcon(name = "CaretDown") {
                materialPath {
                    moveTo(7.41f, 8.59f)
                    lineTo(12.0f, 13.17f)
                    lineTo(16.59f, 8.59f)
                    lineTo(18.0f, 10.0f)
                    lineTo(12.0f, 16.0f)
                    lineTo(6.0f, 10.0f)
                    lineTo(7.41f, 8.59f)
                    close()
                }
            }
            return _caretDown!!
        }

    private var _lightbulb: ImageVector? = null
    private var _note: ImageVector? = null
    private var _bookmark: ImageVector? = null
    private var _share: ImageVector? = null
    private var _equalizer: ImageVector? = null
    private var _caretUp: ImageVector? = null
    private var _caretDown: ImageVector? = null
}