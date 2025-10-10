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
  CardActionArea,
  Button,
  TextField,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Chip,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  PlayArrow,
  Stop,
  Favorite,
  FavoriteBorder,
  Radio as RadioIcon,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { RadioStation } from '../../data/local/entity';

export const RadioScreen: React.FC = () => {
  const navigate = useNavigate();
  const [stations, setStations] = useState<RadioStation[]>([]);
  const [playingStationId, setPlayingStationId] = useState<number | null>(null);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [newStationName, setNewStationName] = useState('');
  const [newStationUrl, setNewStationUrl] = useState('');
  const audioRef = React.useRef<HTMLAudioElement>(null);

  useEffect(() => {
    loadStations();
  }, []);

  const loadStations = async () => {
    const radioStations = await db.radioStations.orderBy('name').toArray();
    setStations(radioStations);
  };

  const handlePlayStation = (station: RadioStation) => {
    if (playingStationId === station.id) {
      // Stop
      audioRef.current?.pause();
      setPlayingStationId(null);
    } else {
      // Play
      if (audioRef.current) {
        audioRef.current.src = station.streamUrl;
        audioRef.current.play();
        setPlayingStationId(station.id);
      }
    }
  };

  const handleAddStation = async () => {
    if (!newStationName || !newStationUrl) return;

    const newStation: RadioStation = {
      id: 0,
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

    await db.radioStations.add(newStation);
    setShowAddDialog(false);
    setNewStationName('');
    setNewStationUrl('');
    loadStations();
  };

  const handleToggleFavorite = async (station: RadioStation) => {
    await db.radioStations.update(station.id, {
      isFavorite: !station.isFavorite,
    });
    loadStations();
  };

  return (
    <Box>
      <audio ref={audioRef} />

      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Internet Radio
          </Typography>
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
                      onClick={() => handleToggleFavorite(station)}
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
            <Button
              variant="contained"
              startIcon={<Add />}
              onClick={() => setShowAddDialog(true)}
              sx={{ mt: 2 }}
            >
              Add Station
            </Button>
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
    </Box>
  );
};

export default RadioScreen;
