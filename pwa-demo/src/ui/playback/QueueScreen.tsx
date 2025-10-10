/**
 * Playback Queue Screen
 * 
 * Shows and manages the current playback queue.
 * Migrated from QueueScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Avatar,
  Button,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Clear,
  DragIndicator,
  MusicNote,
} from '@mui/icons-material';

import { audioPlayerService } from '../../services/playback/AudioPlayerService';
import type { AudioTrack } from '../../services/playback/AudioPlayerService';

export const QueueScreen: React.FC = () => {
  const navigate = useNavigate();
  const [queue, setQueue] = useState<AudioTrack[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);

  useEffect(() => {
    loadQueue();

    const unsubscribe = audioPlayerService.on('trackchange', () => {
      loadQueue();
    });

    return () => unsubscribe();
  }, []);

  const loadQueue = () => {
    const state = audioPlayerService.getState();
    setQueue(state.playlist);
    setCurrentIndex(state.currentIndex);
  };

  const handleClearQueue = () => {
    if (confirm('Clear the entire queue?')) {
      audioPlayerService.loadPlaylist([], 0);
      loadQueue();
    }
  };

  const handlePlayTrack = (index: number) => {
    const state = audioPlayerService.getState();
    audioPlayerService.loadPlaylist(state.playlist, index);
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Queue ({queue.length} tracks)
          </Typography>
          <IconButton color="inherit" onClick={handleClearQueue} disabled={queue.length === 0}>
            <Clear />
          </IconButton>
        </Toolbar>
      </AppBar>

      <List>
        {queue.map((track, index) => (
          <ListItem
            key={track.id}
            sx={{
              bgcolor: index === currentIndex ? 'action.selected' : 'transparent',
            }}
            secondaryAction={
              <IconButton onClick={() => handlePlayTrack(index)}>
                <PlayArrow />
              </IconButton>
            }
          >
            <ListItemAvatar>
              <Avatar src={track.coverUrl}>
                <MusicNote />
              </Avatar>
            </ListItemAvatar>
            <ListItemText
              primary={track.title}
              secondary={track.artist}
            />
          </ListItem>
        ))}
      </List>

      {queue.length === 0 && (
        <Box sx={{ textAlign: 'center', py: 8 }}>
          <Typography variant="h6" color="text.secondary">
            Queue is empty
          </Typography>
          <Typography variant="body2" color="text.secondary">
            Add tracks to start playing
          </Typography>
        </Box>
      )}
    </Box>
  );
};

export default QueueScreen;
