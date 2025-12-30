/**
 * Reading Preferences Screen
 * Migrated from ReadingPreferencesScreen.kt
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
  Slider,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const ReadingPreferencesScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoScroll, setAutoScroll] = useState(false);
  const [fontSize, setFontSize] = useState(16);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Reading Preferences</Typography>
        </Toolbar>
      </AppBar>

      <List>
        <ListItem>
          <ListItemText primary="Auto Scroll" secondary="Automatically scroll while reading" />
          <Switch checked={autoScroll} onChange={(e) => setAutoScroll(e.target.checked)} />
        </ListItem>
        <ListItem>
          <Box sx={{ width: '100%' }}>
            <Typography gutterBottom>Font Size: {fontSize}px</Typography>
            <Slider
              value={fontSize}
              min={12}
              max={24}
              onChange={(_, v) => setFontSize(v as number)}
            />
          </Box>
        </ListItem>
      </List>
    </Box>
  );
};

export default ReadingPreferencesScreen;
