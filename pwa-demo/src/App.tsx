/**
 * Main Application Component for CleverFerret PWA
 * 
 * Complete navigation and routing implementation with responsive design
 * Migrated from MainActivity.kt
 */

import React from 'react';
import { BrowserRouter as Router, Routes, Route, useNavigate, useLocation } from 'react-router-dom';
import { ThemeProvider, CssBaseline, Box, TextField, InputAdornment, useMediaQuery, useTheme, Fab, Zoom } from '@mui/material';
import { Search as SearchIcon, Add as AddIcon } from '@mui/icons-material';

// Import all screens
import {
  LibraryListScreen,
  LibraryDetailsScreen,
  LibraryManagementScreen,
  MediaItemDetailScreen,
  EReaderScreen,
  PDFReaderScreen,
  ComicReaderScreen,
  BookmarkScreen,
  AudioPlayerScreen,
  VideoPlayerScreen,
  QueueScreen,
  NowPlayingBar,
  MusicLibraryScreen,
  PodcastManagerScreen,
  PodcastDiscoveryScreen,
  RadioScreen,
  RadioDiscoveryScreen,
  CollectionDetailScreen,
  CollectionsListScreen,
  SeriesDetailScreen,
  BookshelfScreen,
  SettingsMainScreen,
  ReaderSettingsScreen,
  APIKeysScreen,
  ImportExportSettingsScreen,
  AudiobookSettingsScreen,
  LibraryManagementSettingsScreen,
  PodcastSettingsScreen,
  NotificationSettingsScreen,
  SecuritySettingsScreen,
  AboutScreen,
  PlexIntegrationScreen,
  MaintenanceScreen,
  VisualizerScreen,
  SearchScreen,
  DownloadsManagerScreen,
  WebFictionManagerScreen,
  StorageBrowserScreen,
  OPDSCatalogBrowserScreen,
  OpdsSettingsScreen,
  ReadingStatisticsScreen,
  StorageOrganizerScreen,
  NetworkStorageSettingsScreen,
  TtsProviderSettingsScreen,
  MediaOpenScreen,
  DocumentEditorScreen,
  DocumentReaderScreen,
} from './ui';

// Import existing screens
import { MediaViewerScreen } from './components/MediaViewerScreen';
import { MetadataEditorScreen } from './components/MetadataEditorScreen';
import { ServerIntegrationScreen } from './components/ServerIntegrationScreen';
import { SettingsScreen } from './components/SettingsScreen';
import { ThemePreviewScreen } from './components/ThemePreviewScreen';
import { WebComicManagerScreen } from './components/WebComicManagerScreen';

// Import responsive navigation
import { ResponsiveNavigation } from './components/ResponsiveNavigation';
import { PWAInstallPrompt } from './components/PWAInstallPrompt';

// Initialize database
import { initializeDatabase } from './services/database-complete';
import { useAppStore } from './store/app-store';
import { getAllUnifiedThemes } from './themes/unified-themes';

