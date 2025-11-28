/**
 * File Handler Service
 * 
 * Handles file opening and association with CleverFerret
 */

export interface FileHandle {
  name: string;
  type: string;
  size: number;
  lastModified: number;
  file: File;
}

export interface FileOpenResult {
  success: boolean;
  file?: FileHandle;
  error?: string;
  route?: string;
}

/**
 * Determine the appropriate route for a file based on its type
 */
export function getRouteForFileType(mimeType: string, fileName: string): string | null {
  const extension = fileName.split('.').pop()?.toLowerCase() || '';
  
  // E-books
  if (mimeType.includes('epub') || extension === 'epub') {
    return '/reader';
  }
  if (mimeType.includes('pdf') || extension === 'pdf') {
    return '/pdf';
  }
  if (['mobi', 'azw', 'azw3'].includes(extension)) {
    return '/reader';
  }
  
  // Comics
  if (['cbr', 'cbz', 'cbt', 'cb7'].includes(extension)) {
    return '/comic';
  }
  
  // Audio
  if (mimeType.startsWith('audio/') || ['mp3', 'm4a', 'm4b', 'flac', 'wav', 'ogg', 'opus', 'wma'].includes(extension)) {
    return '/audio_player';
  }
  
  // Video
  if (mimeType.startsWith('video/') || ['mp4', 'mkv', 'mov', 'avi', 'webm'].includes(extension)) {
    return '/video_player';
  }
  
  // Images
  if (mimeType.startsWith('image/') || ['jpg', 'jpeg', 'png', 'gif'].includes(extension)) {
    return '/open';
  }
  
  // Text documents
  if (mimeType.includes('text/') || ['txt', 'md', 'rtf'].includes(extension)) {
    return '/document';
  }
  
  return '/open';
}

/**
 * Process a file handle and return routing information
 */
export function processFileHandle(file: File): FileOpenResult {
  try {
    const fileHandle: FileHandle = {
      name: file.name,
      type: file.type || 'application/octet-stream',
      size: file.size,
      lastModified: file.lastModified,
      file,
    };
    
    const route = getRouteForFileType(fileHandle.type, fileHandle.name);
    
    return {
      success: true,
      file: fileHandle,
      route: route || '/open',
    };
  } catch (error) {
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error processing file',
    };
  }
}

/**
 * Check if the app was launched with a file
 */
export function checkForFileLaunch(): FileHandle | null {
  // Check URL parameters for file launch
  const urlParams = new URLSearchParams(window.location.search);
  const fileParam = urlParams.get('file');
  
  if (fileParam) {
    // File was passed via URL parameter
    // This would need to be handled by the service worker or launch handler
    return null;
  }

  // Check for File System Access API file launch
  if ('launchQueue' in window && 'files' in (window as any).launchQueue) {
    // File handlers API - handled by service worker
    return null;
  }
  
  return null;
}

/**
 * Store file handle in session storage for retrieval
 */
export function storeFileHandle(fileHandle: FileHandle): void {
  try {
    const fileData = {
      name: fileHandle.name,
      type: fileHandle.type,
      size: fileHandle.size,
      lastModified: fileHandle.lastModified,
    };
    sessionStorage.setItem('pendingFile', JSON.stringify(fileData));
    sessionStorage.setItem('pendingFileBlob', URL.createObjectURL(fileHandle.file));
  } catch (error) {
    console.error('Failed to store file handle:', error);
  }
}

/**
 * Retrieve stored file handle from session storage
 */
export function retrieveFileHandle(): FileHandle | null {
  try {
    const fileDataStr = sessionStorage.getItem('pendingFile');
    const blobUrl = sessionStorage.getItem('pendingFileBlob');
    
    if (!fileDataStr || !blobUrl) {
      return null;
    }
    
    const fileData = JSON.parse(fileDataStr);
    
    // Note: In a real implementation, you'd need to reconstruct the File object
    // For now, we'll return the metadata
    return {
      ...fileData,
      file: null as any, // Would need to be reconstructed from blob
    };
  } catch (error) {
    console.error('Failed to retrieve file handle:', error);
    return null;
  }
}

/**
 * Clear stored file handle
 */
export function clearFileHandle(): void {
  const blobUrl = sessionStorage.getItem('pendingFileBlob');
  if (blobUrl) {
    URL.revokeObjectURL(blobUrl);
  }
  sessionStorage.removeItem('pendingFile');
  sessionStorage.removeItem('pendingFileBlob');
}
