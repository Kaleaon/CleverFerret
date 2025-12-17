/**
 * Google Books API Service
 * Handles API calls with proper error handling and quota management
 */

export interface GoogleBooksResponse {
  items?: Array<{
    id: string;
    volumeInfo: {
      title: string;
      authors?: string[];
      description?: string;
      imageLinks?: {
        thumbnail?: string;
        smallThumbnail?: string;
      };
      publishedDate?: string;
      publisher?: string;
      pageCount?: number;
      categories?: string[];
      averageRating?: number;
      ratingsCount?: number;
    };
  }>;
  totalItems?: number;
  error?: string;
}

/**
 * Fetch books from Google Books API
 * @param query - Search query string
 * @param maxResults - Maximum number of results (default: 40)
 * @returns Promise with books data or error
 */
export const fetchGoogleBooks = async (
  query: string,
  maxResults: number = 40
): Promise<GoogleBooksResponse> => {
  try {
    // Get API key from environment (optional but recommended)
    const apiKey = import.meta.env.VITE_GOOGLE_BOOKS_API_KEY;
    
    // Build URL with optional API key
    const params = new URLSearchParams({
      q: query,
      maxResults: maxResults.toString(),
      printType: 'books',
    });
    
    if (apiKey) {
      params.append('key', apiKey);
    }
    
    const url = `https://www.googleapis.com/books/v1/volumes?${params.toString()}`;
    
    const response = await fetch(url);
    
    // Handle quota exceeded (403)
    if (response.status === 403) {
      console.warn('Google Books API quota exceeded or access denied');
      return {
        items: [],
        totalItems: 0,
        error: 'QUOTA_EXCEEDED',
      };
    }
    
    // Handle rate limiting (429)
    if (response.status === 429) {
      console.warn('Google Books API rate limit exceeded');
      return {
        items: [],
        totalItems: 0,
        error: 'RATE_LIMITED',
      };
    }
    
    // Handle other errors
    if (!response.ok) {
      console.error(`Google Books API error: ${response.status} ${response.statusText}`);
      return {
        items: [],
        totalItems: 0,
        error: 'API_ERROR',
      };
    }
    
    const data = await response.json();
    return data;
    
  } catch (error) {
    console.error('Error fetching from Google Books API:', error);
    return {
      items: [],
      totalItems: 0,
      error: 'NETWORK_ERROR',
    };
  }
};

/**
 * Get error message for display
 * @param errorCode - Error code from API response
 * @returns User-friendly error message
 */
export const getErrorMessage = (errorCode?: string): string => {
  switch (errorCode) {
    case 'QUOTA_EXCEEDED':
      return 'API quota exceeded. Please try again later or add an API key.';
    case 'RATE_LIMITED':
      return 'Too many requests. Please wait a moment and try again.';
    case 'API_ERROR':
      return 'Unable to fetch books. Please try again.';
    case 'NETWORK_ERROR':
      return 'Network error. Please check your connection.';
    default:
      return 'An unexpected error occurred.';
  }
};

/**
 * Fetch book details by ID
 * @param bookId - Google Books volume ID
 * @returns Promise with book details or error
 */
export const fetchBookDetails = async (bookId: string): Promise<GoogleBooksResponse> => {
  try {
    const apiKey = import.meta.env.VITE_GOOGLE_BOOKS_API_KEY;
    const url = `https://www.googleapis.com/books/v1/volumes/${bookId}${apiKey ? `?key=${apiKey}` : ''}`;
    
    const response = await fetch(url);
    
    if (!response.ok) {
      console.error(`Google Books API error: ${response.status} ${response.statusText}`);
      return { error: 'API_ERROR' };
    }
    
    const data = await response.json();
    return { items: [data] };
    
  } catch (error) {
    console.error('Error fetching book details:', error);
    return { error: 'NETWORK_ERROR' };
  }
};