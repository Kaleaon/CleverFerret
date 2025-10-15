/**
 * Universal Media Library Screen
 * Migrated from UniversalMediaLibraryScreen.kt
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Tabs,
  Tab,
  Grid,
  Card,
  CardMedia,
  CardContent,
} from '@mui/material';
import {
  ArrowBack,
  Menu as MenuIcon,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const UniversalMediaLibraryScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [media, setMedia] = useState<any[]>([]);

  useEffect(() => {
    db.mediaItems.limit(20).toArray().then(setMedia);
  }, []);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit"><MenuIcon /></IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>Universal Library</Typography>
        </Toolbar>
        <Tabs value={tabValue} onChange={(_, v) => setTabValue(v)} centered>
          <Tab label="All" />
          <Tab label="Books" />
          <Tab label="Movies" />
          <Tab label="Music" />
        </Tabs>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <Grid container spacing={2}>
          {media.map((item) => (
            <Grid item xs={6} sm={4} md={3} key={item.itemId}>
              <Card onClick={() => navigate(`/detail/${item.itemId}`)}>
                <CardMedia component="img" height="140" image={item.thumbnailPath || '/placeholder.png'} alt={item.fileName} />
                <CardContent>
                  <Typography variant="body2" noWrap>{item.fileName}</Typography>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Box>
  );
};

export default UniversalMediaLibraryScreen;
