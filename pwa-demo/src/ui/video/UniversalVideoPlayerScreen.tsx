/**
 * Universal Video Player Screen
 * Migrated from UniversalVideoPlayerScreen.kt
 */

import React, { useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Fade,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
  Pause,
} from '@mui/icons-material';

export const UniversalVideoPlayerScreen: React.FC = () => {
  const { videoId } = useParams();
  const navigate = useNavigate();
  const [isPlaying, setIsPlaying] = useState(false);
  const [showControls, setShowControls] = useState(true);

  return (
    <Box
      sx={{ position: 'relative', width: '100vw', height: '100vh', bgcolor: 'black' }}
      onClick={() => setShowControls(!showControls)}
    >
      <video style={{ width: '100%', height: '100%', objectFit: 'contain' }} />

      <Fade in={showControls}>
        <Box sx={{ position: 'absolute', top: 0, left: 0, right: 0, p: 2, background: 'linear-gradient(to bottom, rgba(0,0,0,0.7), transparent)' }}>
          <IconButton onClick={() => navigate(-1)} sx={{ color: 'white' }}>
            <ArrowBack />
          </IconButton>
        </Box>
      </Fade>

      <Fade in={showControls}>
        <Box sx={{ position: 'absolute', bottom: '50%', left: '50%', transform: 'translate(-50%, 50%)' }}>
          <IconButton onClick={() => setIsPlaying(!isPlaying)} sx={{ color: 'white', width: 80, height: 80, bgcolor: 'rgba(255,255,255,0.2)' }}>
            {isPlaying ? <Pause sx={{ fontSize: 48 }} /> : <PlayArrow sx={{ fontSize: 48 }} />}
          </IconButton>
        </Box>
      </Fade>
    </Box>
  );
};

export default UniversalVideoPlayerScreen;
