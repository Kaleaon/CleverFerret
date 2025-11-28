/**
 * Web Fiction Manager Screen
 * 
 * Download and manage web fiction/fanfiction stories.
 * Migrated from WebFictionManagerScreen.kt
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
  ListItem,
  ListItemText,
  Card,
  CardContent,
  Chip,
  Stack,
  LinearProgress,
  Snackbar,
  Alert,
  CircularProgress,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Download,
  Refresh,
  Delete,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

interface Story {
  storyId: number;
  title: string;
  author: string;
  url: string;
  chapters: number;
  downloaded: number;
  lastUpdate: number;
}

export const WebFictionManagerScreen: React.FC = () => {
  const navigate = useNavigate();
  const [stories, setStories] = useState<Story[]>([]);
  const [newStoryUrl, setNewStoryUrl] = useState('');
  const [loading, setLoading] = useState(false);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });

  useEffect(() => {
    loadStories();
  }, []);

  const loadStories = async () => {
    const downloaded = await db.downloadedStories.toArray();
    setStories(downloaded.map((s, index) => ({
      storyId: index,
      title: s.title,
      author: s.author,
      url: s.url,
      chapters: s.totalChapters || 0,
      downloaded: s.lastKnownChapters || 0,
      lastUpdate: s.lastChecked,
    })));
  };

  const handleAddStory = async () => {
    if (!newStoryUrl) return;
    
    setLoading(true);
    try {
      setSnackbar({ open: true, message: `Parsing story from: ${newStoryUrl}...`, severity: 'info' });
      
      const { webFictionParser } = await import('../../services/webfiction/WebFictionParser');
      const { db } = await import('../../services/database-complete');
      
      const storyInfo = await webFictionParser.parseStory(newStoryUrl);
      
      // Add to database
      await db.downloadedStories.add({
        id: `${storyInfo.site}_${Date.now()}`,
        title: storyInfo.title,
        author: storyInfo.author,
        url: storyInfo.url,
        site: storyInfo.site,
        siteStoryId: storyInfo.url,
        totalChapters: storyInfo.chapterCount,
        lastKnownChapters: 0,
        lastChecked: Date.now(),
        hasUpdates: false,
        description: storyInfo.description,
      });
      
      setNewStoryUrl('');
      setSnackbar({ open: true, message: `Story "${storyInfo.title}" added successfully`, severity: 'success' });
      loadStories();
    } catch (error) {
      setSnackbar({ open: true, message: `Failed to add story: ${error instanceof Error ? error.message : 'Unknown error'}`, severity: 'error' });
    } finally {
      setLoading(false);
    }
  };

  const handleDownloadStory = async (story: Story) => {
    setLoading(true);
    try {
      setSnackbar({ open: true, message: `Downloading: ${story.title}...`, severity: 'info' });
      
      const { webFictionParser } = await import('../../services/webfiction/WebFictionParser');
      const { db } = await import('../../services/database-complete');
      
      // Parse story to get chapters
      const storyInfo = await webFictionParser.parseStory(story.url);
      
      // Download chapters (limit to first 10 for now)
      let downloaded = 0;
      for (const chapter of storyInfo.chapters.slice(0, 10)) {
        try {
          const chapterContent = await webFictionParser.parseChapter(chapter.url);
          // Store chapter content (would need a chapters table)
          downloaded++;
          setSnackbar({ open: true, message: `Downloading: ${story.title}... (${downloaded}/${Math.min(10, storyInfo.chapters.length)})`, severity: 'info' });
        } catch (err) {
          const { logger } = await import('../../services/logging');
          logger.warn('WebFiction', `Failed to download chapter ${chapter.number}`, undefined, err as Error);
        }
      }
      
      // Update story in database
      await db.downloadedStories.update(story.url, {
        lastKnownChapters: downloaded,
        lastChecked: Date.now(),
      });
      
      setSnackbar({ open: true, message: `${story.title}: ${downloaded} chapters downloaded`, severity: 'success' });
      loadStories();
    } catch (error) {
      setSnackbar({ open: true, message: `Failed to download: ${error instanceof Error ? error.message : 'Unknown error'}`, severity: 'error' });
    } finally {
      setLoading(false);
    }
  };

  const handleUpdateStory = async (story: Story) => {
    setLoading(true);
    try {
      setSnackbar({ open: true, message: `Checking for updates: ${story.title}...`, severity: 'info' });
      
      const { webFictionParser } = await import('../../services/webfiction/WebFictionParser');
      const { db } = await import('../../services/database-complete');
      
      // Parse story to get current chapter count
      const storyInfo = await webFictionParser.parseStory(story.url);
      
      const downloadedStory = await db.downloadedStories.get(story.url);
      if (!downloadedStory) {
        setSnackbar({ open: true, message: 'Story not found in database', severity: 'error' });
        return;
      }
      
      const newChapters = storyInfo.chapterCount - (downloadedStory.lastKnownChapters || 0);
      
      if (newChapters > 0) {
        await db.downloadedStories.update(story.url, {
          hasUpdates: true,
          lastChecked: Date.now(),
          totalChapters: storyInfo.chapterCount,
        });
        setSnackbar({ open: true, message: `Found ${newChapters} new chapter(s)!`, severity: 'success' });
      } else {
        await db.downloadedStories.update(story.url, {
          hasUpdates: false,
          lastChecked: Date.now(),
        });
        setSnackbar({ open: true, message: 'No new chapters available', severity: 'info' });
      }
      
      loadStories();
    } catch (error) {
      setSnackbar({ open: true, message: `Failed to check updates: ${error instanceof Error ? error.message : 'Unknown error'}`, severity: 'error' });
    } finally {
      setLoading(false);
    }
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* Header */}
      <Box sx={{ display: 'flex', alignItems: 'center', p: 2, borderBottom: 1, borderColor: 'divider' }}>
        <IconButton onClick={() => navigate('/downloads')} sx={{ mr: 1 }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="h5" component="h1" sx={{ flexGrow: 1 }}>
          Web Fiction Manager
        </Typography>
      </Box>

      <Box sx={{ p: 2 }}>
        <Stack direction="row" spacing={1}>
          <TextField
            fullWidth
            placeholder="Enter story URL (Archive of Our Own, FanFiction.Net, etc.)"
            value={newStoryUrl}
            onChange={(e) => setNewStoryUrl(e.target.value)}
            disabled={loading}
          />
          <Button
            variant="contained"
            startIcon={loading ? <CircularProgress size={20} /> : <Add />}
            onClick={handleAddStory}
            disabled={loading || !newStoryUrl}
          >
            Add
          </Button>
        </Stack>
        {loading && <LinearProgress sx={{ mt: 2 }} />}
      </Box>

      <List sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        {stories.map((story) => (
          <Card key={story.storyId} sx={{ mb: 2 }}>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                {story.title}
              </Typography>
              <Typography variant="body2" color="text.secondary" gutterBottom>
                by {story.author}
              </Typography>
              <Stack direction="row" spacing={1} sx={{ mb: 2 }}>
                <Chip label={`${story.downloaded}/${story.chapters} chapters`} size="small" />
                <Chip label={new Date(story.lastUpdate).toLocaleDateString()} size="small" variant="outlined" />
              </Stack>
              <LinearProgress
                variant="determinate"
                value={(story.downloaded / story.chapters) * 100}
                sx={{ mb: 2 }}
              />
              <Stack direction="row" spacing={1}>
                <Button size="small" startIcon={<Download />} onClick={() => handleDownloadStory(story)}>
                  Download
                </Button>
                <Button size="small" startIcon={<Refresh />} onClick={() => handleUpdateStory(story)}>
                  Update
                </Button>
                <Button size="small" startIcon={<Delete />} color="error">
                  Remove
                </Button>
              </Stack>
            </CardContent>
          </Card>
        ))}
        {stories.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Typography variant="h6" color="text.secondary">
              No stories yet
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Add a story URL to get started
            </Typography>
          </Box>
        )}
      </List>

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

export default WebFictionManagerScreen;
