/**
 * Podcast Player Screen - Podcast-specific player
 * Migrated from PodcastPlayerScreen.kt
 */

import React, { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Slider,
  Stack,
  Chip,
  Card,
  CardMedia,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  Forward30,
  Replay30,
  Speed,
} from '@mui/icons-material';

export const PodcastPlayerScreen: React.FC = () => {
  const { episodeId } = useParams<{ episodeId: string }>();
  const navigate = useNavigate();
  const [isPlaying, setIsPlaying] = useState(false);
  const [playbackSpeed, setPlaybackSpeed] = useState(1.0);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column', bgcolor: '#1a1a1a', color: 'white' }}>
      <AppBar position="static" sx={{ bgcolor: 'transparent' }}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>Podcast Player</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, p: 3, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center' }}>
        <Card sx={{ width: 250, height: 250, mb: 3 }}>
          <CardMedia component="img" image="/placeholder-podcast.png" alt="Podcast" />
        </Card>

        <Typography variant="h5" gutterBottom textAlign="center">Episode Title</Typography>
        <Typography variant="body2" color="grey.400" gutterBottom textAlign="center">Podcast Name</Typography>

        <Slider sx={{ width: '100%', maxWidth: 500, my: 3, color: 'white' }} />
        
        <Stack direction="row" spacing={2} alignItems="center">
          <IconButton sx={{ color: 'white' }}><Replay30 /></IconButton>
          <IconButton sx={{ color: 'white' }}><SkipPrevious /></IconButton>
          <IconButton onClick={() => setIsPlaying(!isPlaying)} sx={{ bgcolor: 'primary.main', color: 'white', width: 56, height: 56 }}>
            {isPlaying ? <Pause /> : <PlayArrow />}
          </IconButton>
          <IconButton sx={{ color: 'white' }}><SkipNext /></IconButton>
          <IconButton sx={{ color: 'white' }}><Forward30 /></IconButton>
        </Stack>

        <Chip icon={<Speed />} label={`${playbackSpeed}x`} sx={{ mt: 3, color: 'white', borderColor: 'white' }} variant="outlined" />
      </Box>
    </Box>
  );
};

export default PodcastPlayerScreen;
