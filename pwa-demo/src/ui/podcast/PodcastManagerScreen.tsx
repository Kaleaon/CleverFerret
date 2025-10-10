/**
 * Podcast Manager Screen
 * 
 * Browse, subscribe to, and manage podcasts.
 * Migrated from PodcastManagerScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Tabs,
  Tab,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
  Grid,
  Button,
  Chip,
  TextField,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Search,
  Podcasts,
  Download,
  PlayArrow,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { PodcastEntity, PodcastEpisodeEntity } from '../../data/local/entity/podcast-types';

export const PodcastManagerScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [podcasts, setPodcasts] = useState<PodcastEntity[]>([]);
  const [episodes, setEpisodes] = useState<PodcastEpisodeEntity[]>([]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [feedUrl, setFeedUrl] = useState('');

  useEffect(() => {
    loadPodcasts();
    loadEpisodes();
  }, []);

  const loadPodcasts = async () => {
    const subs = await db.podcasts.where('isSubscribed').equals(true).toArray();
    setPodcasts(subs);
  };

  const loadEpisodes = async () => {
    const eps = await db.podcastEpisodes
      .orderBy('publishDate')
      .reverse()
      .limit(50)
      .toArray();
    setEpisodes(eps);
  };

  const handleSubscribe = async () => {
    if (!feedUrl) return;

    try {
      // TODO: Fetch podcast feed and parse
      const newPodcast: PodcastEntity = {
        id: 0,
        title: 'New Podcast',
        description: 'Description',
        author: undefined,
        language: undefined,
        feedUrl,
        websiteUrl: undefined,
        imageUrl: undefined,
        localImagePath: undefined,
        category: undefined,
        keywords: undefined,
        explicit: false,
        isSubscribed: true,
        subscribedAt: Date.now(),
        autoDownload: false,
        downloadWifiOnly: true,
        keepEpisodes: 10,
        autoDelete: true,
        notifyNewEpisodes: true,
        lastChecked: undefined,
        lastUpdated: undefined,
        lastRefreshError: undefined,
        totalEpisodes: 0,
        newEpisodeCount: 0,
        playbackSpeed: 1.0,
        skipIntro: 0,
        skipOutro: 0,
        tags: undefined,
        customOrder: 0,
        isFavorite: false,
        createdAt: Date.now(),
        modifiedAt: Date.now(),
      };

      await db.podcasts.add(newPodcast);
      setShowAddDialog(false);
      setFeedUrl('');
      loadPodcasts();
    } catch (err) {
      console.error('Failed to subscribe:', err);
    }
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Podcasts
          </Typography>
          <IconButton color="inherit" onClick={() => setShowAddDialog(true)}>
            <Add />
          </IconButton>
          <IconButton color="inherit">
            <Search />
          </IconButton>
        </Toolbar>
        <Tabs
          value={tabValue}
          onChange={(_, value) => setTabValue(value)}
          textColor="inherit"
          indicatorColor="secondary"
        >
          <Tab label="Subscriptions" />
          <Tab label="Episodes" />
        </Tabs>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {tabValue === 0 && (
          <Grid container spacing={2}>
            {podcasts.map((podcast) => (
              <Grid item xs={12} sm={6} md={4} key={podcast.id}>
                <Card>
                  <CardActionArea onClick={() => navigate(`/podcast/${podcast.id}`)}>
                    {podcast.imageUrl && (
                      <CardMedia
                        component="img"
                        height="200"
                        image={podcast.imageUrl}
                        alt={podcast.title}
                      />
                    )}
                    <CardContent>
                      <Typography variant="h6" noWrap>
                        {podcast.title}
                      </Typography>
                      <Typography variant="body2" color="text.secondary" noWrap>
                        {podcast.author}
                      </Typography>
                      <Box sx={{ mt: 1, display: 'flex', gap: 1 }}>
                        <Chip size="small" label={`${podcast.totalEpisodes} episodes`} />
                        {podcast.newEpisodeCount > 0 && (
                          <Chip
                            size="small"
                            label={`${podcast.newEpisodeCount} new`}
                            color="primary"
                          />
                        )}
                      </Box>
                    </CardContent>
                  </CardActionArea>
                </Card>
              </Grid>
            ))}
            {podcasts.length === 0 && (
              <Grid item xs={12}>
                <Box sx={{ textAlign: 'center', py: 8 }}>
                  <Podcasts sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
                  <Typography variant="h6" gutterBottom>
                    No Podcasts Yet
                  </Typography>
                  <Typography variant="body2" color="text.secondary" gutterBottom>
                    Subscribe to your favorite podcasts
                  </Typography>
                  <Button
                    variant="contained"
                    startIcon={<Add />}
                    onClick={() => setShowAddDialog(true)}
                    sx={{ mt: 2 }}
                  >
                    Add Podcast
                  </Button>
                </Box>
              </Grid>
            )}
          </Grid>
        )}

        {tabValue === 1 && (
          <Box>
            {episodes.map((episode) => (
              <Card key={episode.id} sx={{ mb: 2 }}>
                <CardContent>
                  <Box sx={{ display: 'flex', gap: 2 }}>
                    {episode.imageUrl && (
                      <CardMedia
                        component="img"
                        sx={{ width: 100, height: 100, borderRadius: 1 }}
                        image={episode.imageUrl}
                        alt={episode.title}
                      />
                    )}
                    <Box sx={{ flex: 1 }}>
                      <Typography variant="h6">{episode.title}</Typography>
                      <Typography variant="body2" color="text.secondary" sx={{ mb: 1 }}>
                        {new Date(episode.publishDate).toLocaleDateString()}
                      </Typography>
                      <Box sx={{ display: 'flex', gap: 1 }}>
                        <Button
                          size="small"
                          startIcon={<PlayArrow />}
                          onClick={() => navigate(`/podcast_player/${episode.id}`)}
                        >
                          Play
                        </Button>
                        {!episode.downloaded && (
                          <Button size="small" startIcon={<Download />}>
                            Download
                          </Button>
                        )}
                      </Box>
                    </Box>
                  </Box>
                </CardContent>
              </Card>
            ))}
            {episodes.length === 0 && (
              <Box sx={{ textAlign: 'center', py: 8 }}>
                <Typography variant="h6">No Episodes</Typography>
                <Typography variant="body2" color="text.secondary">
                  Subscribe to podcasts to see episodes
                </Typography>
              </Box>
            )}
          </Box>
        )}
      </Box>

      {/* Add Podcast Dialog */}
      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Subscribe to Podcast</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="RSS Feed URL"
            fullWidth
            value={feedUrl}
            onChange={(e) => setFeedUrl(e.target.value)}
            placeholder="https://example.com/feed.xml"
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button onClick={handleSubscribe} variant="contained" disabled={!feedUrl}>
            Subscribe
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default PodcastManagerScreen;
