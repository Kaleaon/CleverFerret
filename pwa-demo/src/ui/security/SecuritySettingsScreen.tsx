/**
 * Security Settings Screen
 * Migrated from SecuritySettingsScreen.kt
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
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const SecuritySettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [requirePassword, setRequirePassword] = useState(false);
  const [biometricAuth, setBiometricAuth] = useState(false);

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6">Security</Typography>
        </Toolbar>
      </AppBar>

      <List>
        <ListItem>
          <ListItemText primary="Require Password" secondary="Require password to open app" />
          <Switch
            checked={requirePassword}
            onChange={(e) => setRequirePassword(e.target.checked)}
          />
        </ListItem>
        <ListItem>
          <ListItemText
            primary="Biometric Authentication"
            secondary="Use fingerprint or face recognition"
          />
          <Switch checked={biometricAuth} onChange={(e) => setBiometricAuth(e.target.checked)} />
        </ListItem>
        <ListItem>
          <Button variant="outlined" fullWidth>
            Change Password
          </Button>
        </ListItem>
      </List>
    </Box>
  );
};

export default SecuritySettingsScreen;
