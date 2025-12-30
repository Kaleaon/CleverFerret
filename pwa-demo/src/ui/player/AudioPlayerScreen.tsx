/**
 * Modern Audio Player Screen
 *
 * Beautiful audio player with animations and glassmorphic design.
 * Supports music, audiobooks, and podcasts.
 * Migrated from ModernAudioPlayerScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Card,
  CardMedia,
  Typography,
  IconButton,
  Slider,
  Stack,
  LinearProgress,
  useTheme,
  alpha,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  Shuffle,
  Repeat,
  RepeatOne,
  QueueMusic,
  Favorite,
  FavoriteBorder,
  MoreVert,
} from '@mui/icons-material';

import { audioPlayerService } from '../../services/playback/AudioPlayerService';
import type { PlaybackState } from '../../services/playback/AudioPlayerService';

export const AudioPlayerScreen: React.FC = () => {
  const navigate = useNavigate();
  const theme = useTheme();

  const [playbackState, setPlaybackState] = useState<PlaybackState | null>(null);
  const [isFavorite, setIsFavorite] = useState(false);

  useEffect(() => {
    // Subscribe to all relevant playback events
    const events = [
      'timeupdate',
      'play',
      'pause',
      'loadedmetadata',
      'repeatchange',
      'shufflechange',
      'trackend',
      'trackchange',
    ];
    const unsubscribes = events.map((evt) =>
      audioPlayerService.on(evt, () => {
        setPlaybackState(audioPlayerService.getState());
      }),
    );

    // Initial state
    setPlaybackState(audioPlayerService.getState());

    return () => {
      unsubscribes.forEach((unsub) => unsub());
    };
  }, []);

  const formatTime = (seconds: number): string => {
    if (isNaN(seconds)) return '0:00';
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  const handleSeek = (_: Event, value: number | number[]) => {
    audioPlayerService.seek(value as number);
  };

  const handleRepeatToggle = () => {
    const modes: Array<'none' | 'one' | 'all'> = ['none', 'one', 'all'];
    const currentIndex = modes.indexOf(playbackState?.repeatMode || 'none');
    const nextMode = modes[(currentIndex + 1) % modes.length];
    audioPlayerService.setRepeatMode(nextMode);
  };

  const handleShuffleToggle = () => {
    audioPlayerService.setShuffle(!playbackState?.isShuffled);
  };

  if (!playbackState?.currentTrack) {
    return (
      <Box sx={{ p: 3, textAlign: 'center' }}>
        <Typography variant="h6" gutterBottom>
          No track loaded
        </Typography>
        <Typography variant="body2" color="text.secondary">
          Select a track to play
        </Typography>
      </Box>
    );
  }

  const track = playbackState.currentTrack;

  return (
    <Box
      sx={{
        height: '100vh',
        background: `linear-gradient(135deg, ${theme.palette.primary.dark} 0%, ${theme.palette.primary.main} 50%, ${theme.palette.secondary.main} 100%)`,
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      {/* Top Bar */}
      <Box sx={{ p: 2, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <IconButton onClick={() => navigate(-1)} sx={{ color: 'white' }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="subtitle1" sx={{ color: 'white' }}>
          Now Playing
        </Typography>
        <IconButton sx={{ color: 'white' }}>
          <MoreVert />
        </IconButton>
      </Box>

      {/* Album Art */}
      <Box
        sx={{
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          p: 4,
        }}
      >
        <Card
          elevation={24}
          sx={{
            maxWidth: 400,
            width: '100%',
            aspectRatio: '1/1',
            borderRadius: 4,
          }}
        >
          {track.coverUrl ? (
            <CardMedia
              component="img"
              image={track.coverUrl}
              alt={track.title}
              sx={{ width: '100%', height: '100%' }}
            />
          ) : (
            <Box
              sx={{
                width: '100%',
                height: '100%',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                bgcolor: alpha(theme.palette.primary.main, 0.3),
              }}
            >
              <Typography variant="h1" sx={{ opacity: 0.3 }}>
                ♪
              </Typography>
            </Box>
          )}
        </Card>
      </Box>

      {/* Track Info */}
      <Box sx={{ px: 4, pb: 2, textAlign: 'center' }}>
        <Typography variant="h5" fontWeight="bold" sx={{ color: 'white' }} noWrap>
          {track.title}
        </Typography>
        <Typography variant="subtitle1" sx={{ color: 'text.secondary' }} noWrap>
          {track.artist || 'Unknown Artist'}
        </Typography>
        {track.album && (
          <Typography
            variant="body2"
            sx={{ color: alpha(theme.palette.text.secondary, 0.7) }}
            noWrap
          >
            {track.album}
          </Typography>
        )}
      </Box>

      {/* Progress Bar */}
      <Box sx={{ px: 4, pb: 1 }}>
        <Slider
          value={playbackState.currentTime}
          max={playbackState.duration || 100}
          onChange={handleSeek}
          sx={{
            color: 'white',
            '& .MuiSlider-thumb': {
              width: 12,
              height: 12,
            },
          }}
        />
        <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
          <Typography variant="caption" sx={{ color: 'text.secondary' }}>
            {formatTime(playbackState.currentTime)}
          </Typography>
          <Typography variant="caption" sx={{ color: 'text.secondary' }}>
            {formatTime(playbackState.duration)}
          </Typography>
        </Box>
      </Box>

      {/* Playback Controls */}
      <Box sx={{ px: 4, pb: 3 }}>
        <Stack direction="row" spacing={2} alignItems="center" justifyContent="center">
          <IconButton
            onClick={handleShuffleToggle}
            sx={{ color: playbackState.isShuffled ? 'text.primary' : 'text.disabled' }}
          >
            <Shuffle />
          </IconButton>

          <IconButton onClick={() => audioPlayerService.previous()} sx={{ color: 'text.primary' }}>
            <SkipPrevious sx={{ fontSize: 40 }} />
          </IconButton>

          <IconButton
            onClick={() => audioPlayerService.togglePlayPause()}
            sx={{
              bgcolor: 'text.primary',
              color: 'background.default',
              width: 64,
              height: 64,
              '&:hover': {
                bgcolor: alpha(theme.palette.text.primary, 0.9),
              },
            }}
          >
            {playbackState.isPlaying ? (
              <Pause sx={{ fontSize: 32 }} />
            ) : (
              <PlayArrow sx={{ fontSize: 32 }} />
            )}
          </IconButton>

          <IconButton onClick={() => audioPlayerService.next()} sx={{ color: 'text.primary' }}>
            <SkipNext sx={{ fontSize: 40 }} />
          </IconButton>

          <IconButton onClick={handleRepeatToggle} sx={{ color: 'text.primary' }}>
            {playbackState.repeatMode === 'one' ? (
              <RepeatOne />
            ) : playbackState.repeatMode === 'all' ? (
              <Repeat />
            ) : (
              <Repeat sx={{ opacity: 0.5 }} />
            )}
          </IconButton>
        </Stack>
      </Box>

      {/* Bottom Actions */}
      <Box sx={{ px: 4, pb: 3, display: 'flex', justifyContent: 'space-between' }}>
        <IconButton onClick={() => setIsFavorite(!isFavorite)} sx={{ color: 'text.primary' }}>
          {isFavorite ? <Favorite /> : <FavoriteBorder />}
        </IconButton>
        <IconButton onClick={() => navigate('/queue')} sx={{ color: 'text.primary' }}>
          <QueueMusic />
        </IconButton>
      </Box>
    </Box>
  );
};

export default AudioPlayerScreen;
