/**
 * Podcast Settings Screen
 *
 * Configure podcast download, playback, and notification settings
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
  FormGroup,
  FormControlLabel,
  Switch,
  Select,
  MenuItem,
  InputLabel,
  Divider,
  Slider,
  FormLabel,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const PodcastSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoDownload, setAutoDownload] = React.useState(false);
  const [wifiOnly, setWifiOnly] = React.useState(true);
  const [deleteOld, setDeleteOld] = React.useState(true);
  const [notifyNew, setNotifyNew] = React.useState(true);
  const [keepEpisodes, setKeepEpisodes] = React.useState(10);
  const [playbackSpeed, setPlaybackSpeed] = React.useState(1.0);
  const [skipIntro, setSkipIntro] = React.useState(0);
  const [skipOutro, setSkipOutro] = React.useState(0);

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Podcast Settings
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* Download Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Downloads
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={autoDownload}
                      onChange={(e) => setAutoDownload(e.target.checked)}
                    />
                  }
                  label="Auto-Download New Episodes"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically download new episodes when published
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={wifiOnly} onChange={(e) => setWifiOnly(e.target.checked)} />
                  }
                  label="Download on WiFi Only"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Only download episodes when connected to WiFi
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={deleteOld} onChange={(e) => setDeleteOld(e.target.checked)} />
                  }
                  label="Auto-Delete Played Episodes"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically delete episodes after listening
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl fullWidth sx={{ mt: 2 }}>
              <InputLabel>Keep Episodes</InputLabel>
              <Select
                value={keepEpisodes}
                label="Keep Episodes"
                onChange={(e) => setKeepEpisodes(e.target.value as number)}
              >
                <MenuItem value={5}>Last 5 episodes</MenuItem>
                <MenuItem value={10}>Last 10 episodes</MenuItem>
                <MenuItem value={20}>Last 20 episodes</MenuItem>
                <MenuItem value={50}>Last 50 episodes</MenuItem>
                <MenuItem value={-1}>All episodes</MenuItem>
              </Select>
            </FormControl>
          </CardContent>
        </Card>

        {/* Playback Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Playback
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl fullWidth sx={{ mb: 3 }}>
              <FormLabel>Playback Speed: {playbackSpeed.toFixed(1)}x</FormLabel>
              <Slider
                value={playbackSpeed}
                onChange={(_, value) => setPlaybackSpeed(value as number)}
                min={0.5}
                max={2.5}
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

            <FormControl fullWidth sx={{ mb: 2 }}>
              <InputLabel>Skip Intro</InputLabel>
              <Select
                value={skipIntro}
                label="Skip Intro"
                onChange={(e) => setSkipIntro(e.target.value as number)}
              >
                <MenuItem value={0}>Don't skip</MenuItem>
                <MenuItem value={10}>10 seconds</MenuItem>
                <MenuItem value={30}>30 seconds</MenuItem>
                <MenuItem value={60}>1 minute</MenuItem>
              </Select>
            </FormControl>

            <FormControl fullWidth>
              <InputLabel>Skip Outro</InputLabel>
              <Select
                value={skipOutro}
                label="Skip Outro"
                onChange={(e) => setSkipOutro(e.target.value as number)}
              >
                <MenuItem value={0}>Don't skip</MenuItem>
                <MenuItem value={10}>10 seconds</MenuItem>
                <MenuItem value={30}>30 seconds</MenuItem>
                <MenuItem value={60}>1 minute</MenuItem>
              </Select>
            </FormControl>
          </CardContent>
        </Card>

        {/* Notifications */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Notifications
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%' }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={notifyNew} onChange={(e) => setNotifyNew(e.target.checked)} />
                  }
                  label="Notify on New Episodes"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Get notifications when new episodes are available
                </Typography>
              </FormGroup>
            </FormControl>
          </CardContent>
        </Card>
      </Box>
    </Box>
  );
};

export default PodcastSettingsScreen;
