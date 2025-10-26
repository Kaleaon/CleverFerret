// Ancient Architect Animation Components
// Metallic shimmer, energy pulses, crystal glows
import React from 'react';
import { Box, SxProps, Theme, keyframes } from '@mui/material';

// Animation keyframes
const metallicShimmer = keyframes`
  0% {
    transform: translateX(-100%) rotate(25deg);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateX(300%) rotate(25deg);
    opacity: 0;
  }
`;

const energyPulse = keyframes`
  0%, 100% {
    opacity: 0.6;
    transform: scale(1);
  }
  50% {
    opacity: 1;
    transform: scale(1.05);
  }
`;

const crystalGlow = keyframes`
  0%, 100% {
    box-shadow: 0 0 20px currentColor, 0 0 40px currentColor, inset 0 0 20px currentColor;
    filter: brightness(1);
  }
  50% {
    box-shadow: 0 0 40px currentColor, 0 0 80px currentColor, inset 0 0 40px currentColor;
    filter: brightness(1.3);
  }
`;

const radialPulse = keyframes`
  0% {
    transform: scale(0.95);
    opacity: 0.8;
  }
  50% {
    transform: scale(1.05);
    opacity: 1;
  }
  100% {
    transform: scale(0.95);
    opacity: 0.8;
  }
`;

const rotateGlow = keyframes`
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
`;

// Metallic Shimmer Effect
interface MetallicShimmerProps {
  duration?: number;
  color?: string;
  intensity?: number;
  sx?: SxProps<Theme>;
}

export const MetallicShimmer: React.FC<MetallicShimmerProps> = ({
  duration = 3,
  color = 'rgba(255, 255, 255, 0.3)',
  intensity = 1,
  sx,
}) => {
  return (
    <Box
      sx={{
        position: 'absolute',
        top: 0,
        left: '-50%',
        width: '50%',
        height: '100%',
        background: `linear-gradient(90deg, transparent, ${color}, transparent)`,
        opacity: intensity,
        animation: `${metallicShimmer} ${duration}s ease-in-out infinite`,
        pointerEvents: 'none',
        zIndex: 10,
        ...sx,
      }}
    />
  );
};

// Energy Pulse Effect
interface EnergyPulseProps {
  duration?: number;
  color?: string;
  sx?: SxProps<Theme>;
  children?: React.ReactNode;
}

export const EnergyPulse: React.FC<EnergyPulseProps> = ({ duration = 2, color = '#00CED1', sx, children }) => {
  return (
    <Box
      sx={{
        position: 'relative',
        animation: `${energyPulse} ${duration}s ease-in-out infinite`,
        '&::before': {
          content: '""',
          position: 'absolute',
          top: -2,
          left: -2,
          right: -2,
          bottom: -2,
          border: `2px solid ${color}`,
          borderRadius: 'inherit',
          opacity: 0.5,
          animation: `${radialPulse} ${duration}s ease-in-out infinite`,
          pointerEvents: 'none',
        },
        ...sx,
      }}
    >
      {children}
    </Box>
  );
};

// Crystal Glow Effect
interface CrystalGlowProps {
  duration?: number;
  color?: string;
  intensity?: 'low' | 'medium' | 'high';
  sx?: SxProps<Theme>;
  children?: React.ReactNode;
}

export const CrystalGlow: React.FC<CrystalGlowProps> = ({
  duration = 2,
  color = '#00CED1',
  intensity = 'medium',
  sx,
  children,
}) => {
  const intensityValues = {
    low: { shadowSize: 10, blur: 20 },
    medium: { shadowSize: 20, blur: 40 },
    high: { shadowSize: 40, blur: 80 },
  };

  const { shadowSize, blur } = intensityValues[intensity];

  return (
    <Box
      sx={{
        color,
        animation: `${crystalGlow} ${duration}s ease-in-out infinite`,
        boxShadow: `
          0 0 ${shadowSize}px ${color},
          0 0 ${blur}px ${color},
          inset 0 0 ${shadowSize}px ${color}
        `,
        ...sx,
      }}
    >
      {children}
    </Box>
  );
};

// Rotating Glow Ring (for icons and decorative elements)
interface RotatingGlowRingProps {
  size?: number;
  duration?: number;
  color?: string;
  thickness?: number;
  sx?: SxProps<Theme>;
}

