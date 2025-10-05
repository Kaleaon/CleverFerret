// Cover art generator - creates beautiful SVG covers instead of placeholder images
export interface CoverOptions {
  title: string;
  author?: string;
  mediaType: 'BOOK' | 'MOVIE' | 'MUSIC' | 'PODCAST' | 'MAGAZINE' | 'DOCUMENT';
  colorScheme?: number; // 0-5 for different color schemes
  width?: number;
  height?: number;
}

const colorSchemes = [
  { bg1: '#4A90E2', bg2: '#357ABD', text: '#FFFFFF', accent: '#FFD700' }, // Blue
  { bg1: '#F5A623', bg2: '#D68910', text: '#FFFFFF', accent: '#FFF8DC' }, // Orange
  { bg1: '#7ED321', bg2: '#5FA016', text: '#FFFFFF', accent: '#FFFFE0' }, // Green
  { bg1: '#D0021B', bg2: '#A00115', text: '#FFFFFF', accent: '#FFB6C1' }, // Red
  { bg1: '#9013FE', bg2: '#7010CA', text: '#FFFFFF', accent: '#E6E6FA' }, // Purple
  { bg1: '#50E3C2', bg2: '#3DB89E', text: '#1A1A1A', accent: '#F0FFFF' }, // Cyan
];

const mediaTypeIcons = {
  BOOK: '📚',
  MOVIE: '🎬',
  MUSIC: '🎵',
  PODCAST: '🎙️',
  MAGAZINE: '📰',
  DOCUMENT: '📄',
};

const mediaTypePatterns = {
  BOOK: `
    <pattern id="book-pattern" x="0" y="0" width="40" height="40" patternUnits="userSpaceOnUse">
      <rect x="0" y="0" width="40" height="40" fill="none" opacity="0.05"/>
      <path d="M5 10 L15 10 L15 30 L5 30 Z" fill="white" opacity="0.03"/>
      <path d="M25 10 L35 10 L35 30 L25 30 Z" fill="white" opacity="0.03"/>
    </pattern>
  `,
  MOVIE: `
    <pattern id="movie-pattern" x="0" y="0" width="50" height="50" patternUnits="userSpaceOnUse">
      <rect x="5" y="20" width="40" height="10" fill="white" opacity="0.03"/>
      <circle cx="15" cy="25" r="8" fill="white" opacity="0.04"/>
      <circle cx="35" cy="25" r="8" fill="white" opacity="0.04"/>
    </pattern>
  `,
  MUSIC: `
    <pattern id="music-pattern" x="0" y="0" width="60" height="60" patternUnits="userSpaceOnUse">
      <path d="M20 10 Q30 15 20 25 Q10 15 20 10 Z" fill="white" opacity="0.03"/>
      <circle cx="20" cy="30" r="5" fill="white" opacity="0.04"/>
      <path d="M40 15 Q50 20 40 30 Q30 20 40 15 Z" fill="white" opacity="0.03"/>
    </pattern>
  `,
  PODCAST: `
    <pattern id="podcast-pattern" x="0" y="0" width="50" height="50" patternUnits="userSpaceOnUse">
      <path d="M25 10 Q25 15 20 20 Q15 25 15 30" stroke="white" stroke-width="2" fill="none" opacity="0.03"/>
      <path d="M25 10 Q25 15 30 20 Q35 25 35 30" stroke="white" stroke-width="2" fill="none" opacity="0.03"/>
      <circle cx="25" cy="35" r="5" fill="white" opacity="0.04"/>
    </pattern>
  `,
  MAGAZINE: `
    <pattern id="magazine-pattern" x="0" y="0" width="60" height="80" patternUnits="userSpaceOnUse">
      <rect x="10" y="10" width="40" height="3" fill="white" opacity="0.03"/>
      <rect x="10" y="20" width="35" height="2" fill="white" opacity="0.02"/>
      <rect x="10" y="30" width="30" height="2" fill="white" opacity="0.02"/>
      <rect x="10" y="50" width="40" height="20" fill="white" opacity="0.02"/>
    </pattern>
  `,
  DOCUMENT: `
    <pattern id="document-pattern" x="0" y="0" width="40" height="60" patternUnits="userSpaceOnUse">
      <rect x="10" y="10" width="20" height="2" fill="white" opacity="0.03"/>
      <rect x="10" y="17" width="20" height="2" fill="white" opacity="0.03"/>
      <rect x="10" y="24" width="15" height="2" fill="white" opacity="0.03"/>
      <rect x="10" y="35" width="20" height="2" fill="white" opacity="0.02"/>
      <rect x="10" y="42" width="18" height="2" fill="white" opacity="0.02"/>
    </pattern>
  `,
};

