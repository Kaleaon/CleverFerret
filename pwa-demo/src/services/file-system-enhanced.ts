// Enhanced File System Service with full Android parity
// Provides advanced file system access using modern Web APIs

import { MediaItem, MediaType } from '../types-enhanced';
import enhancedDB from './database-enhanced';

// File System Access API declarations
declare global {
  interface Window {
    showOpenFilePicker?: (options?: {
      multiple?: boolean;
      types?: Array<{
        description: string;
        accept: Record<string, string[]>;
      }>;
      excludeAcceptAllOption?: boolean;
    }) => Promise<FileSystemFileHandle[]>;
    
    showDirectoryPicker?: (options?: {
      mode?: 'read' | 'readwrite';
    }) => Promise<FileSystemDirectoryHandle>;
    
    showSaveFilePicker?: (options?: {
      types?: Array<{
        description: string;
        accept: Record<string, string[]>;
      }>;
      suggestedName?: string;
    }) => Promise<FileSystemFileHandle>;
  }
}

interface FileSystemHandle {
  kind: 'file' | 'directory';
  name: string;
  queryPermission?: (descriptor?: { mode?: 'read' | 'readwrite' }) => Promise<PermissionState>;
  requestPermission?: (descriptor?: { mode?: 'read' | 'readwrite' }) => Promise<PermissionState>;
}

interface FileSystemFileHandle extends FileSystemHandle {
  kind: 'file';
  getFile(): Promise<File>;
  createWritable?: (options?: { keepExistingData?: boolean }) => Promise<FileSystemWritableFileStream>;
}

interface FileSystemDirectoryHandle extends FileSystemHandle {
  kind: 'directory';
  entries(): AsyncIterableIterator<[string, FileSystemHandle]>;
  keys(): AsyncIterableIterator<string>;
  values(): AsyncIterableIterator<FileSystemHandle>;
  getFileHandle(name: string, options?: { create?: boolean }): Promise<FileSystemFileHandle>;
  getDirectoryHandle(name: string, options?: { create?: boolean }): Promise<FileSystemDirectoryHandle>;
  removeEntry(name: string, options?: { recursive?: boolean }): Promise<void>;
}

interface FileSystemWritableFileStream extends WritableStream {
  write(data: ArrayBuffer | ArrayBufferView | Blob | string): Promise<void>;
  seek(position: number): Promise<void>;
  truncate(size: number): Promise<void>;
}

// Supported file types with comprehensive MIME types
const SUPPORTED_TYPES = {
  books: {
    description: 'eBooks and Documents',
    accept: {
      'application/epub+zip': ['.epub'],
      'application/pdf': ['.pdf'],
      'application/x-mobipocket-ebook': ['.mobi', '.azw', '.azw3'],
      'text/plain': ['.txt'],
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document': ['.docx'],
      'application/msword': ['.doc'],
      'text/html': ['.html', '.htm']
    }
  },
  audio: {
    description: 'Audio Files',
    accept: {
      'audio/mpeg': ['.mp3'],
      'audio/mp4': ['.m4a', '.aac'],
      'audio/flac': ['.flac'],
      'audio/wav': ['.wav'],
      'audio/ogg': ['.ogg'],
      'audio/webm': ['.webm'],
      'audio/x-ms-wma': ['.wma']
    }
  },
  video: {
    description: 'Video Files',
    accept: {
      'video/mp4': ['.mp4'],
      'video/x-matroska': ['.mkv'],
      'video/quicktime': ['.mov'],
      'video/x-msvideo': ['.avi'],
      'video/webm': ['.webm'],
      'video/x-ms-wmv': ['.wmv']
    }
  },
  comics: {
    description: 'Comic Archives',
    accept: {
      'application/x-cbr': ['.cbr'],
      'application/x-cbz': ['.cbz'],
      'application/x-cb7': ['.cb7'],
      'application/x-cbt': ['.cbt']
    }
  },
  images: {
    description: 'Images',
    accept: {
      'image/jpeg': ['.jpg', '.jpeg'],
      'image/png': ['.png'],
      'image/webp': ['.webp'],
      'image/gif': ['.gif'],
      'image/svg+xml': ['.svg'],
      'image/bmp': ['.bmp'],
      'image/tiff': ['.tiff', '.tif']
    }
  },
  archives: {
    description: 'Archives',
    accept: {
      'application/zip': ['.zip'],
      'application/x-rar-compressed': ['.rar'],
      'application/x-7z-compressed': ['.7z'],
      'application/x-tar': ['.tar'],
      'application/gzip': ['.gz']
    }
  },
  databases: {
    description: 'Database Files',
    accept: {
      'application/x-sqlite3': ['.db', '.sqlite', '.sqlite3'],
      'application/vnd.sqlite3': ['.db']
    }
  }
};

