/**
 * Now Playing Screen
 *
 * Mini player/now playing bar for global playback control.
 */

import React, { useEffect, useState, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { Box, Paper, Avatar, Typography, IconButton, LinearProgress, Slide } from '@mui/material';
import {
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  FastForward,
  FastRewind,
  Forward10,
  Replay10,
  MusicNote,
} from '@mui/icons-material';

import { audioPlayerService } from '../../services/playback/AudioPlayerService';
import type { PlaybackState } from '../../services/playback/AudioPlayerService';

export const NowPlayingBar: React.FC = React.memo(() => {
  const navigate = useNavigate();
  const [playbackState, setPlaybackState] = useState<PlaybackState | null>(null);

  useEffect(() => {
    const unsubscribe = audioPlayerService.on('timeupdate', () => {
      setPlaybackState(audioPlayerService.getState());
    });

    setPlaybackState(audioPlayerService.getState());

    return () => unsubscribe();
  }, []);

  const handleSkip10Forward = useCallback(
    (e: React.MouseEvent) => {
      e.stopPropagation();
      if (playbackState) {
        audioPlayerService.seek(playbackState.currentTime + 10);
      }
    },
    [playbackState],
  );

  const handleSkip10Backward = useCallback(
    (e: React.MouseEvent) => {
      e.stopPropagation();
      if (playbackState) {
        audioPlayerService.seek(Math.max(0, playbackState.currentTime - 10));
      }
    },
    [playbackState],
  );

  const handleFastForward = useCallback(
    (e: React.MouseEvent) => {
      e.stopPropagation();
      if (playbackState) {
        audioPlayerService.seek(playbackState.currentTime + 30);
      }
    },
    [playbackState],
  );

  const handleFastRewind = useCallback(
    (e: React.MouseEvent) => {
      e.stopPropagation();
      if (playbackState) {
        audioPlayerService.seek(Math.max(0, playbackState.currentTime - 30));
      }
    },
    [playbackState],
  );

  const handleNavigate = useCallback(() => {
    navigate('/audio_player');
  }, [navigate]);

  const handleTogglePlayPause = useCallback((e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.togglePlayPause();
  }, []);

  const handlePrevious = useCallback((e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.previous();
  }, []);

  const handleNext = useCallback((e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.next();
  }, []);

  if (!playbackState?.currentTrack) {
    return null;
  }

  const track = playbackState.currentTrack;
  const progress = (playbackState.currentTime / playbackState.duration) * 100;

  return (
    <Slide direction="up" in={true}>
      <Paper
        elevation={8}
        sx={{
          position: 'fixed',
          bottom: 0,
          left: 0,
          right: 0,
          zIndex: 1300,
        }}
      >
        <LinearProgress variant="determinate" value={progress} sx={{ height: 2 }} />
        <Box
          sx={{
            display: 'flex',
            flexDirection: 'column',
            p: 2,
            cursor: 'pointer',
          }}
          onClick={handleNavigate}
        >
          {/* Title centered above controls */}
          <Box sx={{ textAlign: 'center', mb: 1 }}>
            <Typography variant="subtitle1" noWrap fontWeight="medium">
              {track.title}
            </Typography>
            <Typography variant="caption" color="text.secondary" noWrap>
              {track.artist || track.album || 'Unknown'}
            </Typography>
          </Box>

          {/* Playback controls centered */}
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              gap: 0.5,
            }}
          >
            {/* Previous track/chapter */}
            <IconButton
              size="small"
              onClick={handlePrevious}
              title="Previous Track"
            >
              <SkipPrevious />
            </IconButton>

            {/* Fast Rewind (30 seconds) */}
            <IconButton size="small" onClick={handleFastRewind} title="Rewind 30s">
              <FastRewind />
            </IconButton>

            {/* Rewind 10 seconds */}
            <IconButton size="small" onClick={handleSkip10Backward} title="Rewind 10s">
              <Replay10 />
            </IconButton>

            {/* Play/Pause - Larger and centered */}
            <IconButton
              size="large"
              onClick={handleTogglePlayPause}
              sx={{
                mx: 1,
                bgcolor: 'primary.main',
                color: 'primary.contrastText',
                '&:hover': {
                  bgcolor: 'primary.dark',
                },
              }}
            >
              {playbackState.isPlaying ? <Pause /> : <PlayArrow />}
            </IconButton>

            {/* Forward 10 seconds */}
            <IconButton size="small" onClick={handleSkip10Forward} title="Forward 10s">
              <Forward10 />
            </IconButton>

            {/* Fast Forward (30 seconds) */}
            <IconButton size="small" onClick={handleFastForward} title="Forward 30s">
              <FastForward />
            </IconButton>

            {/* Next track/chapter */}
            <IconButton
              size="small"
              onClick={handleNext}
              title="Next Track"
            >
              <SkipNext />
            </IconButton>
          </Box>
        </Box>
      </Paper>
    </Slide>
  );
});

export default NowPlayingBar;
