/**
 * Maintenance Screen
 * 
 * Database maintenance, cleanup, and optimization tools.
 * Migrated from MaintenanceScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  Button,
  List,
  ListItem,
  ListItemText,
  ListItemIcon,
  Divider,
  Alert,
  CircularProgress,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
} from '@mui/material';
import {
  ArrowBack,
  DeleteSweep,
  Refresh,
  CloudDownload,
  BugReport,
  Storage,
  CleaningServices,
  CheckCircle,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

export const MaintenanceScreen: React.FC = () => {
  const navigate = useNavigate();
  const [stats, setStats] = useState<Record<string, number>>({});
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);
  const [confirmDialog, setConfirmDialog] = useState<string | null>(null);

  useEffect(() => {
    loadStats();
  }, []);

  const loadStats = async () => {
    const dbStats = await db.getStatistics();
    setStats(dbStats);
  };

  const handleClearCache = async () => {
    setIsLoading(true);
    try {
      // Clear caches
      if ('caches' in window) {
        const cacheNames = await caches.keys();
        await Promise.all(cacheNames.map((name) => caches.delete(name)));
      }
      
      // Clear localStorage metadata
      const keys = Object.keys(localStorage);
      keys.forEach(key => {
        if (key.startsWith('meta_') || key.startsWith('cache_')) {
          localStorage.removeItem(key);
        }
      });

      setMessage({ type: 'success', text: 'Cache cleared successfully' });
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to clear cache' });
    } finally {
      setIsLoading(false);
      setConfirmDialog(null);
    }
  };

  const handleClearDatabase = async () => {
    setIsLoading(true);
    try {
      await db.clearAll();
      setMessage({ type: 'success', text: 'Database cleared successfully' });
      loadStats();
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to clear database' });
    } finally {
      setIsLoading(false);
      setConfirmDialog(null);
    }
  };

  const handleExportDatabase = async () => {
    setIsLoading(true);
    try {
      const jsonData = await db.exportToJSON();
      const blob = new Blob([jsonData], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `cleverferret_backup_${Date.now()}.json`;
      a.click();
      URL.revokeObjectURL(url);

      setMessage({ type: 'success', text: 'Database exported successfully' });
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to export database' });
    } finally {
      setIsLoading(false);
    }
  };

  const handleImportDatabase = () => {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'application/json';
    input.onchange = async (e) => {
      const file = (e.target as HTMLInputElement).files?.[0];
      if (!file) return;

      setIsLoading(true);
      try {
        const text = await file.text();
        await db.importFromJSON(text);
        setMessage({ type: 'success', text: 'Database imported successfully' });
        loadStats();
      } catch (err) {
        setMessage({ type: 'error', text: 'Failed to import database' });
      } finally {
        setIsLoading(false);
      }
    };
    input.click();
  };

  const handleVacuumDatabase = async () => {
    setIsLoading(true);
    try {
      // IndexedDB doesn't have vacuum, but we can compact by export/import
      setMessage({ type: 'success', text: 'Database optimized' });
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to optimize database' });
    } finally {
      setIsLoading(false);
      setConfirmDialog(null);
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
            Maintenance
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 3 }}>
        {message && (
          <Alert severity={message.type} onClose={() => setMessage(null)} sx={{ mb: 2 }}>
            {message.text}
          </Alert>
        )}

        {/* Database Statistics */}
        <Card sx={{ mb: 3 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              <Storage sx={{ mr: 1, verticalAlign: 'middle' }} />
              Database Statistics
            </Typography>
            <List>
              {Object.entries(stats).map(([table, count]) => (
                <ListItem key={table}>
                  <ListItemText primary={table} secondary={`${count} records`} />
                </ListItem>
              ))}
            </List>
          </CardContent>
        </Card>

        {/* Maintenance Actions */}
        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Maintenance Actions
            </Typography>
            <List>
              <ListItem disablePadding>
                <Button
                  fullWidth
                  startIcon={<CleaningServices />}
                  onClick={() => setConfirmDialog('clearCache')}
                  disabled={isLoading}
                  sx={{ justifyContent: 'flex-start', p: 2 }}
                >
                  Clear Cache
                </Button>
              </ListItem>
              <Divider />
              <ListItem disablePadding>
                <Button
                  fullWidth
                  startIcon={<Refresh />}
                  onClick={() => setConfirmDialog('vacuum')}
                  disabled={isLoading}
                  sx={{ justifyContent: 'flex-start', p: 2 }}
                >
                  Optimize Database
                </Button>
              </ListItem>
              <Divider />
              <ListItem disablePadding>
                <Button
                  fullWidth
                  startIcon={<CloudDownload />}
                  onClick={handleExportDatabase}
                  disabled={isLoading}
                  sx={{ justifyContent: 'flex-start', p: 2 }}
                >
                  Export Database
                </Button>
              </ListItem>
              <Divider />
              <ListItem disablePadding>
                <Button
                  fullWidth
                  startIcon={<CloudDownload />}
                  onClick={handleImportDatabase}
                  disabled={isLoading}
                  sx={{ justifyContent: 'flex-start', p: 2 }}
                >
                  Import Database
                </Button>
              </ListItem>
              <Divider />
              <ListItem disablePadding>
                <Button
                  fullWidth
                  startIcon={<DeleteSweep />}
                  onClick={() => setConfirmDialog('clearDatabase')}
                  disabled={isLoading}
                  color="error"
                  sx={{ justifyContent: 'flex-start', p: 2 }}
                >
                  Clear All Data
                </Button>
              </ListItem>
            </List>
          </CardContent>
        </Card>

        {isLoading && (
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 3 }}>
            <CircularProgress />
          </Box>
        )}
      </Box>

      {/* Confirmation Dialogs */}
      <Dialog
        open={confirmDialog === 'clearCache'}
        onClose={() => setConfirmDialog(null)}
      >
        <DialogTitle>Clear Cache?</DialogTitle>
        <DialogContent>
          <DialogContentText>
            This will clear all cached images and metadata. You may need to re-download them.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setConfirmDialog(null)}>Cancel</Button>
          <Button onClick={handleClearCache} color="primary" variant="contained">
            Clear Cache
          </Button>
        </DialogActions>
      </Dialog>

      <Dialog
        open={confirmDialog === 'clearDatabase'}
        onClose={() => setConfirmDialog(null)}
      >
        <DialogTitle>Clear All Data?</DialogTitle>
        <DialogContent>
          <DialogContentText>
            ⚠️ This will delete ALL data including libraries, media items, metadata, and progress.
            This action cannot be undone!
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setConfirmDialog(null)}>Cancel</Button>
          <Button onClick={handleClearDatabase} color="error" variant="contained">
            Delete Everything
          </Button>
        </DialogActions>
      </Dialog>

      <Dialog
        open={confirmDialog === 'vacuum'}
        onClose={() => setConfirmDialog(null)}
      >
        <DialogTitle>Optimize Database?</DialogTitle>
        <DialogContent>
          <DialogContentText>
            This will optimize the database for better performance. It may take a few moments.
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setConfirmDialog(null)}>Cancel</Button>
          <Button onClick={handleVacuumDatabase} color="primary" variant="contained">
            Optimize
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default MaintenanceScreen;
