/**
 * Main Application Component for CleverFerret PWA
 * 
 * Migrated from MainActivity.kt
 * This is the main entry point and navigation hub for the application.
 */

import React from 'react';
import { BrowserRouter as Router, Routes, Route, useNavigate } from 'react-router-dom';
import { ThemeProvider, CssBaseline } from '@mui/material';
import { createTheme } from '@mui/material/styles';

// Screens - these will be created as we migrate
import LibraryListScreen from './components/LibraryListScreen';
import LibraryDetailsScreen from './components/LibraryDetailsScreen';
import MediaViewerScreen from './components/MediaViewerScreen';
import MetadataEditorScreen from './components/MetadataEditorScreen';
import ServerIntegrationScreen from './components/ServerIntegrationScreen';
import SettingsScreen from './components/SettingsScreen';
import ThemePreviewScreen from './components/ThemePreviewScreen';

// Additional screens to be migrated
// import MediaItemDetailScreen from './ui/detail/MediaItemDetailScreen';
// import EReaderScreen from './ui/reader/EReaderScreen';
// import AudioPlayerScreen from './ui/player/AudioPlayerScreen';
// import VideoPlayerScreen from './ui/player/VideoPlayerScreen';
// import PodcastManagerScreen from './ui/podcast/PodcastManagerScreen';
// import MusicLibraryScreen from './ui/music/MusicLibraryScreen';
// import RadioScreen from './ui/radio/RadioScreen';
// import CollectionDetailScreen from './ui/collections/CollectionDetailScreen';
// import MaintenanceScreen from './ui/maintenance/MaintenanceScreen';
// import StorageBrowserScreen from './ui/filepicker/StorageBrowserScreen';
// import VisualizerScreen from './ui/visualizer/VisualizerScreen';

/**
 * Main App Component
 * Sets up routing and theme for the entire application
 */
function App() {
  // TODO: Implement theme selection from settings
  const [darkMode, setDarkMode] = React.useState(true);
  const [selectedPalette, setSelectedPalette] = React.useState('NAVY_GOLD');

  // Create theme based on settings
  const theme = React.useMemo(
    () =>
      createTheme({
        palette: {
          mode: darkMode ? 'dark' : 'light',
          primary: {
            main: selectedPalette === 'NAVY_GOLD' ? '#D4AF37' : '#1976d2',
          },
          secondary: {
            main: selectedPalette === 'NAVY_GOLD' ? '#0A1630' : '#dc004e',
          },
        },
      }),
    [darkMode, selectedPalette]
  );

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Router>
        <AppRoutes />
      </Router>
    </ThemeProvider>
  );
}

/**
 * Application Routes
 * Mirrors the navigation structure from MainActivity.kt
 */
function AppRoutes() {
  return (
    <Routes>
      {/* Home/Library List */}
      <Route path="/" element={<LibraryListScreen />} />
      
      {/* Library Management */}
      <Route path="/library/:libraryId" element={<LibraryDetailsScreen />} />
      
      {/* Media Item Detail */}
      <Route path="/detail/:itemId" element={<div>Media Detail (TODO)</div>} />
      
      {/* Media Viewer/Player */}
      <Route path="/open/:itemId" element={<MediaViewerScreen />} />
      
      {/* Reader Routes */}
      <Route path="/reader/:itemId" element={<div>E-Reader (TODO)</div>} />
      <Route path="/bookshelf/:libraryId" element={<div>Bookshelf (TODO)</div>} />
      
      {/* Music Routes */}
      <Route path="/music" element={<div>Music Library (TODO)</div>} />
      <Route path="/music_player" element={<div>Music Player (TODO)</div>} />
      <Route path="/audio_player/:audioPath" element={<div>Audio Player (TODO)</div>} />
      
      {/* Video Routes */}
      <Route path="/videos" element={<div>Video Library (TODO)</div>} />
      <Route path="/video_player/:videoPath" element={<div>Video Player (TODO)</div>} />
      
      {/* Podcast Routes */}
      <Route path="/podcasts" element={<div>Podcast Manager (TODO)</div>} />
      <Route path="/podcast_player/:episodeId" element={<div>Podcast Player (TODO)</div>} />
      
      {/* Radio */}
      <Route path="/radio" element={<div>Radio (TODO)</div>} />
      
      {/* Collections */}
      <Route path="/collections" element={<div>Collections (TODO)</div>} />
      <Route path="/collection_detail/:collectionId" element={<div>Collection Detail (TODO)</div>} />
      
      {/* Settings */}
      <Route path="/settings" element={<SettingsScreen />} />
      <Route path="/settings/import_export" element={<div>Import/Export (TODO)</div>} />
      <Route path="/settings/organizer" element={<div>Storage Organizer (TODO)</div>} />
      <Route path="/settings/playlists" element={<div>Playlist Settings (TODO)</div>} />
      <Route path="/settings/opds" element={<div>OPDS Settings (TODO)</div>} />
      
      {/* Metadata Editor */}
      <Route path="/metadata/:itemId" element={<MetadataEditorScreen />} />
      
      {/* Maintenance */}
      <Route path="/maintenance" element={<div>Maintenance (TODO)</div>} />
      
      {/* Storage Browser */}
      <Route path="/storage_browser" element={<div>Storage Browser (TODO)</div>} />
      
      {/* Server Integration */}
      <Route path="/servers" element={<ServerIntegrationScreen />} />
      
      {/* Visualizer */}
      <Route path="/visualizer" element={<div>Visualizer (TODO)</div>} />
      <Route path="/visualizer_presets" element={<div>Visualizer Presets (TODO)</div>} />
      
      {/* Theme Preview */}
      <Route path="/theme_preview" element={<ThemePreviewScreen />} />
      
      {/* Enhanced Media Library */}
      <Route path="/media_library" element={<div>Media Library (TODO)</div>} />
      
      {/* Document Editor */}
      <Route path="/editor/new" element={<div>Document Editor (TODO)</div>} />
      
      {/* Queue */}
      <Route path="/queue" element={<div>Playback Queue (TODO)</div>} />
      
      {/* Album Detail */}
      <Route path="/album/:albumId" element={<div>Album Detail (TODO)</div>} />
      
      {/* Series Detail */}
      <Route path="/series/:seriesId" element={<div>Series Detail (TODO)</div>} />
      
      {/* Now Playing */}
      <Route path="/now_playing" element={<div>Now Playing (TODO)</div>} />
      
      {/* 404 */}
      <Route path="*" element={<div>Page Not Found</div>} />
    </Routes>
  );
}

export default App;
