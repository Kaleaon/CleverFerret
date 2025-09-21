/**
 * Represents a media library, which is a top-level container for media items.
 * @interface Library
 */
export interface Library {
  /** The unique identifier for the library. */
  libraryId?: number;
  /** The name of the library. */
  name: string;
  /** The type of media contained in the library. */
  type: 'BOOK' | 'MOVIE' | 'MUSIC' | 'PODCAST' | 'MAGAZINE' | 'DOCUMENT';
  /** The file path to the root of the library. */
  path: string;
  /** The date the library was created. */
  dateCreated?: Date;
  /** The date the library was last modified. */
  dateModified?: Date;
}

/**
 * Represents a single media item within a library.
 * @interface MediaItem
 */
export interface MediaItem {
  /** The unique identifier for the media item. */
  itemId?: number;
  /** The ID of the library this item belongs to. */
  libraryId: number;
  /** The full file path of the media item. */
  filePath: string;
  /** The name of the file. */
  fileName: string;
  /** The size of the file in bytes. */
  fileSize: number;
  /** The MIME type of the file. */
  mimeType: string;
  /** The type of media. */
  mediaType: 'BOOK' | 'MOVIE' | 'MUSIC' | 'PODCAST' | 'MAGAZINE' | 'DOCUMENT';
  /** The date the item was added to the library. */
  dateAdded?: Date;
  /** The date the file was last modified. */
  lastModified?: Date;
  /** A hash of the file for duplicate detection. */
  fileHash?: string;
}

/**
 * Represents common metadata shared across all media types.
 * @interface MetadataCommon
 */
export interface MetadataCommon {
  /** The ID of the media item this metadata belongs to. */
  itemId: number;
  /** The title of the media item. */
  title: string;
  /** A summary or description of the content. */
  description?: string;
  /** The path to a thumbnail or cover image. */
  thumbnailPath?: string;
  /** The user's rating for the item. */
  rating?: number;
  /** A comma-separated string of tags. */
  tags?: string;
  /** The date the metadata was created. */
  dateCreated?: Date;
  /** The date the item was last accessed. */
  lastAccessed?: Date;
  /** Whether the item is marked as a favorite. */
  isFavorite: boolean;
  /** Whether the item is downloaded for offline access. */
  isDownloaded: boolean;
}

/**
 * Represents book-specific metadata, extending the common metadata.
 * @interface MetadataBook
 * @extends {MetadataCommon}
 */
export interface MetadataBook extends MetadataCommon {
  /** The author of the book. */
  author?: string;
  /** The ISBN of the book. */
  isbn?: string;
  /** The publisher of the book. */
  publisher?: string;
  /** The publication date of the book. */
  publicationDate?: string;
  /** The number of pages in the book. */
  pageCount?: number;
  /** The language of the book. */
  language?: string;
  /** The series the book belongs to. */
  series?: string;
  /** The index of the book within a series. */
  seriesIndex?: number;
  /** The file format of the book (e.g., EPUB, PDF). */
  format?: string;
}

/**
 * A composite type that holds all details for a book.
 * @interface BookDetails
 */
export interface BookDetails {
  /** The core media item information. */
  mediaItem: MediaItem;
  /** The common metadata for the book. */
  metadataCommon: MetadataCommon;
  /** The book-specific metadata. */
  metadataBook?: MetadataBook;
}

/**
 * An enumeration for the different view modes in the library details screen.
 * @enum {string}
 */
export enum ViewMode {
  GRID = 'GRID',
  LIST = 'LIST',
  COVER_FLOW = 'COVER_FLOW'
}

/**
 * Represents the status of a background import process.
 * @interface ImportStatus
 */
export interface ImportStatus {
  /** Whether an import is currently in progress. */
  isImporting: boolean;
  /** A status message describing the current step. */
  status: string;
  /** The progress of the import, from 0 to 100. */
  progress?: number;
}