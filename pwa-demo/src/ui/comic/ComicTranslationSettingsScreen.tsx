/**
 * Comic Translation Settings Screen
 * Migrated from ComicTranslationSettingsScreen.kt
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
  Select,
  MenuItem,
  FormControl,
  InputLabel,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const ComicTranslationSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [enableTranslation, setEnableTranslation] = useState(false);
  const [targetLanguage, setTargetLanguage] = useState('en');

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Comic Translation</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <ListItem>
          <ListItemText primary="Enable Translation" secondary="Automatically translate comic text" />
          <Switch checked={enableTranslation} onChange={(e) => setEnableTranslation(e.target.checked)} />
        </ListItem>

        {enableTranslation && (
          <ListItem>
            <FormControl fullWidth>
              <InputLabel>Target Language</InputLabel>
              <Select value={targetLanguage} onChange={(e) => setTargetLanguage(e.target.value)} label="Target Language">
                <MenuItem value="en">English</MenuItem>
                <MenuItem value="es">Spanish</MenuItem>
                <MenuItem value="fr">French</MenuItem>
                <MenuItem value="de">German</MenuItem>
                <MenuItem value="ja">Japanese</MenuItem>
                <MenuItem value="zh">Chinese</MenuItem>
              </Select>
            </FormControl>
          </ListItem>
        )}
      </List>
    </Box>
  );
};

export default ComicTranslationSettingsScreen;
