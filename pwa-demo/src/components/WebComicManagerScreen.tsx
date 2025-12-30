/**
 * Web Comic Manager Screen
 *
 * Add, manage, and browse web comics
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Typography,
  TextField,
  Button,
  List,
  Card,
  CardContent,
  CardMedia,
  CardActions,
  Chip,
  Stack,
  LinearProgress,
  Alert,
  Grid,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  Snackbar,
} from '@mui/material';
import { ArrowBack, Add, Download, Refresh, Delete, MenuBook, Public } from '@mui/icons-material';

import webComicService, { Comic } from '../services/webcomic/WebComicService';
import { db } from '../services/database-complete';

export const WebComicManagerScreen: React.FC = () => {
  const navigate = useNavigate();
  const [comics, setComics] = useState<Comic[]>([]);
  const [newComicUrl, setNewComicUrl] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [showExamples, setShowExamples] = useState(false);
  const [snackbar, setSnackbar] = useState<{
    open: boolean;
    message: string;
    severity?: 'success' | 'error' | 'info';
  }>({ open: false, message: '' });
  const [deleteComicId, setDeleteComicId] = useState<string | null>(null);

  useEffect(() => {
    loadComics();
  }, []);

  const loadComics = async () => {
    try {
      const savedComics = (await db.downloadedComics?.toArray()) || [];
      setComics(savedComics as any);
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('WebComic', 'Error loading comics', undefined, error as Error);
    }
  };

  const handleAddComic = async () => {
    if (!newComicUrl) {
      setError('Please enter a comic URL');
      return;
    }

    try {
      setLoading(true);
      setError(null);

      const comic = await webComicService.fetchComic(newComicUrl);

      // Save to database
      await db.downloadedComics?.add(comic as any);

      setComics([...comics, comic]);
      setNewComicUrl('');
      setLoading(false);
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('WebComic', 'Error adding comic', undefined, error as Error);
      setError('Failed to add comic. Please check the URL and try again.');
      setLoading(false);
    }
  };

  const handleUpdateComic = async (comic: Comic) => {
    try {
      const newStrips = await webComicService.checkForUpdates(comic);
      if (newStrips > 0) {
        setSnackbar({
          open: true,
          message: `${newStrips} new strips available!`,
          severity: 'success',
        });
        // Refresh the comic
        const updatedComic = await webComicService.fetchComic(comic.url);
        await db.downloadedComics?.update(comic.id, updatedComic as any);
        loadComics();
      } else {
        setSnackbar({ open: true, message: 'No new strips available.', severity: 'info' });
      }
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('WebComic', 'Error updating comic', undefined, error as Error);
      setSnackbar({ open: true, message: 'Failed to check for updates.', severity: 'error' });
    }
  };

  const handleDeleteComic = async (comicId: string) => {
    setDeleteComicId(comicId);
  };

  const confirmDeleteComic = async () => {
    if (!deleteComicId) return;

    try {
      await db.downloadedComics?.delete(deleteComicId);
      setComics(comics.filter((c) => c.id !== deleteComicId));
      setSnackbar({ open: true, message: 'Comic removed successfully', severity: 'success' });
    } catch (error) {
      const { logger } = await import('../services/logging');
      logger.error('WebComic', 'Error deleting comic', undefined, error as Error);
      setSnackbar({ open: true, message: 'Failed to remove comic', severity: 'error' });
    } finally {
      setDeleteComicId(null);
    }
  };

  const handleReadComic = (comic: Comic) => {
    const firstStrip = comic.strips[0];
    if (firstStrip) {
      navigate(`/comic/${comic.id}/${firstStrip.number}`);
    }
  };

  const exampleComics = [
    {
      name: 'Schlock Mercenary',
      url: 'https://www.schlockmercenary.com/',
      description: 'Space opera with mercenaries and mayhem',
    },
    {
      name: 'Questionable Content',
      url: 'https://www.questionablecontent.net/',
      description: 'Slice-of-life comedy with robots and coffee',
    },
  ];

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Header */}
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          p: 2,
          borderBottom: 1,
          borderColor: 'divider',
        }}
      >
        <IconButton onClick={() => navigate('/downloads')} sx={{ mr: 1 }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="h5" component="h1" sx={{ flexGrow: 1 }}>
          Web Comic Manager
        </Typography>
        <IconButton onClick={() => setShowExamples(true)}>
          <Public />
        </IconButton>
      </Box>

      <Box sx={{ p: 2 }}>
        {error && (
          <Alert severity="error" onClose={() => setError(null)} sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        <Stack direction="row" spacing={1} sx={{ mb: 2 }}>
          <TextField
            fullWidth
            placeholder="Enter comic URL (e.g., https://www.schlockmercenary.com/)"
            value={newComicUrl}
            onChange={(e) => setNewComicUrl(e.target.value)}
            disabled={loading}
          />
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={handleAddComic}
            disabled={loading}
          >
            Add
          </Button>
        </Stack>

        {loading && <LinearProgress sx={{ mb: 2 }} />}

        <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
          Supported sites: Schlock Mercenary, Questionable Content, and any comic with an RSS feed
        </Typography>
      </Box>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        {comics.length === 0 ? (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <MenuBook sx={{ fontSize: 64, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6" color="text.secondary" gutterBottom>
              No comics yet
            </Typography>
            <Typography variant="body2" color="text.secondary" paragraph>
              Add a comic URL to get started
            </Typography>
            <Button variant="outlined" onClick={() => setShowExamples(true)}>
              View Examples
            </Button>
          </Box>
        ) : (
          <Grid container spacing={2}>
            {comics.map((comic) => (
              <Grid item xs={12} sm={6} md={4} key={comic.id}>
                <Card>
                  {comic.strips[0]?.imageUrl && (
                    <CardMedia
                      component="img"
                      height="200"
                      image={comic.strips[0].imageUrl}
                      alt={comic.title}
                      sx={{ objectFit: 'cover' }}
                    />
                  )}
                  <CardContent>
                    <Typography variant="h6" gutterBottom>
                      {comic.title}
                    </Typography>
                    <Typography variant="body2" color="text.secondary" gutterBottom>
                      by {comic.author}
                    </Typography>
                    {comic.description && (
                      <Typography variant="body2" paragraph>
                        {comic.description.substring(0, 100)}
                        {comic.description.length > 100 ? '...' : ''}
                      </Typography>
                    )}
                    <Stack direction="row" spacing={1} sx={{ mb: 1 }}>
                      <Chip label={`${comic.strips.length} strips`} size="small" />
                      <Chip label={comic.site.toUpperCase()} size="small" variant="outlined" />
                    </Stack>
                    <Typography variant="caption" color="text.secondary">
                      Last updated: {comic.lastUpdated.toLocaleDateString()}
                    </Typography>
                  </CardContent>
                  <CardActions>
                    <Button
                      size="small"
                      startIcon={<MenuBook />}
                      onClick={() => handleReadComic(comic)}
                    >
                      Read
                    </Button>
                    <Button
                      size="small"
                      startIcon={<Refresh />}
                      onClick={() => handleUpdateComic(comic)}
                    >
                      Update
                    </Button>
                    <Button
                      size="small"
                      startIcon={<Delete />}
                      color="error"
                      onClick={() => handleDeleteComic(comic.id)}
                    >
                      Remove
                    </Button>
                  </CardActions>
                </Card>
              </Grid>
            ))}
          </Grid>
        )}
      </Box>

      {/* Examples Dialog */}
      <Dialog open={showExamples} onClose={() => setShowExamples(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Example Comics</DialogTitle>
        <DialogContent>
          <Typography variant="body2" paragraph>
            Try these popular web comics:
          </Typography>
          <List>
            {exampleComics.map((example, index) => (
              <Card key={index} sx={{ mb: 2 }}>
                <CardContent>
                  <Typography variant="h6" gutterBottom>
                    {example.name}
                  </Typography>
                  <Typography variant="body2" color="text.secondary" paragraph>
                    {example.description}
                  </Typography>
                  <Typography variant="caption" color="primary" sx={{ wordBreak: 'break-all' }}>
                    {example.url}
                  </Typography>
                </CardContent>
                <CardActions>
                  <Button
                    size="small"
                    onClick={() => {
                      setNewComicUrl(example.url);
                      setShowExamples(false);
                    }}
                  >
                    Use This URL
                  </Button>
                </CardActions>
              </Card>
            ))}
          </List>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowExamples(false)}>Close</Button>
        </DialogActions>
      </Dialog>

      <Dialog open={!!deleteComicId} onClose={() => setDeleteComicId(null)}>
        <DialogTitle>Remove Comic</DialogTitle>
        <DialogContent>
          <DialogContentText>
            Are you sure you want to remove this comic? This action cannot be undone.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setDeleteComicId(null)}>Cancel</Button>
          <Button onClick={confirmDeleteComic} color="error" variant="contained">
            Remove
          </Button>
        </DialogActions>
      </Dialog>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert
          onClose={() => setSnackbar({ ...snackbar, open: false })}
          severity={snackbar.severity || 'info'}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default WebComicManagerScreen;
