import { MediaItem, MediaType } from '../types';

// sql.js is loaded from a script tag in index.html
declare const initSqlJs: (config: { locateFile: (file: string) => string }) => Promise<any>;

// Helper to convert sql.js output to an array of objects
const convertSqlResultToObjects = (result: any) => {
  if (!result || result.length === 0) return [];
  const objects: any[] = [];
  const columns = result[0].columns;
  const values = result[0].values;
  for (const row of values) {
    const obj: any = {};
    for (let i = 0; i < columns.length; i++) {
      obj[columns[i]] = row[i];
    }
    objects.push(obj);
  }
  return objects;
};

export const importCalibreDb = async (file: File): Promise<MediaItem[]> => {
  if (!file) {
    throw new Error('No file provided for import.');
  }

  if (typeof initSqlJs === 'undefined') {
    throw new Error('sql.js library not loaded. Please check your internet connection.');
  }

  const SQL = await initSqlJs({
    locateFile: (file) => `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/${file}`,
  });

  const fileBuffer = await file.arrayBuffer();
  const db = new SQL.Database(new Uint8Array(fileBuffer));

  const mediaItems: MediaItem[] = [];

  try {
    // Query for main book data
    const booksQuery = `
      SELECT
          b.id,
          b.title,
          b.sort,
          b.pubdate,
          b.rating,
          b.isbn,
          p.name as publisher,
          c.text as summary,
          (SELECT GROUP_CONCAT(a.name, '&') FROM books_authors_link AS bal JOIN authors AS a ON a.id = bal.author WHERE bal.book = b.id) AS authors
      FROM
          books b
      LEFT JOIN
          comments c ON b.id = c.book
      LEFT JOIN
          publishers p ON b.publisher = p.id
      GROUP BY
          b.id;
    `;

    const bookResults = db.exec(booksQuery);
    const booksData = convertSqlResultToObjects(bookResults);

    // Query for tags/genres
    const tagsQuery = `
      SELECT
        btl.book as book_id,
        t.name as tag_name
      FROM
        books_tags_link btl
      JOIN
        tags t ON btl.tag = t.id;
    `;
    const tagResults = db.exec(tagsQuery);
    const tagsData = convertSqlResultToObjects(tagResults);

    const tagsMap = new Map<number, string[]>();
    for (const row of tagsData) {
      if (!tagsMap.has(row.book_id)) {
        tagsMap.set(row.book_id, []);
      }
      tagsMap.get(row.book_id)!.push(row.tag_name);
    }

    // Map data to MediaItem objects
    for (const book of booksData) {
      const releaseDate = book.pubdate
        ? new Date(book.pubdate).toISOString().split('T')[0]
        : undefined;
      const rating = book.rating ? Math.round(book.rating / 2) : undefined;
      const newId = `calibre-${book.id}`;

      const mediaItem: MediaItem = {
        id: newId,
        type: MediaType.Book,
        title: book.title,
        sortTitle: book.sort,
        summary: book.summary,
        authors: book.authors ? book.authors.split('&') : [],
        releaseDate: releaseDate,
        rating: rating,
        isbn: book.isbn,
        publisher: book.publisher,
        genres: tagsMap.get(book.id) || [],
        coverArt: `https://picsum.photos/seed/${newId}/400/600`,
        status: 'Unread',
        dateAdded: new Date().toISOString(),
      };
      mediaItems.push(mediaItem);
    }
  } catch (error) {
    console.error('Error querying Calibre database:', error);
    throw new Error("Failed to read Calibre database. Ensure it's a valid metadata.db file.");
  } finally {
    db.close();
  }

  return mediaItems;
};
