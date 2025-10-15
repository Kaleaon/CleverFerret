/**
 * TTS Provider Settings Screen
 * Migrated from TtsProviderSettingsScreen.kt
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
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Slider,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const TtsProviderSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [provider, setProvider] = useState('system');
  const [voice, setVoice] = useState('default');
  const [speed, setSpeed] = useState(1.0);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Text-to-Speech</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ p: 2 }}>
        <ListItem>
          <FormControl fullWidth>
            <InputLabel>TTS Provider</InputLabel>
            <Select value={provider} onChange={(e) => setProvider(e.target.value)} label="TTS Provider">
              <MenuItem value="system">System TTS</MenuItem>
              <MenuItem value="google">Google TTS</MenuItem>
              <MenuItem value="amazon">Amazon Polly</MenuItem>
            </Select>
          </FormControl>
        </ListItem>
        <ListItem>
          <FormControl fullWidth>
            <InputLabel>Voice</InputLabel>
            <Select value={voice} onChange={(e) => setVoice(e.target.value)} label="Voice">
              <MenuItem value="default">Default</MenuItem>
              <MenuItem value="male">Male</MenuItem>
              <MenuItem value="female">Female</MenuItem>
            </Select>
          </FormControl>
        </ListItem>
        <ListItem>
          <Box sx={{ width: '100%' }}>
            <Typography gutterBottom>Speed: {speed}x</Typography>
            <Slider value={speed} min={0.5} max={2.0} step={0.1} onChange={(_, v) => setSpeed(v as number)} />
          </Box>
        </ListItem>
      </List>
    </Box>
  );
};

export default TtsProviderSettingsScreen;
