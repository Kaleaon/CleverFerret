/**
 * Permanent Navigation Sidebar Component
 * 
 * Provides a permanent side navigation menu for easy access to all app sections.
 */

import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import {
  Box,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Divider,
  Typography,
  Tooltip,
} from '@mui/material';
import {
  Home,
  LibraryBooks,
  Radio,
  Podcasts,
  MusicNote,
  VideoLibrary,
  Article,
  Settings as SettingsIcon,
  CloudSync,
  Movie,
  Headphones,
  MenuBook,
} from '@mui/icons-material';

interface NavigationDrawerProps {
  // No props needed for permanent sidebar
}

interface NavItem {
  label: string;
  icon: React.ReactElement;
  path: string;
  type?: 'library' | 'feature';
}

export const NavigationDrawer: React.FC<NavigationDrawerProps> = () => {
  const navigate = useNavigate();
  const location = useLocation();

  // Library type icons at the top
  const libraryItems: NavItem[] = [
    { label: 'Books', icon: <LibraryBooks />, path: '/', type: 'library' },
    { label: 'Audiobooks', icon: <Headphones />, path: '/audiobooks', type: 'library' },
    { label: 'Comics', icon: <MenuBook />, path: '/comics', type: 'library' },
    { label: 'Movies', icon: <Movie />, path: '/movies', type: 'library' },
    { label: 'Music', icon: <MusicNote />, path: '/music', type: 'library' },
    { label: 'Podcasts', icon: <Podcasts />, path: '/podcasts', type: 'library' },
    { label: 'Documents', icon: <Article />, path: '/documents', type: 'library' },
    { label: 'Radio', icon: <Radio />, path: '/radio', type: 'library' },
  ];

  const handleNavigation = (path: string) => {
    navigate(path);
  };

  const isActive = (path: string) => {
    if (path === '/') {
      return location.pathname === '/';
    }
    return location.pathname.startsWith(path);
  };

  return (
    <Box
      sx={{
        width: 80,
        height: '100vh',
        bgcolor: 'background.paper',
        borderRight: '1px solid',
        borderColor: 'divider',
        display: 'flex',
        flexDirection: 'column',
        position: 'fixed',
        left: 0,
        top: 0,
        zIndex: 1200,
        overflowY: 'auto',
        '&::-webkit-scrollbar': {
          width: '6px',
        },
        '&::-webkit-scrollbar-track': {
          bgcolor: 'transparent',
        },
        '&::-webkit-scrollbar-thumb': {
          bgcolor: 'divider',
          borderRadius: '3px',
        },
      }}
    >
      {/* App Logo/Home */}
      <Tooltip title="Home" placement="right">
        <ListItemButton
          onClick={() => handleNavigation('/')}
          selected={location.pathname === '/'}
          sx={{
            py: 2,
            flexDirection: 'column',
            alignItems: 'center',
            minHeight: 80,
            borderBottom: '1px solid',
            borderColor: 'divider',
            '&.Mui-selected': {
              bgcolor: 'primary.main',
              color: 'primary.contrastText',
              '&:hover': {
                bgcolor: 'primary.dark',
              },
              '& .MuiSvgIcon-root': {
                color: 'primary.contrastText',
              },
            },
          }}
        >
          <Home sx={{ fontSize: 32, mb: 0.5 }} />
          <Typography variant="caption" sx={{ fontSize: '0.65rem', textAlign: 'center' }}>
            Home
          </Typography>
        </ListItemButton>
      </Tooltip>

      <Divider />

      {/* Library Type Icons */}
      <List sx={{ flex: 1, py: 1 }}>
        {libraryItems.map((item) => (
          <Tooltip key={item.path} title={item.label} placement="right">
            <ListItemButton
              onClick={() => handleNavigation(item.path)}
              selected={isActive(item.path)}
              sx={{
                py: 2,
                flexDirection: 'column',
                alignItems: 'center',
                minHeight: 72,
                '&.Mui-selected': {
                  bgcolor: 'primary.main',
                  color: 'primary.contrastText',
                  '&:hover': {
                    bgcolor: 'primary.dark',
                  },
                  '& .MuiSvgIcon-root': {
                    color: 'primary.contrastText',
                  },
                },
              }}
            >
              {item.icon}
              <Typography
                variant="caption"
                sx={{
                  fontSize: '0.65rem',
                  mt: 0.5,
                  textAlign: 'center',
                  maxWidth: '100%',
                  overflow: 'hidden',
                  textOverflow: 'ellipsis',
                  whiteSpace: 'nowrap',
                }}
              >
                {item.label}
              </Typography>
            </ListItemButton>
          </Tooltip>
        ))}
      </List>

      <Divider />

      {/* Settings at Bottom with Large Icon */}
      <Tooltip title="Settings" placement="right">
        <ListItemButton
          onClick={() => handleNavigation('/settings')}
          selected={location.pathname.startsWith('/settings')}
          sx={{
            py: 3,
            flexDirection: 'column',
            alignItems: 'center',
            minHeight: 90,
            borderTop: '1px solid',
            borderColor: 'divider',
            '&.Mui-selected': {
              bgcolor: 'primary.main',
              color: 'primary.contrastText',
              '&:hover': {
                bgcolor: 'primary.dark',
              },
              '& .MuiSvgIcon-root': {
                color: 'primary.contrastText',
              },
            },
          }}
        >
          <SettingsIcon sx={{ fontSize: 40, mb: 0.5 }} />
          <Typography variant="caption" sx={{ fontSize: '0.7rem', fontWeight: 600 }}>
            Settings
          </Typography>
        </ListItemButton>
      </Tooltip>
    </Box>
  );
};
