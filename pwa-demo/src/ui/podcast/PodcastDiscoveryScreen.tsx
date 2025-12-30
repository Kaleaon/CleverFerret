/**
 * Podcast Discovery Screen
 *
 * Discover and browse new podcasts from various directories.
 * Inspired by AntennaPod's podcast discovery features.
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
  CardMedia,
  CardContent,
  CardActions,
  Grid,
  Button,
  Chip,
  CircularProgress,
  Alert,
  Snackbar,
} from '@mui/material';
import {
  ArrowBack,
  Search as SearchIcon,
  TrendingUp,
  NewReleases,
  Category,
  RssFeed,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { PodcastEntity } from '../../data/local/entity/podcast-types';

interface PodcastSearchResult {
  id: string;
  title: string;
  author: string;
  description: string;
  imageUrl: string;
  feedUrl: string;
  category?: string;
  subscriberCount?: number;
}

export const PodcastDiscoveryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [searchQuery, setSearchQuery] = useState('');
  const [searching, setSearching] = useState(false);
  const [results, setResults] = useState<PodcastSearchResult[]>([]);
  const [trendingPodcasts, setTrendingPodcasts] = useState<PodcastSearchResult[]>([]);
  const [error, setError] = useState<string | null>(null);
  const [snackbar, setSnackbar] = useState<{
    open: boolean;
    message: string;
    severity?: 'success' | 'error' | 'info' | 'warning';
  }>({ open: false, message: '' });

  useEffect(() => {
    if (tabValue === 1) {
      loadTrendingPodcasts();
    } else if (tabValue === 2) {
      loadTopPodcasts();
    }
  }, [tabValue]);

  const handleSearch = async () => {
    if (!searchQuery.trim()) return;

    setSearching(true);
    setError(null);

    try {
      // Use iTunes Podcast Search API (free, no API key required)
      const response = await fetch(
        `https://itunes.apple.com/search?term=${encodeURIComponent(searchQuery)}&media=podcast&limit=50`,
      );
      const data = await response.json();

      if (data.results) {
        const podcasts: PodcastSearchResult[] = data.results.map((item: any) => ({
          id: item.collectionId.toString(),
          title: item.collectionName || item.trackName,
          author: item.artistName,
          description: item.collectionCensoredName || '',
          imageUrl: item.artworkUrl600 || item.artworkUrl100,
          feedUrl: item.feedUrl,
          category: item.primaryGenreName,
        }));
        setResults(podcasts);
      }
    } catch (err) {
      setError('Failed to search podcasts. Please try again.');
      const { logger } = await import('../../services/logging');
      logger.error('PodcastDiscovery', 'Podcast search error', undefined, err as Error);
    } finally {
      setSearching(false);
    }
  };

  const loadTrendingPodcasts = async () => {
    setSearching(true);
    setError(null);

    try {
      // Get trending podcasts from iTunes (Top 25)
      const response = await fetch('https://itunes.apple.com/us/rss/toppodcasts/limit=25/json');

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();

      if (data.feed?.entry) {
        const podcasts: PodcastSearchResult[] = await Promise.all(
          data.feed.entry.map(async (item: any) => {
            try {
              // Get feed URL from podcast detail
              const detailResponse = await fetch(
                `https://itunes.apple.com/lookup?id=${item.id.attributes['im:id']}`,
              );
              const detailData = await detailResponse.json();
              const feedUrl = detailData.results?.[0]?.feedUrl || '';

              return {
                id: item.id.attributes['im:id'],
                title: item['im:name'].label,
                author: item['im:artist'].label,
                description: item.summary?.label || '',
                imageUrl: item['im:image']?.[2]?.label || item['im:image']?.[0]?.label,
                feedUrl,
                category: item.category?.attributes?.label,
              };
            } catch (err) {
              const { logger } = await import('../../services/logging');
              logger.warn(
                'PodcastDiscovery',
                'Error fetching podcast details',
                undefined,
                err as Error,
              );
              // Return podcast without feedUrl if detail fetch fails
              return {
                id: item.id.attributes['im:id'],
                title: item['im:name'].label,
                author: item['im:artist'].label,
                description: item.summary?.label || '',
                imageUrl: item['im:image']?.[2]?.label || item['im:image']?.[0]?.label,
                feedUrl: '',
                category: item.category?.attributes?.label,
              };
            }
          }),
        );
        setTrendingPodcasts(podcasts);
      } else {
        throw new Error('No podcasts found in response');
      }
    } catch (err) {
      setError('Failed to load trending podcasts. Please try again.');
      const { logger } = await import('../../services/logging');
      logger.error('PodcastDiscovery', 'Trending podcasts error', undefined, err as Error);
    } finally {
      setSearching(false);
    }
  };

  const loadTopPodcasts = async () => {
    setSearching(true);
    setError(null);

    try {
      // Get top podcasts by category
      const response = await fetch('https://itunes.apple.com/us/rss/toppodcasts/limit=50/json');

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();

      if (data.feed?.entry) {
        const podcasts: PodcastSearchResult[] = await Promise.all(
          data.feed.entry.map(async (item: any) => {
            try {
              const detailResponse = await fetch(
                `https://itunes.apple.com/lookup?id=${item.id.attributes['im:id']}`,
              );
              const detailData = await detailResponse.json();
              const feedUrl = detailData.results?.[0]?.feedUrl || '';

              return {
                id: item.id.attributes['im:id'],
                title: item['im:name'].label,
                author: item['im:artist'].label,
                description: item.summary?.label || '',
                imageUrl: item['im:image']?.[2]?.label || item['im:image']?.[0]?.label,
                feedUrl,
                category: item.category?.attributes?.label,
              };
            } catch (err) {
              const { logger } = await import('../../services/logging');
              logger.warn(
                'PodcastDiscovery',
                'Error fetching podcast details',
                undefined,
                err as Error,
              );
              // Return podcast without feedUrl if detail fetch fails
              return {
                id: item.id.attributes['im:id'],
                title: item['im:name'].label,
                author: item['im:artist'].label,
                description: item.summary?.label || '',
                imageUrl: item['im:image']?.[2]?.label || item['im:image']?.[0]?.label,
                feedUrl: '',
                category: item.category?.attributes?.label,
              };
            }
          }),
        );
        setResults(podcasts);
      } else {
        throw new Error('No podcasts found in response');
      }
    } catch (err) {
      setError('Failed to load top podcasts. Please try again.');
      const { logger } = await import('../../services/logging');
      logger.error('PodcastDiscovery', 'Top podcasts error', undefined, err as Error);
    } finally {
      setSearching(false);
    }
  };

  const handleSubscribe = async (podcast: PodcastSearchResult) => {
    if (!podcast.feedUrl) {
      setSnackbar({
        open: true,
        message: 'Feed URL not available for this podcast',
        severity: 'warning',
      });
      return;
    }

    try {
      // Check if already subscribed
      const existing = await db.podcasts.where('feedUrl').equals(podcast.feedUrl).first();

      if (existing) {
        setSnackbar({
          open: true,
          message: 'Already subscribed to this podcast!',
          severity: 'info',
        });
        return;
      }

      // Omit id field - Dexie will auto-increment
      await db.podcasts.add({
        title: podcast.title,
        description: podcast.description,
        author: podcast.author,
        feedUrl: podcast.feedUrl,
        imageUrl: podcast.imageUrl,
        category: podcast.category,
        isSubscribed: true,
        subscribedAt: Date.now(),
        autoDownload: false,
        downloadWifiOnly: true,
        keepEpisodes: 10,
        autoDelete: true,
        notifyNewEpisodes: true,
        totalEpisodes: 0,
        newEpisodeCount: 0,
        playbackSpeed: 1.0,
      } as any);

      setSnackbar({ open: true, message: 'Subscribed successfully!', severity: 'success' });
    } catch (err) {
      const { logger } = await import('../../services/logging');
      logger.error('PodcastDiscovery', 'Subscribe error', undefined, err as Error);
      setSnackbar({
        open: true,
        message: `Failed to subscribe: ${err instanceof Error ? err.message : 'Unknown error'}. Please try again.`,
        severity: 'error',
      });
    }
  };

  const PodcastCard: React.FC<{ podcast: PodcastSearchResult }> = ({ podcast }) => (
    <Card sx={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
      <CardMedia
        component="img"
        height="200"
        image={podcast.imageUrl}
        alt={podcast.title}
        sx={{ objectFit: 'cover' }}
      />
      <CardContent sx={{ flexGrow: 1 }}>
        <Typography variant="h6" gutterBottom noWrap>
          {podcast.title}
        </Typography>
        <Typography variant="body2" color="text.secondary" gutterBottom>
          {podcast.author}
        </Typography>
        {podcast.category && <Chip label={podcast.category} size="small" sx={{ mt: 1 }} />}
        <Typography
          variant="body2"
          color="text.secondary"
          sx={{
            mt: 1,
            overflow: 'hidden',
            textOverflow: 'ellipsis',
            display: '-webkit-box',
            WebkitLineClamp: 3,
            WebkitBoxOrient: 'vertical',
          }}
        >
          {podcast.description}
        </Typography>
      </CardContent>
      <CardActions>
        <Button
          size="small"
          startIcon={<RssFeed />}
          onClick={(e) => {
            e.stopPropagation();
            handleSubscribe(podcast);
          }}
          disabled={!podcast.feedUrl}
          sx={{ position: 'relative', zIndex: 1 }}
        >
          Subscribe
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
            Discover Podcasts
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
        <Tabs value={tabValue} onChange={(_, newValue) => setTabValue(newValue)}>
          <Tab icon={<SearchIcon />} label="Search" />
          <Tab icon={<TrendingUp />} label="Trending" />
          <Tab icon={<NewReleases />} label="Top Podcasts" />
        </Tabs>
      </Box>

      <Box sx={{ p: 2 }}>
        {tabValue === 0 && (
          <>
            <TextField
              fullWidth
              placeholder="Search for podcasts..."
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

        {error && (
          <Alert severity="error" sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        {searching && results.length === 0 && (
          <Box sx={{ display: 'flex', justifyContent: 'center', p: 4 }}>
            <CircularProgress />
          </Box>
        )}

        {tabValue === 0 && results.length > 0 && (
          <Grid container spacing={2}>
            {results.map((podcast) => (
              <Grid item xs={12} sm={6} md={4} lg={3} key={podcast.id}>
                <PodcastCard podcast={podcast} />
              </Grid>
            ))}
          </Grid>
        )}

        {tabValue === 1 && (
          <Grid container spacing={2}>
            {trendingPodcasts.map((podcast) => (
              <Grid item xs={12} sm={6} md={4} lg={3} key={podcast.id}>
                <PodcastCard podcast={podcast} />
              </Grid>
            ))}
          </Grid>
        )}

        {tabValue === 2 && results.length > 0 && (
          <Grid container spacing={2}>
            {results.map((podcast) => (
              <Grid item xs={12} sm={6} md={4} lg={3} key={podcast.id}>
                <PodcastCard podcast={podcast} />
              </Grid>
            ))}
          </Grid>
        )}

        {!searching && results.length === 0 && trendingPodcasts.length === 0 && tabValue === 0 && (
          <Box sx={{ textAlign: 'center', p: 4 }}>
            <Typography variant="body1" color="text.secondary">
              Search for podcasts using the search bar above
            </Typography>
          </Box>
        )}
      </Box>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert
          onClose={() => setSnackbar({ ...snackbar, open: false })}
          severity={snackbar.severity || 'info'}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default PodcastDiscoveryScreen;
