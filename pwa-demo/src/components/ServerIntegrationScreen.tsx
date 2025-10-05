// Server Integration Screen for PWA - Plex, Jellyfin, Emby
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Card,
  CardContent,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Chip,
  Alert,
  Grid,
  Paper,
} from '@mui/material';
import {
  ArrowBack as ArrowBackIcon,
  CloudQueue as PlexIcon,
  Cloud as JellyfinIcon,
  CloudCircle as EmbyIcon,
  Add as AddIcon,
  CheckCircle as CheckCircleIcon,
  Sync as SyncIcon,
  LinkOff as LinkOffIcon,
} from '@mui/icons-material';

type ServerType = 'plex' | 'jellyfin' | 'emby';

interface ServerConnection {
  id: string;
  type: ServerType;
  name: string;
  url: string;
  connected: boolean;
}

export const ServerIntegrationScreen: React.FC = () => {
  const navigate = useNavigate();
  const [servers, setServers] = useState<ServerConnection[]>([]);
  const [showAddDialog, setShowAddDialog] = useState(false);
  const [selectedType, setSelectedType] = useState<ServerType>('plex');
  const [serverUrl, setServerUrl] = useState('');
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const serverTypes = [
    {
      type: 'plex' as ServerType,
      name: 'Plex Media Server',
      icon: <PlexIcon sx={{ fontSize: 48 }} />,
      description: 'Connect to your Plex server for seamless media integration',
      color: '#e5a00d',
    },
    {
      type: 'jellyfin' as ServerType,
      name: 'Jellyfin',
      icon: <JellyfinIcon sx={{ fontSize: 48 }} />,
      description: 'Open-source media system with full API support',
      color: '#00a4dc',
    },
    {
      type: 'emby' as ServerType,
      name: 'Emby',
      icon: <EmbyIcon sx={{ fontSize: 48 }} />,
      description: 'Personal media server with extensive features',
      color: '#52b54b',
    },
  ];

  const handleConnect = () => {
    if (!serverUrl || !username) return;

    const newServer: ServerConnection = {
      id: Date.now().toString(),
      type: selectedType,
      name: `${selectedType.charAt(0).toUpperCase() + selectedType.slice(1)} Server`,
      url: serverUrl,
      connected: true,
    };

    setServers([...servers, newServer]);
    setShowAddDialog(false);
    setServerUrl('');
    setUsername('');
    setPassword('');
  };

  const handleDisconnect = (serverId: string) => {
    setServers(servers.filter((s) => s.id !== serverId));
  };

  const handleSync = (serverId: string) => {
    console.log('Syncing server:', serverId);
    // Would trigger actual sync here
  };

  const connectedServers = (type: ServerType) => servers.filter((s) => s.type === type);

  return (
    <Box sx={{ minHeight: '100vh', bgcolor: 'background.default' }}>
      {/* Header */}
      <AppBar position="static" elevation={0}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBackIcon />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1, ml: 2 }}>
            Server Integration
          </Typography>
        </Toolbar>
      </AppBar>

      {/* Content */}
      <Box sx={{ p: 3, maxWidth: 1200, mx: 'auto' }}>
        <Paper sx={{ p: 3, mb: 3, bgcolor: 'background.paper', border: '1px solid #2d3136' }}>
          <Typography variant="h5" gutterBottom sx={{ fontWeight: 300 }}>
            Connect to Media Servers
          </Typography>
          <Typography variant="body1" color="text.secondary">
            Connect CleverFerret to your existing media servers for seamless library integration.
            Supports Plex, Jellyfin, and Emby.
          </Typography>
        </Paper>

        {/* Server type cards */}
        <Grid container spacing={3} sx={{ mb: 4 }}>
          {serverTypes.map((serverType) => {
            const connected = connectedServers(serverType.type);
            return (
              <Grid item xs={12} md={4} key={serverType.type}>
                <Card
                  sx={{
                    height: '100%',
                    cursor: 'pointer',
                    '&:hover': {
                      borderColor: serverType.color,
                      transform: 'translateY(-4px)',
                    },
                  }}
                  onClick={() => {
                    setSelectedType(serverType.type);
                    setShowAddDialog(true);
                  }}
                >
                  <CardContent>
                    <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', mb: 2 }}>
                      <Box sx={{ color: serverType.color, mb: 1 }}>{serverType.icon}</Box>
                      <Typography variant="h6" align="center" gutterBottom>
                        {serverType.name}
                      </Typography>
                    </Box>
                    <Typography variant="body2" color="text.secondary" align="center" paragraph>
                      {serverType.description}
                    </Typography>
                    {connected.length > 0 && (
                      <Chip
                        label={`${connected.length} connected`}
                        color="primary"
                        size="small"
                        sx={{ mt: 1 }}
                      />
                    )}
                  </CardContent>
                </Card>
              </Grid>
            );
          })}
        </Grid>

        {/* Connected servers */}
        {servers.length > 0 && (
          <>
            <Typography variant="h6" gutterBottom sx={{ fontWeight: 500, mb: 2 }}>
              Connected Servers
            </Typography>
            <List>
              {servers.map((server) => {
                const serverTypeInfo = serverTypes.find((st) => st.type === server.type);
                return (
                  <Paper key={server.id} sx={{ mb: 1, bgcolor: 'background.paper' }}>
                    <ListItem>
                      <ListItemIcon>
                        <CheckCircleIcon sx={{ color: serverTypeInfo?.color }} />
                      </ListItemIcon>
                      <ListItemText
                        primary={server.name}
                        secondary={
                          <>
                            <Typography variant="body2" component="span" sx={{ color: serverTypeInfo?.color }}>
                              {serverTypeInfo?.name}
                            </Typography>
                            {' • '}
                            {server.url}
                          </>
                        }
                      />
                      <Button
                        startIcon={<SyncIcon />}
                        onClick={() => handleSync(server.id)}
                        size="small"
                        sx={{ mr: 1 }}
                      >
                        Sync
                      </Button>
                      <Button
                        startIcon={<LinkOffIcon />}
                        onClick={() => handleDisconnect(server.id)}
                        size="small"
                        color="error"
                      >
                        Disconnect
                      </Button>
                    </ListItem>
                  </Paper>
                );
              })}
            </List>
          </>
        )}
      </Box>

      {/* Add server dialog */}
      <Dialog open={showAddDialog} onClose={() => setShowAddDialog(false)} maxWidth="sm" fullWidth>
        <DialogTitle>
          Connect to {serverTypes.find((st) => st.type === selectedType)?.name}
        </DialogTitle>
        <DialogContent>
          <Alert severity="info" sx={{ mb: 3 }}>
            {selectedType === 'plex'
              ? 'Plex uses PIN-based authentication. You will be redirected to Plex.tv to authorize.'
              : 'Enter your server details and credentials to connect.'}
          </Alert>
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 2 }}>
            <TextField
              fullWidth
              label="Server URL"
              value={serverUrl}
              onChange={(e) => setServerUrl(e.target.value)}
              placeholder={`https://${selectedType}.example.com:8096`}
              helperText="Full URL including port (e.g., http://192.168.1.100:8096)"
            />
            <TextField
              fullWidth
              label="Username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
            />
            <TextField
              fullWidth
              label="Password"
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </Box>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAddDialog(false)}>Cancel</Button>
          <Button
            variant="contained"
            onClick={handleConnect}
            disabled={!serverUrl || !username}
          >
            Connect
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};