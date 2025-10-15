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
  AppBar,
  Toolbar,
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
    // TODO: Parse story URL and fetch metadata
    alert(`Adding story from: ${newStoryUrl}`);
    setNewStoryUrl('');
  };

  const handleDownloadStory = (story: Story) => {
    // TODO: Download all chapters
    alert(`Downloading: ${story.title}`);
  };

  const handleUpdateStory = (story: Story) => {
    // TODO: Check for new chapters
    alert(`Checking for updates: ${story.title}`);
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Web Fiction Manager
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <Stack direction="row" spacing={1}>
          <TextField
            fullWidth
            placeholder="Enter story URL (Archive of Our Own, FanFiction.Net, etc.)"
            value={newStoryUrl}
            onChange={(e) => setNewStoryUrl(e.target.value)}
          />
          <Button
            variant="contained"
            startIcon={<Add />}
            onClick={handleAddStory}
          >
            Add
          </Button>
        </Stack>
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
    </Box>
  );
};

export default WebFictionManagerScreen;