const AppContent: React.FC = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));
  const [searchQuery, setSearchQuery] = React.useState('');
  const [showSearchBar, setShowSearchBar] = React.useState(true);
  const [lastScrollY, setLastScrollY] = React.useState(0);

  // Hide search bar on scroll down, show on scroll up (mobile only)
  React.useEffect(() => {
    if (!isMobile) {
      setShowSearchBar(true);
      return;
    }

    const handleScroll = () => {
      const currentScrollY = window.scrollY;
      if (currentScrollY > lastScrollY && currentScrollY > 80) {
        setShowSearchBar(false);
      } else {
        setShowSearchBar(true);
      }
      setLastScrollY(currentScrollY);
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => window.removeEventListener('scroll', handleScroll);
  }, [lastScrollY, isMobile]);

  // Handle search
  const handleSearch = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter' && searchQuery.trim()) {
      navigate(`/search?q=${encodeURIComponent(searchQuery)}`);
    }
  };

  const showFab = location.pathname === '/' || location.pathname.startsWith('/library/');

  return (
    <ResponsiveNavigation>
      {/* Search Bar - conditionally visible */}
      <Zoom in={showSearchBar}>
        <Box
          sx={{
            position: 'sticky',
            top: isMobile ? 56 : 0,
            zIndex: 1000,
            bgcolor: 'background.paper',
            borderBottom: 1,
            borderColor: 'divider',
            p: isMobile ? 1 : 2,
            transition: 'all 0.3s ease',
          }}
        >
          <TextField
            fullWidth
            size={isMobile ? 'small' : 'medium'}
            placeholder="Search across all libraries..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            onKeyPress={handleSearch}
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <SearchIcon />
                </InputAdornment>
              ),
            }}
            sx={{
              '& .MuiOutlinedInput-root': {
                borderRadius: 3,
              },
            }}
          />
        </Box>
      </Zoom>

      {/* Routes Content */}
      <Box sx={{ flex: 1, minHeight: '100vh', bgcolor: 'background.default' }}>
        <Routes>
          {/* Home */}
          <Route path="/" element={<LibraryListScreen />} />
          
          {/* Library */}
          <Route path="/library/:libraryId" element={<LibraryDetailsScreen />} />
          <Route path="/library/:libraryId/management" element={<LibraryManagementScreen />} />
          
          {/* Media Detail */}
          <Route path="/detail/:itemId" element={<MediaItemDetailScreen />} />
          
          {/* Media Viewer */}
          <Route path="/open/:itemId" element={<MediaViewerScreen />} />
          
          {/* Readers */}
          <Route path="/reader/:itemId" element={<EReaderScreen />} />
          <Route path="/pdf/:itemId" element={<PDFReaderScreen />} />
          <Route path="/comic/:itemId" element={<ComicReaderScreen />} />
          <Route path="/bookshelf/:libraryId" element={<BookshelfScreen />} />
          <Route path="/bookmarks/:itemId" element={<BookmarkScreen />} />
          
          {/* Players */}
          <Route path="/audio_player" element={<AudioPlayerScreen />} />
          <Route path="/audio_player/:itemId" element={<AudioPlayerScreen />} />
          <Route path="/video_player/:itemId" element={<VideoPlayerScreen />} />
          <Route path="/queue" element={<QueueScreen />} />
          
          {/* Music */}
          <Route path="/music" element={<MusicLibraryScreen />} />
          
          {/* Podcasts */}
          <Route path="/podcasts" element={<PodcastManagerScreen />} />
          <Route path="/podcasts/discover" element={<PodcastDiscoveryScreen />} />
          <Route path="/podcast/:podcastId" element={<div>Podcast Detail</div>} />
          <Route path="/podcast_player/:episodeId" element={<div>Podcast Player</div>} />
          
          {/* Radio */}
          <Route path="/radio" element={<RadioScreen />} />
          <Route path="/radio/discover" element={<RadioDiscoveryScreen />} />
          <Route path="/settings/radio" element={<RadioScreen />} />
          
          {/* Collections */}
          <Route path="/collections" element={<CollectionsListScreen />} />
          <Route path="/collection_detail/:collectionId" element={<CollectionDetailScreen />} />
          
          {/* Series */}
          <Route path="/series/:seriesId" element={<SeriesDetailScreen />} />
          
          {/* Search */}
          <Route path="/search" element={<SearchScreen />} />
          
          {/* Downloads */}
          <Route path="/downloads" element={<DownloadsManagerScreen />} />
          <Route path="/downloads/webfiction" element={<WebFictionManagerScreen />} />
          <Route path="/downloads/comics" element={<WebComicManagerScreen />} />
          
          {/* Settings */}
          <Route path="/settings" element={<SettingsMainScreen />} />
          <Route path="/settings/reader" element={<ReaderSettingsScreen />} />
          <Route path="/settings/api-keys" element={<APIKeysScreen />} />
          <Route path="/settings/import_export" element={<ImportExportSettingsScreen />} />
          <Route path="/settings/audiobook" element={<AudiobookSettingsScreen />} />
          <Route path="/settings/libraries" element={<LibraryManagementSettingsScreen />} />
          <Route path="/settings/podcasts" element={<PodcastSettingsScreen />} />
          <Route path="/settings/notifications" element={<NotificationSettingsScreen />} />
          <Route path="/settings/security" element={<SecuritySettingsScreen />} />
          <Route path="/settings/about" element={<AboutScreen />} />
          
          {/* Integration */}
          <Route path="/servers" element={<ServerIntegrationScreen />} />
          <Route path="/servers/plex" element={<PlexIntegrationScreen />} />
          
          {/* Maintenance */}
          <Route path="/maintenance" element={<MaintenanceScreen />} />
          
          {/* Visualizer */}
          <Route path="/visualizer" element={<VisualizerScreen />} />
          
          {/* Storage & Files */}
          <Route path="/storage" element={<StorageBrowserScreen />} />
          <Route path="/storage/organizer" element={<StorageOrganizerScreen />} />
          <Route path="/storage/network" element={<NetworkStorageSettingsScreen />} />
          
          {/* OPDS */}
          <Route path="/opds" element={<OPDSCatalogBrowserScreen />} />
          <Route path="/settings/opds" element={<OpdsSettingsScreen />} />
          
          {/* Statistics */}
          <Route path="/statistics" element={<ReadingStatisticsScreen />} />
          
          {/* TTS */}
          <Route path="/settings/tts" element={<TtsProviderSettingsScreen />} />
          
          {/* Media Open */}
          <Route path="/open" element={<MediaOpenScreen />} />
          
          {/* Documents */}
          <Route path="/document/edit/:docId?" element={<DocumentEditorScreen />} />
          <Route path="/document/:docId" element={<DocumentReaderScreen />} />
          
          {/* Metadata */}
          <Route path="/metadata/:itemId" element={<MetadataEditorScreen />} />
          
          {/* Theme */}
          <Route path="/theme_preview" element={<ThemePreviewScreen />} />
          
          {/* Fallback */}
          <Route path="*" element={<div style={{ padding: 20 }}>Page Not Found</div>} />
        </Routes>

        {/* Global Now Playing Bar */}
        <NowPlayingBar />

        {/* PWA Install Prompt */}
        <PWAInstallPrompt />

        {/* Floating Action Button (Mobile & Desktop) */}
        <Zoom in={showFab}>
          <Fab
            color="secondary"
            aria-label="add"
            onClick={() => navigate('/')}
            sx={{
              position: 'fixed',
              bottom: isMobile ? 72 : 24,
              right: 24,
              zIndex: 1000,
            }}
          >
            <AddIcon />
          </Fab>
        </Zoom>
      </Box>
    </ResponsiveNavigation>
  );
};

function App() {
  const { selectedTheme } = useAppStore();

  React.useEffect(() => {
    initializeDatabase();
  }, []);

  const theme = React.useMemo(() => {
    const themeConfig = getAllUnifiedThemes().find((t) => t.name === selectedTheme);
    return themeConfig ? themeConfig.theme : getAllUnifiedThemes()[0].theme;
  }, [selectedTheme]);

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <AppContent />
      </Router>
    </ThemeProvider>
  );
}

export default App;
