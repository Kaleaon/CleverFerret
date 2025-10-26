// Ancient Architect Navigation Components
// Navigation rail and drawer with pillar aesthetic
import React from 'react';
import {
  Drawer,
  DrawerProps,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Box,
  Typography,
  Divider,
  AppBar,
  AppBarProps,
  Toolbar,
  keyframes,
} from '@mui/material';
import { GeometricDivider } from './GeometricPatterns';

// Glow pulse animation
const glowPulse = keyframes`
  0%, 100% {
    box-shadow: 0 0 10px currentColor;
  }
  50% {
    box-shadow: 0 0 20px currentColor, 0 0 30px currentColor;
  }
`;

interface NavigationItem {
  icon: React.ReactNode;
  label: string;
  onClick: () => void;
  badge?: number;
}

interface AncientNavigationDrawerProps extends Omit<DrawerProps, 'ref'> {
  items: NavigationItem[];
  selectedIndex?: number;
  title?: string;
}

export const AncientNavigationDrawer: React.FC<AncientNavigationDrawerProps> = ({
  items,
  selectedIndex = 0,
  title,
  sx,
  ...props
}) => {
  return (
    <Drawer
      {...props}
      sx={{
        '& .MuiDrawer-paper': {
          backgroundColor: '#1A1D23',
          backgroundImage: `
            linear-gradient(180deg, #1A1D23 0%, #2D3139 100%),
            repeating-linear-gradient(
              0deg,
              transparent,
              transparent 60px,
              rgba(82, 87, 95, 0.1) 60px,
              rgba(82, 87, 95, 0.1) 61px
            )
          `,
          borderRight: '3px solid #CD7F32',
          borderImage: 'linear-gradient(180deg, #CD7F32 0%, #B87333 50%, #CD7F32 100%) 1',
          boxShadow: '8px 0 24px rgba(11, 18, 21, 0.6)',
          width: 280,
          ...sx,
        },
      }}
    >
      {title && (
        <Box
          sx={{
            p: 3,
            borderBottom: '2px solid #CD7F32',
            background: 'linear-gradient(135deg, #2D3139 0%, #3F4451 100%)',
          }}
        >
          <Typography
            variant="h5"
            sx={{
              fontFamily: '"Orbitron", sans-serif',
              color: '#CD7F32',
              textAlign: 'center',
              letterSpacing: '0.1em',
              textShadow: '0 0 10px rgba(205, 127, 50, 0.5)',
            }}
          >
            {title}
          </Typography>
        </Box>
      )}
      
      <List sx={{ p: 2 }}>
        {items.map((item, index) => (
          <React.Fragment key={index}>
            <ListItem disablePadding sx={{ mb: 1 }}>
              <ListItemButton
                selected={selectedIndex === index}
                onClick={item.onClick}
                sx={{
                  borderRadius: 0,
                  clipPath: 'polygon(8px 0, 100% 0, 100% calc(100% - 8px), calc(100% - 8px) 100%, 0 100%, 0 8px)',
                  border: '1px solid',
                  borderColor: selectedIndex === index ? '#00CED1' : 'rgba(205, 127, 50, 0.3)',
                  background:
                    selectedIndex === index
                      ? 'linear-gradient(135deg, rgba(0, 206, 209, 0.2) 0%, rgba(70, 130, 180, 0.2) 100%)'
                      : 'rgba(45, 49, 57, 0.3)',
                  mb: 0.5,
                  transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
                  '&:hover': {
                    background: 'linear-gradient(135deg, rgba(0, 206, 209, 0.15) 0%, rgba(70, 130, 180, 0.15) 100%)',
                    borderColor: '#00CED1',
                    boxShadow: '0 0 16px rgba(0, 206, 209, 0.3)',
                  },
                  ...(selectedIndex === index && {
                    animation: `${glowPulse} 2s ease-in-out infinite`,
                  }),
                }}
              >
                <ListItemIcon
                  sx={{
                    color: selectedIndex === index ? '#00CED1' : '#CD7F32',
                    minWidth: 40,
                    transition: 'color 0.3s',
                  }}
                >
                  <Box
                    sx={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      width: 32,
                      height: 32,
                      clipPath: 'polygon(30% 0%, 70% 0%, 100% 30%, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0% 30%)',
                      border: '1px solid currentColor',
                      background: 'rgba(63, 68, 81, 0.3)',
                    }}
                  >
                    {item.icon}
                  </Box>
                </ListItemIcon>
                <ListItemText
                  primary={item.label}
                  primaryTypographyProps={{
                    fontFamily: '"Rajdhani", sans-serif',
                    fontWeight: 600,
                    fontSize: '1rem',
                    letterSpacing: '0.05em',
                    color: selectedIndex === index ? '#00CED1' : '#E8E8E8',
                  }}
                />
                {item.badge !== undefined && item.badge > 0 && (
                  <Box
                    sx={{
                      backgroundColor: '#E0115F',
                      color: '#E8E8E8',
                      borderRadius: 0,
                      clipPath: 'polygon(4px 0, 100% 0, 100% calc(100% - 4px), calc(100% - 4px) 100%, 0 100%, 0 4px)',
                      px: 1,
                      py: 0.5,
                      fontSize: '0.75rem',
                      fontWeight: 700,
                      minWidth: 24,
                      textAlign: 'center',
                      boxShadow: '0 0 10px rgba(224, 17, 95, 0.5)',
                    }}
                  >
                    {item.badge}
                  </Box>
                )}
              </ListItemButton>
            </ListItem>
            {index < items.length - 1 && index % 5 === 4 && (
              <Box sx={{ my: 2 }}>
                <GeometricDivider style="chevron" color="#CD7F32" height={3} />
              </Box>
            )}
          </React.Fragment>
        ))}
      </List>
    </Drawer>
  );
};

