/**
 * API Settings Screen
 * Migrated from APISettingsScreen.kt
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
  TextField,
  Button,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const APISettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [apiEndpoint, setApiEndpoint] = useState('https://api.example.com');
  const [timeout, setTimeout] = useState('30');

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">API Settings</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ p: 2 }}>
        <ListItem>
          <TextField
            fullWidth
            label="API Endpoint"
            value={apiEndpoint}
            onChange={(e) => setApiEndpoint(e.target.value)}
          />
        </ListItem>
        <ListItem>
          <TextField
            fullWidth
            label="Timeout (seconds)"
            type="number"
            value={timeout}
            onChange={(e) => setTimeout(e.target.value)}
          />
        </ListItem>
        <ListItem>
          <Button variant="contained" fullWidth>Save</Button>
        </ListItem>
      </List>
    </Box>
  );
};

export default APISettingsScreen;