class EnhancedFileSystemService {
  private permissionCache = new Map<string, PermissionState>();
  private handleCache = new Map<string, FileSystemHandle>();
  private watchedDirectories = new Set<FileSystemDirectoryHandle>();

  // File System Access API Support Detection
  get isNativeFileSystemSupported(): boolean {
    return (
      'showOpenFilePicker' in window &&
      'showDirectoryPicker' in window &&
      'showSaveFilePicker' in window
    );
  }

  // Enhanced File Selection with categorized types
  async selectFiles(options: {
    multiple?: boolean;
    categories?: Array<keyof typeof SUPPORTED_TYPES>;
    customTypes?: Array<{ description: string; accept: Record<string, string[]> }>;
  } = {}): Promise<File[]> {
    try {
      if (this.isNativeFileSystemSupported && window.showOpenFilePicker) {
        const types = this.buildFileTypes(options.categories, options.customTypes);
        
        const fileHandles = await window.showOpenFilePicker({
          multiple: options.multiple || true,
          types,
          excludeAcceptAllOption: false
        });

        const files: File[] = [];
        for (const handle of fileHandles) {
          const file = await handle.getFile();
          // Store handle for future reference
          this.handleCache.set(file.name, handle);
          files.push(file);
        }
        
        return files;
      } else {
        // Fallback to traditional file input
        return this.fallbackFileSelection(options);
      }
    } catch (error) {
      if ((error as Error).name === 'AbortError') {
        console.log('File selection cancelled by user');
        return [];
      }
      console.error('File selection error:', error);
      throw error;
    }
  }

  // Enhanced Directory Selection and Scanning
  async selectDirectory(options: {
    mode?: 'read' | 'readwrite';
    recursive?: boolean;
  } = {}): Promise<{
    handle: FileSystemDirectoryHandle;
    files: File[];
    structure: DirectoryStructure;
  } | null> {
    try {
      if (this.isNativeFileSystemSupported && window.showDirectoryPicker) {
        const dirHandle = await window.showDirectoryPicker({
          mode: options.mode || 'read'
        });

        // Check permissions
        const permission = await this.checkPermission(dirHandle, options.mode);
        if (permission !== 'granted') {
          const granted = await this.requestPermission(dirHandle, options.mode);
          if (granted !== 'granted') {
            throw new Error('Directory access permission denied');
          }
        }

        // Scan directory
        const { files, structure } = await this.scanDirectory(dirHandle, options.recursive);
        
        // Cache directory handle
        this.handleCache.set(dirHandle.name, dirHandle);
        
        return { handle: dirHandle, files, structure };
      } else {
        throw new Error('Directory selection not supported in this browser');
      }
    } catch (error) {
      if ((error as Error).name === 'AbortError') {
        console.log('Directory selection cancelled by user');
        return null;
      }
      console.error('Directory selection error:', error);
      throw error;
    }
  }

