/**
 * Playlist Settings Screen
 * Migrated from PlaylistSettingsScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemText,
  Switch,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const PlaylistSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoPlay, setAutoPlay] = useState(true);
  const [shuffle, setShuffle] = useState(false);
  const [repeat, setRepeat] = useState(false);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Playlist Settings</Typography>
        </Toolbar>
      </AppBar>

      <List>
        <ListItem>
          <ListItemText primary="Auto-play next track" secondary="Automatically play the next track in playlist" />
          <Switch checked={autoPlay} onChange={(e) => setAutoPlay(e.target.checked)} />
        </ListItem>
        <ListItem>
          <ListItemText primary="Shuffle by default" secondary="Start playlists in shuffle mode" />
          <Switch checked={shuffle} onChange={(e) => setShuffle(e.target.checked)} />
        </ListItem>
        <ListItem>
          <ListItemText primary="Repeat playlists" secondary="Automatically repeat when playlist ends" />
          <Switch checked={repeat} onChange={(e) => setRepeat(e.target.checked)} />
        </ListItem>
      </List>
    </Box>
  );
};

export default PlaylistSettingsScreen;
