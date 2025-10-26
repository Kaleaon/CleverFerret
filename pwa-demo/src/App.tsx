/**
 * Main Application Component for CleverFerret PWA
 * 
 * Complete navigation and routing implementation
 * Migrated from MainActivity.kt
 */

import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { ThemeProvider, CssBaseline, createTheme } from '@mui/material';

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
import { SettingsScreen } from './components/SettingsScreen';
import { ThemePreviewScreen } from './components/ThemePreviewScreen';

// Initialize database
import { initializeDatabase } from './services/database-complete';
import { useAppStore } from './store/app-store';
import { getAllUnifiedThemes } from './themes/unified-themes';
import { NavigationDrawer } from './components/NavigationDrawer';
import { Box, TextField, InputAdornment } from '@mui/material';
import { Search as SearchIcon } from '@mui/icons-material';

function App() {
  const { selectedTheme } = useAppStore();
  const [searchQuery, setSearchQuery] = React.useState('');

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
        {/* Permanent Sidebar Navigation */}
        <NavigationDrawer />
        
        {/* Main Content Area with Search Bar */}
        <Box
          sx={{
            marginLeft: '80px',
            minHeight: '100vh',
            display: 'flex',
            flexDirection: 'column',
          }}
        >
          {/* Omni Search Bar */}
          <Box
            sx={{
              position: 'sticky',
              top: 0,
              zIndex: 1100,
              bgcolor: 'background.paper',
              borderBottom: '1px solid',
              borderColor: 'divider',
              p: 2,
            }}
          >
            <TextField
              fullWidth
              placeholder="Search across all libraries..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
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

          {/* Routes Content */}
          <Box sx={{ flex: 1 }}>
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
          <Route path="*" element={<div style={{ padding: 20 }}>Page Not Found</div>} />
            </Routes>

            {/* Global Now Playing Bar */}
            <NowPlayingBar />
          </Box>
        </Box>
      </Router>
    </ThemeProvider>
  );
}

export default App;
