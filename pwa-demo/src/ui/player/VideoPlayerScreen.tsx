/**
 * Modern Video Player Screen
 * 
 * Clean video player with gesture controls and overlay UI.
 * Migrated from ModernVideoPlayerScreen.kt
 */

import React, { useRef, useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Slider,
  Typography,
  Stack,
  CircularProgress,
  Fade,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
  SkipNext,
  SkipPrevious,
  VolumeUp,
  Settings,
  Fullscreen,
  FullscreenExit,
  Forward10,
  Replay10,
} from '@mui/icons-material';

export const VideoPlayerScreen: React.FC = () => {
  const { videoPath } = useParams<{ videoPath: string }>();
  const navigate = useNavigate();
  const videoRef = useRef<HTMLVideoElement>(null);

  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [volume, setVolume] = useState(1);
  const [showControls, setShowControls] = useState(true);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  // Hide controls after 3 seconds of inactivity
  useEffect(() => {
    if (!showControls) return;

    const timer = setTimeout(() => {
      if (isPlaying) {
        setShowControls(false);
      }
    }, 3000);

    return () => clearTimeout(timer);
  }, [showControls, isPlaying]);

  useEffect(() => {
    const video = videoRef.current;
    if (!video) return;

    const handleTimeUpdate = () => setCurrentTime(video.currentTime);
    const handleDurationChange = () => setDuration(video.duration);
    const handleCanPlay = () => setIsLoading(false);
    const handleWaiting = () => setIsLoading(true);
    const handlePlay = () => setIsPlaying(true);
    const handlePause = () => setIsPlaying(false);

    video.addEventListener('timeupdate', handleTimeUpdate);
    video.addEventListener('durationchange', handleDurationChange);
    video.addEventListener('canplay', handleCanPlay);
    video.addEventListener('waiting', handleWaiting);
    video.addEventListener('play', handlePlay);
    video.addEventListener('pause', handlePause);

    return () => {
      video.removeEventListener('timeupdate', handleTimeUpdate);
      video.removeEventListener('durationchange', handleDurationChange);
      video.removeEventListener('canplay', handleCanPlay);
      video.removeEventListener('waiting', handleWaiting);
      video.removeEventListener('play', handlePlay);
      video.removeEventListener('pause', handlePause);
    };
  }, []);

  const togglePlay = () => {
    if (videoRef.current) {
      if (isPlaying) {
        videoRef.current.pause();
      } else {
        videoRef.current.play();
      }
    }
  };

  const handleSeek = (_: Event, value: number | number[]) => {
    if (videoRef.current) {
      videoRef.current.currentTime = value as number;
      setCurrentTime(value as number);
    }
  };

  const handleVolumeChange = (_: Event, value: number | number[]) => {
    if (videoRef.current) {
      const vol = (value as number) / 100;
      videoRef.current.volume = vol;
      setVolume(vol);
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

  const skip = (seconds: number) => {
    if (videoRef.current) {
      videoRef.current.currentTime = Math.max(
        0,
        Math.min(duration, currentTime + seconds)
      );
    }
  };

  const formatTime = (seconds: number): string => {
    if (isNaN(seconds)) return '0:00';
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <Box
      sx={{
        height: '100vh',
        bgcolor: 'black',
        position: 'relative',
        overflow: 'hidden',
      }}
      onClick={() => setShowControls(!showControls)}
    >
      {/* Video Element */}
      <video
        ref={videoRef}
        src={videoPath ? decodeURIComponent(videoPath) : ''}
        style={{
          width: '100%',
          height: '100%',
          objectFit: 'contain',
        }}
      />

      {/* Loading Indicator */}
      {isLoading && (
        <Box
          sx={{
            position: 'absolute',
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
          }}
        >
          <CircularProgress sx={{ color: 'white' }} />
        </Box>
      )}

      {/* Controls Overlay */}
      <Fade in={showControls}>
        <Box
          sx={{
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            pointerEvents: showControls ? 'auto' : 'none',
          }}
        >
          {/* Top Gradient */}
          <Box
            sx={{
              background: 'linear-gradient(180deg, rgba(0,0,0,0.7) 0%, transparent 100%)',
              p: 2,
            }}
          >
            <IconButton onClick={() => navigate(-1)} sx={{ color: 'white' }}>
              <ArrowBack />
            </IconButton>
          </Box>

          {/* Center Play/Pause */}
          <Box
            sx={{
              position: 'absolute',
              top: '50%',
              left: '50%',
              transform: 'translate(-50%, -50%)',
            }}
          >
            <IconButton
              onClick={(e) => {
                e.stopPropagation();
                togglePlay();
              }}
              sx={{
                bgcolor: alpha('#fff', 0.2),
                width: 80,
                height: 80,
                '&:hover': {
                  bgcolor: alpha('#fff', 0.3),
                },
              }}
            >
              {isPlaying ? (
                <Pause sx={{ fontSize: 40, color: 'white' }} />
              ) : (
                <PlayArrow sx={{ fontSize: 40, color: 'white' }} />
              )}
            </IconButton>
          </Box>

          {/* Bottom Controls */}
          <Box
            sx={{
              position: 'absolute',
              bottom: 0,
              left: 0,
              right: 0,
              background: 'linear-gradient(0deg, rgba(0,0,0,0.7) 0%, transparent 100%)',
              p: 2,
            }}
          >
            {/* Progress Bar */}
            <Box sx={{ px: 2, mb: 1 }}>
              <Slider
                value={currentTime}
                max={duration || 100}
                onChange={handleSeek}
                sx={{
                  color: 'white',
                  '& .MuiSlider-thumb': {
                    width: 14,
                    height: 14,
                  },
                }}
              />
              <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
                <Typography variant="caption" sx={{ color: 'white' }}>
                  {formatTime(currentTime)}
                </Typography>
                <Typography variant="caption" sx={{ color: 'white' }}>
                  {formatTime(duration)}
                </Typography>
              </Box>
            </Box>

            {/* Control Buttons */}
            <Stack
              direction="row"
              spacing={1}
              alignItems="center"
              justifyContent="space-between"
              sx={{ px: 2 }}
            >
              <Box sx={{ display: 'flex', alignItems: 'center', gap: 1 }}>
                <VolumeUp sx={{ color: 'white' }} />
                <Slider
                  value={volume * 100}
                  onChange={handleVolumeChange}
                  sx={{ width: 100, color: 'white' }}
                />
              </Box>

              <Stack direction="row" spacing={1}>
                <IconButton onClick={() => skip(-10)} sx={{ color: 'white' }}>
                  <Replay10 />
                </IconButton>
                <IconButton onClick={() => skip(10)} sx={{ color: 'white' }}>
                  <Forward10 />
                </IconButton>
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

export default VideoPlayerScreen;
