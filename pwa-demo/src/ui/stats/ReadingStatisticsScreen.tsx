/**
 * Reading Statistics Screen
 * 
 * Display reading analytics including time spent, pages read, completion rate.
 * Migrated from ReadingStatisticsScreen.kt
 */

import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Card,
  CardContent,
  Grid,
  Tabs,
  Tab,
  List,
  ListItem,
  ListItemText,
  LinearProgress,
  Chip,
  Stack,
} from '@mui/material';
import {
  ArrowBack,
  TrendingUp,
  MenuBook,
  Timer,
  CheckCircle,
  CalendarToday,
} from '@mui/icons-material';

import { db } from '../../services/database-complete';

interface StatCard {
  title: string;
  value: string | number;
  subtitle?: string;
  icon: React.ReactNode;
  color: string;
}

export const ReadingStatisticsScreen: React.FC = () => {
  const navigate = useNavigate();
  const [tabValue, setTabValue] = useState(0);
  const [stats, setStats] = useState({
    totalBooks: 0,
    booksCompleted: 0,
    totalReadingTime: 0,
    pagesRead: 0,
    currentStreak: 7,
  });

  useEffect(() => {
    loadStatistics();
  }, []);

  const loadStatistics = async () => {
    // Load reading statistics
    const readingStats = await db.readingStatistics.toArray();
    const progress = await db.readingProgress.toArray();
    
    const totalTime = readingStats.reduce((sum, stat) => sum + stat.readingTimeMinutes, 0);
    const totalPages = readingStats.reduce((sum, stat) => sum + stat.pagesRead, 0);
    const completed = progress.filter(p => p.isCompleted).length;

    setStats({
      totalBooks: progress.length,
      booksCompleted: completed,
      totalReadingTime: totalTime,
      pagesRead: totalPages,
      currentStreak: 7, // Mock data
    });
  };

  const statCards: StatCard[] = [
    {
      title: 'Total Reading Time',
      value: `${Math.floor(stats.totalReadingTime / 60)}h ${stats.totalReadingTime % 60}m`,
      subtitle: 'All time',
      icon: <Timer sx={{ fontSize: 40 }} />,
      color: '#4CAF50',
    },
    {
      title: 'Books Completed',
      value: stats.booksCompleted,
      subtitle: `of ${stats.totalBooks} books`,
      icon: <CheckCircle sx={{ fontSize: 40 }} />,
      color: '#2196F3',
    },
    {
      title: 'Pages Read',
      value: stats.pagesRead.toLocaleString(),
      subtitle: 'Total pages',
      icon: <MenuBook sx={{ fontSize: 40 }} />,
      color: '#FF9800',
    },
    {
      title: 'Current Streak',
      value: `${stats.currentStreak} days`,
      subtitle: 'Keep it up!',
      icon: <TrendingUp sx={{ fontSize: 40 }} />,
      color: '#E91E63',
    },
  ];

  const recentBooks = [
    { title: 'The Great Gatsby', progress: 85, pages: 180 },
    { title: '1984', progress: 100, pages: 328 },
    { title: 'To Kill a Mockingbird', progress: 45, pages: 281 },
  ];

  return (
    <Box sx={{ height: '100vh', display: 'flex', flexDirection: 'column' }}>
      <AppBar position="static">
        <Toolbar>
          <IconButton edge="start" color="inherit" onClick={() => navigate(-1)}>
            <ArrowBack />
          </IconButton>
          <Typography variant="h6" sx={{ flexGrow: 1 }}>
            Reading Statistics
          </Typography>
        </Toolbar>
      </AppBar>

      <Box sx={{ flex: 1, overflow: 'auto', bgcolor: '#f5f5f5' }}>
        <Tabs
          value={tabValue}
          onChange={(_, newValue) => setTabValue(newValue)}
          centered
          sx={{ bgcolor: 'white', borderBottom: 1, borderColor: 'divider' }}
        >
          <Tab label="Overview" />
          <Tab label="This Week" />
          <Tab label="This Month" />
          <Tab label="All Time" />
        </Tabs>

        <Box sx={{ p: 2 }}>
          {/* Stat Cards */}
          <Grid container spacing={2} sx={{ mb: 3 }}>
            {statCards.map((card) => (
              <Grid item xs={6} key={card.title}>
                <Card sx={{ height: '100%' }}>
                  <CardContent>
                    <Box sx={{ display: 'flex', alignItems: 'flex-start', mb: 1 }}>
                      <Box sx={{ color: card.color, mr: 1 }}>{card.icon}</Box>
                      <Box sx={{ flex: 1 }}>
                        <Typography variant="h4" sx={{ fontWeight: 'bold', mb: 0.5 }}>
                          {card.value}
                        </Typography>
                        <Typography variant="body2" color="text.secondary">
                          {card.title}
                        </Typography>
                        {card.subtitle && (
                          <Typography variant="caption" color="text.secondary">
                            {card.subtitle}
                          </Typography>
                        )}
                      </Box>
                    </Box>
                  </CardContent>
                </Card>
              </Grid>
            ))}
          </Grid>

          {/* Daily Reading Goal */}
          <Card sx={{ mb: 2 }}>
            <CardContent>
              <Stack direction="row" justifyContent="space-between" alignItems="center" sx={{ mb: 1 }}>
                <Typography variant="h6">Daily Reading Goal</Typography>
                <Chip label="On Track" color="success" size="small" />
              </Stack>
              <Typography variant="body2" color="text.secondary" gutterBottom>
                35 minutes of 30 minutes (117%)
              </Typography>
              <LinearProgress variant="determinate" value={100} sx={{ height: 8, borderRadius: 4 }} />
            </CardContent>
          </Card>

          {/* Reading History */}
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Reading History
              </Typography>
              <List>
                {recentBooks.map((book, index) => (
                  <ListItem key={index} divider={index < recentBooks.length - 1}>
                    <ListItemText
                      primary={book.title}
                      secondary={
                        <Box sx={{ mt: 1 }}>
                          <Stack direction="row" spacing={1} alignItems="center" sx={{ mb: 0.5 }}>
                            <Typography variant="caption">
                              {book.progress}% complete
                            </Typography>
                            <Typography variant="caption" color="text.secondary">
                              • {book.pages} pages
                            </Typography>
                          </Stack>
                          <LinearProgress
                            variant="determinate"
                            value={book.progress}
                            sx={{ height: 6, borderRadius: 3 }}
                          />
                        </Box>
                      }
                    />
                  </ListItem>
                ))}
              </List>
            </CardContent>
          </Card>

          {/* Weekly Calendar Heatmap placeholder */}
          <Card sx={{ mt: 2 }}>
            <CardContent>
              <Stack direction="row" spacing={1} alignItems="center" sx={{ mb: 2 }}>
                <CalendarToday />
                <Typography variant="h6">Reading Activity</Typography>
              </Stack>
              <Typography variant="body2" color="text.secondary">
                Weekly reading activity visualization coming soon...
              </Typography>
            </CardContent>
          </Card>
        </Box>
      </Box>
    </Box>
  );
};

export default ReadingStatisticsScreen;
