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
  RadioScreen,
  CollectionDetailScreen,
  CollectionsListScreen,
  SeriesDetailScreen,
  BookshelfScreen,
  SettingsMainScreen,
  ReaderSettingsScreen,
  APIKeysScreen,
  ImportExportSettingsScreen,
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
          <Route path="/podcast/:podcastId" element={<div>Podcast Detail</div>} />
          <Route path="/podcast_player/:episodeId" element={<div>Podcast Player</div>} />
          
          {/* Radio */}
          <Route path="/radio" element={<RadioScreen />} />
          
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
      </Router>
    </ThemeProvider>
  );
}

export default App;
