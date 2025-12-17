/**
 * Responsive Navigation Component
 * 
 * Adapts navigation based on screen size:
 * - Desktop (>1280px): Fixed sidebar (current behavior)
 * - Tablet (960-1280px): Collapsible sidebar
 * - Mobile (<960px): Bottom navigation + drawer
 */

import React, { useState, useEffect } from 'react';
import {
  AppBar,
  Box,
  Drawer,
  IconButton,
  Toolbar,
  useMediaQuery,
  useTheme,
  BottomNavigation,
  BottomNavigationAction,
  SwipeableDrawer,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Divider,
  Tabs,
  Tab,
} from '@mui/material';
import {
  Menu as MenuIcon,
  Home as HomeIcon,
  LibraryBooks as BooksIcon,
  Headphones as AudioIcon,
  Book as ComicsIcon,
  Movie as MoviesIcon,
  MusicNote as MusicIcon,
  Podcasts as PodcastsIcon,
  Article as DocumentsIcon,
  Radio as RadioIcon,
  Settings as SettingsIcon,
  Collections as CollectionsIcon,
  Search as SearchIcon,
  GraphicEq as VisualizerIcon,
  Tv as TvIcon,
  Folder as FolderIcon,
  Download as DownloadIcon,
  Storage as StorageIcon,
  BarChart as StatisticsIcon,
} from '@mui/icons-material';
import { useNavigate, useLocation } from 'react-router-dom';
import { libraryRepository } from '../data/repository';
import type { Library } from '../data/local/entity';

interface NavItem {
  id: string;
  label: string;
  icon: React.ReactElement;
  path: string;
  showInBottom?: boolean;
}

const navItems: NavItem[] = [
  { id: 'home', label: 'Home', icon: <HomeIcon />, path: '/', showInBottom: true },
  { id: 'books', label: 'Books', icon: <BooksIcon />, path: '/library/1', showInBottom: true },
  { id: 'comics', label: 'Comics', icon: <ComicsIcon />, path: '/library/3', showInBottom: true },
  { id: 'audiobooks', label: 'Audiobooks', icon: <AudioIcon />, path: '/library/2', showInBottom: true },
  { id: 'music', label: 'Music', icon: <MusicIcon />, path: '/music', showInBottom: true },
  { id: 'movies', label: 'Movies', icon: <MoviesIcon />, path: '/library/4', showInBottom: true },
  { id: 'tv', label: 'TV Shows', icon: <TvIcon />, path: '/library/5', showInBottom: true },
  { id: 'radio', label: 'Radio', icon: <RadioIcon />, path: '/radio', showInBottom: true },
  { id: 'podcasts', label: 'Podcasts', icon: <PodcastsIcon />, path: '/podcasts', showInBottom: false },
  { id: 'documents', label: 'Documents', icon: <DocumentsIcon />, path: '/library/7', showInBottom: false },
  { id: 'collections', label: 'Collections', icon: <CollectionsIcon />, path: '/collections', showInBottom: false },
  { id: 'downloads', label: 'Downloads', icon: <DownloadIcon />, path: '/downloads', showInBottom: false },
  { id: 'storage', label: 'Storage', icon: <StorageIcon />, path: '/storage', showInBottom: false },
  { id: 'opds', label: 'OPDS', icon: <BooksIcon />, path: '/opds', showInBottom: false },
  { id: 'statistics', label: 'Statistics', icon: <StatisticsIcon />, path: '/statistics', showInBottom: false },
  { id: 'search', label: 'Search', icon: <SearchIcon />, path: '/search', showInBottom: false },
  { id: 'settings', label: 'Settings', icon: <SettingsIcon />, path: '/settings', showInBottom: false },
];

const bottomNavItems = navItems.filter(item => item.showInBottom);

interface ResponsiveNavigationProps {
  children: React.ReactNode;
}

