/**
 * Comic Reader Screen
 * 
 * Read web comics with navigation controls and offline support
 */

import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Card,
  CardMedia,
  CardContent,
  Button,
  Stack,
  LinearProgress,
  Chip,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  Snackbar,
  Alert,
} from '@mui/material';
import {
  ArrowBack,
  NavigateBefore,
  NavigateNext,
  FirstPage,
  LastPage,
  Download,
  Share,
  Bookmark,
  Info,
} from '@mui/icons-material';

import webComicService, { Comic, ComicStrip } from '../services/webcomic/WebComicService';

export const ComicReaderScreen: React.FC = () => {
  const navigate = useNavigate();
  const { comicId, stripNumber } = useParams<{ comicId: string; stripNumber: string }>();
  
  const [comic, setComic] = useState<Comic | null>(null);
  const [currentStrip, setCurrentStrip] = useState<ComicStrip | null>(null);
  const [loading, setLoading] = useState(true);
  const [downloading, setDownloading] = useState(false);
  const [downloadProgress, setDownloadProgress] = useState(0);
  const [showInfo, setShowInfo] = useState(false);
  const [showDownloadDialog, setShowDownloadDialog] = useState(false);
  const [downloadRange, setDownloadRange] = useState({ start: 1, end: 10 });
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });

  useEffect(() => {
    loadComic();
  }, [comicId]);

  useEffect(() => {
    if (comic && stripNumber) {
      const strip = webComicService.getStripByNumber(comic, parseInt(stripNumber));
      setCurrentStrip(strip || comic.strips[0]);
    }
  }, [comic, stripNumber]);

  const loadComic = async () => {
    try {
      setLoading(true);
      // In a real app, load from IndexedDB or fetch from URL
      // For now, this is a placeholder
      setLoading(false);
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('ComicReader', 'Error loading comic', undefined, error as Error);
      setLoading(false);
    }
  };

  const handlePrevious = () => {
    if (!comic || !currentStrip) return;
    const prev = webComicService.getPreviousStrip(comic, currentStrip.number);
    if (prev) {
      setCurrentStrip(prev);
      navigate(`/comic/${comicId}/${prev.number}`);
    }
  };

  const handleNext = () => {
    if (!comic || !currentStrip) return;
    const next = webComicService.getNextStrip(comic, currentStrip.number);
    if (next) {
      setCurrentStrip(next);
      navigate(`/comic/${comicId}/${next.number}`);
    }
  };

  const handleFirst = () => {
    if (!comic) return;
    const first = comic.strips[0];
    if (first) {
      setCurrentStrip(first);
      navigate(`/comic/${comicId}/${first.number}`);
    }
  };

  const handleLast = () => {
    if (!comic) return;
    const last = comic.strips[comic.strips.length - 1];
    if (last) {
      setCurrentStrip(last);
      navigate(`/comic/${comicId}/${last.number}`);
    }
  };

  const handleDownload = async () => {
    if (!comic) return;
    
    try {
      setDownloading(true);
      await webComicService.downloadStrips(
        comic,
        downloadRange.start - 1,
        downloadRange.end - 1,
        (current, total) => {
          setDownloadProgress((current / total) * 100);
        }
      );
      setDownloading(false);
      setShowDownloadDialog(false);
      setSnackbar({ open: true, message: 'Download complete!', severity: 'success' });
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('ComicReader', 'Error downloading strips', undefined, error as Error);
      setDownloading(false);
      setSnackbar({ open: true, message: 'Download failed. Please try again.', severity: 'error' });
    }
  };

  const handleShare = async () => {
    if (!currentStrip) return;
    
    try {
      await navigator.share({
        title: currentStrip.title,
        url: currentStrip.url,
      });
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('ComicReader', 'Error sharing', undefined, error as Error);
    }
  };

  if (loading) {
    return (
      <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
        <LinearProgress sx={{ width: '50%' }} />
      </Box>
    );
  }

  if (!comic || !currentStrip) {
    return (
      <Box sx={{ p: 4, textAlign: 'center' }}>
        <Typography variant="h6">Comic not found</Typography>
        <Button onClick={() => navigate(-1)} sx={{ mt: 2 }}>Go Back</Button>
      </Box>
    );
  }

  const hasPrevious = webComicService.getPreviousStrip(comic, currentStrip.number) !== undefined;
  const hasNext = webComicService.getNextStrip(comic, currentStrip.number) !== undefined;

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column', bgcolor: 'background.default' }}>
      {/* Header */}
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            {comic.title}
          </Typography>
          <IconButton color="inherit" onClick={() => setShowInfo(true)}>
            <Info />
          </IconButton>
          <IconButton color="inherit" onClick={() => setShowDownloadDialog(true)}>
            <Download />
          </IconButton>
          <IconButton color="inherit" onClick={handleShare}>
            <Share />
          </IconButton>
        </Toolbar>
      </AppBar>

      {/* Comic Strip Display */}
      <Box sx={{ flex: 1, overflow: 'auto', display: 'flex', flexDirection: 'column', alignItems: 'center', p: 2 }}>
        <Card sx={{ maxWidth: 1200, width: '100%', mb: 2 }}>
          <CardContent>
            <Stack direction="row" spacing={1} alignItems="center" sx={{ mb: 2 }}>
              <Chip label={`#${currentStrip.number}`} size="small" />
              <Typography variant="h6" sx={{ flexGrow: 1 }}>
                {currentStrip.title}
              </Typography>
              {currentStrip.cached && <Chip label="Cached" size="small" color="success" />}
            </Stack>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              {currentStrip.publishDate.toLocaleDateString()}
            </Typography>
          </CardContent>
          
          <CardMedia
            component="img"
            image={currentStrip.imageUrl}
            alt={currentStrip.title}
            sx={{ 
              maxHeight: '70vh',
              objectFit: 'contain',
              bgcolor: 'background.paper',
            }}
          />
          
          {currentStrip.altText && (
            <CardContent>
              <Typography variant="body2" color="text.secondary" sx={{ fontStyle: 'italic' }}>
                {currentStrip.altText}
              </Typography>
            </CardContent>
          )}
        </Card>

        {/* Navigation Controls */}
        <Stack direction="row" spacing={1} sx={{ mb: 2 }}>
          <Button
            variant="outlined"
            startIcon={<FirstPage />}
            onClick={handleFirst}
            disabled={!hasPrevious}
          >
            First
          </Button>
          <Button
            variant="outlined"
            startIcon={<NavigateBefore />}
            onClick={handlePrevious}
            disabled={!hasPrevious}
          >
            Previous
          </Button>
          <Button
            variant="outlined"
            endIcon={<NavigateNext />}
            onClick={handleNext}
            disabled={!hasNext}
          >
            Next
          </Button>
          <Button
            variant="outlined"
            endIcon={<LastPage />}
            onClick={handleLast}
            disabled={!hasNext}
          >
            Latest
          </Button>
        </Stack>

        <Typography variant="body2" color="text.secondary">
          Strip {currentStrip.number} of {comic.strips.length}
        </Typography>
      </Box>

      {/* Info Dialog */}
      <Dialog open={showInfo} onClose={() => setShowInfo(false)} maxWidth="sm" fullWidth>
        <DialogTitle>{comic.title}</DialogTitle>
        <DialogContent>
          <Typography variant="body1" gutterBottom>
            <strong>Author:</strong> {comic.author}
          </Typography>
          {comic.description && (
            <Typography variant="body2" paragraph>
              {comic.description}
            </Typography>
          )}
          <Typography variant="body2" gutterBottom>
            <strong>Total Strips:</strong> {comic.strips.length}
          </Typography>
          <Typography variant="body2" gutterBottom>
            <strong>Last Updated:</strong> {comic.lastUpdated.toLocaleDateString()}
          </Typography>
          {comic.rssUrl && (
            <Typography variant="body2" gutterBottom>
              <strong>RSS Feed:</strong> <a href={comic.rssUrl} target="_blank" rel="noopener noreferrer">Link</a>
            </Typography>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowInfo(false)}>Close</Button>
        </DialogActions>
      </Dialog>

      {/* Download Dialog */}
      <Dialog open={showDownloadDialog} onClose={() => setShowDownloadDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Download Strips</DialogTitle>
        <DialogContent>
          <Typography variant="body2" paragraph>
            Download comic strips for offline reading. This may take a while depending on the number of strips.
          </Typography>
          <Stack spacing={2} sx={{ mt: 2 }}>
            <TextField
              label="Start Strip"
              type="number"
              value={downloadRange.start}
              onChange={(e) => setDownloadRange({ ...downloadRange, start: parseInt(e.target.value) || 1 })}
              inputProps={{ min: 1, max: comic.strips.length }}
              fullWidth
            />
            <TextField
              label="End Strip"
              type="number"
              value={downloadRange.end}
              onChange={(e) => setDownloadRange({ ...downloadRange, end: parseInt(e.target.value) || 1 })}
              inputProps={{ min: 1, max: comic.strips.length }}
              fullWidth
            />
            <Typography variant="caption" color="text.secondary">
              Total strips to download: {Math.max(0, downloadRange.end - downloadRange.start + 1)}
            </Typography>
          </Stack>
          {downloading && (
            <Box sx={{ mt: 2 }}>
              <LinearProgress variant="determinate" value={downloadProgress} />
              <Typography variant="caption" sx={{ mt: 1 }}>
                Downloading... {Math.round(downloadProgress)}%
              </Typography>
            </Box>
          )}
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowDownloadDialog(false)} disabled={downloading}>
            Cancel
          </Button>
          <Button onClick={handleDownload} variant="contained" disabled={downloading}>
            Download
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert onClose={() => setSnackbar({ ...snackbar, open: false })} severity={snackbar.severity || 'info'} sx={{ width: '100%' }}>
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default ComicReaderScreen;