/**
 * Plex Authentication Screen
 * Migrated from PlexAuthScreen.kt
 */

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  TextField,
  Button,
  Card,
  CardContent,
  Stack,
  Alert,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const PlexAuthScreen: React.FC = () => {
  const navigate = useNavigate();
  const [serverUrl, setServerUrl] = useState('');
  const [token, setToken] = useState('');
  const [status, setStatus] = useState<'idle' | 'connecting' | 'success' | 'error'>('idle');

  const handleConnect = async () => {
    setStatus('connecting');
    // TODO: Implement actual Plex authentication
    setTimeout(() => {
      setStatus('success');
      setTimeout(() => navigate('/plex'), 1000);
    }, 1000);
  };

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Connect to Plex</Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, p: 3, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <Card sx={{ maxWidth: 500, width: '100%' }}>
          <CardContent>
            <Typography variant="h5" gutterBottom>Plex Server</Typography>
            <Typography variant="body2" color="text.secondary" paragraph>
              Connect to your Plex Media Server to access your media library.
            </Typography>

            {status === 'success' && (
              <Alert severity="success" sx={{ mb: 2 }}>Connected successfully!</Alert>
            )}
            {status === 'error' && (
              <Alert severity="error" sx={{ mb: 2 }}>Connection failed. Please check your credentials.</Alert>
            )}

            <Stack spacing={2}>
              <TextField
                fullWidth
                label="Server URL"
                placeholder="https://192.168.1.100:32400"
                value={serverUrl}
                onChange={(e) => setServerUrl(e.target.value)}
              />
              <TextField
                fullWidth
                label="Plex Token"
                placeholder="X-Plex-Token"
                value={token}
                onChange={(e) => setToken(e.target.value)}
                type="password"
              />
              <Button
                variant="contained"
                onClick={handleConnect}
                disabled={!serverUrl || !token || status === 'connecting'}
              >
                {status === 'connecting' ? 'Connecting...' : 'Connect'}
              </Button>
            </Stack>
          </CardContent>
        </Card>
      </Box>
    </Box>
  );
};

export default PlexAuthScreen;
