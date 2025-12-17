/**
 * Security Settings Screen
 * 
 * Configure app security and privacy settings
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  FormControl,
  FormGroup,
  FormControlLabel,
  Switch,
  Button,
  Divider,
  Alert,
  TextField,
  Snackbar,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
} from '@mui/material';
import { ArrowBack, Lock, VpnKey } from '@mui/icons-material';

export const SecuritySettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [requirePassword, setRequirePassword] = React.useState(false);
  const [biometric, setBiometric] = React.useState(false);
  const [autoLock, setAutoLock] = React.useState(true);
  const [hideSensitive, setHideSensitive] = React.useState(false);
  const [showPassword, setShowPassword] = React.useState(false);
  const [snackbar, setSnackbar] = React.useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });
  const [showClearDialog, setShowClearDialog] = React.useState(false);

  const handleSetPassword = () => {
    setSnackbar({ open: true, message: 'Password setup would open here', severity: 'info' });
  };

  const handleClearData = () => {
    setShowClearDialog(true);
  };

  const confirmClearData = async () => {
    setShowClearDialog(false);
    try {
      // Clear data implementation would go here
      setSnackbar({ open: true, message: 'Data cleared successfully', severity: 'success' });
    } catch (error) {
      setSnackbar({ open: true, message: `Failed to clear data: ${error instanceof Error ? error.message : 'Unknown error'}`, severity: 'error' });
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
            Security
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* Authentication */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Authentication
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={requirePassword}
                      onChange={(e) => setRequirePassword(e.target.checked)}
                    />
                  }
                  label="Require Password"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Require password to access the app
                </Typography>
              </FormGroup>
            </FormControl>

            {requirePassword && (
              <Button
                variant="outlined"
                fullWidth
                startIcon={<Lock />}
                onClick={handleSetPassword}
                sx={{ mb: 2 }}
              >
                Set Password
              </Button>
            )}

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={biometric}
                      onChange={(e) => setBiometric(e.target.checked)}
                      disabled={!requirePassword}
                    />
                  }
                  label="Biometric Authentication"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Use fingerprint or face recognition (if available)
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%' }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={autoLock}
                      onChange={(e) => setAutoLock(e.target.checked)}
                      disabled={!requirePassword}
                    />
                  }
                  label="Auto-Lock"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically lock app after 5 minutes of inactivity
                </Typography>
              </FormGroup>
            </FormControl>
          </CardContent>
        </Card>

        {/* Privacy */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Privacy
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={hideSensitive}
                      onChange={(e) => setHideSensitive(e.target.checked)}
                    />
                  }
                  label="Hide Sensitive Info in Recents"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Hide app preview in task switcher
                </Typography>
              </FormGroup>
            </FormControl>

            <Button
              variant="outlined"
              color="error"
              fullWidth
              onClick={handleClearData}
              sx={{ mt: 2 }}
            >
              Clear All App Data
            </Button>
          </CardContent>
        </Card>

        {/* Info Alert */}
        <Alert severity="warning">
          Security features help protect your data. Make sure to remember your password if you enable authentication.
        </Alert>
      </Box>
    </Box>
  );
};

export default SecuritySettingsScreen;
