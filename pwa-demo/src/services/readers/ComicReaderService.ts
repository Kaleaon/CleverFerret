/**
 * Comic Reader Service
 * 
 * Handles comic file reading (CBR, CBZ, CBT, CB7)
 * CBR = RAR archive
 * CBZ = ZIP archive
 * CBT = TAR archive
 * CB7 = 7Z archive
 */

import JSZip from 'jszip';

export interface ComicArchive {
  type: 'CBZ' | 'CBR' | 'CBT' | 'CB7';
  pages: ComicPage[];
  title: string;
}

export interface ComicPage {
  index: number;
  filename: string;
  dataUrl?: string;
  blob?: Blob;
}

export class ComicReaderService {
  /**
   * Load a comic archive (CBZ supported, others need additional libraries)
   */
  async loadComic(file: File | Blob): Promise<ComicArchive> {
    const fileName = file instanceof File ? file.name : 'comic';
    const extension = fileName.split('.').pop()?.toUpperCase();
    
    if (extension === 'CBZ') {
      return this.loadCBZ(file);
    } else {
      throw new Error(`Comic format ${extension} is not yet supported. CBZ (ZIP) format is supported.`);
    }
  }

  /**
   * Load CBZ (ZIP archive)
   */
  private async loadCBZ(file: File | Blob): Promise<ComicArchive> {
    try {
      const zip = new JSZip();
      const zipData = await zip.loadAsync(file);
      
      // Filter image files and sort them
      const imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
      const files = Object.keys(zipData.files)
        .filter(name => {
          const ext = name.toLowerCase();
          return imageExtensions.some(imgExt => ext.endsWith(imgExt)) && !zipData.files[name].dir;
        })
        .sort(); // Natural sort
      
      const pages: ComicPage[] = files.map((filename, index) => ({
        index,
        filename,
      }));
      
      return {
        type: 'CBZ',
        pages,
        title: file instanceof File ? file.name.replace(/\.cbz$/i, '') : 'Comic',
      };
    } catch (error) {
      throw new Error(`Failed to load CBZ: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  /**
   * Get a specific page as data URL
   */
  async getPage(archive: ComicArchive, pageIndex: number): Promise<string> {
    if (pageIndex < 0 || pageIndex >= archive.pages.length) {
      throw new Error(`Page ${pageIndex} is out of range`);
    }
    
    const page = archive.pages[pageIndex];
    
    // If already loaded, return cached data URL
    if (page.dataUrl) {
      return page.dataUrl;
    }
    
    // Load the page
    if (archive.type === 'CBZ') {
      return this.loadCBZPage(archive, pageIndex);
    }
    
    throw new Error(`Page loading not implemented for ${archive.type}`);
  }

  /**
   * Load a page from CBZ archive
   */
  private async loadCBZPage(archive: ComicArchive, pageIndex: number): Promise<string> {
    // This would need the original file reference
    // For now, return a placeholder
    throw new Error('Page loading requires file reference. Use loadComicPage() instead.');
  }

  /**
   * Load a page from a CBZ file
   */
  async loadComicPage(file: File | Blob, pageIndex: number): Promise<string> {
    try {
      const zip = new JSZip();
      const zipData = await zip.loadAsync(file);
      
      const imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
      const files = Object.keys(zipData.files)
        .filter(name => {
          const ext = name.toLowerCase();
          return imageExtensions.some(imgExt => ext.endsWith(imgExt)) && !zipData.files[name].dir;
        })
        .sort();
      
      if (pageIndex < 0 || pageIndex >= files.length) {
        throw new Error(`Page ${pageIndex} is out of range`);
      }
      
      const filename = files[pageIndex];
      const fileData = zipData.files[filename];
      
      if (!fileData) {
        throw new Error(`File ${filename} not found in archive`);
      }
      
      const blob = await fileData.async('blob');
      const dataUrl = URL.createObjectURL(blob);
      
      return dataUrl;
    } catch (error) {
      throw new Error(`Failed to load page: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  /**
   * Get total number of pages
   */
  getPageCount(archive: ComicArchive): number {
    return archive.pages.length;
  }

  /**
   * Preload multiple pages
   */
  async preloadPages(file: File | Blob, startIndex: number, count: number): Promise<string[]> {
    const dataUrls: string[] = [];
    
    for (let i = 0; i < count; i++) {
      try {
        const dataUrl = await this.loadComicPage(file, startIndex + i);
        dataUrls.push(dataUrl);
      } catch (error) {
        console.error(`Failed to preload page ${startIndex + i}:`, error);
      }
    }
    
    return dataUrls;
  }
}

export const comicReaderService = new ComicReaderService();