export function generateCoverDataURL(options: CoverOptions): string {
  const {
    title,
    author,
    mediaType,
    colorScheme = 0,
    width = 300,
    height = 450,
  } = options;

  const scheme = colorSchemes[colorScheme % colorSchemes.length];
  const icon = mediaTypeIcons[mediaType];
  const pattern = mediaTypePatterns[mediaType];

  // Create nice title truncation
  const maxTitleLength = 40;
  const displayTitle = title.length > maxTitleLength 
    ? title.substring(0, maxTitleLength - 3) + '...' 
    : title;

  const maxAuthorLength = 30;
  const displayAuthor = author && author.length > maxAuthorLength
    ? author.substring(0, maxAuthorLength - 3) + '...'
    : author || '';

  const svg = `
    <svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}">
      <defs>
        <linearGradient id="bg-gradient" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" style="stop-color:${scheme.bg1};stop-opacity:1" />
          <stop offset="100%" style="stop-color:${scheme.bg2};stop-opacity:1" />
        </linearGradient>
        ${pattern}
      </defs>
      
      <!-- Background -->
      <rect width="${width}" height="${height}" fill="url(#bg-gradient)"/>
      <rect width="${width}" height="${height}" fill="url(#${mediaType.toLowerCase()}-pattern)"/>
      
      <!-- Decorative elements -->
      <rect x="0" y="0" width="${width}" height="4" fill="${scheme.accent}" opacity="0.3"/>
      <rect x="0" y="${height - 4}" width="${width}" height="4" fill="${scheme.accent}" opacity="0.3"/>
      
      <!-- Icon/Emoji at top -->
      <text x="${width / 2}" y="100" font-size="60" text-anchor="middle" opacity="0.8">
        ${icon}
      </text>
      
      <!-- Title -->
      <text 
        x="${width / 2}" 
        y="${height / 2}" 
        font-family="system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif" 
        font-size="24" 
        font-weight="600" 
        fill="${scheme.text}" 
        text-anchor="middle"
        opacity="0.95"
      >
        ${escapeXml(displayTitle)}
      </text>
      
      <!-- Author (if provided) -->
      ${
        displayAuthor
          ? `<text 
          x="${width / 2}" 
          y="${height / 2 + 40}" 
          font-family="system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif" 
          font-size="16" 
          fill="${scheme.text}" 
          text-anchor="middle"
          opacity="0.7"
        >
          ${escapeXml(displayAuthor)}
        </text>`
          : ''
      }
      
      <!-- Media type label -->
      <text 
        x="${width / 2}" 
        y="${height - 30}" 
        font-family="system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif" 
        font-size="12" 
        font-weight="500"
        fill="${scheme.accent}" 
        text-anchor="middle"
        opacity="0.9"
        letter-spacing="2"
      >
        ${mediaType}
      </text>
      
      <!-- Border -->
      <rect 
        x="2" 
        y="2" 
        width="${width - 4}" 
        height="${height - 4}" 
        fill="none" 
        stroke="${scheme.accent}" 
        stroke-width="2" 
        opacity="0.3"
      />
    </svg>
  `;

  // Convert SVG to data URL
  const encoded = btoa(unescape(encodeURIComponent(svg)));
  return `data:image/svg+xml;base64,${encoded}`;
}

function escapeXml(unsafe: string): string {
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

// Generate a deterministic color scheme based on string hash
export function hashStringToColorScheme(str: string): number {
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
    hash = str.charCodeAt(i) + ((hash << 5) - hash);
  }
  return Math.abs(hash) % colorSchemes.length;
}

// Convenience function to generate cover from minimal info
export function generateCover(
  title: string,
  mediaType: CoverOptions['mediaType'],
  author?: string
): string {
  return generateCoverDataURL({
    title,
    author,
    mediaType,
    colorScheme: hashStringToColorScheme(title),
  });
}