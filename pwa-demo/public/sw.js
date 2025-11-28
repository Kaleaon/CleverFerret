// Service Worker for PWA functionality
const APP_VERSION = 'v2';
const STATIC_CACHE = `cleverferret-static-${APP_VERSION}`;
const DYNAMIC_CACHE = `cleverferret-dynamic-${APP_VERSION}`;
const OFFLINE_URL = './offline.html';

// Files to cache on install
const STATIC_FILES = ['./', './index.html', './manifest.json', OFFLINE_URL];

// Install event - cache static files
self.addEventListener('install', (event) => {
  console.log('Service Worker installing...');
  event.waitUntil(
    caches
      .open(STATIC_CACHE)
      .then((cache) => {
        console.log('Pre-caching static files...');
        return cache.addAll(STATIC_FILES);
      })
      .then(() => {
        return self.skipWaiting();
      }),
  );
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
  console.log('Service Worker activating...');
  event.waitUntil(
    caches
      .keys()
      .then((keyList) => {
        return Promise.all(
          keyList.map((key) => {
            if (key !== STATIC_CACHE && key !== DYNAMIC_CACHE) {
              console.log('Removing old cache:', key);
              return caches.delete(key);
            }
          }),
        );
      })
      .then(() => {
        return self.clients.claim();
      }),
  );
});

// Handle file opening via File System Access API
self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'FILE_OPEN') {
    // Forward file opening to client
    event.waitUntil(
      self.clients.matchAll().then((clients) => {
        clients.forEach((client) => {
          client.postMessage({
            type: 'FILE_OPEN',
            file: event.data.file,
          });
        });
      }),
    );
  }
});

// Fetch event - serve cached content when offline
self.addEventListener('fetch', (event) => {
  const { request } = event;

  // Handle Web Share Target POST to /import
  if (request.method === 'POST') {
    const url = new URL(request.url);
    if (url.pathname === '/import') {
      event.respondWith(
        (async () => {
          try {
            // Read form data to ensure browser considers it handled
            const formData = await request.formData();
            const files = formData.getAll('files');
            // Optionally postMessage to clients for processing
            const clientList = await self.clients.matchAll({
              type: 'window',
              includeUncontrolled: true,
            });
            for (const client of clientList) {
              client.postMessage({ type: 'SHARE_TARGET_IMPORT', count: files?.length || 0 });
            }
          } catch (_) {}
          // Redirect user to import handler route in app
          return Response.redirect('/?action=import', 303);
        })(),
      );
      return;
    }
  }

  // Skip other non-GET requests
  if (request.method !== 'GET') return;

  // Skip external requests
  if (!request.url.startsWith(self.location.origin)) {
    return;
  }

  event.respondWith(
    caches.match(request).then((cachedResponse) => {
      if (cachedResponse) {
        return cachedResponse;
      }

      // Network first for navigation requests (ensure latest shell)
      if (request.mode === 'navigate') {
        return fetch(request)
          .then((networkResponse) => {
            const responseClone = networkResponse.clone();
            caches.open(DYNAMIC_CACHE).then((cache) => cache.put(request, responseClone));
            return networkResponse;
          })
          .catch(async () => {
            const cached = await caches.match(request);
            return cached || caches.match(OFFLINE_URL);
          });
      }

      // Cache-first for static assets; network fallback
      return fetch(request)
        .then((networkResponse) => {
          if (networkResponse && networkResponse.ok) {
            const responseClone = networkResponse.clone();
            caches.open(DYNAMIC_CACHE).then((cache) => cache.put(request, responseClone));
          }
          return networkResponse;
        })
        .catch(() => caches.match(OFFLINE_URL));
    }),
  );
});

// Background sync for importing files
self.addEventListener('sync', (event) => {
  if (event.tag === 'calibre-import') {
    event.waitUntil(processCalibreImport());
  }
});

// Background sync for media processing
async function processCalibreImport() {
  try {
    // Process any pending import tasks
    console.log('Processing background import...');
    // Implementation would handle actual import logic
  } catch (error) {
    console.error('Background import failed:', error);
  }
}

// Handle file uploads and processing
self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'PROCESS_FILE') {
    const { file, type } = event.data;
    const resolvedType = event.data.fileType || type;
    processFileUpload(file, resolvedType)
      .then((result) => {
        event.ports[0].postMessage({ success: true, result });
      })
      .catch((error) => {
        event.ports[0].postMessage({ success: false, error: error.message });
      });
  }
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

async function processFileUpload(file, type) {
  // Handle different file types
  switch (type) {
    case 'epub':
      return processEpubFile(file);
    case 'pdf':
      return processPdfFile(file);
    case 'calibre-db':
      return processCalibreDatabase(file);
    default:
      throw new Error(`Unsupported file type: ${type}`);
  }
}

async function processEpubFile(file) {
  // Extract metadata from EPUB file
  // This would use epub parsing libraries in the actual implementation
  return {
    title: 'Extracted Title',
    author: 'Extracted Author',
    size: file.size,
  };
}

async function processPdfFile(file) {
  // Extract metadata from PDF file
  return {
    title: file.name,
    size: file.size,
    type: 'pdf',
  };
}

async function processCalibreDatabase(file) {
  // Process Calibre metadata.db file
  // This would involve SQLite parsing in the actual implementation
  return {
    booksImported: 0,
    metadataProcessed: true,
  };
}

// Push notifications
self.addEventListener('push', (event) => {
  try {
    const data = event.data ? event.data.json() : { title: 'CleverFerret', body: 'New update' };
    const title = data.title || 'CleverFerret';
    const options = {
      body: data.body || 'Notification',
      icon: '/icons/icon-192.png',
      badge: '/icons/icon-72.png',
      data: data.data || {},
      actions: [{ action: 'open', title: 'Open' }],
    };
    event.waitUntil(self.registration.showNotification(title, options));
  } catch (e) {
    // no-op
  }
});

self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  const targetUrl = event.notification?.data?.url || '/';
  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clientList) => {
      for (const client of clientList) {
        if (client.url.includes(self.location.origin)) {
          client.focus();
          client.postMessage({ type: 'NAVIGATE', url: targetUrl });
          return;
        }
      }
      return self.clients.openWindow(targetUrl);
    }),
  );
});
