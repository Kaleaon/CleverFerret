/**
 * Enhanced eBook Reader Screen
 *
 * Beautiful, customizable reading experience with features:
 * - Night mode, font size control, brightness
 * - Chapter navigation, bookmarks
 * - Reading progress tracking
 *
 * Migrated from EnhancedEReaderScreen.kt
 * Uses epub.js for EPUB files, custom renderer for other formats
 */

import React, { useEffect, useState, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Slider,
  Menu,
  MenuItem,
  Fab,
  Paper,
  LinearProgress,
  Drawer,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  ToggleButton,
  ToggleButtonGroup,
  FormControl,
  InputLabel,
  Select,
  CircularProgress,
  Button,
} from '@mui/material';
import {
  ArrowBack,
  Settings,
  Bookmark,
  List as ListIcon,
  ArrowForward,
  ArrowBack as PrevIcon,
  Brightness6,
  FormatSize,
  Palette,
  MenuBook,
} from '@mui/icons-material';
import {
  epubReaderService,
  type EPUBBook,
  type EPUBChapter,
} from '../../services/readers/EPUBReaderService';
import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';

export const EReaderScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();
  const contentRef = useRef<HTMLDivElement>(null);

  // Reader state
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [showControls, setShowControls] = useState(false);
  const [showSettings, setShowSettings] = useState(false);
  const [showChapterList, setShowChapterList] = useState(false);

  // Reading state
  const [currentPage, setCurrentPage] = useState(0);
  const [totalPages, setTotalPages] = useState(0);
  const [currentChapter, setCurrentChapter] = useState(0);
  const [chapters, setChapters] = useState<EPUBChapter[]>([]);
  const [book, setBook] = useState<EPUBBook | null>(null);
  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);

  // Reader settings
  const [fontSize, setFontSize] = useState(18);
  const [fontFamily, setFontFamily] = useState('Serif');
  const [theme, setTheme] = useState<'light' | 'sepia' | 'dark'>('sepia');
  const [brightness, setBrightness] = useState(100);
  const [lineHeight, setLineHeight] = useState(1.6);

  // Content
  const [content, setContent] = useState('<p>Loading...</p>');

  useEffect(() => {
    loadBook();
  }, [itemId]);

  const loadBook = async () => {
    if (!itemId) {
      setError('No book ID provided');
      setIsLoading(false);
      return;
    }

    setIsLoading(true);
    setError(null);

    try {
      // Load media item from database
      const item = await db.mediaItems.get(parseInt(itemId));
      if (!item) {
        throw new Error('Book not found');
      }
      setMediaItem(item);

      // Load EPUB file
      let file: File | Blob | string;
      if (item.filePath) {
        // Try to load from file path
        file = item.filePath;
      } else if (item.fileData) {
        // Use stored file data
        file = new Blob([item.fileData], { type: 'application/epub+zip' });
      } else {
        throw new Error('No file data available');
      }

      const epubBook = await epubReaderService.loadEPUB(file);
      setBook(epubBook);
      setTotalPages(epubBook.spine.length);

      // Load table of contents
      const toc = epubReaderService.getTableOfContents(epubBook);
      setChapters(toc);

      // Load first chapter
      await loadChapter(0);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load book');
      const { logger } = await import('../../services/logging');
      logger.error('EReader', 'Failed to load book', undefined, err as Error);
    } finally {
      setIsLoading(false);
    }
  };

  const loadChapter = async (chapterIndex: number) => {
    if (!book) return;

    try {
      const chapterContent = await epubReaderService.renderChapter(book, chapterIndex);
      setContent(chapterContent);
      setCurrentPage(chapterIndex);
      setCurrentChapter(chapterIndex);
    } catch (err) {
      setError(`Failed to load chapter: ${err instanceof Error ? err.message : 'Unknown error'}`);
    }
  };

  const handleNextPage = async () => {
    if (currentPage < totalPages - 1 && book) {
      await loadChapter(currentPage + 1);
    }
  };

  const handlePrevPage = async () => {
    if (currentPage > 0 && book) {
      await loadChapter(currentPage - 1);
    }
  };

  const handleTap = (e: React.MouseEvent) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const width = rect.width;

    if (x < width / 3) {
      handlePrevPage();
    } else if (x > (width * 2) / 3) {
      handleNextPage();
    } else {
      setShowControls(!showControls);
    }
  };

  const getThemeColors = () => {
    switch (theme) {
      case 'light':
        return { bg: '#FFFFFF', text: '#000000' };
      case 'sepia':
        return { bg: '#FFFBF0', text: '#3E2723' };
      case 'dark':
        return { bg: '#1A1A1A', text: '#E0E0E0' };
      default:
        return { bg: '#FFFBF0', text: '#3E2723' };
    }
  };

  const colors = getThemeColors();

  if (isLoading) {
    return (
      <Box
        sx={{
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'center',
          alignItems: 'center',
          height: '100vh',
          gap: 2,
        }}
      >
        <CircularProgress />
        <Typography>Loading book...</Typography>
      </Box>
    );
  }

  if (error) {
    return (
      <Box
        sx={{
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'center',
          alignItems: 'center',
          height: '100vh',
          gap: 2,
          p: 3,
        }}
      >
        <Typography variant="h6" color="error">
          {error}
        </Typography>
        <Button variant="contained" onClick={() => navigate(-1)}>
          Go Back
        </Button>
      </Box>
    );
  }

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Top Controls */}
      {showControls && (
        <AppBar position="static" color="transparent" elevation={0}>
          <Toolbar>
            <IconButton edge="start" onClick={() => navigate(-1)}>
              <ArrowBack />
            </IconButton>
            <Typography variant="h6" sx={{ flexGrow: 1 }} noWrap>
              {book?.title || 'Reading'}
            </Typography>
            <IconButton onClick={() => setShowChapterList(true)}>
              <ListIcon />
            </IconButton>
            <IconButton onClick={() => setShowSettings(true)}>
              <Settings />
            </IconButton>
            <IconButton>
              <Bookmark />
            </IconButton>
          </Toolbar>
        </AppBar>
      )}

      {/* Reading Area */}
      <Box
        ref={contentRef}
        onClick={handleTap}
        sx={{
          flex: 1,
          bgcolor: colors.bg,
          color: colors.text,
          p: 4,
          overflow: 'auto',
          opacity: brightness / 100,
          cursor: 'pointer',
          fontSize: `${fontSize}px`,
          fontFamily: fontFamily,
          lineHeight: lineHeight,
        }}
      >
        <div dangerouslySetInnerHTML={{ __html: content }} />
      </Box>

      {/* Progress Bar */}
      {showControls && (
        <Paper elevation={3} sx={{ p: 2 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <IconButton size="small" onClick={handlePrevPage}>
              <PrevIcon />
            </IconButton>
            <Slider
              value={currentPage}
              min={0}
              max={Math.max(0, totalPages - 1)}
              onChange={async (_, value) => {
                const pageNum = value as number;
                if (book) {
                  await loadChapter(pageNum);
                }
              }}
              sx={{ flex: 1 }}
            />
            <IconButton size="small" onClick={handleNextPage}>
              <ArrowForward />
            </IconButton>
            <Typography variant="body2" sx={{ minWidth: 80, textAlign: 'right' }}>
              {currentPage + 1} / {totalPages}
            </Typography>
          </Box>
        </Paper>
      )}

      {/* Settings Drawer */}
      <Drawer anchor="right" open={showSettings} onClose={() => setShowSettings(false)}>
        <Box sx={{ width: 300, p: 3 }}>
          <Typography variant="h6" gutterBottom>
            Reader Settings
          </Typography>

          {/* Font Size */}
          <Box sx={{ mb: 3 }}>
            <Typography variant="subtitle2" gutterBottom>
              <FormatSize sx={{ mr: 1, verticalAlign: 'middle' }} />
              Font Size: {fontSize}px
            </Typography>
            <Slider
              value={fontSize}
              min={12}
              max={32}
              onChange={(_, value) => setFontSize(value as number)}
            />
          </Box>

          {/* Font Family */}
          <FormControl fullWidth sx={{ mb: 3 }}>
            <InputLabel>Font Family</InputLabel>
            <Select value={fontFamily} onChange={(e) => setFontFamily(e.target.value)}>
              <MenuItem value="Serif">Serif</MenuItem>
              <MenuItem value="Sans-serif">Sans-serif</MenuItem>
              <MenuItem value="Monospace">Monospace</MenuItem>
            </Select>
          </FormControl>

          {/* Theme */}
          <Box sx={{ mb: 3 }}>
            <Typography variant="subtitle2" gutterBottom>
              <Palette sx={{ mr: 1, verticalAlign: 'middle' }} />
              Theme
            </Typography>
            <ToggleButtonGroup
              value={theme}
              exclusive
              onChange={(_, value) => value && setTheme(value)}
              fullWidth
            >
              <ToggleButton value="light">Light</ToggleButton>
              <ToggleButton value="sepia">Sepia</ToggleButton>
              <ToggleButton value="dark">Dark</ToggleButton>
            </ToggleButtonGroup>
          </Box>

          {/* Brightness */}
          <Box sx={{ mb: 3 }}>
            <Typography variant="subtitle2" gutterBottom>
              <Brightness6 sx={{ mr: 1, verticalAlign: 'middle' }} />
              Brightness: {brightness}%
            </Typography>
            <Slider
              value={brightness}
              min={50}
              max={100}
              onChange={(_, value) => setBrightness(value as number)}
            />
          </Box>

          {/* Line Height */}
          <Box sx={{ mb: 3 }}>
            <Typography variant="subtitle2" gutterBottom>
              Line Height: {lineHeight.toFixed(1)}
            </Typography>
            <Slider
              value={lineHeight}
              min={1.2}
              max={2.0}
              step={0.1}
              onChange={(_, value) => setLineHeight(value as number)}
            />
          </Box>
        </Box>
      </Drawer>

      {/* Chapter List Drawer */}
      <Drawer anchor="left" open={showChapterList} onClose={() => setShowChapterList(false)}>
        <Box sx={{ width: 300 }}>
          <Box sx={{ p: 2, borderBottom: 1, borderColor: 'divider' }}>
            <Typography variant="h6">Chapters</Typography>
          </Box>
          <List>
            {chapters.length > 0 ? (
              chapters.map((chapter, index) => (
                <ListItem key={chapter.id || index} disablePadding>
                  <ListItemButton
                    selected={index === currentChapter}
                    onClick={async () => {
                      await loadChapter(index);
                      setShowChapterList(false);
                    }}
                  >
                    <ListItemText
                      primary={chapter.title}
                      secondary={index === currentChapter ? 'Current' : ''}
                    />
                  </ListItemButton>
                </ListItem>
              ))
            ) : (
              <ListItem>
                <ListItemText primary="No chapters available" />
              </ListItem>
            )}
          </List>
        </Box>
      </Drawer>
    </Box>
  );
};

export default EReaderScreen;
