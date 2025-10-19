/**
 * Mini Player Bar Component
 * 
 * Enhanced mini player with parity to Android MiniPlayerBar.kt
 * Features:
 * - Album artwork with media type-specific gradients
 * - Progress indicator
 * - Compact layout optimized for bottom bar
 * - Smooth animations
 * - Audiobook/video controls (10s/30s skip)
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Paper,
  Typography,
  IconButton,
  LinearProgress,
  Slide,
  Avatar,
  useTheme,
  useMediaQuery,
} from '@mui/material';
import {
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  Forward10,
  Replay10,
  MusicNote,
  Headphones,
  Book,
  Movie,
  PlayCircle,
} from '@mui/icons-material';

import { audioPlayerService } from '../services/playback/AudioPlayerService';
import type { PlaybackState } from '../services/playback/AudioPlayerService';

interface MiniPlayerBarProps {
  /** Additional click handler when bar is clicked */
  onExpand?: () => void;
}

export const MiniPlayerBar: React.FC<MiniPlayerBarProps> = ({ onExpand }) => {
  const navigate = useNavigate();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));
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
  const mediaType = track.mediaType || 'music';
  
  // Determine if we're playing audiobook or video (for chapter controls)
  const isAudiobookOrVideo = mediaType === 'audiobook' || mediaType === 'video';

  const handleClick = () => {
    if (onExpand) {
      onExpand();
    } else {
      navigate('/audio_player');
    }
  };

  const handleSkip10Forward = (e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.seek(playbackState.currentTime + 10);
  };

  const handleSkip10Backward = (e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.seek(Math.max(0, playbackState.currentTime - 10));
  };

  const handlePlayPause = (e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.togglePlayPause();
  };

  const handleNext = (e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.next();
  };

  const handlePrevious = (e: React.MouseEvent) => {
    e.stopPropagation();
    audioPlayerService.previous();
  };

  // Media type-specific colors and icons (matching Android implementation)
  const getMediaTypeStyle = () => {
    const typeUpper = mediaType.toUpperCase();
    switch (typeUpper) {
      case 'MUSIC':
      case 'MUSIC_TRACK':
        return {
          gradient: ['#4A148C', '#9C27B0'],
          icon: <MusicNote />,
        };
      case 'AUDIOBOOK':
      case 'PODCAST':
        return {
          gradient: ['#0D1F12', '#4A7C59'],
          icon: <Headphones />,
        };
      case 'BOOK':
        return {
          gradient: ['#1B5E20', '#4CAF50'],
          icon: <Book />,
        };
      case 'VIDEO':
      case 'MOVIE':
        return {
          gradient: ['#0D47A1', '#2196F3'],
          icon: <Movie />,
        };
      default:
        return {
          gradient: ['#37474F', '#78909C'],
          icon: <PlayCircle />,
        };
    }
  };

  const { gradient, icon } = getMediaTypeStyle();

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
          cursor: 'pointer',
        }}
        onClick={handleClick}
      >
        {/* Progress indicator */}
        <LinearProgress 
          variant="determinate" 
          value={progress} 
          sx={{ height: 2 }}
        />

        <Box
          sx={{
            display: 'flex',
            alignItems: 'center',
            gap: 1.5,
            p: 1.5,
            px: 2,
          }}
        >
          {/* Album artwork / Media type icon */}
          {track.artwork ? (
            <Avatar
              src={track.artwork}
              variant="rounded"
              sx={{ width: 48, height: 48 }}
            />
          ) : (
            <Box
              sx={{
                width: 48,
                height: 48,
                borderRadius: 1,
                background: `linear-gradient(135deg, ${gradient[0]}, ${gradient[1]})`,
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: 'white',
                opacity: 0.8,
              }}
            >
              {icon}
            </Box>
          )}

          {/* Title and artist */}
          <Box sx={{ flex: 1, minWidth: 0 }}>
            <Typography 
              variant="body1" 
              fontWeight="medium" 
              noWrap
              sx={{ lineHeight: 1.3 }}
            >
              {track.title}
            </Typography>
            <Typography 
              variant="body2" 
              color="text.secondary" 
              noWrap
              sx={{ lineHeight: 1.3 }}
            >
              {track.artist || track.album || 'Unknown'}
            </Typography>
          </Box>

          {/* Playback controls */}
          <Box
            sx={{
              display: 'flex',
              alignItems: 'center',
              gap: { xs: 0, sm: 0.5 },
            }}
          >
            {/* Show skip controls for audiobooks/videos, or desktop mode */}
            {(isAudiobookOrVideo || !isMobile) && (
              <>
                {isAudiobookOrVideo && (
                  <IconButton 
                    size="small" 
                    onClick={handleSkip10Backward}
                    title="Rewind 10s"
                  >
                    <Replay10 fontSize="small" />
                  </IconButton>
                )}
                
                {!isMobile && (
                  <IconButton 
                    size="small" 
                    onClick={handlePrevious}
                    title={isAudiobookOrVideo ? 'Previous Chapter' : 'Previous Track'}
                  >
                    <SkipPrevious fontSize="small" />
                  </IconButton>
                )}
              </>
            )}

            {/* Play/Pause button */}
            <IconButton
              size={isMobile ? 'medium' : 'large'}
              onClick={handlePlayPause}
              sx={{
                color: 'primary.main',
              }}
            >
              {playbackState.isPlaying ? <Pause /> : <PlayArrow />}
            </IconButton>

            {/* Next and forward controls */}
            {(isAudiobookOrVideo || !isMobile) && (
              <>
                {!isMobile && (
                  <IconButton 
                    size="small" 
                    onClick={handleNext}
                    title={isAudiobookOrVideo ? 'Next Chapter' : 'Next Track'}
                  >
                    <SkipNext fontSize="small" />
                  </IconButton>
                )}
                
                {isAudiobookOrVideo && (
                  <IconButton 
                    size="small" 
                    onClick={handleSkip10Forward}
                    title="Forward 10s"
                  >
                    <Forward10 fontSize="small" />
                  </IconButton>
                )}
              </>
            )}
          </Box>
        </Box>
      </Paper>
    </Slide>
  );
};

/**
 * Compact Mini Player (for very small screens or embedded use)
 */
export const CompactMiniPlayer: React.FC<{
  title: string;
  isPlaying: boolean;
  onPlayPause: () => void;
  onClick: () => void;
}> = ({ title, isPlaying, onPlayPause, onClick }) => {
  return (
    <Paper
      elevation={4}
      sx={{
        position: 'fixed',
        bottom: 0,
        left: 0,
        right: 0,
        zIndex: 1300,
        cursor: 'pointer',
      }}
      onClick={onClick}
    >
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          p: 1.5,
          gap: 1.5,
        }}
      >
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 1.5, flex: 1, minWidth: 0 }}>
          <MusicNote fontSize="small" />
          <Typography variant="body2" fontWeight="medium" noWrap>
            {title}
          </Typography>
        </Box>

        <IconButton 
          size="small" 
          onClick={(e) => {
            e.stopPropagation();
            onPlayPause();
          }}
        >
          {isPlaying ? <Pause /> : <PlayArrow />}
        </IconButton>
      </Box>
    </Paper>
  );
};

export default MiniPlayerBar;
