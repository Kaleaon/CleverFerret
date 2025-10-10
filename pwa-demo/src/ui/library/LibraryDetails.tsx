/**
 * Library Details Screen
 * 
 * Shows media items in a library with grid/list view and filtering.
 * Migrated from LibraryDetailsScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
  TextField,
  InputAdornment,
  Chip,
  Menu,
  MenuItem,
} from '@mui/material';
import {
  ArrowBack as BackIcon,
  Search as SearchIcon,
  FilterList as FilterIcon,
  ViewModule as GridIcon,
  ViewList as ListIcon,
  Sort as SortIcon,
} from '@mui/icons-material';

import { mediaRepository, libraryRepository } from '../../data/repository';
import type { MediaItem, Library } from '../../data/local/entity';

export const LibraryDetailsScreen: React.FC = () => {
  const { libraryId } = useParams<{ libraryId: string }>();
  const navigate = useNavigate();

  const [library, setLibrary] = useState<Library | null>(null);
  const [items, setItems] = useState<MediaItem[]>([]);
  const [filteredItems, setFilteredItems] = useState<MediaItem[]>([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid');
  const [sortAnchor, setSortAnchor] = useState<null | HTMLElement>(null);
  const [sortBy, setSortBy] = useState<'name' | 'date' | 'size'>('name');

  useEffect(() => {
    if (libraryId) {
      loadLibrary(parseInt(libraryId));
      loadItems(parseInt(libraryId));
    }
  }, [libraryId]);

  useEffect(() => {
    filterAndSortItems();
  }, [items, searchQuery, sortBy]);

  const loadLibrary = async (id: number) => {
    const lib = await libraryRepository.getLibraryById(id);
    setLibrary(lib || null);
  };

  const loadItems = async (id: number) => {
    const mediaItems = await mediaRepository.getMediaItemsByLibrary(id);
    setItems(mediaItems);
  };

  const filterAndSortItems = () => {
    let filtered = items;

    // Apply search filter
    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      filtered = filtered.filter(
        (item) =>
          item.fileName.toLowerCase().includes(query) ||
          item.filePath.toLowerCase().includes(query)
      );
    }

    // Apply sorting
    filtered = [...filtered].sort((a, b) => {
      switch (sortBy) {
        case 'name':
          return a.fileName.localeCompare(b.fileName);
        case 'date':
          return b.dateAdded - a.dateAdded;
        case 'size':
          return b.fileSize - a.fileSize;
        default:
          return 0;
      }
    });

    setFilteredItems(filtered);
  };

  const handleSort = (sort: 'name' | 'date' | 'size') => {
    setSortBy(sort);
    setSortAnchor(null);
  };

  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <BackIcon />
          </IconButton>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            {library?.name || 'Library'}
          </Typography>
          <IconButton color="inherit" onClick={(e) => setSortAnchor(e.currentTarget)}>
            <SortIcon />
          </IconButton>
          <IconButton
            color="inherit"
            onClick={() => setViewMode(viewMode === 'grid' ? 'list' : 'grid')}
          >
            {viewMode === 'grid' ? <ListIcon /> : <GridIcon />}
          </IconButton>
        </Toolbar>
      </AppBar>

      <Menu
        anchorEl={sortAnchor}
        open={Boolean(sortAnchor)}
        onClose={() => setSortAnchor(null)}
      >
        <MenuItem onClick={() => handleSort('name')}>Sort by Name</MenuItem>
        <MenuItem onClick={() => handleSort('date')}>Sort by Date Added</MenuItem>
        <MenuItem onClick={() => handleSort('size')}>Sort by Size</MenuItem>
      </Menu>

      <Box sx={{ p: 2 }}>
        <TextField
          fullWidth
          placeholder="Search library..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          InputProps={{
            startAdornment: (
              <InputAdornment position="start">
                <SearchIcon />
              </InputAdornment>
            ),
          }}
          sx={{ mb: 2 }}
        />

        <Box sx={{ mb: 2 }}>
          <Chip label={`${filteredItems.length} items`} sx={{ mr: 1 }} />
          <Chip label={library?.type || 'Unknown'} color="primary" />
        </Box>

        <Grid container spacing={2}>
          {filteredItems.map((item) => (
            <Grid
              item
              xs={viewMode === 'grid' ? 6 : 12}
              sm={viewMode === 'grid' ? 4 : 12}
              md={viewMode === 'grid' ? 3 : 12}
              lg={viewMode === 'grid' ? 2 : 12}
              key={item.itemId}
            >
              <Card>
                <CardActionArea onClick={() => navigate(`/detail/${item.itemId}`)}>
                  {item.hasThumbnail && item.thumbnailPath && (
                    <CardMedia
                      component="img"
                      height={viewMode === 'grid' ? 200 : 140}
                      image={item.thumbnailPath}
                      alt={item.fileName}
                    />
                  )}
                  <CardContent>
                    <Typography variant="subtitle2" noWrap>
                      {item.fileName.replace(/\.[^/.]+$/, '')}
                    </Typography>
                    <Typography variant="caption" color="text.secondary">
                      {(item.fileSize / 1024 / 1024).toFixed(2)} MB
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {filteredItems.length === 0 && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Typography variant="h6" color="text.secondary">
              {searchQuery ? 'No items found' : 'Library is empty'}
            </Typography>
          </Box>
        )}
      </Box>
    </Box>
  );
};

export default LibraryDetailsScreen;
