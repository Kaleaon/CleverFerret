/**
 * Preset Browser Screen
 * Migrated from PresetBrowserScreen.kt
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
  Chip,
} from '@mui/material';
import { ArrowBack, CheckCircle } from '@mui/icons-material';

export const PresetBrowserScreen: React.FC = () => {
  const navigate = useNavigate();
  const [selectedPreset, setSelectedPreset] = useState('default');

  const presets = [
    { id: 'default', name: 'Default', description: 'Standard reading settings' },
    { id: 'night', name: 'Night Mode', description: 'Dark theme with reduced brightness' },
    { id: 'sepia', name: 'Sepia', description: 'Warm sepia tones for comfortable reading' },
    { id: 'large', name: 'Large Text', description: 'Increased font size for better readability' },
  ];

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Reading Presets</Typography>
        </Toolbar>
      </AppBar>

      <List>
        {presets.map((preset) => (
          <ListItem
            key={preset.id}
            secondaryAction={selectedPreset === preset.id && <CheckCircle color="primary" />}
          >
            <ListItemButton onClick={() => setSelectedPreset(preset.id)}>
              <ListItemText primary={preset.name} secondary={preset.description} />
            </ListItemButton>
          </ListItem>
        ))}
      </List>
    </Box>
  );
};

export default PresetBrowserScreen;
