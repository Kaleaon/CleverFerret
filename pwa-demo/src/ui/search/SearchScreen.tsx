/**
 * Advanced Search Screen
 * 
 * Comprehensive search with filters and facets.
 */

import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  TextField,
  InputAdornment,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CardActionArea,
  Typography,
  Drawer,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Chip,
  Button,
  Slider,
  FormGroup,
  FormControlLabel,
  Checkbox,
} from '@mui/material';
import {
  ArrowBack,
  Search,
  FilterList,
  Clear,
} from '@mui/icons-material';

import { searchRepository } from '../../data/repository';
import type { MediaItemWithMetadata, SearchOptions, FilterOptions } from '../../data/repository/SearchRepository';

export const SearchScreen: React.FC = () => {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<MediaItemWithMetadata[]>([]);
  const [filterOptions, setFilterOptions] = useState<FilterOptions | null>(null);
  const [showFilters, setShowFilters] = useState(false);
  const [isSearching, setIsSearching] = useState(false);

  // Filter state
  const [selectedMediaTypes, setSelectedMediaTypes] = useState<string[]>([]);
  const [yearRange, setYearRange] = useState<[number, number]>([1900, 2025]);
  const [ratingRange, setRatingRange] = useState<[number, number]>([0, 10]);
  const [hasMetadata, setHasMetadata] = useState<boolean | undefined>(undefined);

  useEffect(() => {
    loadFilterOptions();
  }, []);

  useEffect(() => {
    if (query.length > 2) {
      performSearch();
    }
  }, [query, selectedMediaTypes, yearRange, ratingRange, hasMetadata]);

  const loadFilterOptions = async () => {
    const options = await searchRepository.getAvailableFilters();
    setFilterOptions(options);
    if (options.yearRange) {
      setYearRange(options.yearRange);
    }
    if (options.ratingRange) {
      setRatingRange(options.ratingRange);
    }
  };

  const performSearch = async () => {
    setIsSearching(true);
    try {
      const searchOptions: SearchOptions = {
        query,
        mediaTypes: selectedMediaTypes,
        yearFrom: yearRange[0],
        yearTo: yearRange[1],
        minRating: ratingRange[0],
        maxRating: ratingRange[1],
        hasMetadata,
      };

      const searchResults = await searchRepository.searchMedia(searchOptions);
      setResults(searchResults);
    } catch (err) {
      const { logger } = await import('../../services/logging');
      logger.error('Search', 'Search error', undefined, err as Error);
    } finally {
      setIsSearching(false);
    }
  };

  const handleClearFilters = () => {
    setSelectedMediaTypes([]);
    setHasMetadata(undefined);
    if (filterOptions?.yearRange) {
      setYearRange(filterOptions.yearRange);
    }
    if (filterOptions?.ratingRange) {
      setRatingRange(filterOptions.ratingRange);
    }
  };

  const activeFilterCount = () => {
    let count = 0;
    if (selectedMediaTypes.length > 0) count++;
    if (hasMetadata !== undefined) count++;
    return count;
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <TextField
            fullWidth
            placeholder="Search your library..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            InputProps={{
              startAdornment: (
                <InputAdornment position="start">
                  <Search />
                </InputAdornment>
              ),
              endAdornment: query && (
                <InputAdornment position="end">
                  <IconButton size="small" onClick={() => setQuery('')}>
                    <Clear />
                  </IconButton>
                </InputAdornment>
              ),
            }}
            sx={{
              '& .MuiOutlinedInput-root': {
                color: 'white',
                '& fieldset': { borderColor: 'rgba(255,255,255,0.3)' },
                '&:hover fieldset': { borderColor: 'rgba(255,255,255,0.5)' },
                '&.Mui-focused fieldset': { borderColor: 'white' },
              },
            }}
          />
          <IconButton
            color="inherit"
            onClick={() => setShowFilters(true)}
          >
            <FilterList />
            {activeFilterCount() > 0 && (
              <Chip
                label={activeFilterCount()}
                size="small"
                color="secondary"
                sx={{ ml: 0.5 }}
              />
            )}
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        <Typography variant="body2" color="text.secondary" sx={{ mb: 2 }}>
          {isSearching ? 'Searching...' : `${results.length} results`}
        </Typography>

        <Grid container spacing={2}>
          {results.map((result) => (
            <Grid item xs={6} sm={4} md={3} lg={2} key={result.mediaItem.itemId}>
              <Card>
                <CardActionArea onClick={() => navigate(`/detail/${result.mediaItem.itemId}`)}>
                  {result.metadata?.coverImagePath && (
                    <CardMedia
                      component="img"
                      height="200"
                      image={result.metadata.coverImagePath}
                      alt={result.metadata.title}
                    />
                  )}
                  <CardContent>
                    <Typography variant="subtitle2" noWrap>
                      {result.metadata?.title || result.mediaItem.fileName.replace(/\.[^/.]+$/, '')}
                    </Typography>
                    <Typography variant="caption" color="text.secondary">
                      {result.mediaItem.mediaType}
                    </Typography>
                  </CardContent>
                </CardActionArea>
              </Card>
            </Grid>
          ))}
        </Grid>

        {results.length === 0 && query.length > 2 && !isSearching && (
          <Box sx={{ textAlign: 'center', py: 8 }}>
            <Typography variant="h6" color="text.secondary">
              No results found
            </Typography>
            <Typography variant="body2" color="text.secondary">
              Try different keywords or adjust filters
            </Typography>
          </Box>
        )}
      </Box>

      {/* Filters Drawer */}
      <Drawer anchor="right" open={showFilters} onClose={() => setShowFilters(false)}>
        <Box sx={{ width: 300, p: 3 }}>
          <Typography variant="h6" gutterBottom>
            Filters
          </Typography>

          {/* Media Types */}
          {filterOptions && (
            <Box sx={{ mb: 3 }}>
              <Typography variant="subtitle2" gutterBottom>
                Media Type
              </Typography>
              <FormGroup>
                {filterOptions.availableMediaTypes.map((type) => (
                  <FormControlLabel
                    key={type}
                    control={
                      <Checkbox
                        checked={selectedMediaTypes.includes(type)}
                        onChange={(e) => {
                          if (e.target.checked) {
                            setSelectedMediaTypes([...selectedMediaTypes, type]);
                          } else {
                            setSelectedMediaTypes(selectedMediaTypes.filter((t) => t !== type));
                          }
                        }}
                      />
                    }
                    label={type}
                  />
                ))}
              </FormGroup>
            </Box>
          )}

          {/* Year Range */}
          {filterOptions?.yearRange && (
            <Box sx={{ mb: 3 }}>
              <Typography variant="subtitle2" gutterBottom>
                Year: {yearRange[0]} - {yearRange[1]}
              </Typography>
              <Slider
                value={yearRange}
                min={filterOptions.yearRange[0]}
                max={filterOptions.yearRange[1]}
                onChange={(_, value) => setYearRange(value as [number, number])}
                valueLabelDisplay="auto"
              />
            </Box>
          )}

          {/* Rating Range */}
          {filterOptions?.ratingRange && (
            <Box sx={{ mb: 3 }}>
              <Typography variant="subtitle2" gutterBottom>
                Rating: {ratingRange[0]} - {ratingRange[1]}
              </Typography>
              <Slider
                value={ratingRange}
                min={filterOptions.ratingRange[0]}
                max={filterOptions.ratingRange[1]}
                onChange={(_, value) => setRatingRange(value as [number, number])}
                valueLabelDisplay="auto"
                step={0.1}
              />
            </Box>
          )}

          {/* Has Metadata */}
          <Box sx={{ mb: 3 }}>
            <Typography variant="subtitle2" gutterBottom>
              Metadata
            </Typography>
            <FormGroup>
              <FormControlLabel
                control={
                  <Checkbox
                    checked={hasMetadata === true}
                    onChange={(e) => setHasMetadata(e.target.checked ? true : undefined)}
                  />
                }
                label="Has Metadata"
              />
            </FormGroup>
          </Box>

          <Button variant="outlined" fullWidth onClick={handleClearFilters}>
            Clear All Filters
          </Button>
        </Box>
      </Drawer>
    </Box>
  );
};

export default SearchScreen;
