/**
 * File operations utility using File System Access API
 * Provides file reading, writing, and management capabilities
 */

export interface FileHandle {
  name: string;
  kind: 'file' | 'directory';
  handle: FileSystemFileHandle | FileSystemDirectoryHandle;
}

class FileUtilsClass {
  /**
   * Check if File System Access API is supported
   */
  isSupported(): boolean {
    return 'showOpenFilePicker' in window;
  }

  /**
   * Check if Directory Picker API is supported
   */
  isDirectoryPickerSupported(): boolean {
    return 'showDirectoryPicker' in window;
  }

  /**
   * Open directory picker
   */
  async pickDirectory(): Promise<FileSystemDirectoryHandle | null> {
    if (!this.isDirectoryPickerSupported()) {
      console.warn('Directory picker not supported in this browser');
      return null;
    }

    try {
      const dirHandle = await (window as any).showDirectoryPicker({
        mode: 'read',
      });
      return dirHandle;
    } catch (error) {
      if ((error as Error).name !== 'AbortError') {
        console.error('Failed to pick directory:', error);
      }
      return null;
    }
  }

  /**
   * Open file picker and read file
   */
  async pickFile(accept?: string[]): Promise<File | null> {
    if (!this.isSupported()) {
      // Fallback to input element
      return this.pickFileWithInput(accept);
    }

    try {
      const [fileHandle] = await (window as any).showOpenFilePicker({
        types: accept
          ? [
              {
                description: 'Files',
                accept: accept.reduce((acc, type) => ({ ...acc, [type]: [] }), {}),
              },
            ]
          : undefined,
      });

      return await fileHandle.getFile();
    } catch (error) {
      if ((error as Error).name !== 'AbortError') {
        console.error('Failed to pick file:', error);
      }
      return null;
    }
  }

  /**
   * Fallback file picker using input element
   */
  private async pickFileWithInput(accept?: string[]): Promise<File | null> {
    return new Promise((resolve) => {
      const input = document.createElement('input');
      input.type = 'file';
      if (accept) {
        input.accept = accept.join(',');
      }

      input.onchange = () => {
        const file = input.files?.[0];
        resolve(file || null);
      };

      input.click();
    });
  }

  /**
   * Open file picker for multiple files
   */
  async pickFiles(accept?: string[]): Promise<File[]> {
    if (!this.isSupported()) {
      return this.pickFilesWithInput(accept);
    }

    try {
      const fileHandles = await (window as any).showOpenFilePicker({
        multiple: true,
        types: accept
          ? [
              {
                description: 'Files',
                accept: accept.reduce((acc, type) => ({ ...acc, [type]: [] }), {}),
              },
            ]
          : undefined,
      });

      const files: File[] = [];
      for (const handle of fileHandles) {
        const file = await handle.getFile();
        files.push(file);
      }

      return files;
    } catch (error) {
      if ((error as Error).name !== 'AbortError') {
        console.error('Failed to pick files:', error);
      }
      return [];
    }
  }

  /**
   * Fallback file picker for multiple files
   */
  private async pickFilesWithInput(accept?: string[]): Promise<File[]> {
    return new Promise((resolve) => {
      const input = document.createElement('input');
      input.type = 'file';
      input.multiple = true;
      if (accept) {
        input.accept = accept.join(',');
      }

      input.onchange = () => {
        const files = Array.from(input.files || []);
        resolve(files);
      };

      input.click();
    });
  }

  /**
   * Read file as text
   */
  async readAsText(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = () => reject(reader.error);
      reader.readAsText(file);
    });
  }

  /**
   * Read file as data URL
   */
  async readAsDataURL(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = () => reject(reader.error);
      reader.readAsDataURL(file);
    });
  }

  /**
   * Read file as array buffer
   */
  async readAsArrayBuffer(file: File): Promise<ArrayBuffer> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result as ArrayBuffer);
      reader.onerror = () => reject(reader.error);
      reader.readAsArrayBuffer(file);
    });
  }

  /**
   * Save file (download)
   */
  async saveFile(data: string | Blob, filename: string, mimeType?: string): Promise<void> {
    const blob =
      typeof data === 'string' ? new Blob([data], { type: mimeType || 'text/plain' }) : data;

    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  }

  /**
   * Get file extension
   */
  getExtension(filename: string): string {
    const parts = filename.split('.');
    return parts.length > 1 ? parts[parts.length - 1].toLowerCase() : '';
  }

  /**
   * Get file name without extension
   */
  getNameWithoutExtension(filename: string): string {
    const parts = filename.split('.');
    return parts.length > 1 ? parts.slice(0, -1).join('.') : filename;
  }

  /**
   * Format file size
   */
  formatSize(bytes: number): string {
    if (bytes === 0) return '0 B';

    const k = 1024;
    const sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));

    return `${(bytes / Math.pow(k, i)).toFixed(2)} ${sizes[i]}`;
  }

  /**
   * Check if file is image
   */
  isImage(filename: string): boolean {
    const ext = this.getExtension(filename);
    return ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'svg'].includes(ext);
  }

  /**
   * Check if file is video
   */
  isVideo(filename: string): boolean {
    const ext = this.getExtension(filename);
    return ['mp4', 'webm', 'ogg', 'mov', 'avi', 'mkv'].includes(ext);
  }

  /**
   * Check if file is audio
   */
  isAudio(filename: string): boolean {
    const ext = this.getExtension(filename);
    return ['mp3', 'wav', 'ogg', 'flac', 'm4a', 'aac'].includes(ext);
  }

  /**
   * Check if file is document
   */
  isDocument(filename: string): boolean {
    const ext = this.getExtension(filename);
    return ['pdf', 'doc', 'docx', 'txt', 'epub', 'mobi'].includes(ext);
  }
}

export const FileUtils = new FileUtilsClass();
