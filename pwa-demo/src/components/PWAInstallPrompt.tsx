/**
 * PWA Install Prompt Component
 *
 * Shows a prominent banner or dialog to prompt users to install the PWA
 * Appears on mobile and desktop when the PWA is installable
 */

import React, { useState, useEffect } from 'react';
import {
  Box,
  Button,
  Card,
  CardContent,
  CardActions,
  IconButton,
  Typography,
  Slide,
  useMediaQuery,
  useTheme,
  Snackbar,
} from '@mui/material';
import {
  Close as CloseIcon,
  GetApp as InstallIcon,
  PhoneIphone as PhoneIcon,
} from '@mui/icons-material';

interface BeforeInstallPromptEvent extends Event {
  prompt: () => Promise<void>;
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>;
}

export const PWAInstallPrompt: React.FC = () => {
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));
  const [deferredPrompt, setDeferredPrompt] = useState<BeforeInstallPromptEvent | null>(null);
  const [showPrompt, setShowPrompt] = useState(false);
  const [isInstalled, setIsInstalled] = useState(false);

  useEffect(() => {
    // Check if app is already installed
    if (window.matchMedia('(display-mode: standalone)').matches) {
      setIsInstalled(true);
      return;
    }

    // Check localStorage to see if user dismissed the prompt
    const dismissed = localStorage.getItem('pwa-install-dismissed');
    const dismissedTime = dismissed ? parseInt(dismissed) : 0;
    const oneDayInMs = 24 * 60 * 60 * 1000;

    // Show prompt again after 1 day
    if (Date.now() - dismissedTime < oneDayInMs) {
      return;
    }

    const handleBeforeInstallPrompt = (e: Event) => {
      e.preventDefault();
      setDeferredPrompt(e as BeforeInstallPromptEvent);
      // Show prompt after 5 seconds
      setTimeout(() => setShowPrompt(true), 5000);
    };

    window.addEventListener('beforeinstallprompt', handleBeforeInstallPrompt);

    // Listen for app installed event
    window.addEventListener('appinstalled', () => {
      setIsInstalled(true);
      setShowPrompt(false);
      setDeferredPrompt(null);
    });

    return () => {
      window.removeEventListener('beforeinstallprompt', handleBeforeInstallPrompt);
    };
  }, []);

  const handleInstall = async () => {
    if (!deferredPrompt) return;

    deferredPrompt.prompt();
    const { outcome } = await deferredPrompt.userChoice;

    if (outcome === 'accepted') {
      setShowPrompt(false);
    }

    setDeferredPrompt(null);
  };

  const handleDismiss = () => {
    setShowPrompt(false);
    localStorage.setItem('pwa-install-dismissed', Date.now().toString());
  };

  if (isInstalled || !showPrompt) return null;

  // Mobile: Bottom banner
  if (isMobile) {
    return (
      <Slide direction="up" in={showPrompt}>
        <Card
          sx={{
            position: 'fixed',
            bottom: 72, // Above bottom navigation
            left: 8,
            right: 8,
            zIndex: 1300,
            boxShadow: theme.shadows[8],
          }}
        >
          <CardContent sx={{ pb: 1 }}>
            <Box sx={{ display: 'flex', alignItems: 'flex-start' }}>
              <Box sx={{ flexGrow: 1 }}>
                <Typography variant="subtitle1" fontWeight={600}>
                  Install CleverFerret
                </Typography>
                <Typography variant="body2" color="text.secondary">
                  Add to your home screen for quick access and offline use
                </Typography>
              </Box>
              <IconButton size="small" onClick={handleDismiss} sx={{ ml: 1 }}>
                <CloseIcon fontSize="small" />
              </IconButton>
            </Box>
          </CardContent>
          <CardActions sx={{ pt: 0, px: 2, pb: 2 }}>
            <Button
              variant="contained"
              startIcon={<InstallIcon />}
              onClick={handleInstall}
              fullWidth
              size="small"
            >
              Install App
            </Button>
          </CardActions>
        </Card>
      </Slide>
    );
  }

  // Desktop: Snackbar notification
  return (
    <Snackbar
      open={showPrompt}
      anchorOrigin={{ vertical: 'bottom', horizontal: 'right' }}
      sx={{ mb: 2, mr: 2 }}
    >
      <Card sx={{ minWidth: 320, boxShadow: theme.shadows[8] }}>
        <CardContent>
          <Box sx={{ display: 'flex', alignItems: 'center', mb: 1 }}>
            <PhoneIcon color="primary" sx={{ mr: 1 }} />
            <Typography variant="h6" component="div">
              Install CleverFerret
            </Typography>
            <IconButton size="small" onClick={handleDismiss} sx={{ ml: 'auto' }}>
              <CloseIcon fontSize="small" />
            </IconButton>
          </Box>
          <Typography variant="body2" color="text.secondary">
            Install for quick access and offline functionality
          </Typography>
        </CardContent>
        <CardActions sx={{ px: 2, pb: 2, pt: 0 }}>
          <Button onClick={handleDismiss} size="small">
            Not Now
          </Button>
          <Button
            variant="contained"
            startIcon={<InstallIcon />}
            onClick={handleInstall}
            size="small"
          >
            Install
          </Button>
        </CardActions>
      </Card>
    </Snackbar>
  );
};

export default PWAInstallPrompt;
