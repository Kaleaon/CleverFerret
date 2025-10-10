/**
 * Series Detail Screen
 * 
 * Shows books/episodes in a series with reading/watch order.
 * Migrated from SeriesDetailScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardMedia,
  CardContent,
  Grid,
  Chip,
  LinearProgress,
} from '@mui/material';
import {
  ArrowBack,
  PlayArrow,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { Series, MediaItem } from '../../data/local/entity';

export const SeriesDetailScreen: React.FC = () => {
  const { seriesId } = useParams<{ seriesId: string }>();
  const navigate = useNavigate();

  const [series, setSeries] = useState<Series | null>(null);
  const [items, setItems] = useState<MediaItem[]>([]);

  useEffect(() => {
    if (seriesId) {
      loadSeries(parseInt(seriesId));
    }
  }, [seriesId]);

  const loadSeries = async (id: number) => {
    const seriesData = await db.series.get(id);
    setSeries(seriesData || null);

    // TODO: Load media items in series
    // This would require a junction table or series field in MediaItem
  };

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            {series?.name || 'Series'}
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 3 }}>
        {series && (
          <>
            {/* Series Header */}
            <Card sx={{ mb: 3 }}>
              <CardContent>
                <Typography variant="h4" gutterBottom>
                  {series.name}
                </Typography>
                {series.description && (
                  <Typography variant="body1" color="text.secondary" paragraph>
                    {series.description}
                  </Typography>
                )}
                <Box sx={{ display: 'flex', gap: 1, flexWrap: 'wrap', mb: 2 }}>
                  <Chip label={series.mediaType} color="primary" />
                  {series.status && <Chip label={series.status} />}
                  {series.totalItems && <Chip label={`${series.totalItems} items`} />}
                  {series.startYear && (
                    <Chip label={`${series.startYear}${series.endYear ? `-${series.endYear}` : '+'}`} />
                  )}
                </Box>
                {series.publisher && (
                  <Typography variant="body2" color="text.secondary">
                    Publisher: {series.publisher}
                  </Typography>
                )}
              </CardContent>
            </Card>

            {/* Series Items */}
            <Typography variant="h6" gutterBottom>
              Items in Series
            </Typography>
            <Grid container spacing={2}>
              {items.map((item, index) => (
                <Grid item xs={6} sm={4} md={3} key={item.itemId}>
                  <Card>
                    <CardContent>
                      <Typography variant="subtitle2" gutterBottom>
                        #{index + 1}
                      </Typography>
                      <Typography variant="body1">
                        {item.fileName.replace(/\.[^/.]+$/, '')}
                      </Typography>
                      <IconButton
                        size="small"
                        onClick={() => navigate(`/detail/${item.itemId}`)}
                      >
                        <PlayArrow />
                      </IconButton>
                    </CardContent>
                  </Card>
                </Grid>
              ))}
            </Grid>

            {items.length === 0 && (
              <Box sx={{ textAlign: 'center', py: 8 }}>
                <Typography variant="h6" color="text.secondary">
                  No items in this series yet
                </Typography>
              </Box>
            )}
          </>
        )}
      </Box>
    </Box>
  );
};

export default SeriesDetailScreen;
