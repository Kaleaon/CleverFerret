/**
 * Media Open Screen - Media opening dialog
 * Migrated from MediaOpenScreen.kt
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
  ListItemButton,
  ListItemText,
  ListItemIcon,
  TextField,
  Button,
} from '@mui/material';
import {
  ArrowBack,
  Folder,
  Link as LinkIcon,
  CloudUpload,
} from '@mui/icons-material';

export const MediaOpenScreen: React.FC = () => {
  const navigate = useNavigate();
  const [url, setUrl] = useState('');

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Open Media</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <TextField
          fullWidth
          label="URL or Path"
          value={url}
          onChange={(e) => setUrl(e.target.value)}
          placeholder="https://... or /path/to/file"
          sx={{ mb: 2 }}
        />
        <Button variant="contained" fullWidth disabled={!url}>
          Open
        </Button>
      </Box>

      <List>
        <ListItem disablePadding>
          <ListItemButton onClick={() => navigate('/storage')}>
            <ListItemIcon><Folder /></ListItemIcon>
            <ListItemText primary="Browse Files" secondary="Choose from local storage" />
          </ListItemButton>
        </ListItem>
        <ListItem disablePadding>
          <ListItemButton>
            <ListItemIcon><LinkIcon /></ListItemIcon>
            <ListItemText primary="Open URL" secondary="Open media from a web URL" />
          </ListItemButton>
        </ListItem>
        <ListItem disablePadding>
          <ListItemButton>
            <ListItemIcon><CloudUpload /></ListItemIcon>
            <ListItemText primary="Upload File" secondary="Upload a file to open" />
          </ListItemButton>
        </ListItem>
      </List>
    </Box>
  );
};

export default MediaOpenScreen;
