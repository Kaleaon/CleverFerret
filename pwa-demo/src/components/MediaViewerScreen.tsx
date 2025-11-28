// Media viewer for different content types
import React, { useState, useEffect, useMemo } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Paper,
  CircularProgress,
  Alert,
  Fab,
  Menu,
  MenuItem,
  Button,
} from '@mui/material';
import {
  ArrowBack as ArrowBackIcon,
  Edit as EditIcon,
  MoreVert as MoreVertIcon,
  PlayArrow as PlayIcon,
  Pause as PauseIcon,
  VolumeUp as VolumeIcon,
  Fullscreen as FullscreenIcon,
} from '@mui/icons-material';
import { MediaItem, MetadataCommon, ReaderThemeMode, ReaderFont } from '../types';
import { useAppStore } from '../store/app-store';
// import { MediaItemService, MetadataService } from '../services/database';

interface MediaViewerProps {
  mediaItem?: MediaItem;
  metadata?: MetadataCommon;
}

const EBookViewer: React.FC<MediaViewerProps> = (props: MediaViewerProps) => {
  const { metadata } = props;
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages] = useState(250);
  const { readerPreferences, setReaderFontSize } = useAppStore();
  const fontSize = readerPreferences.fontSize;

  const readerStyles = useMemo(() => {
    // Colors by reader theme
    const themeToColors: Record<ReaderThemeMode, { bg: string; fg: string; accent: string }> = {
      [ReaderThemeMode.WHITE]: { bg: '#FFFFFF', fg: '#111111', accent: '#0a1630' },
      [ReaderThemeMode.BLACK]: { bg: '#0a0a0a', fg: '#f5f5f5', accent: '#d4af37' },
      [ReaderThemeMode.SEPIA]: { bg: '#F4ECD8', fg: '#3B2F2F', accent: '#8B6B3E' },
      [ReaderThemeMode.EINK]: { bg: '#F5F5F0', fg: '#222222', accent: '#555555' },
    };

    const fontStacks: Record<ReaderFont, string> = {
      [ReaderFont.SYSTEM_SANS]:
        "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'",
      [ReaderFont.SYSTEM_SERIF]:
        "'Times New Roman', Times, Georgia, 'Iowan Old Style', 'Palatino Linotype', 'URW Palladio L', 'Book Antiqua', serif",
      [ReaderFont.ATKINSON]:
        "'Atkinson Hyperlegible', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif",
      [ReaderFont.OPENDYSLEXIC]:
        "'OpenDyslexic3', 'OpenDyslexic', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif",
      [ReaderFont.LEXEND]:
        "'Lexend', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif",
    };

    const c = themeToColors[readerPreferences.themeMode];
    const fontFamily = fontStacks[readerPreferences.font];

    return { c, fontFamily };
  }, [readerPreferences]);

  const demoContent = `
    <h1>${metadata?.title || 'Sample Book'}</h1>
    <p>This is a demonstration of the e-book reader component. In a production environment, this would render actual EPUB content using a library like epub.js or similar.</p>
    
    <p>The reader would support:</p>
    <ul>
      <li>EPUB 2 and EPUB 3 formats</li>
      <li>Text reflow and pagination</li>
      <li>Font size adjustment</li>
      <li>Night/day mode themes</li>
      <li>Bookmarks and annotations</li>
      <li>Search functionality</li>
      <li>Table of contents navigation</li>
    </ul>
    
    <p>Users could navigate through pages using touch gestures, keyboard arrows, or the navigation controls.</p>
    
    <h2>Chapter 1: Getting Started</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    
    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  `;

  return (
    <Box
      sx={{
        bgcolor: 'background.paper',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      {/* Reader Controls */}
      <Box
        sx={{
          p: 2,
          borderBottom: '1px solid #1b2b4d',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
        }}
      >
        <Typography variant="body2" color="text.secondary">
          Page {currentPage} of {totalPages}
        </Typography>
        <Box>
          <IconButton onClick={() => setReaderFontSize(Math.max(12, fontSize - 2))}>
            <Typography variant="h6">A-</Typography>
          </IconButton>
          <IconButton onClick={() => setReaderFontSize(Math.min(28, fontSize + 2))}>
            <Typography variant="h5">A+</Typography>
          </IconButton>
        </Box>
      </Box>

      {/* Content Area */}
      <Box
        sx={{
          flex: 1,
          p: { xs: 2, md: 4 },
          maxWidth: '800px',
          mx: 'auto',
          bgcolor: readerStyles.c.bg,
          color: readerStyles.c.fg,
          borderRadius: 2,
          border: '1px solid rgba(0,0,0,0.1)',
          boxShadow: '0 2px 12px rgba(0,0,0,0.15)',
          '& h1': { color: readerStyles.c.accent, mb: 3, fontFamily: readerStyles.fontFamily },
          '& h2': {
            color: readerStyles.c.accent,
            mt: 4,
            mb: 2,
            fontFamily: readerStyles.fontFamily,
          },
          '& p': {
            mb: 2,
            lineHeight: 1.7,
            fontSize: `${fontSize}px`,
            fontFamily: readerStyles.fontFamily,
          },
          '& ul': { pl: 3, mb: 2, fontFamily: readerStyles.fontFamily },
          '& li': { mb: 1, fontSize: `${fontSize}px`, fontFamily: readerStyles.fontFamily },
        }}
      >
        <div
          style={{ fontFamily: readerStyles.fontFamily }}
          dangerouslySetInnerHTML={{ __html: demoContent }}
        />
      </Box>

      {/* Navigation */}
      <Box
        sx={{
          p: 2,
          borderTop: '1px solid #1b2b4d',
          display: 'flex',
          justifyContent: 'space-between',
        }}
      >
        <IconButton
          disabled={currentPage <= 1}
          onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
        >
          ← Previous
        </IconButton>
        <IconButton
          disabled={currentPage >= totalPages}
          onClick={() => setCurrentPage(Math.min(totalPages, currentPage + 1))}
        >
          Next →
        </IconButton>
      </Box>
    </Box>
  );
};

const VideoPlayer: React.FC<MediaViewerProps> = (props: MediaViewerProps) => {
  const { metadata } = props;
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime] = useState(0);
  const [duration] = useState(7200); // 2 hours demo

  useEffect(() => {
    if ('mediaSession' in navigator) {
      try {
        // Set basic metadata
        navigator.mediaSession.metadata = new MediaMetadata({
          title: metadata?.title || 'Video',
          artist: 'Unknown',
          album: 'CleverFerret',
          artwork: metadata?.thumbnailPath
            ? [{ src: metadata.thumbnailPath, sizes: '512x512', type: 'image/png' }]
            : [],
        });

        // Action handlers
        navigator.mediaSession.setActionHandler('play', () => setIsPlaying(true));
        navigator.mediaSession.setActionHandler('pause', () => setIsPlaying(false));
        navigator.mediaSession.setActionHandler('stop', () => setIsPlaying(false));
        navigator.mediaSession.setActionHandler('seekbackward', () => {});
        navigator.mediaSession.setActionHandler('seekforward', () => {});
        navigator.mediaSession.setActionHandler('previoustrack', () => {});
        navigator.mediaSession.setActionHandler('nexttrack', () => {});
      } catch (_) {
        // no-op
      }
    }
  }, [metadata]);

  const formatTime = (seconds: number) => {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = Math.floor(seconds % 60);
    return `${hours}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  return (
    <Box
      sx={{
        bgcolor: '#000',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
        position: 'relative',
      }}
    >
      {/* Video Area */}
      <Box
        sx={{
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          background:
            'linear-gradient(45deg, #1a1a1a 25%, transparent 25%), linear-gradient(-45deg, #1a1a1a 25%, transparent 25%), linear-gradient(45deg, transparent 75%, #1a1a1a 75%), linear-gradient(-45deg, transparent 75%, #1a1a1a 75%)',
          backgroundSize: '20px 20px',
          backgroundPosition: '0 0, 0 10px, 10px -10px, -10px 0px',
        }}
      >
        <Box
          sx={{
            textAlign: 'center',
            color: 'white',
            p: 4,
          }}
        >
          <Typography variant="h4" gutterBottom>
            {metadata?.title || 'Video Player'}
          </Typography>
          <Typography variant="body1" color="grey.400" mb={4}>
            Demo video player. In production, this would use a video.js player or similar component
            to handle various video formats (MP4, WebM, etc.)
          </Typography>

          <IconButton
            sx={{
              bgcolor: 'primary.main',
              color: 'black',
              width: 80,
              height: 80,
              '&:hover': { bgcolor: 'primary.light' },
            }}
            onClick={() => setIsPlaying(!isPlaying)}
          >
            {isPlaying ? <PauseIcon sx={{ fontSize: 40 }} /> : <PlayIcon sx={{ fontSize: 40 }} />}
          </IconButton>
          {/* Minimal <video> element to leverage MediaSession on supported browsers */}
          <video id="cf-video" style={{ display: 'none' }} controls src={undefined} />
        </Box>
      </Box>

      {/* Video Controls */}
      <Box
        sx={{
          bgcolor: 'rgba(0,0,0,0.8)',
          p: 2,
          display: 'flex',
          alignItems: 'center',
          gap: 2,
        }}
      >
        <IconButton onClick={() => setIsPlaying(!isPlaying)} sx={{ color: 'white' }}>
          {isPlaying ? <PauseIcon /> : <PlayIcon />}
        </IconButton>

        <Typography variant="body2" color="white" sx={{ minWidth: '80px' }}>
          {formatTime(currentTime)}
        </Typography>

        <Box
          sx={{
            flex: 1,
            height: 4,
            bgcolor: 'grey.700',
            borderRadius: 2,
            position: 'relative',
            cursor: 'pointer',
          }}
        >
          <Box
            sx={{
              position: 'absolute',
              left: 0,
              top: 0,
              height: '100%',
              bgcolor: 'primary.main',
              borderRadius: 2,
              width: `${(currentTime / duration) * 100}%`,
            }}
          />
        </Box>

        <Typography variant="body2" color="white" sx={{ minWidth: '80px' }}>
          {formatTime(duration)}
        </Typography>

        <IconButton sx={{ color: 'white' }}>
          <VolumeIcon />
        </IconButton>

        <IconButton sx={{ color: 'white' }}>
          <FullscreenIcon />
        </IconButton>
      </Box>
    </Box>
  );
};

const PDFViewer: React.FC<MediaViewerProps> = (props: MediaViewerProps) => {
  const { metadata } = props;
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages] = useState(42);
  const [zoom, setZoom] = useState(100);

  return (
    <Box
      sx={{
        bgcolor: '#1a1a1a',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      {/* PDF Controls */}
      <Box
        sx={{
          bgcolor: 'rgba(0,0,0,0.8)',
          p: 2,
          borderBottom: '1px solid #333',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          flexWrap: 'wrap',
          gap: 2,
        }}
      >
        <Box sx={{ display: 'flex', gap: 1, alignItems: 'center' }}>
          <IconButton
            disabled={currentPage <= 1}
            onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
            sx={{ color: 'white' }}
          >
            ←
          </IconButton>
          <Typography variant="body2" color="white" sx={{ minWidth: '120px', textAlign: 'center' }}>
            Page {currentPage} / {totalPages}
          </Typography>
          <IconButton
            disabled={currentPage >= totalPages}
            onClick={() => setCurrentPage(Math.min(totalPages, currentPage + 1))}
            sx={{ color: 'white' }}
          >
            →
          </IconButton>
        </Box>

        <Box sx={{ display: 'flex', gap: 1, alignItems: 'center' }}>
          <IconButton onClick={() => setZoom(Math.max(50, zoom - 10))} sx={{ color: 'white' }}>
            <Typography>-</Typography>
          </IconButton>
          <Typography variant="body2" color="white" sx={{ minWidth: '80px', textAlign: 'center' }}>
            {zoom}%
          </Typography>
          <IconButton onClick={() => setZoom(Math.min(200, zoom + 10))} sx={{ color: 'white' }}>
            <Typography>+</Typography>
          </IconButton>
        </Box>
      </Box>

      {/* PDF Content Area */}
      <Box
        sx={{
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          p: 2,
          overflow: 'auto',
        }}
      >
        <Paper
          sx={{
            width: `${zoom}%`,
            maxWidth: '100%',
            minHeight: '80vh',
            bgcolor: 'white',
            p: 4,
            boxShadow: '0 8px 32px rgba(0,0,0,0.5)',
          }}
        >
          <Typography variant="h5" gutterBottom sx={{ color: '#000' }}>
            {metadata?.title || 'PDF Document'}
          </Typography>
          <Typography variant="body1" paragraph sx={{ color: '#333', lineHeight: 1.8 }}>
            This is a demonstration of the PDF viewer component. In a production environment, this
            would render actual PDF content using a library like PDF.js or similar.
          </Typography>
          <Typography variant="body1" paragraph sx={{ color: '#333', lineHeight: 1.8 }}>
            The viewer would support:
          </Typography>
          <Box component="ul" sx={{ color: '#333', pl: 3 }}>
            <li>PDF rendering with vector graphics support</li>
            <li>Page navigation and thumbnails</li>
            <li>Zoom and pan functionality</li>
            <li>Text selection and search</li>
            <li>Annotations and highlights</li>
            <li>Form filling support</li>
            <li>Print functionality</li>
          </Box>
          <Typography variant="body2" sx={{ color: '#666', mt: 3, fontStyle: 'italic' }}>
            Page {currentPage} of {totalPages}
          </Typography>
        </Paper>
      </Box>
    </Box>
  );
};

const ComicViewer: React.FC<MediaViewerProps> = (props: MediaViewerProps) => {
  const { metadata } = props;
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages] = useState(24);
  const [viewMode, setViewMode] = useState<'single' | 'double'>('single');

  const demoPages = [
    { page: 1, color: '#FF6B6B' },
    { page: 2, color: '#4ECDC4' },
    { page: 3, color: '#45B7D1' },
    { page: 4, color: '#FFA07A' },
    { page: 5, color: '#98D8C8' },
  ];

  return (
    <Box
      sx={{
        bgcolor: '#000',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
      }}
    >
      {/* Comic Controls */}
      <Box
        sx={{
          bgcolor: 'rgba(0,0,0,0.9)',
          p: 2,
          borderBottom: '1px solid #333',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
        }}
      >
        <Box sx={{ display: 'flex', gap: 1, alignItems: 'center' }}>
          <IconButton
            disabled={currentPage <= 1}
            onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
            sx={{ color: 'white' }}
          >
            ←
          </IconButton>
          <Typography variant="body2" color="white">
            {currentPage} / {totalPages}
          </Typography>
          <IconButton
            disabled={currentPage >= totalPages}
            onClick={() => setCurrentPage(Math.min(totalPages, currentPage + 1))}
            sx={{ color: 'white' }}
          >
            →
          </IconButton>
        </Box>

        <Box sx={{ display: 'flex', gap: 1 }}>
          <Button
            size="small"
            variant={viewMode === 'single' ? 'contained' : 'outlined'}
            onClick={() => setViewMode('single')}
            sx={{ color: 'white' }}
          >
            Single
          </Button>
          <Button
            size="small"
            variant={viewMode === 'double' ? 'contained' : 'outlined'}
            onClick={() => setViewMode('double')}
            sx={{ color: 'white' }}
          >
            Double
          </Button>
        </Box>
      </Box>

      {/* Comic Content Area */}
      <Box
        sx={{
          flex: 1,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          p: 2,
        }}
      >
        <Box
          sx={{
            display: 'flex',
            gap: 2,
            maxWidth: viewMode === 'double' ? '90vw' : '60vw',
          }}
        >
          {/* Current Page */}
          <Box
            sx={{
              width: viewMode === 'double' ? '45vw' : '60vw',
              height: '80vh',
              bgcolor: demoPages[(currentPage - 1) % demoPages.length].color,
              borderRadius: 2,
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 8px 32px rgba(0,0,0,0.5)',
              p: 4,
            }}
          >
            <Typography variant="h2" sx={{ color: 'white', fontWeight: 700, mb: 2 }}>
              {metadata?.title || 'Comic'}
            </Typography>
            <Typography variant="h4" sx={{ color: 'white', opacity: 0.8 }}>
              Page {currentPage}
            </Typography>
            <Typography
              variant="body2"
              sx={{ color: 'white', opacity: 0.6, mt: 2, textAlign: 'center' }}
            >
              In a production app, this would display the actual comic page image from CBZ/CBR
              archives
            </Typography>
          </Box>

          {/* Second Page (double page mode) */}
          {viewMode === 'double' && currentPage < totalPages && (
            <Box
              sx={{
                width: '45vw',
                height: '80vh',
                bgcolor: demoPages[currentPage % demoPages.length].color,
                borderRadius: 2,
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
                boxShadow: '0 8px 32px rgba(0,0,0,0.5)',
                p: 4,
              }}
            >
              <Typography variant="h4" sx={{ color: 'white', opacity: 0.8 }}>
                Page {currentPage + 1}
              </Typography>
            </Box>
          )}
        </Box>
      </Box>
    </Box>
  );
};

const AudioPlayer: React.FC<MediaViewerProps> = (props: MediaViewerProps) => {
  const { metadata } = props;
  const [isPlaying, setIsPlaying] = useState(false);
  const [currentTime] = useState(0);
  const [duration] = useState(180); // 3 minutes demo

  useEffect(() => {
    if ('mediaSession' in navigator) {
      try {
        navigator.mediaSession.metadata = new MediaMetadata({
          title: metadata?.title || 'Audio Track',
          artist: 'Unknown Artist',
          album: 'CleverFerret',
          artwork: metadata?.thumbnailPath
            ? [{ src: metadata.thumbnailPath, sizes: '512x512', type: 'image/png' }]
            : [],
        });
        navigator.mediaSession.setActionHandler('play', () => setIsPlaying(true));
        navigator.mediaSession.setActionHandler('pause', () => setIsPlaying(false));
        navigator.mediaSession.setActionHandler('stop', () => setIsPlaying(false));
        navigator.mediaSession.setActionHandler('seekbackward', () => {});
        navigator.mediaSession.setActionHandler('seekforward', () => {});
        navigator.mediaSession.setActionHandler('previoustrack', () => {});
        navigator.mediaSession.setActionHandler('nexttrack', () => {});
      } catch (_) {
        // no-op
      }
    }
  }, [metadata]);

  return (
    <Box
      sx={{
        bgcolor: 'background.default',
        minHeight: '100vh',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        p: 4,
      }}
    >
      {/* Album Art */}
      <Paper
        sx={{
          width: 300,
          height: 300,
          mb: 4,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          bgcolor: 'secondary.main',
          backgroundImage: metadata?.thumbnailPath ? `url(${metadata.thumbnailPath})` : 'none',
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }}
      >
        {!metadata?.thumbnailPath && <VolumeIcon sx={{ fontSize: 80, color: 'primary.main' }} />}
      </Paper>

      {/* Track Info */}
      <Typography variant="h4" gutterBottom align="center">
        {metadata?.title || 'Audio Track'}
      </Typography>
      <Typography variant="h6" color="text.secondary" gutterBottom align="center">
        Unknown Artist
      </Typography>

      {/* Audio Controls */}
      <Box
        sx={{
          width: '100%',
          maxWidth: 400,
          mt: 4,
        }}
      >
        <Box
          sx={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            mb: 2,
          }}
        >
          <IconButton
            sx={{
              bgcolor: 'primary.main',
              color: 'black',
              width: 60,
              height: 60,
              '&:hover': { bgcolor: 'primary.light' },
            }}
            onClick={() => setIsPlaying(!isPlaying)}
          >
            {isPlaying ? <PauseIcon sx={{ fontSize: 30 }} /> : <PlayIcon sx={{ fontSize: 30 }} />}
          </IconButton>
        </Box>

        <Box
          sx={{
            display: 'flex',
            alignItems: 'center',
            gap: 2,
          }}
        >
          <Typography variant="caption">
            {Math.floor(currentTime / 60)}:{(currentTime % 60).toString().padStart(2, '0')}
          </Typography>

          <Box
            sx={{
              flex: 1,
              height: 4,
              bgcolor: 'secondary.main',
              borderRadius: 2,
              position: 'relative',
              cursor: 'pointer',
            }}
          >
            <Box
              sx={{
                position: 'absolute',
                left: 0,
                top: 0,
                height: '100%',
                bgcolor: 'primary.main',
                borderRadius: 2,
                width: `${(currentTime / duration) * 100}%`,
              }}
            />
          </Box>

          <Typography variant="caption">
            {Math.floor(duration / 60)}:{(duration % 60).toString().padStart(2, '0')}
          </Typography>
        </Box>
      </Box>
    </Box>
  );
};

export const MediaViewerScreen: React.FC = () => {
  const { mediaId } = useParams<{ mediaId: string }>();
  const navigate = useNavigate();
  const [mediaItem, setMediaItem] = useState<MediaItem | null>(null);
  const [metadata, setMetadata] = useState<MetadataCommon | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [menuAnchor, setMenuAnchor] = useState<null | HTMLElement>(null);

  useEffect(() => {
    loadMediaItem();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mediaId]);

  const loadMediaItem = async () => {
    if (!mediaId) {
      setError('No media ID provided');
      setLoading(false);
      return;
    }

    try {
      // For demo purposes, create mock data
      const mockMediaItem: MediaItem = {
        itemId: parseInt(mediaId),
        libraryId: 1,
        filePath: `/demo/${mediaId}`,
        fileName: `Demo File ${mediaId}`,
        fileSize: 1024000,
        mimeType: 'application/epub+zip',
        mediaType: 'BOOK',
        dateAdded: new Date(),
        lastModified: new Date(),
      };

      const mockMetadata: MetadataCommon = {
        itemId: parseInt(mediaId),
        title: `Demo ${mockMediaItem.mediaType} ${mediaId}`,
        description: 'This is a demonstration of the media viewer functionality.',
        rating: 4.5,
        isFavorite: false,
        isDownloaded: true,
      };

      setMediaItem(mockMediaItem);
      setMetadata(mockMetadata);
    } catch (err) {
      setError('Failed to load media item');
      const { logger } = await import('../services/logging');
      logger.error('MediaViewer', 'Error loading media', undefined, err as Error);
    } finally {
      setLoading(false);
    }
  };

  const handleMenuOpen = (event: React.MouseEvent<HTMLElement>) => {
    setMenuAnchor(event.currentTarget);
  };

  const handleMenuClose = () => {
    setMenuAnchor(null);
  };

  const renderViewer = () => {
    if (!mediaItem || !metadata) return null;

    // Check for specific file types
    const fileName = mediaItem.fileName?.toLowerCase() || '';
    const isPDF = fileName.endsWith('.pdf') || mediaItem.mimeType === 'application/pdf';
    const isComic =
      fileName.endsWith('.cbz') ||
      fileName.endsWith('.cbr') ||
      fileName.endsWith('.cbt') ||
      fileName.endsWith('.cb7') ||
      mediaItem.mimeType === 'application/x-cbz' ||
      mediaItem.mimeType === 'application/x-cbr' ||
      mediaItem.mimeType === 'application/x-cbt' ||
      mediaItem.mimeType === 'application/x-cb7' ||
      mediaItem.mimeType === 'application/vnd.comicbook+zip' ||
      mediaItem.mimeType === 'application/vnd.comicbook-rar';

    // Override mediaType for specific formats
    if (isPDF) {
      return <PDFViewer mediaItem={mediaItem} metadata={metadata} />;
    }
    if (isComic) {
      return <ComicViewer mediaItem={mediaItem} metadata={metadata} />;
    }

    switch (mediaItem.mediaType) {
      case 'BOOK':
        return <EBookViewer mediaItem={mediaItem} metadata={metadata} />;
      case 'MOVIE':
        return <VideoPlayer mediaItem={mediaItem} metadata={metadata} />;
      case 'MUSIC':
      case 'PODCAST':
        return <AudioPlayer mediaItem={mediaItem} metadata={metadata} />;
      case 'DOCUMENT':
        return <PDFViewer mediaItem={mediaItem} metadata={metadata} />;
      case 'MAGAZINE':
        // Magazines can be either PDF or Comic format
        return isPDF ? (
          <PDFViewer mediaItem={mediaItem} metadata={metadata} />
        ) : (
          <ComicViewer mediaItem={mediaItem} metadata={metadata} />
        );
      default:
        return (
          <Box sx={{ p: 4, textAlign: 'center' }}>
            <Typography variant="h5" gutterBottom>
              Viewer not implemented for {mediaItem.mediaType}
            </Typography>
            <Typography color="text.secondary">
              This media type viewer is not yet implemented.
            </Typography>
          </Box>
        );
    }
  };

  if (loading) {
    return (
      <Box
        sx={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          minHeight: '100vh',
        }}
      >
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Box sx={{ p: 4 }}>
        <Alert severity="error">{error}</Alert>
      </Box>
    );
  }

  return (
    <Box sx={{ minHeight: '100vh' }}>
      {/* Header */}
      <AppBar position="static" elevation={0}>
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBackIcon />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1, ml: 2 }}>
            {metadata?.title}
          </Typography>
          <IconButton color="inherit" onClick={handleMenuOpen}>
            <MoreVertIcon />
          </IconButton>
        </Toolbar>
      </AppBar>

      {/* Media Viewer */}
      {renderViewer()}

      {/* Edit FAB */}
      <Fab
        sx={{
          position: 'fixed',
          bottom: 24,
          right: 24,
        }}
        onClick={() => navigate(`/edit/${mediaId}`)}
      >
        <EditIcon />
      </Fab>

      {/* Menu */}
      <Menu anchorEl={menuAnchor} open={Boolean(menuAnchor)} onClose={handleMenuClose}>
        <MenuItem
          onClick={() => {
            handleMenuClose();
            navigate(`/edit/${mediaId}`);
          }}
        >
          Edit Metadata
        </MenuItem>
        <MenuItem onClick={handleMenuClose}>Add to Favorites</MenuItem>
        <MenuItem onClick={handleMenuClose}>Download Offline</MenuItem>
      </Menu>
    </Box>
  );
};
