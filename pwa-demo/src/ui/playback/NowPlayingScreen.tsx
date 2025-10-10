/**
 * Now Playing Screen
 * 
 * Mini player/now playing bar for global playback control.
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Paper,
  Avatar,
  Typography,
  IconButton,
  LinearProgress,
  Slide,
} from '@mui/material';
import {
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  MusicNote,
} from '@mui/icons-material';

import { audioPlayerService } from '../../services/playback/AudioPlayerService';
import type { PlaybackState } from '../../services/playback/AudioPlayerService';

export const NowPlayingBar: React.FC = () => {
  const navigate = useNavigate();
  const [playbackState, setPlaybackState] = useState<PlaybackState | null>(null);

  useEffect(() => {
    const unsubscribe = audioPlayerService.on('timeupdate', () => {
      setPlaybackState(audioPlayerService.getState());
    });

    setPlaybackState(audioPlayerService.getState());

    return () => unsubscribe();
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
            alignItems: 'center',
            p: 1,
            cursor: 'pointer',
          }}
          onClick={() => navigate('/audio_player')}
        >
          <Avatar
            src={track.coverUrl}
            sx={{ width: 48, height: 48, mr: 2 }}
          >
            <MusicNote />
          </Avatar>

          <Box sx={{ flex: 1, minWidth: 0 }}>
            <Typography variant="subtitle2" noWrap>
              {track.title}
            </Typography>
            <Typography variant="caption" color="text.secondary" noWrap>
              {track.artist || 'Unknown Artist'}
            </Typography>
          </Box>

          <Box sx={{ display: 'flex', gap: 0.5 }}>
            <IconButton size="small" onClick={(e) => {
              e.stopPropagation();
              audioPlayerService.previous();
            }}>
              <SkipPrevious />
            </IconButton>

            <IconButton
              size="small"
              onClick={(e) => {
                e.stopPropagation();
                audioPlayerService.togglePlayPause();
              }}
            >
              {playbackState.isPlaying ? <Pause /> : <PlayArrow />}
            </IconButton>

            <IconButton size="small" onClick={(e) => {
              e.stopPropagation();
              audioPlayerService.next();
            }}>
              <SkipNext />
            </IconButton>
          </Box>
        </Box>
      </Paper>
    </Slide>
  );
};

export default NowPlayingBar;
