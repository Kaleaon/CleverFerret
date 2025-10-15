/**
 * Media Server Settings Screen
 * Migrated from MediaServerSettingsScreen.kt
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

export const MediaServerSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [enableServer, setEnableServer] = useState(false);
  const [allowRemote, setAllowRemote] = useState(false);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Media Server</Typography>
        </Toolbar>
      </AppBar>

      <List>
        <ListItem>
          <ListItemText primary="Enable Media Server" secondary="Share your library over the network" />
          <Switch checked={enableServer} onChange={(e) => setEnableServer(e.target.checked)} />
        </ListItem>
        <ListItem>
          <ListItemText primary="Allow Remote Access" secondary="Enable access from outside your network" />
          <Switch checked={allowRemote} onChange={(e) => setAllowRemote(e.target.checked)} />
        </ListItem>
      </List>
    </Box>
  );
};

export default MediaServerSettingsScreen;
