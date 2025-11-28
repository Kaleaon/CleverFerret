/**
 * Radio Screen
 * 
 * Internet radio streaming with station management.
 * Migrated from RadioScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Grid,
  Card,
  CardContent,
  Button,
  TextField,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Chip,
  Paper,
  Slider,
  Snackbar,
  Alert,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  PlayArrow,
  Stop,
  Pause,
  Favorite,
  FavoriteBorder,
  Radio as RadioIcon,
  Search,
  VolumeUp,
  FiberManualRecord,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { RadioStation } from '../../data/local/entity';

export const RadioScreen: React.FC = () => {
  const navigate = useNavigate();
  const [stations, setStations] = useState<RadioStation[]>([]);
  const [playingStationId, setPlayingStationId] = useState<number | null>(null);
  const [playingStation, setPlayingStation] = useState<RadioStation | null>(null);
  const [isPaused, setIsPaused] = useState(false);
  const [volume, setVolume] = useState(0.7);
  const [isRecording, setIsRecording] = useState(false);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [newStationName, setNewStationName] = useState('');
  const [newStationUrl, setNewStationUrl] = useState('');
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const audioRef = React.useRef<HTMLAudioElement>(null);
  const mediaRecorderRef = React.useRef<MediaRecorder | null>(null);
  const recordedChunksRef = React.useRef<Blob[]>([]);

  useEffect(() => {
    loadStations();
  }, []);

  useEffect(() => {
    if (audioRef.current) {
      audioRef.current.volume = volume;
    }
  }, [volume]);

  const loadStations = async () => {
    const radioStations = await db.radioStations.orderBy('name').toArray();
    setStations(radioStations);
  };

  const handlePlayStation = async (station: RadioStation) => {
    if (playingStationId === station.id) {
      // Stop
      audioRef.current?.pause();
      setPlayingStationId(null);
      setPlayingStation(null);
      setIsPaused(false);
      if (isRecording) {
        stopRecording();
      }
    } else {
      // Play
      if (audioRef.current) {
        try {
          audioRef.current.src = station.streamUrl;
          
          // Set up error handler before playing
          audioRef.current.onerror = () => {
            const error = audioRef.current?.error;
            let errorMsg = `Failed to play stream: ${station.name}. `;
            
            if (error) {
              switch (error.code) {
                case error.MEDIA_ERR_NETWORK:
                  errorMsg += 'Network error - stream may be offline or blocked by CORS.';
                  break;
                case error.MEDIA_ERR_DECODE:
                  errorMsg += 'Audio format not supported.';
                  break;
                case error.MEDIA_ERR_SRC_NOT_SUPPORTED:
                  errorMsg += 'Stream URL not supported or invalid.';
                  break;
                default:
                  errorMsg += 'The stream may not be available.';
              }
            } else {
              errorMsg += 'The stream may not be available.';
            }
            
            setErrorMessage(errorMsg);
            setPlayingStationId(null);
            setPlayingStation(null);
          };
          
          await audioRef.current.play();
          setPlayingStationId(station.id);
          setPlayingStation(station);
          setIsPaused(false);
          
          // Update play count and last played time
          if (station.id) {
            await db.radioStations.update(station.id, {
              lastPlayedAt: Date.now(),
              playCount: station.playCount + 1,
            });
          }
        } catch (err) {
          console.error('Failed to play station:', err);
          const errorMsg = err instanceof Error && err.name === 'NotAllowedError'
            ? `Cannot play automatically. Please click the Play button again to start playback.`
            : `Failed to play stream: ${station.name}. The stream may not be available or blocked by your browser.`;
          setErrorMessage(errorMsg);
        }
      }
    }
  };

  const handlePauseResume = () => {
    if (!audioRef.current) return;
    
    if (isPaused) {
      audioRef.current.play();
      setIsPaused(false);
    } else {
      audioRef.current.pause();
      setIsPaused(true);
    }
  };

  const handleVolumeChange = (_event: Event, newValue: number | number[]) => {
    setVolume(newValue as number);
  };

  const startRecording = async () => {
    if (!audioRef.current) return;

    try {
      // Create a MediaStream from the audio element
      const stream = (audioRef.current as any).captureStream 
        ? (audioRef.current as any).captureStream()
        : (audioRef.current as any).mozCaptureStream?.();

      if (!stream) {
        setErrorMessage('Recording not supported in this browser');
        return;
      }

      const mediaRecorder = new MediaRecorder(stream);
      mediaRecorderRef.current = mediaRecorder;
      recordedChunksRef.current = [];

      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          recordedChunksRef.current.push(event.data);
        }
      };

      mediaRecorder.onstop = () => {
        const blob = new Blob(recordedChunksRef.current, { type: 'audio/webm' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `${playingStation?.name || 'recording'}_${new Date().toISOString()}.webm`;
        a.click();
        URL.revokeObjectURL(url);
      };

      mediaRecorder.start();
      setIsRecording(true);
      setErrorMessage(null);
    } catch (error) {
      console.error('Failed to start recording:', error);
      setErrorMessage('Failed to start recording. This feature requires browser support.');
    }
  };

  const stopRecording = () => {
    if (mediaRecorderRef.current && isRecording) {
      mediaRecorderRef.current.stop();
      setIsRecording(false);
    }
  };

  const handleAddStation = async () => {
    if (!newStationName || !newStationUrl) return;

    // Don't include id - Dexie auto-generates it with ++id schema
    const newStation: Omit<RadioStation, 'id'> = {
      name: newStationName,
      description: undefined,
      streamUrl: newStationUrl,
      websiteUrl: undefined,
      logoUrl: undefined,
      genre: undefined,
      country: undefined,
      language: undefined,
      bitrate: undefined,
      codec: undefined,
      isFavorite: false,
      customOrder: 0,
      tags: undefined,
      addedAt: Date.now(),
      lastPlayedAt: undefined,
      playCount: 0,
    };

    await db.radioStations.add(newStation as RadioStation);
    setShowAddDialog(false);
    setNewStationName('');
    setNewStationUrl('');
    loadStations();
  };

  const handleToggleFavorite = async (station: RadioStation) => {
    if (!station.id) {
      console.error('Station ID is undefined');
      return;
    }
    try {
      await db.radioStations.update(station.id, {
        isFavorite: !station.isFavorite,
      });
      loadStations();
    } catch (error) {
      console.error('Failed to update favorite status:', error);
    }
  };

  return (
    <Box>
      <audio 
        ref={audioRef}
        crossOrigin="anonymous"
        preload="none"
      />

      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Internet Radio
          </Typography>
          <Button
            color="inherit"
            startIcon={<Search />}
            onClick={() => navigate('/radio/discover')}
            sx={{ mr: 1 }}
          >
            Discover
          </Button>
          <IconButton color="inherit" onClick={() => setShowAddDialog(true)}>
            <Add />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 3 }}>
        <Grid container spacing={2}>
          {stations.map((station) => (
            <Grid item xs={12} sm={6} md={4} key={station.id}>
              <Card>
                <CardContent>
                  <Box sx={{ display: 'flex', alignItems: 'start', mb: 2 }}>
                    <RadioIcon sx={{ fontSize: 40, color: 'primary.main', mr: 2 }} />
                    <Box sx={{ flex: 1 }}>
                      <Typography variant="h6" noWrap>
                        {station.name}
                      </Typography>
                      {station.genre && (
                        <Chip label={station.genre} size="small" sx={{ mt: 0.5 }} />
                      )}
                    </Box>
                    <IconButton
                      size="small"
                      onClick={(e) => {
                        e.stopPropagation();
                        handleToggleFavorite(station);
                      }}
                    >
                      {station.isFavorite ? <Favorite color="error" /> : <FavoriteBorder />}
                    </IconButton>
                  </Box>

                  {station.description && (
                    <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
                      {station.description}
                    </Typography>
                  )}

                  <Button
                    variant={playingStationId === station.id ? 'contained' : 'outlined'}
                    startIcon={playingStationId === station.id ? <Stop /> : <PlayArrow />}
                    fullWidth
                    onClick={() => handlePlayStation(station)}
                  >
                    {playingStationId === station.id ? 'Stop' : 'Play'}
                  </Button>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>

        {stations.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <RadioIcon sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6" gutterBottom>
              No Radio Stations
            </Typography>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              Add your favorite radio stations
            </Typography>
            <Box sx={{ mt: 2, display: 'flex', gap: 2, justifyContent: 'center' }}>
              <Button
                variant="contained"
                startIcon={<Search />}
                onClick={() => navigate('/radio/discover')}
              >
                Discover Stations
              </Button>
              <Button
                variant="outlined"
                startIcon={<Add />}
                onClick={() => setShowAddDialog(true)}
              >
                Add by URL
              </Button>
            </Box>
          </Box>
        )}
      </Box>

      {/* Add Station Dialog */}
      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Add Radio Station</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Station Name"
            fullWidth
            value={newStationName}
            onChange={(e) => setNewStationName(e.target.value)}
          />
          <TextField
            margin="dense"
            label="Stream URL"
            fullWidth
            value={newStationUrl}
            onChange={(e) => setNewStationUrl(e.target.value)}
            placeholder="https://example.com/stream.mp3"
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button
            onClick={handleAddStation}
            variant="contained"
            disabled={!newStationName || !newStationUrl}
          >
            Add
          </Button>
        </DialogActions>
      </Dialog>

      {/* Now Playing Bar */}
      {playingStation && (
        <Paper
          sx={{
            position: 'fixed',
            bottom: 0,
            left: 80,
            right: 0,
            p: 2,
            borderTop: 1,
            borderColor: 'divider',
            bgcolor: 'background.paper',
            zIndex: 1100,
          }}
        >
          <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
            <RadioIcon sx={{ fontSize: 40, color: 'primary.main' }} />
            <Box sx={{ flex: 1 }}>
              <Typography variant="subtitle1" fontWeight="bold">
                {playingStation.name}
              </Typography>
              {playingStation.genre && (
                <Typography variant="caption" color="text.secondary">
                  {playingStation.genre}
                </Typography>
              )}
            </Box>

            <IconButton 
              color="primary" 
              onClick={handlePauseResume}
              size="large"
            >
              {isPaused ? <PlayArrow /> : <Pause />}
            </IconButton>

            <IconButton
              color={isRecording ? 'error' : 'default'}
              onClick={isRecording ? stopRecording : startRecording}
              size="large"
              title={isRecording ? 'Stop Recording' : 'Start Recording'}
            >
              <FiberManualRecord />
            </IconButton>

            <IconButton
              color="error"
              onClick={() => playingStation && handlePlayStation(playingStation)}
              size="large"
              title="Stop"
            >
              <Stop />
            </IconButton>

            <Box sx={{ display: 'flex', alignItems: 'center', minWidth: 200 }}>
              <VolumeUp sx={{ mr: 1 }} />
              <Slider
                value={volume}
                onChange={handleVolumeChange}
                min={0}
                max={1}
                step={0.01}
                sx={{ width: 150 }}
              />
            </Box>
          </Box>
        </Paper>
      )}

      {/* Error Snackbar */}
      <Snackbar
        open={!!errorMessage}
        autoHideDuration={6000}
        onClose={() => setErrorMessage(null)}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <Alert onClose={() => setErrorMessage(null)} severity="error" sx={{ width: '100%' }}>
          {errorMessage}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default RadioScreen;
