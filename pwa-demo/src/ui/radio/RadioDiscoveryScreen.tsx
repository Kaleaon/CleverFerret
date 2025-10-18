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
} from '@mui/material';
import {
  ArrowBack,
  Search as SearchIcon,
  TrendingUp,
  Category,
  Radio as RadioIcon,
  PlayArrow,
  Favorite,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { RadioStation } from '../../data/local/entity';

const SHOUTCAST_API_KEY = 'fa1BTzVMkKOmdKqg';
const SHOUTCAST_BASE_URL = 'http://api.shoutcast.com';

interface ShoutcastStation {
  id: string;
  name: string;
  genre: string;
  currentTrack?: string;
  bitrate: string;
  listeners?: number;
  streamUrl: string;
  logoUrl?: string;
}

interface Genre {
  name: string;
  count?: number;
}

export const RadioDiscoveryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedGenre, setSelectedGenre] = useState('');
  const [searching, setSearching] = useState(false);
  const [results, setResults] = useState<ShoutcastStation[]>([]);
  const [genres, setGenres] = useState<Genre[]>([]);
  const [error, setError] = useState<string | null>(null);

  // Popular genres from Shoutcast directory
  const popularGenres = [
    'Top 40', 'Pop', 'Rock', 'Classic Rock', 'Alternative',
    'Dance', 'Electronic', 'Hip-Hop', 'R&B', 'Jazz',
    'Blues', 'Country', 'Classical', 'Reggae', 'Latin',
    'World', 'News', 'Talk', 'Sports', 'Oldies'
  ];

  useEffect(() => {
    if (tabValue === 1) {
      loadRandomStations();
    } else if (tabValue === 2) {
      setGenres(popularGenres.map(g => ({ name: g })));
    }
  }, [tabValue]);

  const parseShoutcastXML = (xmlText: string): ShoutcastStation[] => {
    const parser = new DOMParser();
    const xmlDoc = parser.parseFromString(xmlText, 'text/xml');
    const stations: ShoutcastStation[] = [];

    const stationNodes = xmlDoc.getElementsByTagName('station');
    
    for (let i = 0; i < Math.min(stationNodes.length, 50); i++) {
      const station = stationNodes[i];
      const id = station.getAttribute('id') || station.getAttribute('tuneid') || `${i}`;
      const name = station.getAttribute('name') || 'Unknown Station';
      const genre = station.getAttribute('genre') || station.getAttribute('genrename') || 'Unknown';
      const currentTrack = station.getAttribute('ct') || station.getAttribute('nowplaying') || '';
      const bitrate = station.getAttribute('br') || station.getAttribute('bitrate') || '128';
      const listeners = station.getAttribute('lc') || '0';

      // Construct stream URL
      const streamUrl = `http://yp.shoutcast.com/sbin/tunein-station.pls?id=${id}`;

      stations.push({
        id,
        name,
        genre,
        currentTrack,
        bitrate,
        listeners: parseInt(listeners),
        streamUrl,
      });
    }

    return stations;
  };

  const handleSearch = async () => {
    if (!searchQuery.trim()) return;

    setSearching(true);
    setError(null);

    try {
      // Use CORS proxy for API requests
      const proxyUrl = 'https://corsproxy.io/?';
      const apiUrl = `${SHOUTCAST_BASE_URL}/legacy/stationsearch?k=${SHOUTCAST_API_KEY}&f=xml&search=${encodeURIComponent(searchQuery)}&limit=50`;
      
      const response = await fetch(proxyUrl + encodeURIComponent(apiUrl));
      const xmlText = await response.text();
      
      const stations = parseShoutcastXML(xmlText);
      setResults(stations);
      
      if (stations.length === 0) {
        setError('No stations found. Try a different search term.');
      }
    } catch (err) {
      console.error('Station search error:', err);
      setError('Failed to search stations. Using fallback data.');
      // Provide some fallback stations
      setResults(getFallbackStations());
    } finally {
      setSearching(false);
    }
  };

  const loadRandomStations = async () => {
    setSearching(true);
    setError(null);

    try {
      const proxyUrl = 'https://corsproxy.io/?';
      const apiUrl = `${SHOUTCAST_BASE_URL}/station/randomstations?k=${SHOUTCAST_API_KEY}&f=xml&limit=50`;
      
      const response = await fetch(proxyUrl + encodeURIComponent(apiUrl));
      const xmlText = await response.text();
      
      const stations = parseShoutcastXML(xmlText);
      setResults(stations);
    } catch (err) {
      console.error('Random stations error:', err);
      setError('Failed to load random stations. Using fallback data.');
      setResults(getFallbackStations());
    } finally {
      setSearching(false);
    }
  };

  const loadGenreStations = async (genre: string) => {
    if (!genre) return;

    setSearching(true);
    setError(null);

    try {
      const proxyUrl = 'https://corsproxy.io/?';
      const apiUrl = `${SHOUTCAST_BASE_URL}/legacy/genresearch?k=${SHOUTCAST_API_KEY}&f=xml&genre=${encodeURIComponent(genre)}&limit=50`;
      
      const response = await fetch(proxyUrl + encodeURIComponent(apiUrl));
      const xmlText = await response.text();
      
      const stations = parseShoutcastXML(xmlText);
      setResults(stations);
      
      if (stations.length === 0) {
        setError(`No stations found for genre: ${genre}`);
      }
    } catch (err) {
      console.error('Genre search error:', err);
      setError('Failed to load genre stations. Using fallback data.');
      setResults(getFallbackStations(genre));
    } finally {
      setSearching(false);
    }
  };

  const getFallbackStations = (genre?: string): ShoutcastStation[] => {
    // Provide some popular internet radio stations as fallback
    const fallbackStations: ShoutcastStation[] = [
      {
        id: 'fallback1',
        name: 'BBC Radio 1',
        genre: genre || 'Pop',
        bitrate: '128',
        listeners: 50000,
        streamUrl: 'http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one',
      },
      {
        id: 'fallback2',
        name: 'KEXP 90.3',
        genre: genre || 'Alternative',
        bitrate: '128',
        listeners: 10000,
        streamUrl: 'http://live-aacplus-64.kexp.org/kexp64.aac',
      },
      {
        id: 'fallback3',
        name: 'NTS Radio',
        genre: genre || 'Electronic',
        bitrate: '128',
        listeners: 5000,
        streamUrl: 'https://stream-mixtape-geo.ntslive.net/stream',
      },
    ];
    return fallbackStations;
  };

  const handleAddStation = async (station: ShoutcastStation, event: React.MouseEvent) => {
    // Stop event propagation to prevent card click
    event.stopPropagation();
    
    try {
      // Omit id field - Dexie will auto-increment
      await db.radioStations.add({
        name: station.name,
        description: station.currentTrack,
        streamUrl: station.streamUrl,
        genre: station.genre,
        bitrate: parseInt(station.bitrate),
        isFavorite: false,
        customOrder: 0,
        addedAt: Date.now(),
        lastPlayedAt: undefined,
        playCount: 0,
      } as any);

      alert('Station added successfully!');
    } catch (err) {
      console.error('Add station error:', err);
      alert('Failed to add station. Please try again.');
    }
  };

  const StationCard: React.FC<{ station: ShoutcastStation }> = ({ station }) => (
    <Card sx={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
      <CardContent sx={{ flexGrow: 1 }}>
        <Box sx={{ display: 'flex', alignItems: 'start', mb: 1 }}>
          <RadioIcon sx={{ mr: 1, color: 'primary.main' }} />
          <Typography variant="h6" gutterBottom noWrap sx={{ flex: 1 }}>
            {station.name}
          </Typography>
        </Box>
        
        <Chip 
          label={station.genre} 
          size="small" 
          sx={{ mb: 1, mr: 1 }} 
          color="primary"
          variant="outlined"
        />
        <Chip 
          label={`${station.bitrate} kbps`} 
          size="small" 
          sx={{ mb: 1 }} 
        />
        
        {station.currentTrack && (
          <Typography
            variant="body2"
            color="text.secondary"
            sx={{ mt: 1, fontStyle: 'italic' }}
          >
            Now Playing: {station.currentTrack}
          </Typography>
        )}
        
        {station.listeners !== undefined && (
          <Typography
            variant="caption"
            color="text.secondary"
            sx={{ display: 'block', mt: 1 }}
          >
            {station.listeners.toLocaleString()} listeners
          </Typography>
        )}
      </CardContent>
      <CardActions>
        <Button
          size="small"
          startIcon={<Favorite />}
          onClick={(e) => handleAddStation(station, e)}
        >
          Add Station
        </Button>
      </CardActions>
    </Card>
  );

  return (
    <Box>
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
          <Tab icon={<TrendingUp />} label="Random" />
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
    </Box>
  );
};

export default RadioDiscoveryScreen;
