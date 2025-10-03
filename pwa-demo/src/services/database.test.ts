import { describe, it, expect, beforeEach } from 'vitest';
import { db, LibraryService, MediaItemService } from './database';
import type { Library, MediaItem, MetadataBook, MetadataCommon } from '../types';

describe('Database Service', () => {
  beforeEach(async () => {
    // Reset the database before each test
    await db.delete();
    await db.open();
  });

  describe('LibraryService', () => {
    it('should add and retrieve a library', async () => {
      const newLibrary: Omit<Library, 'libraryId'> = {
        name: 'Test Library',
        type: 'BOOK',
        path: '/test/path',
        dateCreated: new Date(),
        dateModified: new Date(),
      };
      const libraryId = await LibraryService.addLibrary(newLibrary);
      const libraries = await LibraryService.getAllLibraries();
      expect(libraries).toHaveLength(1);
      expect(libraries[0].libraryId).toBe(libraryId);
      expect(libraries[0].name).toBe('Test Library');
    });

    it('should delete a library and all its contents', async () => {
      // 1. Setup: Add a library with a media item and book metadata
      const libraryId = await LibraryService.addLibrary({
        name: 'Lib To Delete',
        type: 'BOOK',
        path: '/dev/null',
      });
      const mediaItemId = await MediaItemService.addMediaItem({
        libraryId,
        fileName: 'book.epub',
        mediaType: 'BOOK',
        filePath: '/dev/null/book.epub',
      });

      const metadataBook: MetadataBook = {
        itemId: mediaItemId,
        author: 'test',
        isbn: 'test',
        series: 'test',
      };
      await db.metadataBooks.add(metadataBook);

      const metadataCommon: MetadataCommon = { itemId: mediaItemId, title: 'test book' };
      await db.metadataCommon.add(metadataCommon);

      // 2. Delete the library
      await LibraryService.deleteLibrary(libraryId);

      // 3. Verify deletion
      const library = await db.libraries.get(libraryId);
      const mediaItem = await db.mediaItems.get(mediaItemId);
      const commonMetadata = await db.metadataCommon.get(mediaItemId);
      const bookMetadata = await db.metadataBooks.get(mediaItemId);

      expect(library).toBeUndefined();
      expect(mediaItem).toBeUndefined();
      expect(commonMetadata).toBeUndefined();
      expect(bookMetadata).toBeUndefined();
    });
  });
});
