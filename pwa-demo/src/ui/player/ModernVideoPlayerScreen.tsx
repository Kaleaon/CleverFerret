/**
 * Modern Video Player Screen
 *
 * Enhanced video player with gesture controls and overlay UI.
 * Migrated from ModernVideoPlayerScreen.kt
 */

import React, { useRef, useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { Box, IconButton, Slider, Typography, Stack, Fade } from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  VolumeUp,
  Settings,
  Fullscreen,
  FullscreenExit,
  Forward10,
  Replay10,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { MediaItem } from '../../data/local/entity';

export const ModernVideoPlayerScreen: React.FC = () => {
  const { videoId } = useParams<{ videoId: string }>();
  const navigate = useNavigate();
  const videoRef = useRef<HTMLVideoElement>(null);

  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [volume, setVolume] = useState(100);
  const [showControls, setShowControls] = useState(true);
  const [isFullscreen, setIsFullscreen] = useState(false);

  useEffect(() => {
    loadVideoData();
  }, [videoId]);

  useEffect(() => {
    const timer = setTimeout(() => {
      if (isPlaying) setShowControls(false);
    }, 3000);
    return () => clearTimeout(timer);
  }, [showControls, isPlaying]);

  const loadVideoData = async () => {
    if (!videoId) return;
    const item = await db.mediaItems.get(parseInt(videoId));
    setMediaItem(item || null);
  };

  const handlePlayPause = () => {
    if (videoRef.current) {
      if (isPlaying) {
        videoRef.current.pause();
      } else {
        videoRef.current.play();
      }
      setIsPlaying(!isPlaying);
    }
  };

  const handleSeek = (value: number) => {
    if (videoRef.current) {
      videoRef.current.currentTime = value;
      setCurrentTime(value);
    }
  };

  const handleSkip = (seconds: number) => {
    if (videoRef.current) {
      videoRef.current.currentTime += seconds;
    }
  };

  const toggleFullscreen = () => {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen();
      setIsFullscreen(true);
    } else {
      document.exitFullscreen();
      setIsFullscreen(false);
    }
  };

  const formatTime = (seconds: number): string => {
    const hrs = Math.floor(seconds / 3600);
    const mins = Math.floor((seconds % 3600) / 60);
    const secs = Math.floor(seconds % 60);
    if (hrs > 0) {
      return `${hrs}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <Box
      sx={{
        position: 'relative',
        width: '100vw',
        height: '100vh',
        bgcolor: 'black',
        overflow: 'hidden',
      }}
      onClick={() => setShowControls(true)}
    >
      {/* Video Element */}
      <video
        ref={videoRef}
        src={mediaItem?.filePath}
        style={{
          width: '100%',
          height: '100%',
          objectFit: 'contain',
        }}
        onTimeUpdate={(e) => setCurrentTime((e.target as HTMLVideoElement).currentTime)}
        onLoadedMetadata={(e) => setDuration((e.target as HTMLVideoElement).duration)}
      />

      {/* Controls Overlay */}
      <Fade in={showControls}>
        <Box
          sx={{
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            background:
              'linear-gradient(to bottom, rgba(0,0,0,0.7) 0%, transparent 20%, transparent 80%, rgba(0,0,0,0.7) 100%)',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-between',
            padding: 2,
          }}
        >
          {/* Top Bar */}
          <Stack direction="row" justifyContent="space-between" alignItems="center">
            <IconButton onClick={() => navigate(-1)} sx={{ color: 'white' }}>
              <ArrowBack />
            </IconButton>
            <Typography variant="h6" sx={{ color: 'white', flexGrow: 1, ml: 2 }}>
              {mediaItem?.fileName || 'Video'}
            </Typography>
            <IconButton sx={{ color: 'white' }}>
              <Settings />
            </IconButton>
          </Stack>

          {/* Center Controls */}
          <Stack direction="row" spacing={4} justifyContent="center" alignItems="center">
            <IconButton onClick={() => handleSkip(-10)} sx={{ color: 'white', fontSize: '3rem' }}>
              <Replay10 fontSize="inherit" />
            </IconButton>
            <IconButton
              onClick={handlePlayPause}
              sx={{
                color: 'white',
                bgcolor: 'rgba(255,255,255,0.2)',
                width: 80,
                height: 80,
                '&:hover': { bgcolor: 'rgba(255,255,255,0.3)' },
              }}
            >
              {isPlaying ? (
                <Pause sx={{ fontSize: '3rem' }} />
              ) : (
                <PlayArrow sx={{ fontSize: '3rem' }} />
              )}
            </IconButton>
            <IconButton onClick={() => handleSkip(10)} sx={{ color: 'white', fontSize: '3rem' }}>
              <Forward10 fontSize="inherit" />
            </IconButton>
          </Stack>

          {/* Bottom Controls */}
          <Box>
            {/* Progress Bar */}
            <Stack direction="row" spacing={2} alignItems="center" sx={{ mb: 1 }}>
              <Typography variant="caption" sx={{ color: 'white', minWidth: 60 }}>
                {formatTime(currentTime)}
              </Typography>
              <Slider
                value={currentTime}
                max={duration}
                onChange={(_, value) => handleSeek(value as number)}
                sx={{
                  color: 'white',
                  '& .MuiSlider-thumb': { width: 16, height: 16 },
                }}
              />
              <Typography variant="caption" sx={{ color: 'white', minWidth: 60 }}>
                {formatTime(duration)}
              </Typography>
            </Stack>

            {/* Additional Controls */}
            <Stack direction="row" justifyContent="space-between" alignItems="center">
              <Stack direction="row" spacing={1} alignItems="center">
                <VolumeUp sx={{ color: 'white' }} />
                <Slider
                  value={volume}
                  onChange={(_, value) => setVolume(value as number)}
                  sx={{ width: 100, color: 'white' }}
                />
              </Stack>
              <IconButton onClick={toggleFullscreen} sx={{ color: 'white' }}>
                {isFullscreen ? <FullscreenExit /> : <Fullscreen />}
              </IconButton>
            </Stack>
          </Box>
        </Box>
      </Fade>
    </Box>
  );
};

export default ModernVideoPlayerScreen;
