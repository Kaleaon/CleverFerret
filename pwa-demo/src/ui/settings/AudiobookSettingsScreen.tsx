/**
 * Audiobook Settings Screen
 *
 * Configure audiobook playback and management settings
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  FormControl,
  FormLabel,
  FormGroup,
  FormControlLabel,
  Switch,
  Slider,
  Select,
  MenuItem,
  InputLabel,
  Divider,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const AudiobookSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoBookmark, setAutoBookmark] = React.useState(true);
  const [resumePlayback, setResumePlayback] = React.useState(true);
  const [sleepTimer, setSleepTimer] = React.useState(false);
  const [playbackSpeed, setPlaybackSpeed] = React.useState(1.0);
  const [skipBackward, setSkipBackward] = React.useState(15);
  const [skipForward, setSkipForward] = React.useState(30);

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Audiobook Settings
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* Playback Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Playback
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={autoBookmark}
                      onChange={(e) => setAutoBookmark(e.target.checked)}
                    />
                  }
                  label="Auto-Bookmark Progress"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically save your listening position
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={resumePlayback}
                      onChange={(e) => setResumePlayback(e.target.checked)}
                    />
                  }
                  label="Resume Playback on Open"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Continue from last position when opening audiobook
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={sleepTimer}
                      onChange={(e) => setSleepTimer(e.target.checked)}
                    />
                  }
                  label="Enable Sleep Timer"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically pause playback after specified time
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl fullWidth sx={{ mt: 2 }}>
              <FormLabel>Playback Speed: {playbackSpeed.toFixed(1)}x</FormLabel>
              <Slider
                value={playbackSpeed}
                onChange={(_, value) => setPlaybackSpeed(value as number)}
                min={0.5}
                max={2.0}
                step={0.1}
                marks={[
                  { value: 0.5, label: '0.5x' },
                  { value: 1.0, label: '1.0x' },
                  { value: 1.5, label: '1.5x' },
                  { value: 2.0, label: '2.0x' },
                ]}
                sx={{ mt: 2 }}
              />
            </FormControl>
          </CardContent>
        </Card>

        {/* Skip Controls */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Skip Controls
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl fullWidth sx={{ mb: 2 }}>
              <InputLabel>Skip Backward</InputLabel>
              <Select
                value={skipBackward}
                label="Skip Backward"
                onChange={(e) => setSkipBackward(e.target.value as number)}
              >
                <MenuItem value={5}>5 seconds</MenuItem>
                <MenuItem value={10}>10 seconds</MenuItem>
                <MenuItem value={15}>15 seconds</MenuItem>
                <MenuItem value={30}>30 seconds</MenuItem>
                <MenuItem value={60}>1 minute</MenuItem>
              </Select>
            </FormControl>

            <FormControl fullWidth>
              <InputLabel>Skip Forward</InputLabel>
              <Select
                value={skipForward}
                label="Skip Forward"
                onChange={(e) => setSkipForward(e.target.value as number)}
              >
                <MenuItem value={10}>10 seconds</MenuItem>
                <MenuItem value={15}>15 seconds</MenuItem>
                <MenuItem value={30}>30 seconds</MenuItem>
                <MenuItem value={60}>1 minute</MenuItem>
                <MenuItem value={120}>2 minutes</MenuItem>
              </Select>
            </FormControl>
          </CardContent>
        </Card>
      </Box>
    </Box>
  );
};

export default AudiobookSettingsScreen;
