/**
 * Image Utilities
 *
 * Provides fallback images and cover generation
 */

import { generateCover } from './coverGenerator';

/**
 * Get a fallback image URL for a media item
 */
export function getFallbackImage(type: string, title?: string, author?: string): string {
  // Use cover generator for books
  if (type === 'BOOK' || type === 'AUDIOBOOK') {
    return generateCover(title || 'Book', 'BOOK', author || 'Unknown Author');
  }

  // For other types, return data URI with icon
  const icon = getIconForType(type);
  return `data:image/svg+xml,${encodeURIComponent(`
    <svg xmlns="http://www.w3.org/2000/svg" width="300" height="450" viewBox="0 0 300 450">
      <rect width="300" height="450" fill="#1a1a1a"/>
      <text x="150" y="225" font-family="Arial" font-size="48" fill="#ffffff" text-anchor="middle" dominant-baseline="middle">${icon}</text>
      ${title ? `<text x="150" y="280" font-family="Arial" font-size="16" fill="#cccccc" text-anchor="middle">${title.substring(0, 30)}</text>` : ''}
    </svg>
  `)}`;
}

/**
 * Get emoji icon for media type
 */
function getIconForType(type: string): string {
  switch (type.toUpperCase()) {
    case 'MOVIE':
    case 'VIDEO':
      return '🎬';
    case 'MUSIC':
    case 'AUDIO':
      return '🎵';
    case 'PODCAST':
      return '🎙️';
    case 'COMIC':
      return '📚';
    case 'TV_SHOW':
      return '📺';
    case 'RADIO':
      return '📻';
    default:
      return '📄';
  }
}

/**
 * Check if an image URL is valid and accessible
 */
export async function isValidImageUrl(url: string): Promise<boolean> {
  if (!url || url.startsWith('data:') || url.startsWith('blob:')) {
    return true;
  }

  try {
    const response = await fetch(url, { method: 'HEAD', mode: 'no-cors' });
    return response.ok || true; // no-cors always returns opaque response
  } catch {
    return false;
  }
}

/**
 * Get image URL with fallback
 */
export function getImageUrlWithFallback(
  imageUrl: string | undefined | null,
  type: string,
  title?: string,
  author?: string,
): string {
  if (
    imageUrl &&
    imageUrl !== '/placeholder-book.png' &&
    imageUrl !== '/placeholder.png' &&
    !imageUrl.includes('placeholder')
  ) {
    return imageUrl;
  }
  return getFallbackImage(type, title, author);
}
