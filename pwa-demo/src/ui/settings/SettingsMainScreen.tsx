/**
 * Main Settings Screen
 * 
 * Central settings hub with all configuration options.
 * Migrated from SettingsScreen.kt
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Divider,
  Card,
  CardContent,
} from '@mui/material';
import {
  ArrowBack,
  MenuBook,
  Palette,
  CloudSync,
  Key,
  ImportExport,
  Storage,
  Notifications,
  Security,
  Info,
  Settings,
  PlaylistPlay,
  Podcasts,
  Radio,
  LibraryBooks,
} from '@mui/icons-material';

export const SettingsMainScreen: React.FC = () => {
  const navigate = useNavigate();

  const settingsSections = [
    {
      title: 'Reading',
      items: [
        { icon: <MenuBook />, label: 'Reader Settings', path: '/settings/reader' },
        { icon: <PlaylistPlay />, label: 'Audiobook Settings', path: '/settings/audiobook' },
      ],
    },
    {
      title: 'Media',
      items: [
        { icon: <LibraryBooks />, label: 'Library Management', path: '/settings/libraries' },
        { icon: <Podcasts />, label: 'Podcast Settings', path: '/settings/podcasts' },
        { icon: <Radio />, label: 'Radio Settings', path: '/settings/radio' },
      ],
    },
    {
      title: 'Integration',
      items: [
        { icon: <CloudSync />, label: 'Server Integration', path: '/servers' },
        { icon: <Key />, label: 'API Keys', path: '/settings/api-keys' },
        { icon: <ImportExport />, label: 'Import/Export', path: '/settings/import_export' },
        { icon: <LibraryBooks />, label: 'OPDS Catalogs', path: '/opds' },
        { icon: <LibraryBooks />, label: 'OPDS Settings', path: '/settings/opds' },
      ],
    },
    {
      title: 'Appearance',
      items: [
        { icon: <Palette />, label: 'Themes', path: '/theme_preview' },
      ],
    },
    {
      title: 'Storage & Files',
      items: [
        { icon: <Storage />, label: 'File Browser', path: '/storage' },
        { icon: <Storage />, label: 'Storage Organizer', path: '/storage/organizer' },
        { icon: <Storage />, label: 'Network Storage', path: '/storage/network' },
        { icon: <Storage />, label: 'Storage & Cache', path: '/maintenance' },
      ],
    },
    {
      title: 'Advanced',
      items: [
        { icon: <Security />, label: 'Security', path: '/settings/security' },
        { icon: <Notifications />, label: 'Notifications', path: '/settings/notifications' },
        { icon: <CloudSync />, label: 'TTS Settings', path: '/settings/tts' },
      ],
    },
    {
      title: 'About',
      items: [
        { icon: <Info />, label: 'About CleverFerret', path: '/settings/about' },
      ],
    },
  ];

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Settings
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {settingsSections.map((section, index) => (
          <Card key={index} sx={{ mb: 2 }}>
            <CardContent>
              <Typography variant="subtitle2" color="text.secondary" sx={{ mb: 1 }}>
                {section.title}
              </Typography>
              <List disablePadding>
                {section.items.map((item, itemIndex) => (
                  <React.Fragment key={itemIndex}>
                    {itemIndex > 0 && <Divider />}
                    <ListItem disablePadding>
                      <ListItemButton onClick={() => navigate(item.path)}>
                        <ListItemIcon>{item.icon}</ListItemIcon>
                        <ListItemText primary={item.label} />
                      </ListItemButton>
                    </ListItem>
                  </React.Fragment>
                ))}
              </List>
            </CardContent>
          </Card>
        ))}
      </Box>
    </Box>
  );
};

export default SettingsMainScreen;
