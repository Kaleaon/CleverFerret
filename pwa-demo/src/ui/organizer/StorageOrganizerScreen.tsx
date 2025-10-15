/**
 * Storage Organizer Screen
 * Migrated from StorageOrganizerScreen.kt
 */

import React from 'react';
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
} from '@mui/material';
import {
  ArrowBack,
  CleaningServices,
  FolderSpecial,
  DeleteSweep,
} from '@mui/icons-material';

export const StorageOrganizerScreen: React.FC = () => {
  const navigate = useNavigate();

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Storage Organizer</Typography>
        </Toolbar>
      </AppBar>

      <List>
        <ListItem disablePadding>
          <ListItemButton>
            <ListItemIcon><FolderSpecial /></ListItemIcon>
            <ListItemText primary="Organize Files" secondary="Automatically organize files by type" />
          </ListItemButton>
        </ListItem>
        <ListItem disablePadding>
          <ListItemButton>
            <ListItemIcon><CleaningServices /></ListItemIcon>
            <ListItemText primary="Clean Up" secondary="Remove duplicates and unused files" />
          </ListItemButton>
        </ListItem>
        <ListItem disablePadding>
          <ListItemButton>
            <ListItemIcon><DeleteSweep /></ListItemIcon>
            <ListItemText primary="Clear Cache" secondary="Free up storage space" />
          </ListItemButton>
        </ListItem>
      </List>
    </Box>
  );
};

export default StorageOrganizerScreen;
