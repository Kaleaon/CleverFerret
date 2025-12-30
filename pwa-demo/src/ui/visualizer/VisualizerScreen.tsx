/**
 * Audio Visualizer Screen
 *
 * Real-time audio visualization using Web Audio API.
 * Migrated from VisualizerScreen.kt
 */

import React, { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  ToggleButtonGroup,
  ToggleButton,
  Slider,
} from '@mui/material';
import { ArrowBack, Settings, Palette } from '@mui/icons-material';

export const VisualizerScreen: React.FC = () => {
  const navigate = useNavigate();
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const animationRef = useRef<number>();
  const analyserRef = useRef<AnalyserNode>();

  const [visualizerType, setVisualizerType] = useState<'bars' | 'wave' | 'circular'>('bars');
  const [smoothing, setSmoothing] = useState(0.8);
  const [colorScheme, setColorScheme] = useState<'rainbow' | 'mono' | 'gradient'>('rainbow');

  useEffect(() => {
    initializeVisualizer();
    return () => {
      if (animationRef.current) {
        cancelAnimationFrame(animationRef.current);
      }
    };
  }, []);

  useEffect(() => {
    if (analyserRef.current) {
      analyserRef.current.smoothingTimeConstant = smoothing;
    }
  }, [smoothing]);

  const initializeVisualizer = async () => {
    try {
      // This would connect to the actual audio source in production
      const audioContext = new (window.AudioContext || (window as any).webkitAudioContext)();
      const analyser = audioContext.createAnalyser();
      analyser.fftSize = 256;
      analyser.smoothingTimeConstant = smoothing;
      analyserRef.current = analyser;

      // In production, connect to actual audio source:
      // const source = audioContext.createMediaElementSource(audioElement);
      // source.connect(analyser);
      // analyser.connect(audioContext.destination);

      draw();
    } catch (err) {
      const { logger } = await import('../../services/logging');
      logger.error('Visualizer', 'Failed to initialize visualizer', undefined, err as Error);
    }
  };

  const draw = () => {
    const canvas = canvasRef.current;
    const analyser = analyserRef.current;

    if (!canvas || !analyser) return;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    const bufferLength = analyser.frequencyBinCount;
    const dataArray = new Uint8Array(bufferLength);

    const drawVisual = () => {
      animationRef.current = requestAnimationFrame(drawVisual);
      analyser.getByteFrequencyData(dataArray);

      const width = canvas.width;
      const height = canvas.height;

      // Clear canvas
      ctx.fillStyle = '#000';
      ctx.fillRect(0, 0, width, height);

      switch (visualizerType) {
        case 'bars':
          drawBars(ctx, dataArray, width, height);
          break;
        case 'wave':
          drawWave(ctx, dataArray, width, height);
          break;
        case 'circular':
          drawCircular(ctx, dataArray, width, height);
          break;
      }
    };

    drawVisual();
  };

  const drawBars = (
    ctx: CanvasRenderingContext2D,
    dataArray: Uint8Array,
    width: number,
    height: number,
  ) => {
    const barWidth = width / dataArray.length;

    dataArray.forEach((value, index) => {
      const barHeight = (value / 255) * height;
      const x = index * barWidth;
      const y = height - barHeight;

      const hue = (index / dataArray.length) * 360;
      ctx.fillStyle = colorScheme === 'rainbow' ? `hsl(${hue}, 100%, 50%)` : '#00ff00';
      ctx.fillRect(x, y, barWidth - 1, barHeight);
    });
  };

  const drawWave = (
    ctx: CanvasRenderingContext2D,
    dataArray: Uint8Array,
    width: number,
    height: number,
  ) => {
    ctx.lineWidth = 2;
    ctx.strokeStyle = '#00ff00';
    ctx.beginPath();

    const sliceWidth = width / dataArray.length;
    let x = 0;

    dataArray.forEach((value, index) => {
      const y = (value / 255) * height;

      if (index === 0) {
        ctx.moveTo(x, y);
      } else {
        ctx.lineTo(x, y);
      }

      x += sliceWidth;
    });

    ctx.stroke();
  };

  const drawCircular = (
    ctx: CanvasRenderingContext2D,
    dataArray: Uint8Array,
    width: number,
    height: number,
  ) => {
    const centerX = width / 2;
    const centerY = height / 2;
    const radius = Math.min(width, height) / 4;

    dataArray.forEach((value, index) => {
      const barHeight = (value / 255) * 100;
      const angle = (index / dataArray.length) * Math.PI * 2;

      const x1 = centerX + Math.cos(angle) * radius;
      const y1 = centerY + Math.sin(angle) * radius;
      const x2 = centerX + Math.cos(angle) * (radius + barHeight);
      const y2 = centerY + Math.sin(angle) * (radius + barHeight);

      const hue = (index / dataArray.length) * 360;
      ctx.strokeStyle = colorScheme === 'rainbow' ? `hsl(${hue}, 100%, 50%)` : '#00ff00';
      ctx.lineWidth = 2;
      ctx.beginPath();
      ctx.moveTo(x1, y1);
      ctx.lineTo(x2, y2);
      ctx.stroke();
    });
  };

  useEffect(() => {
    const canvas = canvasRef.current;
    if (canvas) {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight - 200;
    }
  }, []);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Audio Visualizer
          </Typography>
        </Toolbar>
      </AppBar>

      {/* Canvas */}
      <Box sx={{ flex: 1, bgcolor: 'black' }}>
        <canvas ref={canvasRef} style={{ width: '100%', height: '100%' }} />
      </Box>

      {/* Controls */}
      <Box sx={{ p: 2, bgcolor: 'background.paper' }}>
        <Box sx={{ mb: 2 }}>
          <Typography variant="subtitle2" gutterBottom>
            Visualizer Type
          </Typography>
          <ToggleButtonGroup
            value={visualizerType}
            exclusive
            onChange={(_: React.MouseEvent<HTMLElement>, value: string | null) =>
              value && setVisualizerType(value as 'bars' | 'wave' | 'circular')
            }
            fullWidth
          >
            <ToggleButton value="bars">Bars</ToggleButton>
            <ToggleButton value="wave">Wave</ToggleButton>
            <ToggleButton value="circular">Circular</ToggleButton>
          </ToggleButtonGroup>
        </Box>

        <Box sx={{ mb: 2 }}>
          <Typography variant="subtitle2" gutterBottom>
            Color Scheme
          </Typography>
          <ToggleButtonGroup
            value={colorScheme}
            exclusive
            onChange={(_: React.MouseEvent<HTMLElement>, value: string | null) =>
              value && setColorScheme(value as 'rainbow' | 'mono' | 'gradient')
            }
            fullWidth
          >
            <ToggleButton value="rainbow">Rainbow</ToggleButton>
            <ToggleButton value="mono">Mono</ToggleButton>
            <ToggleButton value="gradient">Gradient</ToggleButton>
          </ToggleButtonGroup>
        </Box>

        <Box>
          <Typography variant="subtitle2" gutterBottom>
            Smoothing: {smoothing.toFixed(2)}
          </Typography>
          <Slider
            value={smoothing}
            min={0}
            max={1}
            step={0.05}
            onChange={(_: Event, value: number | number[]) => setSmoothing(value as number)}
          />
        </Box>
      </Box>
    </Box>
  );
};

export default VisualizerScreen;
