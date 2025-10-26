/**
 * Music Library Screen
 * 
 * Browse music library with albums, artists, and tracks.
 * Migrated from MusicLibraryScreen.kt
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
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
  List,
  ListItem,
  ListItemButton,
  ListItemAvatar,
  ListItemText,
  Avatar,
  TextField,
  InputAdornment,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
} from '@mui/material';
import {
  ArrowBack,
  Search,
  Album as AlbumIcon,
  Person,
  MusicNote,
  PlayArrow,
} from '@mui/icons-material';

import { mediaRepository } from '../../data/repository';
import { db } from '../../services/database-complete';
import type { MediaItem, Album } from '../../data/local/entity';

export const MusicLibraryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [searchQuery, setSearchQuery] = useState('');
  const [tracks, setTracks] = useState<MediaItem[]>([]);
  const [albums, setAlbums] = useState<Album[]>([]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [feedUrl, setFeedUrl] = useState('');

  useEffect(() => {
    loadMusicData();
  }, []);

  const loadMusicData = async () => {
    const musicTracks = await mediaRepository.getMediaItemsByType('MUSIC');
    setTracks(musicTracks);

    const musicAlbums = await db.albums.toArray();
    setAlbums(musicAlbums);
  };

  const filteredTracks = tracks.filter((track) =>
    track.fileName.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Music Library
          </Typography>
        </Toolbar>
        <Tabs
          value={tabValue}
          onChange={(_, value) => setTabValue(value)}
          textColor="inherit"
          indicatorColor="secondary"
        >
          <Tab label="Tracks" />
          <Tab label="Albums" />
          <Tab label="Artists" />
        </Tabs>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <TextField
          fullWidth
          placeholder="Search music..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <Search />
              </InputAdornment>
            ),
          }}
          sx={{ mb: 2 }}
        />

        {/* Tracks Tab */}
        {tabValue === 0 && (
          <List>
            {filteredTracks.map((track, index) => (
              <ListItem key={track.itemId} disablePadding>
                <ListItemButton onClick={() => navigate(`/audio_player/${track.itemId}`)}>
                  <ListItemAvatar>
                    <Avatar>
                      <MusicNote />
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText
                    primary={track.fileName.replace(/\.[^/.]+$/, '')}
                    secondary={`${(track.fileSize / 1024 / 1024).toFixed(2)} MB`}
                  />
                  <IconButton edge="end">
                    <PlayArrow />
                  </IconButton>
                </ListItemButton>
              </ListItem>
            ))}
            {filteredTracks.length === 0 && (
              <Box sx={{ textAlign: 'center', py: 8 }}>
                <Typography variant="h6" color="text.secondary">
                  No tracks found
                </Typography>
              </Box>
            )}
          </List>
        )}

        {/* Albums Tab */}
        {tabValue === 1 && (
          <Grid container spacing={2}>
            {albums.map((album) => (
              <Grid item xs={6} sm={4} md={3} key={album.albumId}>
                <Card>
                  <CardActionArea onClick={() => navigate(`/album/${album.albumId}`)}>
                    {album.albumArtPath && (
                      <CardMedia
                        component="img"
                        height="200"
                        image={album.albumArtPath}
                        alt={album.title}
                      />
                    )}
                    <CardContent>
                      <Typography variant="subtitle1" noWrap>
                        {album.title}
                      </Typography>
                      <Typography variant="body2" color="text.secondary" noWrap>
                        {album.releaseYear || 'Unknown'}
                      </Typography>
                    </CardContent>
                  </CardActionArea>
                </Card>
              </Grid>
            ))}
            {albums.length === 0 && (
              <Grid item xs={12}>
                <Box sx={{ textAlign: 'center', py: 8 }}>
                  <AlbumIcon sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
                  <Typography variant="h6">No Albums</Typography>
                  <Typography variant="body2" color="text.secondary">
                    Your music albums will appear here
                  </Typography>
                </Box>
              </Grid>
            )}
          </Grid>
        )}

        {/* Artists Tab */}
        {tabValue === 2 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Person sx={{ fontSize: 80, color: 'text.secondary', mb: 2 }} />
            <Typography variant="h6">Artists</Typography>
            <Typography variant="body2" color="text.secondary">
              Artist view coming soon
            </Typography>
          </Box>
        )}
      </Box>

      {/* Add Podcast Dialog */}
      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)}>
        <DialogTitle>Add Podcast</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Feed URL"
            fullWidth
            value={feedUrl}
            onChange={(e) => setFeedUrl(e.target.value)}
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button onClick={() => {}} variant="contained">
            Add
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default MusicLibraryScreen;
