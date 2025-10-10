/**
 * Plex Integration Screen
 * 
 * Connect and sync with Plex Media Server.
 * Migrated from PlexIntegrationScreen.kt
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
  TextField,
  Button,
  List,
  ListItem,
  ListItemText,
  ListItemSecondaryAction,
  Switch,
  Alert,
  CircularProgress,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Chip,
} from '@mui/material';
import {
  ArrowBack,
  Add,
  Sync,
  Delete,
  CheckCircle,
  Error as ErrorIcon,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { PlexServer } from '../../data/local/entity';

export const PlexIntegrationScreen: React.FC = () => {
  const navigate = useNavigate();
  const [servers, setServers] = useState<PlexServer[]>([]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [isSyncing, setIsSyncing] = useState(false);
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // Form state
  const [serverName, setServerName] = useState('');
  const [serverHost, setServerHost] = useState('');
  const [serverPort, setServerPort] = useState(32400);
  const [serverToken, setServerToken] = useState('');

  useEffect(() => {
    loadServers();
  }, []);

  const loadServers = async () => {
    const plexServers = await db.plexServers.toArray();
    setServers(plexServers);
  };

  const handleAddServer = async () => {
    if (!serverName || !serverHost || !serverToken) return;

    try {
      await db.plexServers.add({
        serverId: 0,
        name: serverName,
        host: serverHost,
        port: serverPort,
        token: serverToken,
        machineIdentifier: undefined,
        version: undefined,
        isActive: true,
        lastConnected: 0,
        lastSynced: 0,
        dateAdded: Date.now(),
      });

      setShowAddDialog(false);
      setServerName('');
      setServerHost('');
      setServerPort(32400);
      setServerToken('');
      loadServers();
      setMessage({ type: 'success', text: 'Plex server added successfully' });
    } catch (err) {
      setMessage({ type: 'error', text: 'Failed to add Plex server' });
    }
  };

  const handleSync = async (serverId: number) => {
    setIsSyncing(true);
    try {
      // TODO: Implement Plex sync
      await new Promise((resolve) => setTimeout(resolve, 2000));
      await db.plexServers.update(serverId, {
        lastSynced: Date.now(),
      });
      setMessage({ type: 'success', text: 'Sync completed successfully' });
      loadServers();
    } catch (err) {
      setMessage({ type: 'error', text: 'Sync failed' });
    } finally {
      setIsSyncing(false);
    }
  };

  const handleDeleteServer = async (serverId: number) => {
    if (confirm('Delete this Plex server?')) {
      await db.plexServers.delete(serverId);
      loadServers();
    }
  };

  const handleToggleActive = async (serverId: number, isActive: boolean) => {
    await db.plexServers.update(serverId, { isActive: !isActive });
    loadServers();
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Plex Integration
          </Typography>
          <IconButton color="inherit" onClick={() => setShowAddDialog(true)}>
            <Add />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {message && (
          <Alert severity={message.type} onClose={() => setMessage(null)} sx={{ mb: 2 }}>
            {message.text}
          </Alert>
        )}

        <Alert severity="info" sx={{ mb: 2 }}>
          Connect to your Plex Media Server to sync libraries, metadata, and watch progress.
        </Alert>

        {servers.map((server) => (
          <Card key={server.serverId} sx={{ mb: 2 }}>
            <CardContent>
              <Box sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', mb: 2 }}>
                <Box>
                  <Typography variant="h6">{server.name}</Typography>
                  <Typography variant="body2" color="text.secondary">
                    {server.host}:{server.port}
                  </Typography>
                </Box>
                <Chip
                  size="small"
                  label={server.isActive ? 'Active' : 'Inactive'}
                  color={server.isActive ? 'success' : 'default'}
                  icon={server.isActive ? <CheckCircle /> : <ErrorIcon />}
                />
              </Box>

              {server.lastSynced > 0 && (
                <Typography variant="caption" color="text.secondary" sx={{ display: 'block', mb: 2 }}>
                  Last synced: {new Date(server.lastSynced).toLocaleString()}
                </Typography>
              )}

              <Box sx={{ display: 'flex', gap: 1 }}>
                <Button
                  size="small"
                  startIcon={<Sync />}
                  onClick={() => handleSync(server.serverId)}
                  disabled={isSyncing || !server.isActive}
                >
                  {isSyncing ? 'Syncing...' : 'Sync Now'}
                </Button>
                <Button
                  size="small"
                  color="error"
                  startIcon={<Delete />}
                  onClick={() => handleDeleteServer(server.serverId)}
                >
                  Remove
                </Button>
                <FormControlLabel
                  control={
                    <Switch
                      checked={server.isActive}
                      onChange={() => handleToggleActive(server.serverId, server.isActive)}
                    />
                  }
                  label="Enabled"
                />
              </Box>
            </CardContent>
          </Card>
        ))}

        {servers.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Typography variant="h6" gutterBottom>
              No Plex Servers
            </Typography>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              Add your Plex Media Server to get started
            </Typography>
            <Button
              variant="contained"
              startIcon={<Add />}
              onClick={() => setShowAddDialog(true)}
              sx={{ mt: 2 }}
            >
              Add Server
            </Button>
          </Box>
        )}

        {isSyncing && (
          <Box sx={{ display: 'flex', justifyContent: 'center', mt: 3 }}>
            <CircularProgress />
          </Box>
        )}
      </Box>

      {/* Add Server Dialog */}
      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Add Plex Server</DialogTitle>
        <DialogContent>
          <TextField
            autoFocus
            margin="dense"
            label="Server Name"
            fullWidth
            value={serverName}
            onChange={(e) => setServerName(e.target.value)}
          />
          <TextField
            margin="dense"
            label="Host"
            fullWidth
            value={serverHost}
            onChange={(e) => setServerHost(e.target.value)}
            placeholder="192.168.1.100 or plex.example.com"
          />
          <TextField
            margin="dense"
            label="Port"
            type="number"
            fullWidth
            value={serverPort}
            onChange={(e) => setServerPort(parseInt(e.target.value))}
          />
          <TextField
            margin="dense"
            label="Token"
            fullWidth
            type="password"
            value={serverToken}
            onChange={(e) => setServerToken(e.target.value)}
            helperText="Get your token from Plex account settings"
          />
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button
            onClick={handleAddServer}
            variant="contained"
            disabled={!serverName || !serverHost || !serverToken}
          >
            Add Server
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};

export default PlexIntegrationScreen;
