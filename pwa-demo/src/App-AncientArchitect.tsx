/**
 * CleverFerret PWA - Ancient Architect Edition
 * 
 * Enhanced with Ancient Architect theme system
 * Fusion of Art Deco, Dwarven Architecture, Frank Lloyd Wright, and Stargate Atlantis aesthetics
 */

import React from 'react';
import { BrowserRouter as Router, Routes, Route, useNavigate, useLocation } from 'react-router-dom';
import { ThemeProvider, CssBaseline, Box } from '@mui/material';
import {
  Home as HomeIcon,
  LibraryMusic as MusicIcon,
  Podcasts as PodcastIcon,
  Radio as RadioIcon,
  Collections as CollectionIcon,
  Settings as SettingsIcon,
  Search as SearchIcon,
  VideoLibrary as VideoIcon,
  MenuBook as BookIcon,
} from '@mui/icons-material';

// Ancient Architect components
import {
  getAncientArchitectTheme,
  AncientNavigationRail,
  AncientAppBar,
  AncientIconButton,
} from './components/AncientArchitect';

// Import all screens
import {
  LibraryListScreen,
  LibraryDetailsScreen,
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
} from './ui';

// Import existing screens
import { MediaViewerScreen } from './components/MediaViewerScreen';
import { MetadataEditorScreen } from './components/MetadataEditorScreen';
import { ServerIntegrationScreen } from './components/ServerIntegrationScreen';
import { ThemePreviewScreen } from './components/ThemePreviewScreen';

// Initialize database
import { initializeDatabase } from './services/database-complete';
import { useAppStore } from './store/app-store';

function AppContent() {
  const navigate = useNavigate();
  const location = useLocation();
  const { selectedTheme, setSelectedTheme } = useAppStore();

  const [searchOpen, setSearchOpen] = React.useState(false);

  // Navigation items
  const navigationItems = [
    { icon: <HomeIcon />, label: 'Home', onClick: () => navigate('/') },
    { icon: <BookIcon />, label: 'Books', onClick: () => navigate('/books') },
    { icon: <MusicIcon />, label: 'Music', onClick: () => navigate('/music') },
    { icon: <VideoIcon />, label: 'Videos', onClick: () => navigate('/videos') },
    { icon: <PodcastIcon />, label: 'Podcasts', onClick: () => navigate('/podcasts') },
    { icon: <RadioIcon />, label: 'Radio', onClick: () => navigate('/radio') },
    { icon: <CollectionIcon />, label: 'Collections', onClick: () => navigate('/collections') },
    { icon: <SettingsIcon />, label: 'Settings', onClick: () => navigate('/settings') },
  ];

  // Determine selected index based on current route
  const selectedIndex = React.useMemo(() => {
    const path = location.pathname;
    if (path === '/') return 0;
    if (path.startsWith('/music')) return 2;
    if (path.startsWith('/video')) return 3;
    if (path.startsWith('/podcasts')) return 4;
    if (path.startsWith('/radio')) return 5;
    if (path.startsWith('/collections')) return 6;
    if (path.startsWith('/settings')) return 7;
    return 0;
  }, [location.pathname]);

  return (
    <Box sx={{ display: 'flex', height: '100vh', overflow: 'hidden' }}>
      {/* Ancient Architect Navigation Rail */}
      <AncientNavigationRail items={navigationItems} selectedIndex={selectedIndex} width={90} />

      {/* Main Content Area */}
      <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', overflow: 'hidden' }}>
        {/* Ancient Architect App Bar */}
        <AncientAppBar
          title="CleverFerret"
          actions={
            <>
              <AncientIconButton onClick={() => setSearchOpen(!searchOpen)}>
                <SearchIcon />
              </AncientIconButton>
            </>
          }
        />

        {/* Routes Content with Scroll */}
        <Box
          sx={{
            flex: 1,
            overflow: 'auto',
            position: 'relative',
            p: 3,
          }}
        >
          <Routes>
            {/* Home */}
            <Route path="/" element={<LibraryListScreen />} />

            {/* Library */}
            <Route path="/library/:libraryId" element={<LibraryDetailsScreen />} />

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

            {/* Metadata */}
            <Route path="/metadata/:itemId" element={<MetadataEditorScreen />} />

            {/* Theme */}
            <Route path="/theme_preview" element={<ThemePreviewScreen />} />

            {/* Fallback */}
            <Route
              path="*"
              element={
                <Box sx={{ p: 4, textAlign: 'center', color: 'text.secondary' }}>
                  <Typography variant="h4">Page Not Found</Typography>
                </Box>
              }
            />
          </Routes>

          {/* Global Now Playing Bar */}
          <NowPlayingBar />
        </Box>
      </Box>
    </Box>
  );
}

function App() {
  React.useEffect(() => {
    initializeDatabase();
  }, []);

  // Use Ancient Bronze variant by default
  const theme = getAncientArchitectTheme('ancient-bronze').theme;

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
