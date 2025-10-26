/**
 * About Screen
 * 
 * App information, version, and credits
 */

import React from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  List,
  ListItem,
  ListItemText,
  Divider,
  Button,
  Link,
} from '@mui/material';
import { ArrowBack, OpenInNew, Code, BugReport } from '@mui/icons-material';

export const AboutScreen: React.FC = () => {
  const navigate = useNavigate();
  const appVersion = '1.0.0';
  const buildDate = new Date().toLocaleDateString();

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            About CleverFerret
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* App Logo and Name */}
        <Card sx={{ mb: 2, textAlign: 'center' }}>
          <CardContent>
            <Typography variant="h3" sx={{ mb: 1 }}>
              📚
            </Typography>
            <Typography variant="h5" gutterBottom fontWeight="bold">
              CleverFerret
            </Typography>
            <Typography variant="body2" color="text.secondary" gutterBottom>
              Universal Media Library
            </Typography>
            <Typography variant="caption" color="text.secondary">
              Version {appVersion}
            </Typography>
          </CardContent>
        </Card>

        {/* App Info */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Application Information
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <List disablePadding>
              <ListItem>
                <ListItemText
                  primary="Version"
                  secondary={appVersion}
                />
              </ListItem>
              <Divider />
              <ListItem>
                <ListItemText
                  primary="Build Date"
                  secondary={buildDate}
                />
              </ListItem>
              <Divider />
              <ListItem>
                <ListItemText
                  primary="Platform"
                  secondary="Progressive Web App (PWA)"
                />
              </ListItem>
            </List>
          </CardContent>
        </Card>

        {/* Features */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Features
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <Typography variant="body2" paragraph>
              CleverFerret is a comprehensive media management application supporting:
            </Typography>
            <List dense>
              <ListItem>• Books, Audiobooks, and Comics</ListItem>
              <ListItem>• Movies and TV Shows</ListItem>
              <ListItem>• Music Libraries</ListItem>
              <ListItem>• Podcast Subscriptions and Discovery</ListItem>
              <ListItem>• Internet Radio Streaming</ListItem>
              <ListItem>• Documents and PDFs</ListItem>
              <ListItem>• Server Integration (Plex, Calibre)</ListItem>
              <ListItem>• Metadata Management</ListItem>
            </List>
          </CardContent>
        </Card>

        {/* Links */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Links
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <Button
              fullWidth
              startIcon={<Code />}
              endIcon={<OpenInNew />}
              component={Link}
              href="https://github.com/Kaleaon/CleverFerret"
              target="_blank"
              sx={{ mb: 1, justifyContent: 'space-between' }}
            >
              Source Code
            </Button>
            
            <Button
              fullWidth
              startIcon={<BugReport />}
              endIcon={<OpenInNew />}
              component={Link}
              href="https://github.com/Kaleaon/CleverFerret/issues"
              target="_blank"
              sx={{ justifyContent: 'space-between' }}
            >
              Report an Issue
            </Button>
          </CardContent>
        </Card>

        {/* License */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              License
            </Typography>
            <Divider sx={{ mb: 2 }} />
            
            <Typography variant="body2" color="text.secondary">
              CleverFerret is open-source software. See the repository for full license details.
            </Typography>
          </CardContent>
        </Card>

        {/* Copyright */}
        <Typography variant="caption" color="text.secondary" textAlign="center" display="block" sx={{ mt: 3 }}>
          © 2025 CleverFerret Contributors. All rights reserved.
        </Typography>
      </Box>
    </Box>
  );
};

export default AboutScreen;
