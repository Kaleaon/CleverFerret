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
  DialogActions,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Download,
  Refresh,
  Delete,
  MenuBook,
  Public,
} from '@mui/icons-material';

import webComicService, { Comic } from '../services/webcomic/WebComicService';
import { db } from '../services/database-complete';

export const WebComicManagerScreen: React.FC = () => {
  const navigate = useNavigate();
  const [comics, setComics] = useState<Comic[]>([]);
  const [newComicUrl, setNewComicUrl] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [showExamples, setShowExamples] = useState(false);

  useEffect(() => {
    loadComics();
  }, []);

  const loadComics = async () => {
    try {
      const savedComics = await db.downloadedComics?.toArray() || [];
      setComics(savedComics as any);
    } catch (error) {
      console.error('Error loading comics:', error);
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
      console.error('Error adding comic:', error);
      setError('Failed to add comic. Please check the URL and try again.');
      setLoading(false);
    }
  };

  const handleUpdateComic = async (comic: Comic) => {
    try {
      const newStrips = await webComicService.checkForUpdates(comic);
      if (newStrips > 0) {
        alert(`${newStrips} new strips available!`);
        // Refresh the comic
        const updatedComic = await webComicService.fetchComic(comic.url);
        await db.downloadedComics?.update(comic.id, updatedComic as any);
        loadComics();
      } else {
        alert('No new strips available.');
      }
    } catch (error) {
      console.error('Error updating comic:', error);
      alert('Failed to check for updates.');
    }
  };

  const handleDeleteComic = async (comicId: string) => {
    if (confirm('Are you sure you want to remove this comic?')) {
      try {
        await db.downloadedComics?.delete(comicId);
        setComics(comics.filter(c => c.id !== comicId));
      } catch (error) {
        console.error('Error deleting comic:', error);
      }
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
      <Box sx={{ display: 'flex', alignItems: 'center', p: 2, borderBottom: 1, borderColor: 'divider' }}>
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
                      <Chip 
                        label={comic.site.toUpperCase()} 
                        size="small" 
                        variant="outlined" 
                      />
                    </Stack>
                    <Typography variant="caption" color="text.secondary">
                      Last updated: {comic.lastUpdated.toLocaleDateString()}
                    </Typography>
                  </CardContent>
                  <CardActions>
                    <Button size="small" startIcon={<MenuBook />} onClick={() => handleReadComic(comic)}>
                      Read
                    </Button>
                    <Button size="small" startIcon={<Refresh />} onClick={() => handleUpdateComic(comic)}>
                      Update
                    </Button>
                    <Button size="small" startIcon={<Delete />} color="error" onClick={() => handleDeleteComic(comic.id)}>
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
    </Box>
  );
};

export default WebComicManagerScreen;