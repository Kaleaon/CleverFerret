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
        `https://itunes.apple.com/search?term=${encodeURIComponent(searchQuery)}&media=podcast&limit=50`
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
      console.error('Podcast search error:', err);
    } finally {
      setSearching(false);
    }
  };

  const loadTrendingPodcasts = async () => {
    setSearching(true);
    setError(null);

    try {
      // Get trending podcasts from iTunes (Top 25)
      const response = await fetch(
        'https://itunes.apple.com/us/rss/toppodcasts/limit=25/json'
      );
      const data = await response.json();

      if (data.feed?.entry) {
        const podcasts: PodcastSearchResult[] = await Promise.all(
          data.feed.entry.map(async (item: any) => {
            // Get feed URL from podcast detail
            const detailResponse = await fetch(
              `https://itunes.apple.com/lookup?id=${item.id.attributes['im:id']}`
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
          })
        );
        setTrendingPodcasts(podcasts);
      }
    } catch (err) {
      setError('Failed to load trending podcasts.');
      console.error('Trending podcasts error:', err);
    } finally {
      setSearching(false);
    }
  };

  const loadTopPodcasts = async () => {
    setSearching(true);
    setError(null);

    try {
      // Get top podcasts by category
      const response = await fetch(
        'https://itunes.apple.com/us/rss/toppodcasts/limit=50/json'
      );
      const data = await response.json();

      if (data.feed?.entry) {
        const podcasts: PodcastSearchResult[] = await Promise.all(
          data.feed.entry.map(async (item: any) => {
            const detailResponse = await fetch(
              `https://itunes.apple.com/lookup?id=${item.id.attributes['im:id']}`
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
          })
        );
        setResults(podcasts);
      }
    } catch (err) {
      setError('Failed to load top podcasts.');
      console.error('Top podcasts error:', err);
    } finally {
      setSearching(false);
    }
  };

  const handleSubscribe = async (podcast: PodcastSearchResult) => {
    if (!podcast.feedUrl) {
      alert('Feed URL not available for this podcast');
      return;
    }

    try {
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

      alert('Subscribed successfully!');
    } catch (err) {
      console.error('Subscribe error:', err);
      alert('Failed to subscribe. Please try again.');
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
        {podcast.category && (
          <Chip label={podcast.category} size="small" sx={{ mt: 1 }} />
        )}
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
          onClick={() => handleSubscribe(podcast)}
          disabled={!podcast.feedUrl}
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
    </Box>
  );
};

export default PodcastDiscoveryScreen;
