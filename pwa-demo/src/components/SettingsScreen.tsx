// Settings screen for CleverFerret
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Paper,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  ListItemSecondaryAction,
  Switch,
  Divider,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  TextField,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Chip,
  Alert,
  Card,
  CardContent,
} from '@mui/material';
import {
  ArrowBack as ArrowBackIcon,
  DarkMode as DarkModeIcon,
  Notifications as NotificationsIcon,
  CloudSync as CloudSyncIcon,
  Storage as StorageIcon,
  Security as SecurityIcon,
  Language as LanguageIcon,
  Download as DownloadIcon,
  Update as UpdateIcon,
  Info as InfoIcon,
  Settings as SettingsIcon,
  Api as ApiIcon,
  Backup as BackupIcon,
  Delete as DeleteIcon,
} from '@mui/icons-material';
import { useAppStore } from '../store/app-store';
import { ReaderThemeMode, ReaderFont } from '../types';
import { getAllUnifiedThemes } from '../themes/unified-themes';

export const SettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const { readerPreferences, selectedTheme, setReaderThemeMode, setReaderFont, setReaderFontSize, setTheme } = useAppStore();
  const [notifications, setNotifications] = useState(true);
  const [autoSync, setAutoSync] = useState(false);
  const [offlineMode, setOfflineMode] = useState(true);
  const [showApiDialog, setShowApiDialog] = useState(false);
  const [showAboutDialog, setShowAboutDialog] = useState(false);
  const [installPromptEvent, setInstallPromptEvent] = useState<any>(null);
  const [isInstallable, setIsInstallable] = useState(false);

  useEffect(() => {
    const handler = (e: any) => {
      e.preventDefault();
      setInstallPromptEvent(e);
      setIsInstallable(true);
    };
    window.addEventListener('beforeinstallprompt', handler);
    return () => window.removeEventListener('beforeinstallprompt', handler);
  }, []);

  const handleInstallClick = async () => {
    if (!installPromptEvent) return;
    await installPromptEvent.prompt();
    const choiceResult = await installPromptEvent.userChoice;
    if (choiceResult.outcome === 'accepted') {
      console.log('PWA installed');
    }
    setInstallPromptEvent(null);
    setIsInstallable(false);
  };

  const requestNotificationPermission = async () => {
    try {
      if (!('Notification' in window)) return;
      const permission = await Notification.requestPermission();
      if (permission === 'granted') {
        const reg = await navigator.serviceWorker?.getRegistration();
        await reg?.showNotification('Notifications enabled', {
          body: 'You will receive updates from CleverFerret.',
        });
      }
    } catch (e) {
      console.warn('Notification permission request failed', e);
    }
  };

  // API Keys state
  const [apiKeys, setApiKeys] = useState({
    googleBooks: '',
    tmdb: '',
    omdbApi: '',
    spotify: '',
    musicbrainz: '', // No key needed but keeping for consistency
  });

  const handleApiKeysSave = () => {
    // In a real app, this would save to secure storage
    console.log('Saving API keys:', apiKeys);
    setShowApiDialog(false);
  };

  const allThemes = getAllUnifiedThemes();

  const settingsSections = [
    {
      title: 'Appearance',
      items: [
        {
          icon: <DarkModeIcon />,
          primary: 'App Theme',
          secondary: allThemes.find((t) => t.name === selectedTheme)?.displayName || 'Navy & Gold',
          action: (
            <Box sx={{ display: 'flex', gap: 1 }}>
              <FormControl size="small" sx={{ minWidth: 180 }}>
                <InputLabel>Theme</InputLabel>
                <Select
                  label="Theme"
                  value={selectedTheme}
                  onChange={(e: any) => setTheme(e.target.value)}
                >
                  {allThemes.map((theme) => (
                    <MenuItem key={theme.name} value={theme.name}>
                      {theme.displayName}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
              <Button size="small" onClick={() => navigate('/themes')}>
                Preview
              </Button>
            </Box>
          ),
        },
        {
          icon: <DarkModeIcon />,
          primary: 'Reader Theme',
          secondary: 'White, Black, Sepia, E‑ink',
          action: (
            <FormControl size="small" sx={{ minWidth: 140 }}>
              <InputLabel>Theme</InputLabel>
              <Select
                label="Theme"
                value={readerPreferences.themeMode}
                onChange={(e: any) => setReaderThemeMode(e.target.value as ReaderThemeMode)}
              >
                <MenuItem value={ReaderThemeMode.WHITE}>White</MenuItem>
                <MenuItem value={ReaderThemeMode.BLACK}>Black</MenuItem>
                <MenuItem value={ReaderThemeMode.SEPIA}>Sepia</MenuItem>
                <MenuItem value={ReaderThemeMode.EINK}>E‑ink</MenuItem>
              </Select>
            </FormControl>
          ),
        },
        {
          icon: <DarkModeIcon />,
          primary: 'Reader Font',
          secondary: 'System Sans/Serif, Atkinson, OpenDyslexic, Lexend',
          action: (
            <FormControl size="small" sx={{ minWidth: 200 }}>
              <InputLabel>Font</InputLabel>
              <Select
                label="Font"
                value={readerPreferences.font}
                onChange={(e: any) => setReaderFont(e.target.value as ReaderFont)}
              >
                <MenuItem value={ReaderFont.SYSTEM_SANS}>System Sans</MenuItem>
                <MenuItem value={ReaderFont.SYSTEM_SERIF}>System Serif</MenuItem>
                <MenuItem value={ReaderFont.ATKINSON}>Atkinson Hyperlegible</MenuItem>
                <MenuItem value={ReaderFont.OPENDYSLEXIC}>OpenDyslexic</MenuItem>
                <MenuItem value={ReaderFont.LEXEND}>Lexend</MenuItem>
              </Select>
            </FormControl>
          ),
        },
        {
          icon: <DarkModeIcon />,
          primary: 'Reader Font Size',
          secondary: `${readerPreferences.fontSize}px`,
          action: (
            <Box>
              <Button
                size="small"
                onClick={() => setReaderFontSize(Math.max(12, readerPreferences.fontSize - 2))}
              >
                A-
              </Button>
              <Button
                size="small"
                onClick={() => setReaderFontSize(Math.min(28, readerPreferences.fontSize + 2))}
              >
                A+
              </Button>
            </Box>
          ),
        },
        {
          icon: <LanguageIcon />,
          primary: 'Language',
          secondary: 'English (US)',
          action: <Button size="small">Change</Button>,
        },
      ],
    },
    {
      title: 'Library & Sync',
      items: [
        {
          icon: <CloudSyncIcon />,
          primary: 'Server Integration',
          secondary: 'Connect to Plex, Jellyfin, or Emby servers',
          action: (
            <Button size="small" onClick={() => navigate('/servers')}>
              Manage
            </Button>
          ),
        },
        {
          icon: <NotificationsIcon />,
          primary: 'Notifications',
          secondary: 'Show import progress and updates',
          action: (
            <Switch
              checked={notifications}
              onChange={async (e) => {
                const enable = e.target.checked;
                setNotifications(enable);
                if (enable) {
                  await requestNotificationPermission();
                }
              }}
            />
          ),
        },
        {
          icon: <CloudSyncIcon />,
          primary: 'Auto Sync',
          secondary: 'Automatically sync library changes',
          action: <Switch checked={autoSync} onChange={(e) => setAutoSync(e.target.checked)} />,
        },
        {
          icon: <DownloadIcon />,
          primary: 'Offline Mode',
          secondary: 'Download content for offline viewing',
          action: (
            <Switch checked={offlineMode} onChange={(e) => setOfflineMode(e.target.checked)} />
          ),
        },
      ],
    },
    {
      title: 'Data & Privacy',
      items: [
        {
          icon: <ApiIcon />,
          primary: 'Metadata APIs',
          secondary: 'Configure API keys for metadata fetching',
          action: (
            <Button size="small" onClick={() => setShowApiDialog(true)}>
              Configure
            </Button>
          ),
        },
        {
          icon: <StorageIcon />,
          primary: 'Storage',
          secondary: 'Manage local storage and cache',
          action: <Button size="small">Manage</Button>,
        },
        {
          icon: <BackupIcon />,
          primary: 'Backup & Restore',
          secondary: 'Export/import library data',
          action: <Button size="small">Backup</Button>,
        },
        {
          icon: <SecurityIcon />,
          primary: 'Privacy Settings',
          secondary: 'Control data sharing and analytics',
          action: <Button size="small">Review</Button>,
        },
      ],
    },
    {
      title: 'About',
      items: [
        {
          icon: <UpdateIcon />,
          primary: 'Install App',
          secondary: isInstallable ? 'Install CleverFerret on this device' : 'Already installed or not supported',
          action: (
            <Button size="small" disabled={!isInstallable} onClick={handleInstallClick}>
              Install
            </Button>
          ),
        },
        {
          icon: <UpdateIcon />,
          primary: 'Check for Updates',
          secondary: 'Version 1.0.0 - PWA Demo',
          action: <Button size="small">Check</Button>,
        },
        {
          icon: <InfoIcon />,
          primary: 'About CleverFerret',
          secondary: 'Universal Media Library',
          action: (
            <Button size="small" onClick={() => setShowAboutDialog(true)}>
              Info
            </Button>
          ),
        },
      ],
    },
  ];

  return (
    <Box sx={{ minHeight: '100vh', bgcolor: 'background.default' }}>
      {/* Header */}
      <AppBar position="static" elevation={0}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBackIcon />
          </IconButton>
          <SettingsIcon sx={{ ml: 2, mr: 2 }} />
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Settings
          </Typography>
        </Toolbar>
      </AppBar>

      {/* Settings Content */}
      <Box sx={{ p: 3, maxWidth: 800, mx: 'auto' }}>
        {settingsSections.map((section, sectionIndex) => (
          <Paper
            key={section.title}
            sx={{
              mb: 3,
              bgcolor: 'background.paper',
              border: '1px solid #2d3136',
            }}
          >
            <Box sx={{ p: 2, borderBottom: '1px solid #2d3136' }}>
              <Typography variant="h6" sx={{ fontWeight: 500 }}>
                {section.title}
              </Typography>
            </Box>
            <List disablePadding>
              {section.items.map((item, itemIndex) => (
                <React.Fragment key={itemIndex}>
                  <ListItem sx={{ py: 2 }}>
                    <ListItemIcon sx={{ color: 'primary.main' }}>{item.icon}</ListItemIcon>
                    <ListItemText
                      primary={item.primary}
                      secondary={item.secondary}
                      secondaryTypographyProps={{
                        color: 'text.secondary',
                        fontSize: '0.875rem',
                      }}
                    />
                    <ListItemSecondaryAction>{item.action}</ListItemSecondaryAction>
                  </ListItem>
                  {itemIndex < section.items.length - 1 && (
                    <Divider sx={{ borderColor: '#2d3136' }} />
                  )}
                </React.Fragment>
              ))}
            </List>
          </Paper>
        ))}

        {/* Danger Zone */}
        <Paper
          sx={{
            bgcolor: 'background.paper',
            border: '1px solid #d32f2f',
          }}
        >
          <Box sx={{ p: 2, borderBottom: '1px solid #d32f2f' }}>
            <Typography variant="h6" sx={{ fontWeight: 500, color: 'error.main' }}>
              Danger Zone
            </Typography>
          </Box>
          <Box sx={{ p: 3 }}>
            <Alert severity="warning" sx={{ mb: 2 }}>
              These actions are irreversible. Please be careful.
            </Alert>
            <Button
              variant="outlined"
              color="error"
              startIcon={<DeleteIcon />}
              sx={{ mr: 2, mb: 1 }}
            >
              Clear All Data
            </Button>
            <Button variant="outlined" color="error" startIcon={<DeleteIcon />} sx={{ mb: 1 }}>
              Reset Settings
            </Button>
          </Box>
        </Paper>
      </Box>

      {/* API Keys Dialog */}
      <Dialog open={showApiDialog} onClose={() => setShowApiDialog(false)} maxWidth="md" fullWidth>
        <DialogTitle>Configure Metadata API Keys</DialogTitle>
        <DialogContent>
          <Typography variant="body2" color="text.secondary" paragraph>
            Configure API keys to enable automatic metadata fetching from various sources. All keys
            are stored locally and never shared.
          </Typography>

          <Card sx={{ mb: 3, bgcolor: 'secondary.main' }}>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Available APIs
              </Typography>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 1 }}>
                <Chip label="Google Books API" color="primary" variant="outlined" />
                <Chip label="TMDB (Movies)" color="primary" variant="outlined" />
                <Chip label="OMDb API" color="primary" variant="outlined" />
                <Chip label="Spotify Web API" color="primary" variant="outlined" />
                <Chip label="MusicBrainz (Free)" color="success" />
                <Chip label="Open Library (Free)" color="success" />
              </Box>
            </CardContent>
          </Card>

          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
            <TextField
              label="Google Books API Key"
              value={apiKeys.googleBooks}
              onChange={(e) => setApiKeys({ ...apiKeys, googleBooks: e.target.value })}
              placeholder="Enter your Google Books API key"
              helperText="Get your key from Google Cloud Console"
              fullWidth
            />
            <TextField
              label="TMDB API Key"
              value={apiKeys.tmdb}
              onChange={(e) => setApiKeys({ ...apiKeys, tmdb: e.target.value })}
              placeholder="Enter your TMDB API key"
              helperText="Get your key from themoviedb.org"
              fullWidth
            />
            <TextField
              label="OMDb API Key"
              value={apiKeys.omdbApi}
              onChange={(e) => setApiKeys({ ...apiKeys, omdbApi: e.target.value })}
              placeholder="Enter your OMDb API key"
              helperText="Get your key from omdbapi.com"
              fullWidth
            />
            <TextField
              label="Spotify Client ID"
              value={apiKeys.spotify}
              onChange={(e) => setApiKeys({ ...apiKeys, spotify: e.target.value })}
              placeholder="Enter your Spotify Client ID"
              helperText="Get your client ID from Spotify Developer Dashboard"
              fullWidth
            />
          </Box>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowApiDialog(false)}>Cancel</Button>
          <Button onClick={handleApiKeysSave} variant="contained">
            Save API Keys
          </Button>
        </DialogActions>
      </Dialog>

      {/* About Dialog */}
      <Dialog
        open={showAboutDialog}
        onClose={() => setShowAboutDialog(false)}
        maxWidth="sm"
        fullWidth
      >
        <DialogTitle>About CleverFerret</DialogTitle>
        <DialogContent>
          <Box sx={{ textAlign: 'center', mb: 3 }}>
            <Typography variant="h4" gutterBottom sx={{ fontWeight: 300 }}>
              CleverFerret
            </Typography>
            <Typography variant="h6" color="text.secondary" gutterBottom>
              Universal Media Library
            </Typography>
            <Chip label="PWA Demo v1.0.0" color="primary" />
          </Box>

          <Typography paragraph>
            CleverFerret is a comprehensive universal media library for managing your complete
            collection of books, movies, music, podcasts, and more, all in one place.
          </Typography>

          <Typography variant="h6" gutterBottom sx={{ mt: 3 }}>
            Features:
          </Typography>
          <List dense>
            <ListItem>
              <ListItemText primary="📚 Multi-format book reading (EPUB, PDF, etc.)" />
            </ListItem>
            <ListItem>
              <ListItemText primary="🎬 Video playback with advanced controls" />
            </ListItem>
            <ListItem>
              <ListItemText primary="🎵 Audio player with playlist support" />
            </ListItem>
            <ListItem>
              <ListItemText primary="🔍 Automatic metadata fetching from multiple APIs" />
            </ListItem>
            <ListItem>
              <ListItemText primary="📱 Progressive Web App (installable)" />
            </ListItem>
            <ListItem>
              <ListItemText primary="🌙 Plex-inspired dark theme" />
            </ListItem>
            <ListItem>
              <ListItemText primary="💾 Offline-first with local storage" />
            </ListItem>
          </List>

          <Typography variant="body2" color="text.secondary" sx={{ mt: 2 }}>
            This is a demonstration of the web version. The full Android app includes additional
            features like Calibre import, advanced reading tools, and more.
          </Typography>
        </DialogContent>
        <DialogActions>
          <Button onClick={() => setShowAboutDialog(false)} variant="contained">
            Close
          </Button>
        </DialogActions>
      </Dialog>
    </Box>
  );
};
