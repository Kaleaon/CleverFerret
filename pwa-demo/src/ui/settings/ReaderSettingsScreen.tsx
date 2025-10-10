/**
 * Reader Settings Screen
 * 
 * Configure ebook reader preferences.
 * Migrated from ReaderSettingsScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Card,
  CardContent,
  Slider,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Switch,
  FormControlLabel,
  ToggleButtonGroup,
  ToggleButton,
  Divider,
} from '@mui/material';
import {
  ArrowBack,
  Save,
  RestartAlt,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';
import type { ReaderSettingsEntity } from '../../data/local/entity';

export const ReaderSettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [settings, setSettings] = useState<ReaderSettingsEntity | null>(null);

  useEffect(() => {
    loadSettings();
  }, []);

  const loadSettings = async () => {
    const readerSettings = await db.readerSettings.get(1);
    if (readerSettings) {
      setSettings(readerSettings);
    }
  };

  const handleSave = async () => {
    if (settings) {
      await db.readerSettings.put(settings);
      navigate(-1);
    }
  };

  const handleReset = async () => {
    const defaultSettings: ReaderSettingsEntity = {
      id: 1,
      fontSize: 18,
      fontFamily: 'System Default',
      lineHeight: 1.5,
      letterSpacing: 0,
      fontWeight: 'Normal',
      marginTop: 32,
      marginBottom: 32,
      marginLeft: 24,
      marginRight: 24,
      textAlignment: 'Left',
      paragraphSpacing: 8,
      pageTurnAnimation: 'Slide',
      pageTurnSpeed: 'Normal',
      tapToTurnPages: true,
      swipeToTurnPages: true,
      volumeKeysToTurnPages: true,
      theme: 'Auto',
      brightness: -1,
      nightMode: false,
      autoNightMode: true,
      nightModeStart: '22:00',
      nightModeEnd: '07:00',
      enableHyphenation: true,
      enablePageNumbers: true,
      enableProgressIndicator: true,
      fullScreenMode: false,
      keepScreenOn: true,
      enableDictionaryLookup: true,
      enableTextSelection: true,
      enableTranslation: true,
      scrollingMode: false,
      updatedAt: Date.now(),
    };
    setSettings(defaultSettings);
  };

  if (!settings) {
    return <Box>Loading...</Box>;
  }

  return (
    <Box>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Reader Settings
          </Typography>
          <IconButton color="inherit" onClick={handleReset}>
            <RestartAlt />
          </IconButton>
          <IconButton color="inherit" onClick={handleSave}>
            <Save />
          </IconButton>
        </Toolbar>
      </AppBar>

      <Box sx={{ p: 2 }}>
        {/* Typography */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Typography
            </Typography>

            <Typography variant="subtitle2" gutterBottom>
              Font Size: {settings.fontSize}px
            </Typography>
            <Slider
              value={settings.fontSize}
              min={12}
              max={32}
              onChange={(_, value) => setSettings({ ...settings, fontSize: value as number })}
              sx={{ mb: 3 }}
            />

            <FormControl fullWidth sx={{ mb: 3 }}>
              <InputLabel>Font Family</InputLabel>
              <Select
                value={settings.fontFamily}
                onChange={(e) => setSettings({ ...settings, fontFamily: e.target.value })}
              >
                <MenuItem value="System Default">System Default</MenuItem>
                <MenuItem value="Serif">Serif</MenuItem>
                <MenuItem value="Sans-serif">Sans-serif</MenuItem>
                <MenuItem value="Monospace">Monospace</MenuItem>
              </Select>
            </FormControl>

            <Typography variant="subtitle2" gutterBottom>
              Line Height: {settings.lineHeight.toFixed(1)}
            </Typography>
            <Slider
              value={settings.lineHeight}
              min={1.0}
              max={2.5}
              step={0.1}
              onChange={(_, value) => setSettings({ ...settings, lineHeight: value as number })}
            />
          </CardContent>
        </Card>

        {/* Layout */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Layout
            </Typography>

            <Typography variant="subtitle2" gutterBottom>
              Margins
            </Typography>
            <Box sx={{ mb: 2 }}>
              <Typography variant="caption">Top: {settings.marginTop}dp</Typography>
              <Slider
                value={settings.marginTop}
                min={0}
                max={64}
                onChange={(_, value) => setSettings({ ...settings, marginTop: value as number })}
              />
            </Box>

            <FormControl fullWidth>
              <InputLabel>Text Alignment</InputLabel>
              <Select
                value={settings.textAlignment}
                onChange={(e) => setSettings({ ...settings, textAlignment: e.target.value })}
              >
                <MenuItem value="Left">Left</MenuItem>
                <MenuItem value="Center">Center</MenuItem>
                <MenuItem value="Justify">Justify</MenuItem>
              </Select>
            </FormControl>
          </CardContent>
        </Card>

        {/* Display */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Display
            </Typography>

            <FormControl fullWidth sx={{ mb: 2 }}>
              <InputLabel>Theme</InputLabel>
              <Select
                value={settings.theme}
                onChange={(e) => setSettings({ ...settings, theme: e.target.value })}
              >
                <MenuItem value="Auto">Auto</MenuItem>
                <MenuItem value="Light">Light</MenuItem>
                <MenuItem value="Dark">Dark</MenuItem>
                <MenuItem value="Sepia">Sepia</MenuItem>
              </Select>
            </FormControl>

            <FormControlLabel
              control={
                <Switch
                  checked={settings.nightMode}
                  onChange={(e) => setSettings({ ...settings, nightMode: e.target.checked })}
                />
              }
              label="Night Mode"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.autoNightMode}
                  onChange={(e) => setSettings({ ...settings, autoNightMode: e.target.checked })}
                />
              }
              label="Auto Night Mode"
            />
          </CardContent>
        </Card>

        {/* Page Turn */}
        <Card sx={{ mb: 2 }}>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Page Turn
            </Typography>

            <FormControl fullWidth sx={{ mb: 2 }}>
              <InputLabel>Animation</InputLabel>
              <Select
                value={settings.pageTurnAnimation}
                onChange={(e) => setSettings({ ...settings, pageTurnAnimation: e.target.value })}
              >
                <MenuItem value="Slide">Slide</MenuItem>
                <MenuItem value="Fade">Fade</MenuItem>
                <MenuItem value="Curl">Page Curl</MenuItem>
                <MenuItem value="None">None</MenuItem>
              </Select>
            </FormControl>

            <FormControlLabel
              control={
                <Switch
                  checked={settings.tapToTurnPages}
                  onChange={(e) => setSettings({ ...settings, tapToTurnPages: e.target.checked })}
                />
              }
              label="Tap to Turn Pages"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.swipeToTurnPages}
                  onChange={(e) => setSettings({ ...settings, swipeToTurnPages: e.target.checked })}
                />
              }
              label="Swipe to Turn Pages"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.volumeKeysToTurnPages}
                  onChange={(e) =>
                    setSettings({ ...settings, volumeKeysToTurnPages: e.target.checked })
                  }
                />
              }
              label="Volume Keys to Turn Pages"
            />
          </CardContent>
        </Card>

        {/* Advanced */}
        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Advanced
            </Typography>

            <FormControlLabel
              control={
                <Switch
                  checked={settings.enableHyphenation}
                  onChange={(e) => setSettings({ ...settings, enableHyphenation: e.target.checked })}
                />
              }
              label="Enable Hyphenation"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.enablePageNumbers}
                  onChange={(e) => setSettings({ ...settings, enablePageNumbers: e.target.checked })}
                />
              }
              label="Show Page Numbers"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.keepScreenOn}
                  onChange={(e) => setSettings({ ...settings, keepScreenOn: e.target.checked })}
                />
              }
              label="Keep Screen On"
            />

            <FormControlLabel
              control={
                <Switch
                  checked={settings.fullScreenMode}
                  onChange={(e) => setSettings({ ...settings, fullScreenMode: e.target.checked })}
                />
              }
              label="Full Screen Mode"
            />
          </CardContent>
        </Card>
      </Box>
    </Box>
  );
};

export default ReaderSettingsScreen;
