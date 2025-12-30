/**
 * Downloads Manager Screen
 *
 * Central hub for managing web fiction and comic downloads.
 * Provides organized access to all downloader features.
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  IconButton,
  Typography,
  Grid,
  Card,
  CardContent,
  CardActionArea,
  CardActions,
  Button,
  Stack,
  Chip,
} from '@mui/material';
import { ArrowBack, MenuBook, AutoStories, Download, Article } from '@mui/icons-material';

export const DownloadsManagerScreen: React.FC = () => {
  const navigate = useNavigate();

  const downloadSections = [
    {
      id: 'webfiction',
      title: 'Web Fiction',
      description:
        'Download and manage fanfiction and web novels from Archive of Our Own, FanFiction.Net, and more',
      icon: <AutoStories />,
      path: '/downloads/webfiction',
      features: ['Multi-site support', 'Auto-updates', 'EPUB export'],
    },
    {
      id: 'comics',
      title: 'Web Comics',
      description: 'Download and read web comics with offline support and automatic updates',
      icon: <MenuBook />,
      path: '/downloads/comics',
      features: ['RSS feed support', 'Offline reading', 'Panel navigation'],
    },
  ];

  return (
    <Box sx={{ minHeight: '100vh', bgcolor: 'background.default' }}>
      {/* Header */}
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          p: 2,
          borderBottom: 1,
          borderColor: 'divider',
        }}
      >
        <IconButton onClick={() => navigate(-1)} sx={{ mr: 1 }}>
          <ArrowBack />
        </IconButton>
        <Typography variant="h5" component="h1" sx={{ flexGrow: 1 }}>
          Downloads
        </Typography>
      </Box>

      {/* Content */}
      <Box sx={{ p: 3 }}>
        <Typography variant="h6" gutterBottom sx={{ mb: 3 }}>
          Content Downloaders
        </Typography>
        <Typography variant="body2" color="text.secondary" sx={{ mb: 4 }}>
          Download and manage web content for offline reading. Choose a downloader to get started.
        </Typography>

        <Grid container spacing={3}>
          {downloadSections.map((section) => (
            <Grid item xs={12} md={6} key={section.id}>
              <Card
                sx={{
                  height: '100%',
                  display: 'flex',
                  flexDirection: 'column',
                  transition: 'transform 0.2s, box-shadow 0.2s',
                  '&:hover': {
                    transform: 'translateY(-4px)',
                    boxShadow: 6,
                  },
                }}
              >
                <CardActionArea
                  onClick={() => navigate(section.path)}
                  sx={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'stretch' }}
                >
                  <Box
                    sx={{
                      bgcolor: 'primary.main',
                      color: 'primary.contrastText',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      py: 4,
                      position: 'relative',
                      overflow: 'hidden',
                      '&::before': {
                        content: '""',
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        bgcolor: 'action.hover',
                        opacity: 0.1,
                      },
                    }}
                  >
                    <Box
                      sx={{
                        position: 'relative',
                        zIndex: 1,
                        p: 2,
                        borderRadius: '50%',
                        bgcolor: 'rgba(255, 255, 255, 0.2)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                      }}
                    >
                      {React.cloneElement(section.icon, { sx: { fontSize: 64, color: 'inherit' } })}
                    </Box>
                  </Box>
                  <CardContent sx={{ flex: 1 }}>
                    <Typography variant="h5" gutterBottom>
                      {section.title}
                    </Typography>
                    <Typography variant="body2" color="text.secondary" paragraph>
                      {section.description}
                    </Typography>
                    <Stack direction="row" spacing={1} flexWrap="wrap" gap={1}>
                      {section.features.map((feature, index) => (
                        <Chip
                          key={index}
                          label={feature}
                          size="small"
                          variant="outlined"
                          sx={{ fontSize: '0.7rem' }}
                        />
                      ))}
                    </Stack>
                  </CardContent>
                </CardActionArea>
                <CardActions sx={{ p: 2, pt: 0 }}>
                  <Button
                    fullWidth
                    variant="contained"
                    startIcon={<Download />}
                    onClick={(e) => {
                      e.stopPropagation();
                      navigate(section.path);
                    }}
                  >
                    Open {section.title}
                  </Button>
                </CardActions>
              </Card>
            </Grid>
          ))}
        </Grid>

        {/* Info Section */}
        <Card sx={{ mt: 4, bgcolor: 'action.hover' }}>
          <CardContent>
            <Stack direction="row" spacing={2} alignItems="center">
              <Article sx={{ fontSize: 40, color: 'primary.main' }} />
              <Box>
                <Typography variant="subtitle1" gutterBottom>
                  About Downloads
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  All downloaded content is stored locally and available for offline reading. You
                  can manage downloads, check for updates, and export content from each downloader.
                </Typography>
              </Box>
            </Stack>
          </CardContent>
        </Card>
      </Box>
    </Box>
  );
};

export default DownloadsManagerScreen;
