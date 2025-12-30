/**
 * Music Player Screen - Basic music player
 * Migrated from MusicPlayerScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Slider,
  Stack,
  List,
  ListItem,
  ListItemText,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  Shuffle,
  Repeat,
} from '@mui/icons-material';

export const MusicPlayerScreen: React.FC = () => {
  const navigate = useNavigate();
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(180);

  const queue = [
    { id: 1, title: 'Song 1', artist: 'Artist 1' },
    { id: 2, title: 'Song 2', artist: 'Artist 2' },
    { id: 3, title: 'Song 3', artist: 'Artist 3' },
  ];

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Music Player
          </Typography>
        </Toolbar>
      </AppBar>

      <Box
        sx={{
          flex: 1,
          p: 3,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <Typography variant="h5" gutterBottom>
          Current Song
        </Typography>
        <Typography variant="body2" color="text.secondary" gutterBottom>
          Artist Name
        </Typography>

        <Slider
          value={currentTime}
          max={duration}
          onChange={(_, v) => setCurrentTime(v as number)}
          sx={{ width: '100%', maxWidth: 400, my: 3 }}
        />
        <Stack direction="row" spacing={2}>
          <IconButton>
            <Shuffle />
          </IconButton>
          <IconButton>
            <SkipPrevious />
          </IconButton>
          <IconButton
            onClick={() => setIsPlaying(!isPlaying)}
            sx={{ bgcolor: 'primary.main', color: 'white' }}
          >
            {isPlaying ? <Pause /> : <PlayArrow />}
          </IconButton>
          <IconButton>
            <SkipNext />
          </IconButton>
          <IconButton>
            <Repeat />
          </IconButton>
        </Stack>
      </Box>

      <Box sx={{ borderTop: 1, borderColor: 'divider' }}>
        <Typography variant="subtitle2" sx={{ p: 2 }}>
          Up Next
        </Typography>
        <List dense>
          {queue.map((song) => (
            <ListItem key={song.id}>
              <ListItemText primary={song.title} secondary={song.artist} />
            </ListItem>
          ))}
        </List>
      </Box>
    </Box>
  );
};

export default MusicPlayerScreen;
