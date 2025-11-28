/**
 * Comic Reader Screen
 * 
 * Comic/manga reader with page-by-page viewing.
 * Supports CBZ, CBR files.
 */

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Paper,
  Slider,
  ToggleButton,
  ToggleButtonGroup,
} from '@mui/material';
import {
  ArrowBack,
  NavigateBefore,
  NavigateNext,
  FitScreen,
  Height,
  CropFree,
} from '@mui/icons-material';
import { comicReaderService, type ComicArchive } from '../../services/readers/ComicReaderService';
import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';
import { CircularProgress, Alert, Button } from '@mui/material';

export const ComicReaderScreen: React.FC = () => {
  const { itemId } = useParams<{ itemId: string }>();
  const navigate = useNavigate();

  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [fitMode, setFitMode] = useState<'width' | 'height' | 'both'>('width');
  const [showControls, setShowControls] = useState(true);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [comicArchive, setComicArchive] = useState<ComicArchive | null>(null);
  const [currentPageUrl, setCurrentPageUrl] = useState<string | null>(null);
  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);

  useEffect(() => {
    loadComic();
  }, [itemId]);

  useEffect(() => {
    if (comicArchive && mediaItem) {
      loadPage(currentPage - 1);
    }
  }, [currentPage, comicArchive]);

  const loadComic = async () => {
    if (!itemId) {
      setError('No comic ID provided');
      setIsLoading(false);
      return;
    }

    setIsLoading(true);
    setError(null);

    try {
      const item = await db.mediaItems.get(parseInt(itemId));
      if (!item) {
        throw new Error('Comic not found');
      }
      setMediaItem(item);

      let file: File | Blob;
      if (item.fileData) {
        file = new Blob([item.fileData], { type: 'application/zip' });
      } else {
        throw new Error('No file data available');
      }

      const archive = await comicReaderService.loadComic(file);
      setComicArchive(archive);
      setTotalPages(archive.pages.length);
      setCurrentPage(1);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load comic');
      const { logger } = await import('../../services/logging');
      logger.error('ComicReader', 'Failed to load comic', undefined, err as Error);
    } finally {
      setIsLoading(false);
    }
  };

  const loadPage = async (pageIndex: number) => {
    if (!comicArchive || !mediaItem) return;

    try {
      let file: File | Blob;
      if (mediaItem.fileData) {
        file = new Blob([mediaItem.fileData], { type: 'application/zip' });
      } else {
        throw new Error('No file data available');
      }

      const dataUrl = await comicReaderService.loadComicPage(file, pageIndex);
      setCurrentPageUrl(dataUrl);
    } catch (err) {
      setError(`Failed to load page: ${err instanceof Error ? err.message : 'Unknown error'}`);
    }
  };

  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  };

  const handlePrevPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
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

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {showControls && (
        <AppBar position="static">
          <Toolbar>
            <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
              <ArrowBack />
            </IconButton>
            <Typography variant="h6" sx={{ flexGrow: 1 }}>
              Comic Reader
            </Typography>
            <ToggleButtonGroup
              value={fitMode}
              exclusive
              onChange={(_, value) => value && setFitMode(value)}
              size="small"
            >
              <ToggleButton value="width">
                <FitScreen />
              </ToggleButton>
              <ToggleButton value="height">
                <Height />
              </ToggleButton>
              <ToggleButton value="both">
                <CropFree />
              </ToggleButton>
            </ToggleButtonGroup>
          </Toolbar>
        </AppBar>
      )}

      {isLoading ? (
        <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', gap: 2 }}>
          <CircularProgress />
          <Typography>Loading comic...</Typography>
        </Box>
      ) : error ? (
        <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', justifyContent: 'center', alignItems: 'center', gap: 2, p: 3 }}>
          <Alert severity="error">{error}</Alert>
          <Button variant="contained" onClick={() => navigate(-1)}>Go Back</Button>
        </Box>
      ) : (
        <Box
          onClick={handleTap}
          sx={{
            flex: 1,
            bgcolor: 'black',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            overflow: 'hidden',
            cursor: 'pointer',
          }}
        >
          {currentPageUrl ? (
            <img
              src={currentPageUrl}
              alt={`Page ${currentPage}`}
              style={{
                maxWidth: fitMode === 'width' || fitMode === 'both' ? '100%' : 'auto',
                maxHeight: fitMode === 'height' || fitMode === 'both' ? '100%' : 'auto',
                width: fitMode === 'both' ? '100%' : 'auto',
                height: fitMode === 'both' ? '100%' : 'auto',
                objectFit: fitMode === 'both' ? 'contain' : 'scale-down',
              }}
            />
          ) : (
            <CircularProgress />
          )}
        </Box>
      )}

      {/* Page Navigation */}
      {showControls && (
        <Paper elevation={3} sx={{ p: 2 }}>
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <IconButton onClick={handlePrevPage} disabled={currentPage === 1}>
              <NavigateBefore />
            </IconButton>
            <Slider
              value={currentPage}
              min={1}
              max={totalPages}
              onChange={(_, value) => setCurrentPage(value as number)}
              sx={{ flex: 1 }}
            />
            <IconButton onClick={handleNextPage} disabled={currentPage === totalPages}>
              <NavigateNext />
            </IconButton>
            <Typography variant="body2" sx={{ minWidth: 80, textAlign: 'right' }}>
              {currentPage} / {totalPages}
            </Typography>
          </Box>
        </Paper>
      )}
    </Box>
  );
};

export default ComicReaderScreen;
