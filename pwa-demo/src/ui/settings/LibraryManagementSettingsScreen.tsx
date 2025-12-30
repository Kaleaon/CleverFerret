/**
 * Library Management Settings Screen
 *
 * Configure library scanning, organization, and metadata settings
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
  Snackbar,
} from '@mui/material';
import { ArrowBack, Refresh, FolderOpen } from '@mui/icons-material';

export const LibraryManagementSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [autoScan, setAutoScan] = React.useState(true);
  const [watchFolders, setWatchFolders] = React.useState(true);
  const [autoMetadata, setAutoMetadata] = React.useState(true);
  const [groupSeries, setGroupSeries] = React.useState(true);
  const [scanning, setScanning] = React.useState(false);
  const [snackbar, setSnackbar] = React.useState<{
    open: boolean;
    message: string;
    severity?: 'success' | 'error' | 'info';
  }>({ open: false, message: '' });

  const handleScanAll = async () => {
    setScanning(true);
    try {
      // Simulate scan
      await new Promise((resolve) => setTimeout(resolve, 2000));
      setSnackbar({ open: true, message: 'Library scan completed', severity: 'success' });
    } catch (error) {
      setSnackbar({
        open: true,
        message: `Scan failed: ${error instanceof Error ? error.message : 'Unknown error'}`,
        severity: 'error',
      });
    } finally {
      setScanning(false);
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
            Library Management
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* Scanning Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Scanning
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={autoScan} onChange={(e) => setAutoScan(e.target.checked)} />
                  }
                  label="Auto-Scan on Startup"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically scan libraries when app starts
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={watchFolders}
                      onChange={(e) => setWatchFolders(e.target.checked)}
                    />
                  }
                  label="Watch Folders for Changes"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Monitor library folders and auto-scan when files change
                </Typography>
              </FormGroup>
            </FormControl>

            <Button
              variant="contained"
              fullWidth
              startIcon={<Refresh />}
              onClick={handleScanAll}
              disabled={scanning}
              sx={{ mt: 2 }}
            >
              {scanning ? 'Scanning...' : 'Scan All Libraries Now'}
            </Button>
          </CardContent>
        </Card>

        {/* Metadata Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Metadata
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={autoMetadata}
                      onChange={(e) => setAutoMetadata(e.target.checked)}
                    />
                  }
                  label="Auto-Fetch Metadata"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically download metadata and cover art for new items
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl component="fieldset" sx={{ width: '100%' }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={groupSeries}
                      onChange={(e) => setGroupSeries(e.target.checked)}
                    />
                  }
                  label="Group Books by Series"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Automatically detect and group series books together
                </Typography>
              </FormGroup>
            </FormControl>
          </CardContent>
        </Card>

        {/* Info */}
        <Alert severity="info">
          Configure how libraries are scanned and organized. Changes take effect on next scan.
        </Alert>
      </Box>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert
          onClose={() => setSnackbar({ ...snackbar, open: false })}
          severity={snackbar.severity || 'info'}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default LibraryManagementSettingsScreen;
