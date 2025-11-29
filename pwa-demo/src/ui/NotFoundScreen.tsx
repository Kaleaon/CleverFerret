/**
 * 404 Not Found Screen
 * 
 * Provides helpful navigation when a route is not found
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  Typography,
  Button,
  Stack,
  Card,
  CardContent,
} from '@mui/material';
import {
  Home,
  Search,
  LibraryBooks,
  Settings,
} from '@mui/icons-material';

export const NotFoundScreen: React.FC = () => {
  const navigate = useNavigate();

  const quickLinks = [
    { icon: <Home />, label: 'Home', path: '/' },
    { icon: <LibraryBooks />, label: 'Libraries', path: '/' },
    { icon: <Search />, label: 'Search', path: '/search' },
    { icon: <Settings />, label: 'Settings', path: '/settings' },
  ];

  return (
    <Box
      sx={{
        minHeight: '100vh',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        p: 3,
        bgcolor: 'background.default',
      }}
    >
      <Card sx={{ maxWidth: 600, width: '100%' }}>
        <CardContent sx={{ textAlign: 'center', p: 4 }}>
          <Typography variant="h1" component="h1" sx={{ fontSize: 120, fontWeight: 'bold', color: 'primary.main', mb: 2 }}>
            404
          </Typography>
          <Typography variant="h4" component="h2" gutterBottom>
            Page Not Found
          </Typography>
          <Typography variant="body1" color="text.secondary" paragraph>
            The page you're looking for doesn't exist or has been moved.
          </Typography>

          <Stack direction="row" spacing={2} justifyContent="center" sx={{ mt: 4, mb: 3 }}>
            {quickLinks.map((link) => (
              <Button
                key={link.path}
                variant="outlined"
                startIcon={link.icon}
                onClick={() => navigate(link.path)}
              >
                {link.label}
              </Button>
            ))}
          </Stack>

          <Button
            variant="contained"
            size="large"
            startIcon={<Home />}
            onClick={() => navigate('/')}
            sx={{ mt: 2 }}
          >
            Go to Home
          </Button>
        </CardContent>
      </Card>
    </Box>
  );
};

export default NotFoundScreen;