  // Advanced Directory Scanning with metadata extraction
  private async scanDirectory(
    dirHandle: FileSystemDirectoryHandle, 
    recursive = false, 
    depth = 0, 
    maxDepth = 5
  ): Promise<{
    files: File[];
    structure: DirectoryStructure;
  }> {
    const files: File[] = [];
    const subdirectories: DirectoryStructure[] = [];
    const fileCount = { total: 0, byType: {} as Record<string, number> };

    try {
      for await (const [name, handle] of dirHandle.entries()) {
        if (handle.kind === 'file') {
          try {
            const file = await (handle as FileSystemFileHandle).getFile();
            const mediaType = this.getMediaTypeFromFile(file);
            
            if (mediaType) {
              files.push(file);
              fileCount.total++;
              fileCount.byType[mediaType] = (fileCount.byType[mediaType] || 0) + 1;
              
              // Store handle for future access
              this.handleCache.set(`${dirHandle.name}/${file.name}`, handle);
            }
          } catch (error) {
            console.warn(`Could not read file ${name}:`, error);
          }
        } else if (handle.kind === 'directory' && recursive && depth < maxDepth) {
          try {
            const subResult = await this.scanDirectory(
              handle as FileSystemDirectoryHandle,
              recursive,
              depth + 1,
              maxDepth
            );
            
            files.push(...subResult.files);
            fileCount.total += subResult.structure.fileCount.total;
            
            // Merge file type counts
            Object.entries(subResult.structure.fileCount.byType).forEach(([type, count]) => {
              fileCount.byType[type] = (fileCount.byType[type] || 0) + count;
            });
            
            subdirectories.push(subResult.structure);
          } catch (error) {
            console.warn(`Could not read directory ${name}:`, error);
          }
        }
      }
    } catch (error) {
      console.error('Error scanning directory:', error);
    }

    const structure: DirectoryStructure = {
      name: dirHandle.name,
      path: dirHandle.name, // In browser context, we can't get full paths
      fileCount,
      subdirectories,
      lastScanned: new Date().toISOString()
    };

    return { files, structure };
  }

  // File Analysis and Metadata Extraction
  async analyzeFile(file: File): Promise<{
    mediaType: MediaType;
    metadata: any;
    thumbnail?: Blob;
    isSupported: boolean;
  }> {
    const mediaType = this.getMediaTypeFromFile(file);
    const isSupported = mediaType !== null;
    
    let metadata: any = {
      name: file.name,
      size: file.size,
      lastModified: new Date(file.lastModified),
      type: file.type
    };

    let thumbnail: Blob | undefined;

    if (isSupported && mediaType) {
      try {
        switch (mediaType) {
          case MediaType.Book:
            metadata = await this.extractBookMetadata(file);
            break;
          case MediaType.Music:
            metadata = await this.extractAudioMetadata(file);
            break;
          case MediaType.Movie:
            metadata = await this.extractVideoMetadata(file);
            thumbnail = await this.generateVideoThumbnail(file);
            break;
          case MediaType.Comic:
            metadata = await this.extractComicMetadata(file);
            thumbnail = await this.extractComicCover(file);
            break;
        }
      } catch (error) {
        console.warn(`Failed to extract metadata for ${file.name}:`, error);
      }
    }

    return {
      mediaType: mediaType || MediaType.Book, // fallback
      metadata,
      thumbnail,
      isSupported
    };
  }