export const ResponsiveNavigation: React.FC<ResponsiveNavigationProps> = ({ children }) => {
  const theme = useTheme();
  const navigate = useNavigate();
  const location = useLocation();
  const [drawerOpen, setDrawerOpen] = useState(false);
  const [libraries, setLibraries] = useState<Library[]>([]);
  const [libraryTabValue, setLibraryTabValue] = useState(0);
  
  // Responsive breakpoints
  const isMobile = useMediaQuery(theme.breakpoints.down('md'));
  const isTablet = useMediaQuery(theme.breakpoints.between('md', 'lg'));
  const isDesktop = useMediaQuery(theme.breakpoints.up('lg'));

  // Load libraries for bottom navigation
  useEffect(() => {
    const loadLibraries = async () => {
      const libs = await libraryRepository.getAllActiveLibraries();
      setLibraries(libs);
      
      // Set current library tab if on a library page
      if (location.pathname.startsWith('/library/')) {
        const libraryId = parseInt(location.pathname.split('/library/')[1]?.split('/')[0] || '0');
        const index = libs.findIndex(lib => lib.libraryId === libraryId);
        if (index >= 0) {
          setLibraryTabValue(index);
        }
      }
    };
    loadLibraries();
  }, [location.pathname]);

  const handleNavigation = (path: string) => {
    navigate(path);
    if (isMobile) {
      setDrawerOpen(false);
    }
  };

  const handleLibraryTabChange = (event: React.SyntheticEvent, newValue: number) => {
    setLibraryTabValue(newValue);
    if (libraries[newValue]) {
      navigate(`/library/${libraries[newValue].libraryId}`);
    }
  };

  const getCurrentBottomNav = () => {
    const currentItem = bottomNavItems.find(item => item.path === location.pathname);
    return currentItem ? currentItem.id : 'home';
  };

  const getLibraryIcon = (type: string) => {
    switch (type.toUpperCase()) {
      case 'BOOK':
        return <BooksIcon />;
      case 'MOVIE':
        return <MoviesIcon />;
      case 'MUSIC':
        return <MusicIcon />;
      case 'AUDIOBOOK':
        return <AudioIcon />;
      case 'TV_SHOW':
        return <TvIcon />;
      default:
        return <FolderIcon />;
    }
  };

  // Desktop Sidebar (always visible)
  const DesktopSidebar = () => (
    <Box
      sx={{
        width: 80,
        height: '100vh',
        bgcolor: 'primary.dark',
        position: 'fixed',
        left: 0,
        top: 0,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        py: 2,
        zIndex: 1200,
      }}
    >
      {navItems.map((item) => (
        <IconButton
          key={item.id}
          onClick={() => handleNavigation(item.path)}
          sx={{
            color: location.pathname === item.path ? 'secondary.main' : 'primary.contrastText',
            bgcolor: location.pathname === item.path ? 'action.selected' : 'transparent',
            mb: 1,
            width: 56,
            height: 56,
            '&:hover': {
              bgcolor: 'action.hover',
            },
          }}
        >
          {item.icon}
        </IconButton>
      ))}
    </Box>
  );

  // Tablet Collapsible Sidebar
  const TabletSidebar = () => (
    <>
      <AppBar position="fixed" sx={{ zIndex: theme.zIndex.drawer + 1 }}>
        <Toolbar>
          <IconButton
            color="inherit"
            edge="start"
            onClick={() => setDrawerOpen(!drawerOpen)}
            sx={{ mr: 2 }}
          >
            <MenuIcon />
          </IconButton>
        </Toolbar>
      </AppBar>
      <Drawer
        variant="persistent"
        open={drawerOpen}
        sx={{
          width: 240,
          flexShrink: 0,
          '& .MuiDrawer-paper': {
            width: 240,
            boxSizing: 'border-box',
            mt: '64px',
          },
        }}
      >
        <List>
          {navItems.map((item) => (
            <ListItem key={item.id} disablePadding>
              <ListItemButton
                selected={location.pathname === item.path}
                onClick={() => handleNavigation(item.path)}
              >
                <ListItemIcon>{item.icon}</ListItemIcon>
                <ListItemText primary={item.label} />
              </ListItemButton>
            </ListItem>
          ))}
        </List>
      </Drawer>
    </>
  );

  // Mobile Navigation (Bottom Nav + Drawer for all items)
  const MobileNavigation = () => (
    <>
      {/* Top App Bar with Menu */}
      <AppBar position="fixed" sx={{ top: 0, bottom: 'auto' }}>
        <Toolbar>
          <IconButton
            color="inherit"
            edge="start"
            onClick={() => setDrawerOpen(true)}
            sx={{ mr: 2 }}
          >
            <MenuIcon />
          </IconButton>
          <Box sx={{ flexGrow: 1 }} />
        </Toolbar>
      </AppBar>

      {/* Swipeable Drawer */}
      <SwipeableDrawer
        anchor="left"
        open={drawerOpen}
        onClose={() => setDrawerOpen(false)}
        onOpen={() => setDrawerOpen(true)}
        disableBackdropTransition
        sx={{
          '& .MuiDrawer-paper': {
            width: 280,
            bgcolor: 'background.paper',
          },
        }}
      >
        <Box sx={{ pt: 2, pb: 2 }}>
          <List>
            {navItems.map((item) => (
              <ListItem key={item.id} disablePadding>
                <ListItemButton
                  selected={location.pathname === item.path}
                  onClick={() => handleNavigation(item.path)}
                  sx={{
                    minHeight: 48,
                    px: 2.5,
                  }}
                >
                  <ListItemIcon
                    sx={{
                      minWidth: 0,
                      mr: 3,
                      color: location.pathname === item.path ? 'primary.main' : 'inherit',
                    }}
                  >
                    {item.icon}
                  </ListItemIcon>
                  <ListItemText
                    primary={item.label}
                    sx={{
                      color: location.pathname === item.path ? 'primary.main' : 'inherit',
                    }}
                  />
                </ListItemButton>
              </ListItem>
            ))}
          </List>
        </Box>
      </SwipeableDrawer>

      {/* Scrollable Library Tabs */}
      {libraries.length > 0 && (
        <Box
          sx={{
            position: 'fixed',
            bottom: 56,
            left: 0,
            right: 0,
            zIndex: 1099,
            bgcolor: 'background.paper',
            borderTop: 1,
            borderBottom: 1,
            borderColor: 'divider',
            overflowX: 'auto',
            '&::-webkit-scrollbar': {
              height: 4,
            },
            '&::-webkit-scrollbar-thumb': {
              backgroundColor: 'rgba(0,0,0,0.2)',
              borderRadius: 2,
            },
          }}
        >
          <Tabs
            value={libraryTabValue}
            onChange={handleLibraryTabChange}
            variant="scrollable"
            scrollButtons="auto"
            sx={{
              minHeight: 48,
              '& .MuiTab-root': {
                minHeight: 48,
                textTransform: 'none',
                fontSize: '0.75rem',
                px: 1.5,
              },
            }}
          >
            {libraries.map((library, index) => (
              <Tab
                key={library.libraryId}
                icon={getLibraryIcon(library.type)}
                iconPosition="start"
                label={library.name}
                value={index}
                sx={{
                  minWidth: 120,
                  textTransform: 'none',
                }}
              />
            ))}
          </Tabs>
        </Box>
      )}

      {/* Bottom Navigation */}
      <BottomNavigation
        value={getCurrentBottomNav()}
        onChange={(event, newValue) => {
          const item = bottomNavItems.find(i => i.id === newValue);
          if (item) handleNavigation(item.path);
        }}
        showLabels
        sx={{
          position: 'fixed',
          bottom: 0,
          left: 0,
          right: 0,
          zIndex: 1100,
          borderTop: 1,
          borderColor: 'divider',
          bgcolor: 'background.paper',
        }}
      >
        {bottomNavItems.map((item) => (
          <BottomNavigationAction
            key={item.id}
            label={item.label}
            value={item.id}
            icon={item.icon}
            sx={{
              minWidth: 0,
              '& .MuiBottomNavigationAction-label': {
                fontSize: '0.7rem',
              },
            }}
          />
        ))}
      </BottomNavigation>
    </>
  );

  return (
    <Box sx={{ display: 'flex', minHeight: '100vh' }}>
      {/* Render appropriate navigation based on screen size */}
      {isDesktop && <DesktopSidebar />}
      {isTablet && <TabletSidebar />}
      {isMobile && <MobileNavigation />}

      {/* Main Content Area */}
      <Box
        component="main"
        sx={{
          flexGrow: 1,
          ml: isDesktop ? '80px' : 0,
          pl: isTablet && drawerOpen ? '240px' : 0,
          pt: isMobile || isTablet ? { xs: '56px', sm: '64px' } : 0,
          pb: isMobile ? (libraries.length > 0 ? '104px' : '56px') : 0,
          transition: theme.transitions.create(['margin', 'padding'], {
            easing: theme.transitions.easing.sharp,
            duration: theme.transitions.duration.leavingScreen,
          }),
        }}
      >
        {children}
      </Box>
    </Box>
  );
};

export default ResponsiveNavigation;
