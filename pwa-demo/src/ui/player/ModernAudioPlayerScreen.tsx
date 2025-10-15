/**
 * Modern Audio Player Screen
 * 
 * Enhanced audio player with beautiful UI and advanced features.
 * Supports music, audiobooks, and podcasts.
 * Migrated from ModernAudioPlayerScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Slider,
  Card,
  CardMedia,
  Stack,
  LinearProgress,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  VolumeUp,
  Shuffle,
  Repeat,
  MoreVert,
  QueueMusic,
  Favorite,
  FavoriteBorder,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';

export const ModernAudioPlayerScreen: React.FC = () => {
  const { audioId } = useParams<{ audioId: string }>();
  const navigate = useNavigate();
  
  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [volume, setVolume] = useState(70);
  const [isFavorite, setIsFavorite] = useState(false);

  useEffect(() => {
    loadAudioData();
  }, [audioId]);

  const loadAudioData = async () => {
    if (!audioId) return;
    const item = await db.mediaItems.get(parseInt(audioId));
    setMediaItem(item || null);
  };

  const handlePlayPause = () => {
    setIsPlaying(!isPlaying);
    // TODO: Implement actual playback control
  };

  const handleSeek = (value: number) => {
    setCurrentTime(value);
    // TODO: Implement actual seek
  };

  const formatTime = (seconds: number): string => {
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column', bgcolor: '#1a1a2e' }}>
      <AppBar position="static" sx={{ bgcolor: 'transparent', boxShadow: 'none' }}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1, textAlign: 'center' }}>
            Now Playing
          </Typography>
          <IconButton color="inherit">
            <MoreVert />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', p: 3 }}>
        {/* Album Art */}
        <Card sx={{ 
          width: 300, 
          height: 300, 
          borderRadius: 4, 
          mb: 4,
          boxShadow: '0 20px 60px rgba(0,0,0,0.5)'
        }}>
          <CardMedia
            component="img"
            image={mediaItem?.thumbnailPath || '/placeholder-album.png'}
            alt="Album art"
            sx={{ width: '100%', height: '100%', objectFit: 'cover' }}
          />
        </Card>

        {/* Track Info */}
        <Typography variant="h5" sx={{ color: 'white', fontWeight: 'bold', mb: 1, textAlign: 'center' }}>
          {mediaItem?.fileName || 'Unknown Track'}
        </Typography>
        <Typography variant="body1" sx={{ color: '#aaa', mb: 4, textAlign: 'center' }}>
          Unknown Artist
        </Typography>

        {/* Progress Bar */}
        <Box sx={{ width: '100%', maxWidth: 500, mb: 2 }}>
          <Slider
            value={currentTime}
            max={duration}
            onChange={(_, value) => handleSeek(value as number)}
            sx={{ color: 'primary.main' }}
          />
          <Stack direction="row" justifyContent="space-between" sx={{ color: '#aaa', fontSize: '0.875rem' }}>
            <span>{formatTime(currentTime)}</span>
            <span>{formatTime(duration)}</span>
          </Stack>
        </Box>

        {/* Playback Controls */}
        <Stack direction="row" spacing={3} alignItems="center" sx={{ mb: 3 }}>
          <IconButton sx={{ color: 'white' }}>
            <Shuffle />
          </IconButton>
          <IconButton sx={{ color: 'white', fontSize: '2rem' }}>
            <SkipPrevious fontSize="large" />
          </IconButton>
          <IconButton
            onClick={handlePlayPause}
            sx={{
              bgcolor: 'primary.main',
              color: 'white',
              width: 64,
              height: 64,
              '&:hover': { bgcolor: 'primary.dark' },
            }}
          >
            {isPlaying ? <Pause fontSize="large" /> : <PlayArrow fontSize="large" />}
          </IconButton>
          <IconButton sx={{ color: 'white', fontSize: '2rem' }}>
            <SkipNext fontSize="large" />
          </IconButton>
          <IconButton sx={{ color: 'white' }}>
            <Repeat />
          </IconButton>
        </Stack>

        {/* Additional Controls */}
        <Stack direction="row" spacing={4} alignItems="center">
          <IconButton sx={{ color: 'white' }} onClick={() => setIsFavorite(!isFavorite)}>
            {isFavorite ? <Favorite color="error" /> : <FavoriteBorder />}
          </IconButton>
          <Stack direction="row" spacing={1} alignItems="center" sx={{ width: 120 }}>
            <VolumeUp sx={{ color: 'white' }} />
            <Slider
              value={volume}
              onChange={(_, value) => setVolume(value as number)}
              sx={{ color: 'white' }}
              size="small"
            />
          </Stack>
          <IconButton sx={{ color: 'white' }}>
            <QueueMusic />
          </IconButton>
        </Stack>
      </Box>

      {isPlaying && (
        <LinearProgress sx={{ position: 'absolute', bottom: 0, left: 0, right: 0 }} />
      )}
    </Box>
  );
};

export default ModernAudioPlayerScreen;