// Ancient Architect App Bar
interface AncientAppBarProps extends Omit<AppBarProps, 'ref'> {
  title?: string;
  actions?: React.ReactNode;
}

export const AncientAppBar: React.FC<AncientAppBarProps> = ({ title, actions, children, sx, ...props }) => {
  return (
    <AppBar
      {...props}
      sx={{
        backgroundColor: '#1A1D23',
        backgroundImage: 'linear-gradient(90deg, #1A1D23 0%, #2D3139 100%)',
        borderBottom: '3px solid #CD7F32',
        boxShadow: '0 4px 16px rgba(11, 18, 21, 0.6), inset 0 -2px 0 rgba(205, 127, 50, 0.3)',
        ...sx,
      }}
    >
      <Toolbar
        sx={{
          borderBottom: '1px solid rgba(205, 127, 50, 0.3)',
        }}
      >
        {title && (
          <Typography
            variant="h6"
            component="div"
            sx={{
              flexGrow: 1,
              fontFamily: '"Orbitron", sans-serif',
              color: '#CD7F32',
              letterSpacing: '0.1em',
              textShadow: '0 0 10px rgba(205, 127, 50, 0.5)',
              fontWeight: 600,
            }}
          >
            {title}
          </Typography>
        )}
        {children}
        {actions && <Box sx={{ ml: 2 }}>{actions}</Box>}
      </Toolbar>
    </AppBar>
  );
};

// Navigation Rail (vertical sidebar)
interface AncientNavigationRailProps {
  items: NavigationItem[];
  selectedIndex?: number;
  width?: number;
}

export const AncientNavigationRail: React.FC<AncientNavigationRailProps> = ({
  items,
  selectedIndex = 0,
  width = 80,
}) => {
  return (
    <Box
      sx={{
        width,
        height: '100vh',
        backgroundColor: '#1A1D23',
        backgroundImage: `
          linear-gradient(180deg, #1A1D23 0%, #2D3139 100%),
          repeating-linear-gradient(
            0deg,
            transparent,
            transparent 80px,
            rgba(82, 87, 95, 0.15) 80px,
            rgba(82, 87, 95, 0.15) 81px
          )
        `,
        borderRight: '3px solid #CD7F32',
        borderImage: 'linear-gradient(180deg, #CD7F32 0%, #B87333 50%, #CD7F32 100%) 1',
        boxShadow: '4px 0 16px rgba(11, 18, 21, 0.5)',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        py: 2,
        gap: 1,
      }}
    >
      {items.map((item, index) => (
        <Box
          key={index}
          onClick={item.onClick}
          sx={{
            position: 'relative',
            width: width - 16,
            height: width - 16,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            cursor: 'pointer',
            clipPath: 'polygon(30% 0%, 70% 0%, 100% 30%, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0% 30%)',
            border: '2px solid',
            borderColor: selectedIndex === index ? '#00CED1' : 'rgba(205, 127, 50, 0.4)',
            background:
              selectedIndex === index
                ? 'linear-gradient(135deg, rgba(0, 206, 209, 0.3) 0%, rgba(70, 130, 180, 0.3) 100%)'
                : 'rgba(45, 49, 57, 0.5)',
            color: selectedIndex === index ? '#00CED1' : '#CD7F32',
            transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
            '&:hover': {
              background: 'linear-gradient(135deg, rgba(0, 206, 209, 0.2) 0%, rgba(70, 130, 180, 0.2) 100%)',
              borderColor: '#00CED1',
              color: '#00CED1',
              boxShadow: '0 0 20px rgba(0, 206, 209, 0.4)',
              transform: 'scale(1.05)',
            },
            ...(selectedIndex === index && {
              animation: `${glowPulse} 2s ease-in-out infinite`,
            }),
          }}
        >
          <Box sx={{ fontSize: '1.5rem', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
            {item.icon}
          </Box>
          <Typography
            variant="caption"
            sx={{
              mt: 0.5,
              fontSize: '0.65rem',
              fontWeight: 600,
              letterSpacing: '0.05em',
              textAlign: 'center',
              maxWidth: '100%',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              whiteSpace: 'nowrap',
            }}
          >
            {item.label}
          </Typography>
          {item.badge !== undefined && item.badge > 0 && (
            <Box
              sx={{
                position: 'absolute',
                top: -4,
                right: -4,
                backgroundColor: '#E0115F',
                color: '#E8E8E8',
                borderRadius: '50%',
                width: 20,
                height: 20,
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                fontSize: '0.7rem',
                fontWeight: 700,
                border: '2px solid #1A1D23',
                boxShadow: '0 0 10px rgba(224, 17, 95, 0.5)',
              }}
            >
              {item.badge > 99 ? '99+' : item.badge}
            </Box>
          )}
        </Box>
      ))}
    </Box>
  );
};
