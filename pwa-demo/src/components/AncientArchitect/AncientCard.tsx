// Ancient Architect Card Components
// Enhanced cards with geometric patterns, metallic borders, and corner decorations
import React from 'react';
import { Card, CardProps, Box, keyframes } from '@mui/material';
import { GeometricPattern, CornerDecorations } from './GeometricPatterns';

interface AncientCardProps extends Omit<CardProps, 'ref'> {
  showPattern?: boolean;
  patternType?: 'diamond' | 'chevron' | 'hexagon' | 'steps' | 'facets';
  showCorners?: boolean;
  cornerStyle?: 'art-deco' | 'dwarven' | 'tech' | 'minimal';
  glowOnHover?: boolean;
  glowColor?: string;
  metallic?: boolean;
  elevated?: boolean;
}

// Shimmer animation for metallic effect
const shimmer = keyframes`
  0% {
    transform: translateX(-100%) rotate(45deg);
  }
  100% {
    transform: translateX(200%) rotate(45deg);
  }
}`;

export const AncientCard: React.FC<AncientCardProps> = ({
  showPattern = true,
  patternType = 'diamond',
  showCorners = true,
  cornerStyle = 'art-deco',
  glowOnHover = true,
  glowColor = '#00CED1',
  metallic = true,
  elevated = false,
  children,
  sx,
  ...props
}) => {
  return (
    <Card
      {...props}
      sx={{
        position: 'relative',
        overflow: 'hidden',
        backgroundColor: elevated ? '#3F4451' : '#2D3139',
        backgroundImage: elevated
          ? 'linear-gradient(135deg, #3F4451 0%, #52575F 100%)'
          : 'linear-gradient(135deg, #2D3139 0%, #3F4451 100%)',
        border: '2px solid #CD7F32',
        borderRadius: 0,
        clipPath: 'polygon(12px 0, 100% 0, 100% calc(100% - 12px), calc(100% - 12px) 100%, 0 100%, 0 12px)',
        boxShadow: elevated
          ? '0 12px 24px rgba(11, 18, 21, 0.6), inset 0 2px 0 rgba(205, 127, 50, 0.3)'
          : '0 8px 16px rgba(11, 18, 21, 0.4), inset 0 1px 0 rgba(205, 127, 50, 0.3)',
        transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)',
        '&:hover': glowOnHover
          ? {
              transform: 'translateY(-4px) scale(1.01)',
              borderColor: glowColor,
              boxShadow: `
              0 16px 32px rgba(11, 18, 21, 0.7),
              0 0 40px ${glowColor}30,
              inset 0 2px 0 ${glowColor}50
            `,
            }
          : undefined,
        ...(metallic && {
          '&::after': {
            content: '""',
            position: 'absolute',
            top: 0,
            left: '-100%',
            width: '50%',
            height: '100%',
            background: 'linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.15), transparent)',
            animation: `${shimmer} 3s infinite`,
            pointerEvents: 'none',
          },
        }),
        ...sx,
      }}
    >
      {showPattern && <GeometricPattern pattern={patternType} color="#CD7F32" opacity={0.08} />}
      {showCorners && <CornerDecorations style={cornerStyle} color="#CD7F32" />}
      <Box sx={{ position: 'relative', zIndex: 2 }}>{children}</Box>
    </Card>
  );
};

// Specialized variant for media items
export const MediaCard: React.FC<AncientCardProps> = (props) => {
  return (
    <AncientCard
      patternType="hexagon"
      cornerStyle="tech"
      glowColor="#00CED1"
      elevated={false}
      {...props}
    />
  );
};

// Specialized variant for settings/info
export const InfoCard: React.FC<AncientCardProps> = (props) => {
  return (
    <AncientCard
      patternType="diamond"
      cornerStyle="minimal"
      glowColor="#FFB347"
      elevated={true}
      {...props}
    />
  );
};

// Specialized variant for alerts/important content
export const AlertCard: React.FC<AncientCardProps & { severity?: 'success' | 'error' | 'warning' | 'info' }> = ({
  severity = 'info',
  ...props
}) => {
  const severityColors = {
    success: '#50C878',
    error: '#E0115F',
    warning: '#FFB347',
    info: '#00CED1',
  };

  return (
    <AncientCard
      patternType="steps"
      cornerStyle="art-deco"
      glowColor={severityColors[severity]}
      elevated={true}
      sx={{
        borderColor: severityColors[severity],
        backgroundColor: `${severityColors[severity]}15`,
        ...props.sx,
      }}
      {...props}
    />
  );
};

// Compact card for list views
export const CompactCard: React.FC<AncientCardProps> = (props) => {
  return (
    <AncientCard
      showPattern={false}
      showCorners={false}
      metallic={false}
      glowOnHover={true}
      sx={{
        clipPath: 'polygon(6px 0, 100% 0, 100% calc(100% - 6px), calc(100% - 6px) 100%, 0 100%, 0 6px)',
        ...props.sx,
      }}
      {...props}
    />
  );
};
