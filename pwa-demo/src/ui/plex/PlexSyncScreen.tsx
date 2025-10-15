/**
 * Plex Sync Screen - Synchronization settings
 * Migrated from PlexSyncScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  List,
  ListItem,
  ListItemText,
  Switch,
  Button,
  LinearProgress,
  Card,
  CardContent,
} from '@mui/material';
import { ArrowBack, Sync } from '@mui/icons-material';

export const PlexSyncScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoSync, setAutoSync] = useState(true);
  const [syncProgress, setSyncProgress] = useState(false);

  const handleSync = () => {
    setSyncProgress(true);
    setTimeout(() => setSyncProgress(false), 2000);
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>Plex Sync</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>Last Sync</Typography>
            <Typography variant="body2" color="text.secondary">2 hours ago</Typography>
            <Button variant="contained" startIcon={<Sync />} onClick={handleSync} sx={{ mt: 2 }} fullWidth>
              Sync Now
            </Button>
            {syncProgress && <LinearProgress sx={{ mt: 2 }} />}
          </CardContent>
        </Card>

        <List>
          <ListItem>
            <ListItemText primary="Auto Sync" secondary="Automatically sync when app opens" />
            <Switch checked={autoSync} onChange={(e) => setAutoSync(e.target.checked)} />
          </ListItem>
          <ListItem>
            <ListItemText primary="Sync Watched Status" secondary="Sync playback progress to Plex" />
            <Switch defaultChecked />
          </ListItem>
          <ListItem>
            <ListItemText primary="Sync Ratings" secondary="Sync ratings and reviews" />
            <Switch defaultChecked />
          </ListItem>
        </List>
      </Box>
    </Box>
  );
};

export default PlexSyncScreen;
