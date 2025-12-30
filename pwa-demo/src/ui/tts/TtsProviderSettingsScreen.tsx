/**
 * TTS Provider Settings Screen
 * Migrated from TtsProviderSettingsScreen.kt
 */

import React, { useState, useEffect } from 'react';
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
  Button,
  TextField,
} from '@mui/material';
import { ArrowBack, PlayArrow, Stop } from '@mui/icons-material';
import TTSService from '../../services/tts/TTSService';

export const TtsProviderSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [provider] = useState('system');
  const [voice, setVoice] = useState('');
  const [speed, setSpeed] = useState(1.0);
  const [pitch, setPitch] = useState(1.0);
  const [volume, setVolume] = useState(1.0);
  const [availableVoices, setAvailableVoices] = useState<Array<{ name: string; lang: string }>>([]);
  const [testText, setTestText] = useState('Hello! This is a test of the text to speech system.');

  useEffect(() => {
    // Load available voices
    const loadVoices = () => {
      const voices = TTSService.getAvailableVoices();
      setAvailableVoices(voices);
      if (voices.length > 0 && !voice) {
        setVoice(voices[0].name);
      }
    };

    loadVoices();
    // Voices may load asynchronously, so also listen for voiceschanged event
    if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
      window.speechSynthesis.addEventListener('voiceschanged', loadVoices);
      return () => window.speechSynthesis.removeEventListener('voiceschanged', loadVoices);
    }
  }, [voice]);

  const handleTestSpeech = () => {
    TTSService.speak(testText, {
      rate: speed,
      pitch: pitch,
      volume: volume,
      voice: voice,
    });
  };

  const handleStopSpeech = () => {
    TTSService.stop();
  };

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
            <Select value={provider} disabled label="TTS Provider">
              <MenuItem value="system">System TTS (Web Speech API)</MenuItem>
            </Select>
          </FormControl>
        </ListItem>
        
        <ListItem>
          <FormControl fullWidth>
            <InputLabel>Voice</InputLabel>
            <Select value={voice} onChange={(e) => setVoice(e.target.value)} label="Voice">
              {availableVoices.map((v) => (
                <MenuItem key={v.name} value={v.name}>
                  {v.name} ({v.lang})
                </MenuItem>
              ))}
            </Select>
          </FormControl>
        </ListItem>

        <ListItem>
          <Box sx={{ width: '100%' }}>
            <Typography gutterBottom>Speed: {speed.toFixed(1)}x</Typography>
            <Slider 
              value={speed} 
              min={0.5} 
              max={2.0} 
              step={0.1} 
              onChange={(_, v) => setSpeed(v as number)} 
              marks={[
                { value: 0.5, label: '0.5x' },
                { value: 1.0, label: '1.0x' },
                { value: 2.0, label: '2.0x' },
              ]}
            />
          </Box>
        </ListItem>

        <ListItem>
          <Box sx={{ width: '100%' }}>
            <Typography gutterBottom>Pitch: {pitch.toFixed(1)}</Typography>
            <Slider 
              value={pitch} 
              min={0.5} 
              max={2.0} 
              step={0.1} 
              onChange={(_, v) => setPitch(v as number)} 
              marks={[
                { value: 0.5, label: '0.5' },
                { value: 1.0, label: '1.0' },
                { value: 2.0, label: '2.0' },
              ]}
            />
          </Box>
        </ListItem>

        <ListItem>
          <Box sx={{ width: '100%' }}>
            <Typography gutterBottom>Volume: {(volume * 100).toFixed(0)}%</Typography>
            <Slider 
              value={volume} 
              min={0} 
              max={1} 
              step={0.1} 
              onChange={(_, v) => setVolume(v as number)} 
              marks={[
                { value: 0, label: '0%' },
                { value: 0.5, label: '50%' },
                { value: 1.0, label: '100%' },
              ]}
            />
          </Box>
        </ListItem>

        <ListItem>
          <TextField
            fullWidth
            multiline
            rows={3}
            label="Test Text"
            value={testText}
            onChange={(e) => setTestText(e.target.value)}
            variant="outlined"
          />
        </ListItem>

        <ListItem sx={{ gap: 2 }}>
          <Button
            variant="contained"
            startIcon={<PlayArrow />}
            onClick={handleTestSpeech}
            fullWidth
          >
            Test Voice
          </Button>
          <Button
            variant="outlined"
            startIcon={<Stop />}
            onClick={handleStopSpeech}
            fullWidth
          >
            Stop
          </Button>
        </ListItem>
      </List>
    </Box>
  );
};

export default TtsProviderSettingsScreen;
