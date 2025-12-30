/**
 * Notification Settings Screen
 *
 * Configure app notifications and alerts
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
  FormControl,
  FormGroup,
  FormControlLabel,
  Switch,
  Divider,
  Alert,
  Select,
  MenuItem,
  InputLabel,
} from '@mui/material';
import { ArrowBack } from '@mui/icons-material';

export const NotificationSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [enableNotifications, setEnableNotifications] = React.useState(true);
  const [newContent, setNewContent] = React.useState(true);
  const [downloads, setDownloads] = React.useState(true);
  const [updates, setUpdates] = React.useState(false);
  const [playbackReminders, setPlaybackReminders] = React.useState(true);
  const [notificationSound, setNotificationSound] = React.useState('default');

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Notifications
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* General Settings */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              General
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl component="fieldset" sx={{ width: '100%', mb: 2 }}>
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={enableNotifications}
                      onChange={(e) => setEnableNotifications(e.target.checked)}
                    />
                  }
                  label="Enable Notifications"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Allow CleverFerret to send notifications
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl fullWidth sx={{ mt: 2 }}>
              <InputLabel>Notification Sound</InputLabel>
              <Select
                value={notificationSound}
                label="Notification Sound"
                onChange={(e) => setNotificationSound(e.target.value)}
                disabled={!enableNotifications}
              >
                <MenuItem value="default">Default</MenuItem>
                <MenuItem value="silent">Silent</MenuItem>
                <MenuItem value="chime">Chime</MenuItem>
                <MenuItem value="beep">Beep</MenuItem>
              </Select>
            </FormControl>
          </CardContent>
        </Card>

        {/* Notification Types */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="subtitle1" gutterBottom fontWeight="bold">
              Notification Types
            </Typography>
            <Divider sx={{ mb: 2 }} />

            <FormControl
              component="fieldset"
              sx={{ width: '100%', mb: 2 }}
              disabled={!enableNotifications}
            >
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={newContent}
                      onChange={(e) => setNewContent(e.target.checked)}
                    />
                  }
                  label="New Content Available"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Notify when new podcasts, radio stations, or media are added
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl
              component="fieldset"
              sx={{ width: '100%', mb: 2 }}
              disabled={!enableNotifications}
            >
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={downloads} onChange={(e) => setDownloads(e.target.checked)} />
                  }
                  label="Download Complete"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Notify when downloads finish
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl
              component="fieldset"
              sx={{ width: '100%', mb: 2 }}
              disabled={!enableNotifications}
            >
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch
                      checked={playbackReminders}
                      onChange={(e) => setPlaybackReminders(e.target.checked)}
                    />
                  }
                  label="Playback Reminders"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Remind you to continue unfinished audiobooks or podcasts
                </Typography>
              </FormGroup>
            </FormControl>

            <FormControl
              component="fieldset"
              sx={{ width: '100%' }}
              disabled={!enableNotifications}
            >
              <FormGroup>
                <FormControlLabel
                  control={
                    <Switch checked={updates} onChange={(e) => setUpdates(e.target.checked)} />
                  }
                  label="App Updates"
                />
                <Typography variant="caption" color="text.secondary" sx={{ ml: 4, mt: -1 }}>
                  Notify about available app updates and new features
                </Typography>
              </FormGroup>
            </FormControl>
          </CardContent>
        </Card>

        {/* Info Alert */}
        <Alert severity="info">
          Notification settings require browser permissions. Make sure notifications are enabled for
          this site in your browser settings.
        </Alert>
      </Box>
    </Box>
  );
};

export default NotificationSettingsScreen;