export const RotatingGlowRing: React.FC<RotatingGlowRingProps> = ({
  size = 100,
  duration = 4,
  color = '#00CED1',
  thickness = 2,
  sx,
}) => {
  return (
    <Box
      sx={{
        position: 'absolute',
        top: '50%',
        left: '50%',
        width: size,
        height: size,
        marginTop: -size / 2,
        marginLeft: -size / 2,
        borderRadius: '50%',
        border: `${thickness}px solid transparent`,
        borderTopColor: color,
        borderRightColor: color,
        animation: `${rotateGlow} ${duration}s linear infinite`,
        boxShadow: `0 0 20px ${color}`,
        pointerEvents: 'none',
        zIndex: 1,
        ...sx,
      }}
    />
  );
};

// Hovering Particle Effect
interface HoveringParticleProps {
  count?: number;
  color?: string;
  size?: number;
  speed?: number;
  sx?: SxProps<Theme>;
}

export const HoveringParticles: React.FC<HoveringParticleProps> = ({
  count = 20,
  color = '#CD7F32',
  size = 2,
  speed = 3,
  sx,
}) => {
  const float = keyframes`
    0%, 100% {
      transform: translateY(0) translateX(0);
      opacity: 0.3;
    }
    50% {
      transform: translateY(-20px) translateX(10px);
      opacity: 0.8;
    }
  `;

  return (
    <Box
      sx={{
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        overflow: 'hidden',
        pointerEvents: 'none',
        zIndex: 0,
        ...sx,
      }}
    >
      {Array.from({ length: count }).map((_, i) => (
        <Box
          key={i}
          sx={{
            position: 'absolute',
            left: `${Math.random() * 100}%`,
            top: `${Math.random() * 100}%`,
            width: size,
            height: size,
            backgroundColor: color,
            borderRadius: '50%',
            opacity: 0.3,
            animation: `${float} ${speed + Math.random() * 2}s ease-in-out infinite`,
            animationDelay: `${Math.random() * 2}s`,
            boxShadow: `0 0 ${size * 2}px ${color}`,
          }}
        />
      ))}
    </Box>
  );
};

// Scanning Line Effect
interface ScanningLineProps {
  duration?: number;
  color?: string;
  height?: number;
  sx?: SxProps<Theme>;
}

export const ScanningLine: React.FC<ScanningLineProps> = ({ duration = 3, color = '#00CED1', height = 2, sx }) => {
  const scan = keyframes`
    0% {
      top: 0;
      opacity: 0;
    }
    50% {
      opacity: 1;
    }
    100% {
      top: 100%;
      opacity: 0;
    }
  `;

  return (
    <Box
      sx={{
        position: 'absolute',
        left: 0,
        right: 0,
        height,
        background: `linear-gradient(90deg, transparent, ${color}, transparent)`,
        boxShadow: `0 0 20px ${color}`,
        animation: `${scan} ${duration}s ease-in-out infinite`,
        pointerEvents: 'none',
        zIndex: 10,
        ...sx,
      }}
    />
  );
};

// Corner Accent Glow
interface CornerAccentGlowProps {
  size?: number;
  color?: string;
  corner?: 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right' | 'all';
  sx?: SxProps<Theme>;
}

export const CornerAccentGlow: React.FC<CornerAccentGlowProps> = ({ size = 40, color = '#00CED1', corner = 'all', sx }) => {
  const cornerPositions = {
    'top-left': [{ top: 0, left: 0 }],
    'top-right': [{ top: 0, right: 0 }],
    'bottom-left': [{ bottom: 0, left: 0 }],
    'bottom-right': [{ bottom: 0, right: 0 }],
    all: [
      { top: 0, left: 0 },
      { top: 0, right: 0 },
      { bottom: 0, left: 0 },
      { bottom: 0, right: 0 },
    ],
  };

  return (
    <>
      {cornerPositions[corner].map((position, index) => (
        <Box
          key={index}
          sx={{
            position: 'absolute',
            width: size,
            height: size,
            background: `radial-gradient(circle at ${position.top !== undefined ? 'top' : 'bottom'} ${position.left !== undefined ? 'left' : 'right'}, ${color}40, transparent 70%)`,
            animation: `${energyPulse} 2s ease-in-out infinite`,
            animationDelay: `${index * 0.5}s`,
            pointerEvents: 'none',
            zIndex: 1,
            ...position,
            ...sx,
          }}
        />
      ))}
    </>
  );
};
