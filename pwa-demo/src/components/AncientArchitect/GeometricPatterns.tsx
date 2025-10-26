// Geometric Patterns for Ancient Architect Theme
// Art Deco inspired patterns, Dwarven geometric decorations
import React from 'react';
import { Box, SxProps, Theme } from '@mui/material';

interface GeometricPatternProps {
  pattern: 'diamond' | 'chevron' | 'hexagon' | 'steps' | 'facets';
  color?: string;
  opacity?: number;
  size?: number;
  sx?: SxProps<Theme>;
}

export const GeometricPattern: React.FC<GeometricPatternProps> = ({
  pattern,
  color = '#CD7F32',
  opacity = 0.1,
  size = 40,
  sx,
}) => {
  const patternSvgs = {
    diamond: (
      <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern id="diamond-pattern" x="0" y="0" width={size} height={size} patternUnits="userSpaceOnUse">
            <path
              d={`M ${size / 2} 0 L ${size} ${size / 2} L ${size / 2} ${size} L 0 ${size / 2} Z`}
              fill="none"
              stroke={color}
              strokeWidth="1"
              opacity={opacity}
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#diamond-pattern)" />
      </svg>
    ),
    chevron: (
      <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern id="chevron-pattern" x="0" y="0" width={size} height={size / 2} patternUnits="userSpaceOnUse">
            <path
              d={`M 0 ${size / 4} L ${size / 2} 0 L ${size} ${size / 4} L ${size / 2} ${size / 2} Z`}
              fill="none"
              stroke={color}
              strokeWidth="2"
              opacity={opacity}
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#chevron-pattern)" />
      </svg>
    ),
    hexagon: (
      <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern id="hexagon-pattern" x="0" y="0" width={size * 1.5} height={size * 1.3} patternUnits="userSpaceOnUse">
            <path
              d={`M ${size / 4} 0 L ${size * 0.75} 0 L ${size} ${size / 2.6} L ${size * 0.75} ${size / 1.3} L ${size / 4} ${size / 1.3} L 0 ${size / 2.6} Z`}
              fill="none"
              stroke={color}
              strokeWidth="1"
              opacity={opacity}
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#hexagon-pattern)" />
      </svg>
    ),
    steps: (
      <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern id="steps-pattern" x="0" y="0" width={size} height={size} patternUnits="userSpaceOnUse">
            <path
              d={`M 0 0 L ${size / 3} 0 L ${size / 3} ${size / 3} L ${size * 2 / 3} ${size / 3} L ${size * 2 / 3} ${size * 2 / 3} L ${size} ${size * 2 / 3} L ${size} ${size}`}
              fill="none"
              stroke={color}
              strokeWidth="2"
              opacity={opacity}
            />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#steps-pattern)" />
      </svg>
    ),
    facets: (
      <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <pattern id="facets-pattern" x="0" y="0" width={size} height={size} patternUnits="userSpaceOnUse">
            <polygon
              points={`${size / 2},0 ${size},${size / 3} ${size},${size * 2 / 3} ${size / 2},${size} 0,${size * 2 / 3} 0,${size / 3}`}
              fill="none"
              stroke={color}
              strokeWidth="1"
              opacity={opacity}
            />
            <line x1={size / 2} y1="0" x2={size / 2} y2={size} stroke={color} strokeWidth="1" opacity={opacity * 0.5} />
            <line x1="0" y1={size / 2} x2={size} y2={size / 2} stroke={color} strokeWidth="1" opacity={opacity * 0.5} />
          </pattern>
        </defs>
        <rect width="100%" height="100%" fill="url(#facets-pattern)" />
      </svg>
    ),
  };

  return (
    <Box
      sx={{
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        pointerEvents: 'none',
        zIndex: 0,
        ...sx,
      }}
    >
      {patternSvgs[pattern]}
    </Box>
  );
};

// Corner Decorations for Cards and Containers
interface CornerDecorationProps {
  size?: number;
  color?: string;
  style?: 'art-deco' | 'dwarven' | 'tech' | 'minimal';
  sx?: SxProps<Theme>;
}