  // Enhanced File Import with progress tracking
  async importFiles(
    files: File[], 
    progressCallback?: (current: number, total: number, fileName: string) => void
  ): Promise<MediaItem[]> {
    const mediaItems: MediaItem[] = [];
    
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      
      if (progressCallback) {
        progressCallback(i + 1, files.length, file.name);
      }

      try {
        const analysis = await this.analyzeFile(file);
        
        if (!analysis.isSupported) {
          console.warn(`Skipping unsupported file: ${file.name}`);
          continue;
        }

        // Create media item
        const mediaItem: MediaItem = {
          id: `import-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
          type: analysis.mediaType,
          title: analysis.metadata.title || this.extractTitleFromFilename(file.name),
          coverArt: analysis.thumbnail ? URL.createObjectURL(analysis.thumbnail) : this.getDefaultCoverArt(analysis.mediaType),
          status: analysis.mediaType === MediaType.Movie ? 'Unwatched' : 'Unread',
          dateAdded: new Date().toISOString(),
          fileSize: file.size,
          localPath: URL.createObjectURL(file),
          metadata: {
            filename: file.name,
            originalSize: file.size,
            lastModified: file.lastModified,
            mimeType: file.type,
            ...analysis.metadata
          }
        };

        // Set type-specific properties
        switch (analysis.mediaType) {
          case MediaType.Book:
          case MediaType.Comic:
            if (analysis.metadata.authors) {
              mediaItem.authors = Array.isArray(analysis.metadata.authors) 
                ? analysis.metadata.authors 
                : [analysis.metadata.authors];
            }
            if (analysis.metadata.publisher) {
              mediaItem.publisher = analysis.metadata.publisher;
            }
            if (analysis.metadata.isbn) {
              mediaItem.isbn = analysis.metadata.isbn;
            }
            break;
            
          case MediaType.Music:
          case MediaType.Podcast:
            if (analysis.metadata.artists) {
              mediaItem.artists = Array.isArray(analysis.metadata.artists)
                ? analysis.metadata.artists
                : [analysis.metadata.artists];
            }
            if (analysis.metadata.album) {
              mediaItem.series = analysis.metadata.album;
            }
            if (analysis.metadata.duration) {
              mediaItem.duration = analysis.metadata.duration;
            }
            break;
            
          case MediaType.Movie:
            if (analysis.metadata.directors) {
              mediaItem.directors = Array.isArray(analysis.metadata.directors)
                ? analysis.metadata.directors
                : [analysis.metadata.directors];
            }
            if (analysis.metadata.duration) {
              mediaItem.duration = analysis.metadata.duration;
            }
            break;
        }

        // Set genres if available
        if (analysis.metadata.genres) {
          mediaItem.genres = Array.isArray(analysis.metadata.genres)
            ? analysis.metadata.genres
            : [analysis.metadata.genres];
        }

        // Cache thumbnail if available
        if (analysis.thumbnail) {
          await enhancedDB.cacheThumbnail(mediaItem.id, mediaItem.coverArt, analysis.thumbnail);
        }

        mediaItems.push(mediaItem);
      } catch (error) {
        console.error(`Failed to process file ${file.name}:`, error);
      }
    }

    return mediaItems;
  }

  // File Watching and Change Detection
  async watchDirectory(dirHandle: FileSystemDirectoryHandle, callback: (changes: {
    added: File[];
    modified: File[];
    removed: string[];
  }) => void): Promise<void> {
    if (!this.isNativeFileSystemSupported) {
      throw new Error('File watching not supported in this browser');
    }

    this.watchedDirectories.add(dirHandle);
    
    // Note: Actual file watching would require a more complex implementation
    // For now, this is a placeholder for the interface
    console.log(`Watching directory: ${dirHandle.name}`);
  }

  async stopWatching(dirHandle: FileSystemDirectoryHandle): Promise<void> {
    this.watchedDirectories.delete(dirHandle);
    console.log(`Stopped watching directory: ${dirHandle.name}`);
  }

  // Export and Backup
  async exportLibrary(mediaItems: MediaItem[]): Promise<void> {
    try {
      if (!window.showSaveFilePicker) {
        throw new Error('File saving not supported in this browser');
      }

      const fileHandle = await window.showSaveFilePicker({
        types: [{
          description: 'CleverFerret Library Export',
          accept: { 'application/json': ['.json'] }
        }],
        suggestedName: `cleverferret-library-${new Date().toISOString().split('T')[0]}.json`
      });

      const writable = await fileHandle.createWritable?.();
      if (!writable) {
        throw new Error('Could not create writable stream');
      }

      const exportData = {
        version: '2.0.0',
        exportDate: new Date().toISOString(),
        mediaItems: mediaItems.map(item => ({
          ...item,
          // Remove local paths and blobs for export
          localPath: undefined,
          coverArt: item.coverArt.startsWith('blob:') ? undefined : item.coverArt
        }))
      };

      await writable.write(JSON.stringify(exportData, null, 2));
      await writable.close();

      console.log(`Exported ${mediaItems.length} items successfully`);
    } catch (error) {
      console.error('Export failed:', error);
      throw error;
    }
  }

  // Private helper methods
  private buildFileTypes(
    categories?: Array<keyof typeof SUPPORTED_TYPES>,
    customTypes?: Array<{ description: string; accept: Record<string, string[]> }>
  ) {
    const types: Array<{ description: string; accept: Record<string, string[]> }> = [];

    if (categories && categories.length > 0) {
      categories.forEach(category => {
        if (SUPPORTED_TYPES[category]) {
          types.push(SUPPORTED_TYPES[category]);
        }
      });
    } else {
      // Add all supported types
      types.push(...Object.values(SUPPORTED_TYPES));
    }

    if (customTypes) {
      types.push(...customTypes);
    }

    return types;
  }

  private fallbackFileSelection(options: {
    multiple?: boolean;
    categories?: Array<keyof typeof SUPPORTED_TYPES>;
  }): Promise<File[]> {
    return new Promise((resolve) => {
      const input = document.createElement('input');
      input.type = 'file';
      input.multiple = options.multiple || true;
      
      // Build accept string from categories
      if (options.categories) {
        const acceptTypes: string[] = [];
        options.categories.forEach(category => {
          const typeConfig = SUPPORTED_TYPES[category];
          if (typeConfig) {
            Object.values(typeConfig.accept).forEach(extensions => {
              acceptTypes.push(...extensions);
            });
          }
        });
        input.accept = acceptTypes.join(',');
      }
      
      input.onchange = (e) => {
        const files = Array.from((e.target as HTMLInputElement).files || []);
        resolve(files);
      };
      
      input.click();
    });
  }

  private getMediaTypeFromFile(file: File): MediaType | null {
    const extension = file.name.split('.').pop()?.toLowerCase();
    const mimeType = file.type;

    // Check by MIME type first
    if (mimeType) {
      if (mimeType.startsWith('audio/')) return MediaType.Music;
      if (mimeType.startsWith('video/')) return MediaType.Movie;
      if (mimeType.startsWith('image/')) return null; // Images aren't media items by default
      if (mimeType === 'application/epub+zip') return MediaType.Book;
      if (mimeType === 'application/pdf') return MediaType.Book;
    }

    // Check by extension
    if (extension) {
      const audioExtensions = ['mp3', 'm4a', 'aac', 'flac', 'wav', 'ogg', 'wma'];
      const videoExtensions = ['mp4', 'mkv', 'mov', 'avi', 'webm', 'wmv'];
      const bookExtensions = ['epub', 'pdf', 'mobi', 'azw', 'azw3', 'txt', 'doc', 'docx'];
      const comicExtensions = ['cbr', 'cbz', 'cb7', 'cbt'];

      if (audioExtensions.includes(extension)) return MediaType.Music;
      if (videoExtensions.includes(extension)) return MediaType.Movie;
      if (bookExtensions.includes(extension)) return MediaType.Book;
      if (comicExtensions.includes(extension)) return MediaType.Comic;
    }

    return null;
  }

  private extractTitleFromFilename(filename: string): string {
    // Remove extension
    const nameWithoutExt = filename.replace(/\.[^/.]+$/, '');
    
    // Replace underscores and dashes with spaces
    const cleanName = nameWithoutExt.replace(/[_-]/g, ' ');
    
    // Capitalize words
    return cleanName.replace(/\b\w/g, l => l.toUpperCase());
  }

  private getDefaultCoverArt(mediaType: MediaType): string {
    const seed = `${mediaType}-${Date.now()}`;
    return `https://picsum.photos/seed/${seed}/400/600`;
  }

  private async checkPermission(
    handle: FileSystemHandle, 
    mode: 'read' | 'readwrite' = 'read'
  ): Promise<PermissionState> {
    if (!handle.queryPermission) return 'granted';
    
    const cacheKey = `${handle.name}-${mode}`;
    if (this.permissionCache.has(cacheKey)) {
      return this.permissionCache.get(cacheKey)!;
    }

    const permission = await handle.queryPermission({ mode });
    this.permissionCache.set(cacheKey, permission);
    return permission;
  }

  private async requestPermission(
    handle: FileSystemHandle,
    mode: 'read' | 'readwrite' = 'read'
  ): Promise<PermissionState> {
    if (!handle.requestPermission) return 'granted';
    
    const permission = await handle.requestPermission({ mode });
    const cacheKey = `${handle.name}-${mode}`;
    this.permissionCache.set(cacheKey, permission);
    return permission;
  }

  // Metadata extraction methods (simplified implementations)
  private async extractBookMetadata(file: File): Promise<any> {
    // For EPUB files, we would parse the OPF file
    // For PDF files, we would use PDF.js
    // This is a simplified implementation
    return {
      title: this.extractTitleFromFilename(file.name),
      format: file.name.split('.').pop()?.toUpperCase(),
      fileSize: file.size
    };
  }

  private async extractAudioMetadata(file: File): Promise<any> {
    // Would use Web Audio API or ID3 parsing library
    return {
      title: this.extractTitleFromFilename(file.name),
      format: file.name.split('.').pop()?.toUpperCase(),
      fileSize: file.size
    };
  }

  private async extractVideoMetadata(file: File): Promise<any> {
    // Would use video element to get duration and dimensions
    return {
      title: this.extractTitleFromFilename(file.name),
      format: file.name.split('.').pop()?.toUpperCase(),
      fileSize: file.size
    };
  }

  private async extractComicMetadata(file: File): Promise<any> {
    // Would extract from CBR/CBZ archives
    return {
      title: this.extractTitleFromFilename(file.name),
      format: file.name.split('.').pop()?.toUpperCase(),
      fileSize: file.size
    };
  }

  private async generateVideoThumbnail(file: File): Promise<Blob> {
    // Would create video element, seek to middle, capture frame
    // This is a placeholder implementation
    const canvas = document.createElement('canvas');
    canvas.width = 400;
    canvas.height = 300;
    const ctx = canvas.getContext('2d')!;
    ctx.fillStyle = '#333';
    ctx.fillRect(0, 0, 400, 300);
    ctx.fillStyle = '#fff';
    ctx.font = '20px Arial';
    ctx.textAlign = 'center';
    ctx.fillText('Video Thumbnail', 200, 150);
    
    return new Promise(resolve => {
      canvas.toBlob(blob => resolve(blob!), 'image/jpeg', 0.8);
    });
  }

  private async extractComicCover(file: File): Promise<Blob> {
    // Would extract first image from CBR/CBZ
    // Placeholder implementation
    const canvas = document.createElement('canvas');
    canvas.width = 400;
    canvas.height = 600;
    const ctx = canvas.getContext('2d')!;
    ctx.fillStyle = '#444';
    ctx.fillRect(0, 0, 400, 600);
    ctx.fillStyle = '#fff';
    ctx.font = '24px Arial';
    ctx.textAlign = 'center';
    ctx.fillText('Comic Cover', 200, 300);
    
    return new Promise(resolve => {
      canvas.toBlob(blob => resolve(blob!), 'image/jpeg', 0.8);
    });
  }
}

// Types for directory structure
interface DirectoryStructure {
  name: string;
  path: string;
  fileCount: {
    total: number;
    byType: Record<string, number>;
  };
  subdirectories: DirectoryStructure[];
  lastScanned: string;
}

// Export singleton instance
export const enhancedFileSystem = new EnhancedFileSystemService();
export { EnhancedFileSystemService };
export default enhancedFileSystem;