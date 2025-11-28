/**
 * OPDS Catalog Browser Screen
 * 
 * Browse and download books from OPDS (Open Publication Distribution System) catalogs.
 * Supports searching, filtering, and downloading books from online catalogs.
 * Migrated from OPDSCatalogBrowserScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  TextField,
  InputAdornment,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActions,
  Button,
  List,
  ListItem,
  ListItemButton,
  ListItemText,
  Breadcrumbs,
  Link,
  CircularProgress,
  Alert,
  Snackbar,
} from '@mui/material';
import {
  ArrowBack,
  Search,
  Download,
  Book,
  Folder,
  Refresh,
  Settings,
} from '@mui/icons-material';
import { getImageUrlWithFallback } from '../../utils/imageUtils';

interface OPDSEntry {
  id: string;
  title: string;
  author?: string;
  summary?: string;
  coverUrl?: string;
  downloadUrl?: string;
  type: 'book' | 'folder';
}

export const OPDSCatalogBrowserScreen: React.FC = () => {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const catalogUrl = searchParams.get('url') || '';
  
  const [loading, setLoading] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [entries, setEntries] = useState<OPDSEntry[]>([]);
  const [breadcrumbs, setBreadcrumbs] = useState<Array<{ label: string; url: string }>>([]);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity?: 'success' | 'error' | 'info' }>({ open: false, message: '' });
  const [error, setError] = useState<string | null>(null);

  // Mock OPDS catalog data
  const mockCatalog: OPDSEntry[] = [
    {
      id: '1',
      title: 'Featured Books',
      type: 'folder',
    },
    {
      id: '2',
      title: 'New Releases',
      type: 'folder',
    },
    {
      id: '3',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      summary: 'A classic American novel set in the Jazz Age.',
      coverUrl: undefined,
      downloadUrl: 'https://example.com/gatsby.epub',
      type: 'book',
    },
    {
      id: '4',
      title: '1984',
      author: 'George Orwell',
      summary: 'A dystopian social science fiction novel.',
      coverUrl: undefined,
      downloadUrl: 'https://example.com/1984.epub',
      type: 'book',
    },
    {
      id: '5',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      summary: 'A novel about racial injustice in the American South.',
      coverUrl: undefined,
      downloadUrl: 'https://example.com/mockingbird.epub',
      type: 'book',
    },
  ];

  useEffect(() => {
    loadCatalog(catalogUrl);
  }, [catalogUrl]);

  const loadCatalog = async (url: string) => {
    setLoading(true);
    setError(null);
    
    try {
      const { opdsParser } = await import('../../services/opds/OPDSParser');
      const feed = await opdsParser.parseFeed(url);
      
      // Convert OPDS entries to our format
      const convertedEntries: OPDSEntry[] = feed.entries.map(entry => ({
        id: entry.id,
        title: entry.title,
        author: entry.author,
        summary: entry.summary,
        coverUrl: entry.coverUrl,
        downloadUrl: entry.downloadUrl,
        type: entry.downloadUrl ? 'book' : 'folder',
      }));
      
      setEntries(convertedEntries);
      setLoading(false);
    } catch (err) {
      setError(`Failed to load OPDS catalog: ${err instanceof Error ? err.message : 'Unknown error'}`);
      setLoading(false);
      // Fallback to mock data on error
      setEntries(mockCatalog);
    }
  };

  const handleEntryClick = (entry: OPDSEntry) => {
    if (entry.type === 'folder') {
      // Navigate into folder
      setBreadcrumbs([...breadcrumbs, { label: entry.title, url: entry.id }]);
      // Load subfolder content
    } else {
      // Show book details or download
    }
  };

  const handleDownload = async (entry: OPDSEntry) => {
    if (!entry.downloadUrl) return;
    
    try {
      setLoading(true);
      setSnackbar({ open: true, message: `Downloading: ${entry.title}...`, severity: 'info' });
      
      // Download the file
      const response = await fetch(entry.downloadUrl);
      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }
      
      const blob = await response.blob();
      const file = new File([blob], `${entry.title}.epub`, { type: blob.type });
      
      // Get default library or first available library
      const { db } = await import('../../services/database-complete');
      const libraries = await db.libraries.where('isActive').equals(1).toArray();
      
      if (libraries.length === 0) {
        setSnackbar({ open: true, message: 'No active library found. Please create a library first.', severity: 'warning' });
        return;
      }
      
      const library = libraries[0];
      
      // Read file as ArrayBuffer for storage
      const arrayBuffer = await file.arrayBuffer();
      
      // Add to media items
      const itemId = await db.mediaItems.add({
        libraryId: library.libraryId,
        fileName: file.name,
        filePath: undefined,
        fileHash: undefined,
        fileData: new Uint8Array(arrayBuffer),
        mediaType: 'BOOK',
        dateAdded: Date.now(),
        lastScanned: Date.now(),
        thumbnailPath: entry.coverUrl,
      });
      
      // Add metadata
      await db.metadataCommon.add({
        itemId,
        title: entry.title,
        authors: entry.author ? [entry.author] : [],
        description: entry.summary,
        thumbnailPath: entry.coverUrl,
        isFavorite: false,
        isDownloaded: true,
      });
      
      setSnackbar({ open: true, message: `Downloaded and added to library: ${entry.title}`, severity: 'success' });
    } catch (error) {
      setSnackbar({ open: true, message: `Failed to download: ${error instanceof Error ? error.message : 'Unknown error'}`, severity: 'error' });
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = () => {
    // Filter entries by search query
    const filtered = mockCatalog.filter((entry) =>
      entry.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      entry.author?.toLowerCase().includes(searchQuery.toLowerCase())
    );
    setEntries(filtered);
  };

  const filteredEntries = searchQuery
    ? entries.filter((entry) =>
        entry.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        entry.author?.toLowerCase().includes(searchQuery.toLowerCase())
      )
    : entries;

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      {/* App Bar */}
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            OPDS Catalog
          </Typography>
          <IconButton color="inherit" onClick={() => loadCatalog(catalogUrl)}>
            <Refresh />
          </IconButton>
          <IconButton color="inherit" onClick={() => navigate('/settings/opds')}>
            <Settings />
          </IconButton>
        </Toolbar>
      </AppBar>

      {/* Breadcrumbs */}
      {breadcrumbs.length > 0 && (
        <Box sx={{ p: 2, bgcolor: 'background.paper', borderBottom: 1, borderColor: 'divider' }}>
          <Breadcrumbs>
            <Link
              component="button"
              variant="body2"
              onClick={() => {
                setBreadcrumbs([]);
                loadCatalog(catalogUrl);
              }}
            >
              Home
            </Link>
            {breadcrumbs.map((crumb, index) => (
              <Link
                key={index}
                component="button"
                variant="body2"
                onClick={() => {
                  setBreadcrumbs(breadcrumbs.slice(0, index + 1));
                }}
              >
                {crumb.label}
              </Link>
            ))}
          </Breadcrumbs>
        </Box>
      )}

      {/* Search Bar */}
      <Box sx={{ p: 2 }}>
        <TextField
          fullWidth
          placeholder="Search books..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <Search />
              </InputAdornment>
            ),
          }}
        />
      </Box>

      {/* Content Area */}
      <Box sx={{ flex: 1, overflow: 'auto', p: 2 }}>
        {error && (
          <Alert severity="error" sx={{ mb: 2 }}>
            {error}
          </Alert>
        )}

        {loading ? (
          <Box sx={{ display: 'flex', justifyContent: 'center', p: 4 }}>
            <CircularProgress />
          </Box>
        ) : (
          <>
            {/* Folder Entries */}
            <List sx={{ mb: 2 }}>
              {filteredEntries
                .filter((e) => e.type === 'folder')
                .map((entry) => (
                  <ListItem key={entry.id} disablePadding>
                    <ListItemButton onClick={() => handleEntryClick(entry)}>
                      <Folder sx={{ mr: 2 }} />
                      <ListItemText primary={entry.title} />
                    </ListItemButton>
                  </ListItem>
                ))}
            </List>

            {/* Book Entries */}
            <Grid container spacing={2}>
              {filteredEntries
                .filter((e) => e.type === 'book')
                .map((entry) => (
                  <Grid item xs={12} sm={6} md={4} lg={3} key={entry.id}>
                    <Card>
                      <CardMedia
                        component="img"
                        height="200"
                        image={getImageUrlWithFallback(entry.coverUrl, 'BOOK', entry.title)}
                        alt={entry.title}
                        sx={{ objectFit: 'cover' }}
                      />
                      <CardContent>
                        <Typography variant="h6" noWrap>
                          {entry.title}
                        </Typography>
                        {entry.author && (
                          <Typography variant="body2" color="text.secondary" gutterBottom>
                            by {entry.author}
                          </Typography>
                        )}
                        {entry.summary && (
                          <Typography
                            variant="body2"
                            color="text.secondary"
                            sx={{
                              overflow: 'hidden',
                              textOverflow: 'ellipsis',
                              display: '-webkit-box',
                              WebkitLineClamp: 2,
                              WebkitBoxOrient: 'vertical',
                            }}
                          >
                            {entry.summary}
                          </Typography>
                        )}
                      </CardContent>
                      <CardActions>
                        <Button
                          size="small"
                          startIcon={<Download />}
                          onClick={() => handleDownload(entry)}
                          disabled={!entry.downloadUrl}
                        >
                          Download
                        </Button>
                        <Button size="small" onClick={() => handleEntryClick(entry)}>
                          Details
                        </Button>
                      </CardActions>
                    </Card>
                  </Grid>
                ))}
            </Grid>

            {filteredEntries.length === 0 && !loading && (
              <Box sx={{ textAlign: 'center', py: 8 }}>
                <Book sx={{ fontSize: 64, color: 'text.secondary', mb: 2 }} />
                <Typography variant="h6" color="text.secondary">
                  No books found
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  Try adjusting your search or browse a different catalog
                </Typography>
              </Box>
            )}
          </>
        )}
      </Box>

      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar({ ...snackbar, open: false })}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'center' }}
      >
        <Alert onClose={() => setSnackbar({ ...snackbar, open: false })} severity={snackbar.severity || 'info'} sx={{ width: '100%' }}>
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
};

export default OPDSCatalogBrowserScreen;
