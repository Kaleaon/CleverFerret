/**
 * Video Library Screen
 * Migrated from VideoLibraryScreen.kt
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
} from '@mui/material';
import {
  ArrowBack,
  PlayCircle,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const VideoLibraryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [videos, setVideos] = useState<any[]>([]);

  useEffect(() => {
    db.mediaItems.where('mediaType').equals('VIDEO').limit(20).toArray().then(setVideos);
  }, []);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Video Library</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <Grid container spacing={2}>
          {videos.map((video) => (
            <Grid item xs={12} sm={6} md={4} key={video.itemId}>
              <Card>
                <CardActionArea onClick={() => navigate(`/video/${video.itemId}`)}>
                  <Box sx={{ position: 'relative' }}>
                    <CardMedia component="img" height="180" image={video.thumbnailPath || '/placeholder-video.png'} alt={video.fileName} />
                    <PlayCircle sx={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', fontSize: 64, color: 'white', opacity: 0.8 }} />
                  </Box>
                  <CardContent>
                    <Typography variant="subtitle1" noWrap>{video.fileName}</Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Box>
  );
};

export default VideoLibraryScreen;
