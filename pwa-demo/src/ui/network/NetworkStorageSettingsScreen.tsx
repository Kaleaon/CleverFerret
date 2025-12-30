/**
 * Network Storage Settings Screen
 * Migrated from NetworkStorageSettingsScreen.kt
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

export const NetworkStorageSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [serverAddress, setServerAddress] = useState('');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Network Storage</Typography>
        </Toolbar>
      </AppBar>

      <List sx={{ p: 2 }}>
        <ListItem>
          <TextField
            fullWidth
            label="Server Address"
            value={serverAddress}
            onChange={(e) => setServerAddress(e.target.value)}
            placeholder="smb://192.168.1.100/share"
          />
        </ListItem>
        <ListItem>
          <TextField
            fullWidth
            label="Username"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </ListItem>
        <ListItem>
          <TextField
            fullWidth
            label="Password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </ListItem>
        <ListItem>
          <Button variant="contained" fullWidth>
            Connect
          </Button>
        </ListItem>
      </List>
    </Box>
  );
};

export default NetworkStorageSettingsScreen;
