// Ancient Architect Button Components
// Geometric buttons with metallic effects and crystal glows
import React from 'react';
import { Button, ButtonProps, IconButton, IconButtonProps, Fab, FabProps, keyframes } from '@mui/material';

// Energy pulse animation
const energyPulse = keyframes`
  0%, 100% {
    box-shadow: 0 0 10px currentColor, 0 0 20px currentColor, inset 0 0 10px currentColor;
  }
  50% {
    box-shadow: 0 0 20px currentColor, 0 0 40px currentColor, inset 0 0 20px currentColor;
  }
`;

// Shimmer sweep animation
const shimmerSweep = keyframes`
  0% {
    left: -100%;
  }
  100% {
    left: 200%;
  }
`;

interface AncientButtonProps extends Omit<ButtonProps, 'ref'> {
  glowOnHover?: boolean;
  metallic?: boolean;
  energyEffect?: boolean;
}

export const AncientButton: React.FC<AncientButtonProps> = ({
  glowOnHover = true,
  metallic = true,
  energyEffect = false,
  children,
  sx,
  variant = 'contained',
  ...props
}) => {
  const baseStyles = {
    borderRadius: 0,
    clipPath: 'polygon(8px 0, 100% 0, 100% calc(100% - 8px), calc(100% - 8px) 100%, 0 100%, 0 8px)',
    fontWeight: 600,
    letterSpacing: '0.05em',
    textTransform: 'uppercase' as const,
    position: 'relative',
    overflow: 'hidden',
    transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
  };

  const variantStyles = {
    contained: {
      background: 'linear-gradient(135deg, #CD7F32 0%, #B87333 100%)',
      color: '#1A1D23',
      border: '1px solid #C5A572',
      boxShadow: '0 4px 8px rgba(11, 18, 21, 0.4), inset 0 1px 0 rgba(197, 165, 114, 0.5)',
      '&:hover': {
        background: 'linear-gradient(135deg, #B87333 0%, #C5A572 100%)',
        boxShadow: glowOnHover
          ? '0 6px 16px rgba(11, 18, 21, 0.6), 0 0 20px rgba(0, 206, 209, 0.4), inset 0 1px 0 rgba(0, 206, 209, 0.7)'
          : '0 6px 16px rgba(11, 18, 21, 0.6)',
      },
    },
    outlined: {
      border: '2px solid #CD7F32',
      color: '#CD7F32',
      background: 'rgba(45, 49, 57, 0.5)',
      '&:hover': {
        border: '2px solid #00CED1',
        color: '#00CED1',
        background: 'rgba(45, 49, 57, 0.8)',
        boxShadow: glowOnHover ? '0 0 20px rgba(0, 206, 209, 0.4)' : undefined,
      },
    },
    text: {
      color: '#CD7F32',
      '&:hover': {
        color: '#00CED1',
        background: 'rgba(63, 68, 81, 0.3)',
      },
    },
  };

  return (
    <Button
      variant={variant}
      {...props}
      sx={{
        ...baseStyles,
        ...variantStyles[variant],
        ...(metallic && {
          '&::before': {
            content: '""',
            position: 'absolute',
            top: 0,
            left: '-100%',
            width: '50%',
            height: '100%',
            background: 'linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent)',
            animation: `${shimmerSweep} 3s ease-in-out infinite`,
            pointerEvents: 'none',
          },
        }),
        ...(energyEffect && {
          animation: `${energyPulse} 2s ease-in-out infinite`,
        }),
        ...sx,
      }}
    >
      {children}
    </Button>
  );
};

// Primary action button (bronze metallic)
export const PrimaryButton: React.FC<AncientButtonProps> = (props) => {
  return <AncientButton variant="contained" metallic={true} glowOnHover={true} {...props} />;
};

// Secondary button (outlined)
export const SecondaryButton: React.FC<AncientButtonProps> = (props) => {
  return <AncientButton variant="outlined" metallic={false} glowOnHover={true} {...props} />;
};

