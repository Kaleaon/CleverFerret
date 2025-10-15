/**
 * Improved Library List Screen
 * Migrated from ImprovedLibraryListScreen.kt
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
  CardContent,
  CardActionArea,
  Fab,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Folder,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const ImprovedLibraryListScreen: React.FC = () => {
  const navigate = useNavigate();
  const [libraries, setLibraries] = useState<any[]>([]);

  useEffect(() => {
    db.libraries.toArray().then(setLibraries);
  }, []);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Libraries</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        <Grid container spacing={2}>
          {libraries.map((lib) => (
            <Grid item xs={12} sm={6} md={4} key={lib.libraryId}>
              <Card>
                <CardActionArea onClick={() => navigate(`/library/${lib.libraryId}`)}>
                  <CardContent>
                    <Folder sx={{ fontSize: 48, mb: 1 }} />
                    <Typography variant="h6">{lib.name}</Typography>
                    <Typography variant="body2" color="text.secondary">{lib.type}</Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>

      <Fab color="primary" sx={{ position: 'fixed', bottom: 16, right: 16 }} onClick={() => navigate('/library/create')}>
        <Add />
      </Fab>
    </Box>
  );
};

export default ImprovedLibraryListScreen;
