/**
 * Radio Discovery Screen
 * 
 * Discover and browse internet radio stations using Shoutcast API.
 * Features genre browsing, search, and trending stations.
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  TextField,
  InputAdornment,
  Tabs,
  Tab,
  Card,
  CardContent,
  CardActions,
  Grid,
  Button,
  Chip,
  CircularProgress,
  Alert,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Snackbar,
  Avatar,
} from '@mui/material';
import {
  ArrowBack,
  Search as SearchIcon,
  TrendingUp,
  Category,
  Radio as RadioIcon,
  PlayArrow,
  Stop,
  Favorite,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { RadioStation } from '../../data/local/entity';

// Radio-Browser API - Free and open-source radio station directory
// Using the main API endpoint which load-balances across multiple servers
const RADIO_BROWSER_BASE_URL = 'https://api.radio-browser.info/json';

interface RadioBrowserStation {
  stationuuid: string;
  name: string;
  url: string;
  url_resolved: string;
  homepage: string;
  favicon: string;
  tags: string;
  country: string;
  countrycode: string;
  state: string;
  language: string;
  votes: number;
  codec: string;
  bitrate: number;
  clickcount: number;
  clicktrend: number;
}

interface Genre {
  name: string;
  stationcount?: number;
}

export const RadioDiscoveryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedGenre, setSelectedGenre] = useState('');
  const [searching, setSearching] = useState(false);
  const [results, setResults] = useState<RadioBrowserStation[]>([]);
  const [genres, setGenres] = useState<Genre[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [playingStationId, setPlayingStationId] = useState<string | null>(null);
  const [playError, setPlayError] = useState<string | null>(null);
  const audioRef = React.useRef<HTMLAudioElement>(null);

  // Popular tags/genres from Radio-Browser
  const popularGenres = [
    'pop', 'rock', 'jazz', 'classical', 'electronic',
    'dance', 'hip hop', 'country', 'blues', 'reggae',
    'folk', 'latin', 'world', 'news', 'talk',
    'sports', 'oldies', 'indie', 'metal', 'punk'
  ];

  useEffect(() => {
    if (tabValue === 1) {
      loadPopularStations();
    } else if (tabValue === 2) {
      setGenres(popularGenres.map(g => ({ name: g })));
    }
  }, [tabValue]);

  const handleSearch = async () => {
    if (!searchQuery.trim()) return;

    setSearching(true);
    setError(null);

    try {
      const response = await fetch(
        `${RADIO_BROWSER_BASE_URL}/stations/byname/${encodeURIComponent(searchQuery)}?limit=50&hidebroken=true`
      );
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      const stations: RadioBrowserStation[] = await response.json();
      setResults(stations);
      
      if (stations.length === 0) {
        setError('No stations found. Try a different search term.');
      }
    } catch (err) {
      console.error('Station search error:', err);
      setError('Failed to search stations. Please try again.');
      setResults([]);
    } finally {
      setSearching(false);
    }
  };

  const loadPopularStations = async () => {
    setSearching(true);
    setError(null);

    try {
      // Get top stations by votes
      const response = await fetch(
        `${RADIO_BROWSER_BASE_URL}/stations/topvote/50?hidebroken=true`
      );
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      const stations: RadioBrowserStation[] = await response.json();
      setResults(stations);
    } catch (err) {
      console.error('Popular stations error:', err);
      setError('Failed to load popular stations. Please try again.');
      setResults([]);
    } finally {
      setSearching(false);
    }
  };

  const loadGenreStations = async (genre: string) => {
    if (!genre) return;

    setSearching(true);
    setError(null);

    try {
      const response = await fetch(
        `${RADIO_BROWSER_BASE_URL}/stations/bytag/${encodeURIComponent(genre)}?limit=50&hidebroken=true`
      );
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      const stations: RadioBrowserStation[] = await response.json();
      setResults(stations);
      
      if (stations.length === 0) {
        setError(`No stations found for genre: ${genre}`);
      }
    } catch (err) {
      console.error('Genre search error:', err);
      setError('Failed to load genre stations. Please try again.');
      setResults([]);
    } finally {
      setSearching(false);
    }
  };

  const handlePlayStation = async (station: RadioBrowserStation) => {
    if (playingStationId === station.stationuuid) {
      // Stop playing
      audioRef.current?.pause();
      setPlayingStationId(null);
    } else {
      // Play station
      if (audioRef.current) {
        try {
          // Register click with Radio-Browser API
          fetch(`${RADIO_BROWSER_BASE_URL}/url/${station.stationuuid}`).catch((err) => console.debug('Failed to register click:', err));
          
          audioRef.current.src = station.url_resolved;
          
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
            
            setPlayError(errorMsg);
            setPlayingStationId(null);
          };
          
          await audioRef.current.play();
          setPlayingStationId(station.stationuuid);
          setPlayError(null);
        } catch (err) {
          console.error('Failed to play station:', err);
          const errorMsg = err instanceof Error && err.name === 'NotAllowedError'
            ? `Cannot play automatically. Please click the Play button again to start playback.`
            : `Failed to play stream: ${station.name}. The stream may not be available or blocked by your browser.`;
          setPlayError(errorMsg);
          setPlayingStationId(null);
        }
      }
    }
  };

  const handleAddStation = async (station: RadioBrowserStation, event: React.MouseEvent) => {
    // Stop event propagation to prevent card click
    event.stopPropagation();
    
    try {
      // Check if station already exists
      const existing = await db.radioStations
        .where('streamUrl')
        .equals(station.url_resolved)
        .first();
      
      if (existing) {
        alert('Station is already in your library!');
        return;
      }

      // Omit id field - Dexie will auto-increment
      await db.radioStations.add({
        name: station.name,
        description: station.tags,
        streamUrl: station.url_resolved,
        websiteUrl: station.homepage,
        logoUrl: station.favicon,
        genre: station.tags.split(',')[0] || undefined,
        country: station.country,
        language: station.language,
        bitrate: station.bitrate || undefined,
        codec: station.codec || undefined,
        isFavorite: false,
        customOrder: 0,
        addedAt: Date.now(),
        lastPlayedAt: undefined,
        playCount: 0,
      } as any);

      alert('Station added successfully!');
    } catch (err) {
      console.error('Add station error:', err);
      alert(`Failed to add station: ${err instanceof Error ? err.message : 'Unknown error'}`);
    }
  };

  const StationCard: React.FC<{ station: RadioBrowserStation }> = ({ station }) => (
    <Card 
      sx={{ 
        height: '100%', 
        display: 'flex', 
        flexDirection: 'column',
        cursor: 'pointer',
        '&:hover': { boxShadow: 4 }
      }}
      onClick={() => handlePlayStation(station)}
    >
      <CardContent sx={{ flexGrow: 1 }}>
        <Box sx={{ display: 'flex', alignItems: 'start', mb: 1 }}>
          {station.favicon ? (
            <Avatar src={station.favicon} sx={{ mr: 1, width: 40, height: 40 }}>
              <RadioIcon />
            </Avatar>
          ) : (
            <RadioIcon sx={{ mr: 1, color: 'primary.main' }} />
          )}
          <Typography variant="h6" gutterBottom noWrap sx={{ flex: 1 }}>
            {station.name}
          </Typography>
        </Box>
        
        {station.tags && (
          <Box sx={{ mb: 1, display: 'flex', flexWrap: 'wrap', gap: 0.5 }}>
            {station.tags.split(',').slice(0, 3).map((tag, idx) => (
              <Chip 
                key={idx}
                label={tag.trim()} 
                size="small" 
                color="primary"
                variant="outlined"
              />
            ))}
          </Box>
        )}
        
        <Box sx={{ display: 'flex', gap: 1, mb: 1, flexWrap: 'wrap' }}>
          {station.codec && station.bitrate > 0 && (
            <Chip 
              label={`${station.codec.toUpperCase()} ${station.bitrate}k`} 
              size="small" 
            />
          )}
          {station.country && (
            <Chip 
              label={station.country} 
              size="small" 
            />
          )}
          {station.language && (
            <Chip 
              label={station.language} 
              size="small" 
            />
          )}
        </Box>
        
        <Typography
          variant="caption"
          color="text.secondary"
          sx={{ display: 'block' }}
        >
          ⭐ {station.votes} votes • 🎧 {station.clickcount} plays
        </Typography>
      </CardContent>
      <CardActions sx={{ justifyContent: 'space-between' }}>
        <Button
          size="small"
          startIcon={playingStationId === station.stationuuid ? <Stop /> : <PlayArrow />}
          onClick={(e) => {
            e.stopPropagation();
            handlePlayStation(station);
          }}
          variant={playingStationId === station.stationuuid ? 'contained' : 'outlined'}
          sx={{ position: 'relative', zIndex: 1 }}
        >
          {playingStationId === station.stationuuid ? 'Stop' : 'Play'}
        </Button>
        <Button
          size="small"
          startIcon={<Favorite />}
          onClick={(e) => handleAddStation(station, e)}
          sx={{ position: 'relative', zIndex: 1 }}
        >
          Add
        </Button>
      </CardActions>
    </Card>
  );

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
            Discover Radio Stations
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
        <Tabs value={tabValue} onChange={(_, newValue) => setTabValue(newValue)}>
          <Tab icon={<SearchIcon />} label="Search" />
          <Tab icon={<TrendingUp />} label="Popular" />
          <Tab icon={<Category />} label="By Genre" />
        </Tabs>
      </Box>

      <Box sx={{ p: 2 }}>
        {tabValue === 0 && (
          <>
            <TextField
              fullWidth
              placeholder="Search for radio stations..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
              InputProps={{
                startAdornment: (
                  <InputAdornment position="start">
                    <SearchIcon />
                  </InputAdornment>
                ),
              }}
              sx={{ mb: 3 }}
            />
            <Button
              variant="contained"
              onClick={handleSearch}
              disabled={searching || !searchQuery.trim()}
              fullWidth
              sx={{ mb: 3 }}
            >
              {searching ? <CircularProgress size={24} /> : 'Search'}
            </Button>
          </>
        )}

        {tabValue === 2 && (
          <FormControl fullWidth sx={{ mb: 3 }}>
            <InputLabel>Select Genre</InputLabel>
            <Select
              value={selectedGenre}
              label="Select Genre"
              onChange={(e) => {
                setSelectedGenre(e.target.value);
                loadGenreStations(e.target.value);
              }}
            >
              {popularGenres.map((genre) => (
                <MenuItem key={genre} value={genre}>
                  {genre}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
        )}

        {error && (
          <Alert severity="warning" sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        {searching && results.length === 0 && (
          <Box sx={{ display: 'flex', justifyContent: 'center', p: 4 }}>
            <CircularProgress />
          </Box>
        )}

        {results.length > 0 && (
          <Grid container spacing={2}>
            {results.map((station) => (
              <Grid item xs={12} sm={6} md={4} lg={3} key={station.id}>
                <StationCard station={station} />
              </Grid>
            ))}
          </Grid>
        )}

        {!searching && results.length === 0 && tabValue === 0 && (
          <Box sx={{ textAlign: 'center', p: 4 }}>
            <RadioIcon sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="body1" color="text.secondary">
              Search for internet radio stations from around the world
            </Typography>
          </Box>
        )}
      </Box>

      {/* Play Error Snackbar */}
      <Snackbar
        open={!!playError}
        autoHideDuration={6000}
        onClose={() => setPlayError(null)}
        anchorOrigin={{ vertical: 'top', horizontal: 'center' }}
      >
        <Alert onClose={() => setPlayError(null)} severity="error" sx={{ width: '100%' }}>
          {playError}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default RadioDiscoveryScreen;