// Danger/Alert button
export const DangerButton: React.FC<AncientButtonProps> = (props) => {
  return (
    <AncientButton
      variant="contained"
      sx={{
        background: 'linear-gradient(135deg, #E0115F 0%, #C00F50 100%)',
        borderColor: '#E0115F',
        '&:hover': {
          background: 'linear-gradient(135deg, #C00F50 0%, #A00D40 100%)',
          boxShadow: '0 6px 16px rgba(11, 18, 21, 0.6), 0 0 20px rgba(224, 17, 95, 0.4)',
        },
        ...props.sx,
      }}
      {...props}
    />
  );
};

// Success button
export const SuccessButton: React.FC<AncientButtonProps> = (props) => {
  return (
    <AncientButton
      variant="contained"
      sx={{
        background: 'linear-gradient(135deg, #50C878 0%, #40A868 100%)',
        borderColor: '#50C878',
        '&:hover': {
          background: 'linear-gradient(135deg, #40A868 0%, #308858 100%)',
          boxShadow: '0 6px 16px rgba(11, 18, 21, 0.6), 0 0 20px rgba(80, 200, 120, 0.4)',
        },
        ...props.sx,
      }}
      {...props}
    />
  );
};

// Hexagonal Icon Button
interface AncientIconButtonProps extends Omit<IconButtonProps, 'ref'> {
  glowOnHover?: boolean;
}

export const AncientIconButton: React.FC<AncientIconButtonProps> = ({
  glowOnHover = true,
  children,
  sx,
  ...props
}) => {
  return (
    <IconButton
      {...props}
      sx={{
        color: '#CD7F32',
        border: '1px solid rgba(205, 127, 50, 0.4)',
        background: 'rgba(45, 49, 57, 0.6)',
        clipPath: 'polygon(30% 0%, 70% 0%, 100% 30%, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0% 30%)',
        transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
        '&:hover': {
          color: '#00CED1',
          background: '#3F4451',
          border: '1px solid #00CED1',
          boxShadow: glowOnHover ? '0 0 16px rgba(0, 206, 209, 0.5)' : undefined,
          transform: 'rotate(45deg)',
        },
        ...sx,
      }}
    >
      <Box sx={{ transform: 'rotate(0deg)', transition: 'transform 0.3s' }}>{children}</Box>
    </IconButton>
  );
};

// Diamond-shaped FAB
interface AncientFabProps extends Omit<FabProps, 'ref'> {
  glowOnHover?: boolean;
}

export const AncientFab: React.FC<AncientFabProps> = ({ glowOnHover = true, children, sx, ...props }) => {
  return (
    <Fab
      {...props}
      sx={{
        background: 'linear-gradient(135deg, #CD7F32 0%, #B87333 100%)',
        color: '#1A1D23',
        border: '2px solid #C5A572',
        borderRadius: 0,
        clipPath: 'polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)',
        boxShadow: '0 8px 16px rgba(11, 18, 21, 0.5), inset 0 2px 0 rgba(197, 165, 114, 0.5)',
        transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
        '&:hover': {
          background: 'linear-gradient(135deg, #B87333 0%, #C5A572 100%)',
          borderColor: '#00CED1',
          boxShadow: glowOnHover
            ? '0 12px 24px rgba(11, 18, 21, 0.7), 0 0 40px rgba(0, 206, 209, 0.5)'
            : '0 12px 24px rgba(11, 18, 21, 0.7)',
          transform: 'scale(1.1) rotate(45deg)',
        },
        '&::before': {
          content: '""',
          position: 'absolute',
          top: 0,
          left: '-100%',
          width: '50%',
          height: '100%',
          background: 'linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent)',
          animation: `${shimmerSweep} 3s ease-in-out infinite`,
          pointerEvents: 'none',
        },
        ...sx,
      }}
    >
      {children}</Fab>
  );
};

// Import Box for the icon button
import { Box } from '@mui/material';
