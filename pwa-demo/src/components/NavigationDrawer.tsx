/**
 * Navigation Drawer Component
 * 
 * Provides a side navigation menu for easy access to all app sections.
 */

import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import {
  Drawer,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Divider,
  Box,
  Typography,
  IconButton,
} from '@mui/material';
import {
  Home,
  LibraryBooks,
  Radio,
  Podcasts,
  MusicNote,
  VideoLibrary,
  Search,
  Settings,
  CloudSync,
  Close,
} from '@mui/icons-material';

interface NavigationDrawerProps {
  open: boolean;
  onClose: () => void;
}

interface NavItem {
  label: string;
  icon: React.ReactElement;
  path: string;
  dividerAfter?: boolean;
}

export const NavigationDrawer: React.FC<NavigationDrawerProps> = ({ open, onClose }) => {
  const navigate = useNavigate();
  const location = useLocation();

  const navItems: NavItem[] = [
    { label: 'Libraries', icon: <Home />, path: '/' },
    { label: 'Search', icon: <Search />, path: '/search', dividerAfter: true },
    { label: 'Books', icon: <LibraryBooks />, path: '/libraries' },
    { label: 'Music', icon: <MusicNote />, path: '/music' },
    { label: 'Videos', icon: <VideoLibrary />, path: '/videos' },
    { label: 'Podcasts', icon: <Podcasts />, path: '/podcasts' },
    { label: 'Radio', icon: <Radio />, path: '/radio', dividerAfter: true },
    { label: 'Server Integration', icon: <CloudSync />, path: '/servers' },
    { label: 'Settings', icon: <Settings />, path: '/settings' },
  ];

  const handleNavigation = (path: string) => {
    navigate(path);
    onClose();
  };

  const isActive = (path: string) => {
    if (path === '/') {
      return location.pathname === '/';
    }
    return location.pathname.startsWith(path);
  };

  return (
    <Drawer
      anchor="left"
      open={open}
      onClose={onClose}
      PaperProps={{
        sx: {
          width: 280,
          bgcolor: 'background.paper',
          borderRight: '1px solid',
          borderColor: 'divider',
        },
      }}
    >
      {/* Header */}
      <Box
        sx={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          p: 2,
          bgcolor: 'primary.main',
          color: 'primary.contrastText',
        }}
      >
        <Typography variant="h6" sx={{ fontWeight: 600 }}>
          CleverFerret
        </Typography>
        <IconButton
          onClick={onClose}
          sx={{
            color: 'primary.contrastText',
          }}
        >
          <Close />
        </IconButton>
      </Box>

      {/* Navigation Items */}
      <List sx={{ pt: 1 }}>
        {navItems.map((item) => (
          <React.Fragment key={item.path}>
            <ListItem disablePadding>
              <ListItemButton
                onClick={() => handleNavigation(item.path)}
                selected={isActive(item.path)}
                sx={{
                  py: 1.5,
                  px: 2,
                  '&.Mui-selected': {
                    bgcolor: 'primary.main',
                    color: 'primary.contrastText',
                    '&:hover': {
                      bgcolor: 'primary.dark',
                    },
                    '& .MuiListItemIcon-root': {
                      color: 'primary.contrastText',
                    },
                  },
                }}
              >
                <ListItemIcon
                  sx={{
                    minWidth: 40,
                    color: isActive(item.path) ? 'primary.contrastText' : 'text.secondary',
                  }}
                >
                  {item.icon}
                </ListItemIcon>
                <ListItemText
                  primary={item.label}
                  primaryTypographyProps={{
                    fontSize: '0.95rem',
                    fontWeight: isActive(item.path) ? 600 : 400,
                  }}
                />
              </ListItemButton>
            </ListItem>
            {item.dividerAfter && <Divider sx={{ my: 1 }} />}
          </React.Fragment>
        ))}
      </List>

      {/* Footer */}
      <Box sx={{ mt: 'auto', p: 2, borderTop: '1px solid', borderColor: 'divider' }}>
        <Typography variant="caption" color="text.secondary" sx={{ display: 'block' }}>
          CleverFerret v1.0
        </Typography>
        <Typography variant="caption" color="text.secondary">
          Universal Media Library
        </Typography>
      </Box>
    </Drawer>
  );
};
