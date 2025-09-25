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
}