export const CornerDecorations: React.FC<CornerDecorationProps> = ({
  size = 24,
  color = '#CD7F32',
  style = 'art-deco',
  sx,
}) => {
  const decorationSvgs = {
    'art-deco': (
      <>
        {/* Top Left */}
        <svg
          style={{ position: 'absolute', top: -2, left: -2, width: size, height: size }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path
            d="M0 0 L24 0 L18 6 L12 3 L6 6 L0 12 L0 0 Z"
            fill={color}
            opacity="0.6"
            stroke={color}
            strokeWidth="1"
          />
          <line x1="0" y1="6" x2="6" y2="6" stroke={color} strokeWidth="1" opacity="0.8" />
        </svg>
        {/* Top Right */}
        <svg
          style={{ position: 'absolute', top: -2, right: -2, width: size, height: size, transform: 'scaleX(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path
            d="M0 0 L24 0 L18 6 L12 3 L6 6 L0 12 L0 0 Z"
            fill={color}
            opacity="0.6"
            stroke={color}
            strokeWidth="1"
          />
          <line x1="0" y1="6" x2="6" y2="6" stroke={color} strokeWidth="1" opacity="0.8" />
        </svg>
        {/* Bottom Left */}
        <svg
          style={{ position: 'absolute', bottom: -2, left: -2, width: size, height: size, transform: 'scaleY(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path
            d="M0 0 L24 0 L18 6 L12 3 L6 6 L0 12 L0 0 Z"
            fill={color}
            opacity="0.6"
            stroke={color}
            strokeWidth="1"
          />
          <line x1="0" y1="6" x2="6" y2="6" stroke={color} strokeWidth="1" opacity="0.8" />
        </svg>
        {/* Bottom Right */}
        <svg
          style={{ position: 'absolute', bottom: -2, right: -2, width: size, height: size, transform: 'scale(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path
            d="M0 0 L24 0 L18 6 L12 3 L6 6 L0 12 L0 0 Z"
            fill={color}
            opacity="0.6"
            stroke={color}
            strokeWidth="1"
          />
          <line x1="0" y1="6" x2="6" y2="6" stroke={color} strokeWidth="1" opacity="0.8" />
        </svg>
      </>
    ),
    dwarven: (
      <>
        {/* Top Left */}
        <svg
          style={{ position: 'absolute', top: -2, left: -2, width: size, height: size }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <rect x="0" y="0" width="8" height="8" fill={color} opacity="0.6" />
          <rect x="0" y="8" width="6" height="6" fill={color} opacity="0.4" />
          <rect x="8" y="0" width="6" height="6" fill={color} opacity="0.4" />
          <circle cx="4" cy="4" r="2" fill={color} opacity="0.8" />
        </svg>
        {/* Top Right */}
        <svg
          style={{ position: 'absolute', top: -2, right: -2, width: size, height: size, transform: 'scaleX(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <rect x="0" y="0" width="8" height="8" fill={color} opacity="0.6" />
          <rect x="0" y="8" width="6" height="6" fill={color} opacity="0.4" />
          <rect x="8" y="0" width="6" height="6" fill={color} opacity="0.4" />
          <circle cx="4" cy="4" r="2" fill={color} opacity="0.8" />
        </svg>
        {/* Bottom Left */}
        <svg
          style={{ position: 'absolute', bottom: -2, left: -2, width: size, height: size, transform: 'scaleY(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <rect x="0" y="0" width="8" height="8" fill={color} opacity="0.6" />
          <rect x="0" y="8" width="6" height="6" fill={color} opacity="0.4" />
          <rect x="8" y="0" width="6" height="6" fill={color} opacity="0.4" />
          <circle cx="4" cy="4" r="2" fill={color} opacity="0.8" />
        </svg>
        {/* Bottom Right */}
        <svg
          style={{ position: 'absolute', bottom: -2, right: -2, width: size, height: size, transform: 'scale(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <rect x="0" y="0" width="8" height="8" fill={color} opacity="0.6" />
          <rect x="0" y="8" width="6" height="6" fill={color} opacity="0.4" />
          <rect x="8" y="0" width="6" height="6" fill={color} opacity="0.4" />
          <circle cx="4" cy="4" r="2" fill={color} opacity="0.8" />
        </svg>
      </>
    ),
    tech: (
      <>
        {/* Top Left */}
        <svg
          style={{ position: 'absolute', top: -2, left: -2, width: size, height: size }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path d="M0 0 L12 0 L0 12 Z" fill={color} opacity="0.4" />
          <circle cx="6" cy="6" r="3" fill="none" stroke={color} strokeWidth="1" opacity="0.8" />
          <circle cx="6" cy="6" r="1.5" fill={color} opacity="0.6" />
        </svg>
        {/* Top Right */}
        <svg
          style={{ position: 'absolute', top: -2, right: -2, width: size, height: size, transform: 'scaleX(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path d="M0 0 L12 0 L0 12 Z" fill={color} opacity="0.4" />
          <circle cx="6" cy="6" r="3" fill="none" stroke={color} strokeWidth="1" opacity="0.8" />
          <circle cx="6" cy="6" r="1.5" fill={color} opacity="0.6" />
        </svg>
        {/* Bottom Left */}
        <svg
          style={{ position: 'absolute', bottom: -2, left: -2, width: size, height: size, transform: 'scaleY(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path d="M0 0 L12 0 L0 12 Z" fill={color} opacity="0.4" />
          <circle cx="6" cy="6" r="3" fill="none" stroke={color} strokeWidth="1" opacity="0.8" />
          <circle cx="6" cy="6" r="1.5" fill={color} opacity="0.6" />
        </svg>
        {/* Bottom Right */}
        <svg
          style={{ position: 'absolute', bottom: -2, right: -2, width: size, height: size, transform: 'scale(-1)' }}
          viewBox="0 0 24 24"
          fill="none"
        >
          <path d="M0 0 L12 0 L0 12 Z" fill={color} opacity="0.4" />
          <circle cx="6" cy="6" r="3" fill="none" stroke={color} strokeWidth="1" opacity="0.8" />
          <circle cx="6" cy="6" r="1.5" fill={color} opacity="0.6" />
        </svg>
      </>
    ),
    minimal: (
      <>
        {/* Top Left */}
        <Box
          sx={{
            position: 'absolute',
            top: -1,
            left: -1,
            width: size / 2,
            height: size / 2,
            borderTop: `2px solid ${color}`,
            borderLeft: `2px solid ${color}`,
            opacity: 0.6,
          }}
        />
        {/* Top Right */}
        <Box
          sx={{
            position: 'absolute',
            top: -1,
            right: -1,
            width: size / 2,
            height: size / 2,
            borderTop: `2px solid ${color}`,
            borderRight: `2px solid ${color}`,
            opacity: 0.6,
          }}
        />
        {/* Bottom Left */}
        <Box
          sx={{
            position: 'absolute',
            bottom: -1,
            left: -1,
            width: size / 2,
            height: size / 2,
            borderBottom: `2px solid ${color}`,
            borderLeft: `2px solid ${color}`,
            opacity: 0.6,
          }}
        />
        {/* Bottom Right */}
        <Box
          sx={{
            position: 'absolute',
            bottom: -1,
            right: -1,
            width: size / 2,
            height: size / 2,
            borderBottom: `2px solid ${color}`,
            borderRight: `2px solid ${color}`,
            opacity: 0.6,
          }}
        />
      </>
    ),
  };

  return (
    <Box
      sx={{
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        pointerEvents: 'none',
        zIndex: 1,
        ...sx,
      }}
    >
      {decorationSvgs[style]}
    </Box>
  );
};

// Divider with geometric pattern
interface GeometricDividerProps {
  color?: string;
  height?: number;
  style?: 'chevron' | 'diamond' | 'steps' | 'simple';
  sx?: SxProps<Theme>;
}

export const GeometricDivider: React.FC<GeometricDividerProps> = ({
  color = '#CD7F32',
  height = 4,
  style = 'chevron',
  sx,
}) => {
  const dividerSvgs = {
    chevron: (
      <svg width="100%" height={height} xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
        <pattern id="chevron-divider" x="0" y="0" width="20" height={height} patternUnits="userSpaceOnUse">
          <path d={`M 0 ${height / 2} L 10 0 L 20 ${height / 2} L 10 ${height} Z`} fill={color} opacity="0.6" />
        </pattern>
        <rect width="100%" height={height} fill="url(#chevron-divider)" />
      </svg>
    ),
    diamond: (
      <svg width="100%" height={height} xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
        <pattern id="diamond-divider" x="0" y="0" width="20" height={height} patternUnits="userSpaceOnUse">
          <path d={`M 10 0 L 20 ${height / 2} L 10 ${height} L 0 ${height / 2} Z`} fill={color} opacity="0.6" />
        </pattern>
        <rect width="100%" height={height} fill="url(#diamond-divider)" />
      </svg>
    ),
    steps: (
      <svg width="100%" height={height} xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
        <pattern id="steps-divider" x="0" y="0" width="30" height={height} patternUnits="userSpaceOnUse">
          <rect x="0" y="0" width="8" height={height / 3} fill={color} opacity="0.8" />
          <rect x="10" y={height / 3} width="8" height={height / 3} fill={color} opacity="0.6" />
          <rect x="20" y={(height * 2) / 3} width="8" height={height / 3} fill={color} opacity="0.4" />
        </pattern>
        <rect width="100%" height={height} fill="url(#steps-divider)" />
      </svg>
    ),
    simple: (
      <Box
        sx={{
          width: '100%',
          height: height,
          background: `linear-gradient(90deg, transparent, ${color} 50%, transparent)`,
          opacity: 0.6,
        }}
      />
    ),
  };

  return (
    <Box
      sx={{
        width: '100%',
        height,
        my: 2,
        ...sx,
      }}
    >
      {dividerSvgs[style]}
    </Box>
  );
};
