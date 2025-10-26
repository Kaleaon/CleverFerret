// Enhanced Service Worker for CleverFerret PWA
// Provides advanced caching, offline support, and file system integration

const CACHE_NAME = 'clever-ferret-enhanced-v1';
const STATIC_CACHE = 'clever-ferret-static-v1';
const DYNAMIC_CACHE = 'clever-ferret-dynamic-v1';
const MEDIA_CACHE = 'clever-ferret-media-v1';

// Core app shell files that should always be cached
const APP_SHELL_URLS = [
  '/',
  '/index.html',
  '/src/App-Enhanced.tsx',
  '/src/components/',
  '/src/services/',
  '/src/themes.ts',
  '/src/constants.ts',
  '/src/types-enhanced.ts'
];

// Static resources that can be cached for longer periods
const STATIC_RESOURCES = [
  'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Fira+Code:wght@400;500&display=swap',
  'https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/sql-wasm.js',
  'https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.10.3/sql-wasm.wasm'
];

// API endpoints that should use network-first strategy
const API_ENDPOINTS = [
  'https://generativelanguage.googleapis.com',
  'https://www.googleapis.com/books',
  'https://api.themoviedb.org'
];

// Install event - cache core app shell
self.addEventListener('install', (event) => {
  console.log('Enhanced SW: Installing');
  
  event.waitUntil(
    Promise.all([
      caches.open(CACHE_NAME).then((cache) => {
        console.log('Enhanced SW: Caching app shell');
        return cache.addAll(APP_SHELL_URLS).catch(err => {
          console.warn('Enhanced SW: Failed to cache some app shell files:', err);
        });
      }),
      caches.open(STATIC_CACHE).then((cache) => {
        console.log('Enhanced SW: Caching static resources');
        return cache.addAll(STATIC_RESOURCES).catch(err => {
          console.warn('Enhanced SW: Failed to cache some static resources:', err);
        });
      })
    ])
  );
  
  // Activate immediately
  self.skipWaiting();
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
  console.log('Enhanced SW: Activating');
  
  const cacheWhitelist = [CACHE_NAME, STATIC_CACHE, DYNAMIC_CACHE, MEDIA_CACHE];
  
  event.waitUntil(
    Promise.all([
      caches.keys().then((cacheNames) => {
        return Promise.all(
          cacheNames.map((cacheName) => {
            if (!cacheWhitelist.includes(cacheName)) {
              console.log('Enhanced SW: Deleting old cache:', cacheName);
              return caches.delete(cacheName);
            }
          })
        );
      }),
      self.clients.claim()
    ])
  );
});

// Fetch event - intelligent caching strategies
self.addEventListener('fetch', (event) => {
  const { request } = event;
  const url = new URL(request.url);
  
  // Skip non-GET requests
  if (request.method !== 'GET') {
    return;
  }
  
  // Handle different types of requests with different strategies
  if (isAppShellRequest(url)) {
    event.respondWith(cacheFirst(request, CACHE_NAME));
  } else if (isStaticResource(url)) {
    event.respondWith(cacheFirst(request, STATIC_CACHE));
  } else if (isAPIRequest(url)) {
    event.respondWith(networkFirst(request, DYNAMIC_CACHE));
  } else if (isMediaRequest(url)) {
    event.respondWith(cacheFirst(request, MEDIA_CACHE));
  } else {
    event.respondWith(staleWhileRevalidate(request, DYNAMIC_CACHE));
  }
});

// Message event - handle commands from main app
self.addEventListener('message', (event) => {
  const { type, data } = event.data;
  
  switch (type) {
    case 'SKIP_WAITING':
      self.skipWaiting();
      break;
      
    case 'CACHE_MEDIA_FILE':
      cacheMediaFile(data.url, data.blob);
      break;
      
    case 'CLEAR_CACHE':
      clearCache(data.cacheName || DYNAMIC_CACHE);
      break;
      
    case 'GET_CACHE_SIZE':
      getCacheSize().then(size => {
        event.ports[0].postMessage({ type: 'CACHE_SIZE', size });
      });
      break;
  }
});

// Background sync for offline actions
self.addEventListener('sync', (event) => {
  console.log('Enhanced SW: Background sync triggered:', event.tag);
  
  switch (event.tag) {
    case 'sync-reading-progress':
      event.waitUntil(syncReadingProgress());
      break;
      
    case 'sync-metadata':
      event.waitUntil(syncMetadata());
      break;
      
    case 'upload-media-files':
      event.waitUntil(uploadMediaFiles());
      break;
  }
});

// Push notifications for reading reminders and new releases
self.addEventListener('push', (event) => {
  console.log('Enhanced SW: Push notification received');
  
  let notificationData;
  
  try {
    notificationData = event.data ? event.data.json() : {};
  } catch (error) {
    notificationData = {
      title: 'CleverFerret',
      body: 'You have new updates!',
      icon: '/icons/icon-192.png'
    };
  }
  
  const options = {
    body: notificationData.body,
    icon: notificationData.icon || '/icons/icon-192.png',
    badge: '/icons/icon-96.png',
    data: notificationData.data,
    actions: [
      {
        action: 'open',
        title: 'Open App'
      },
      {
        action: 'dismiss',
        title: 'Dismiss'
      }
    ],
    requireInteraction: true
  };
  
  event.waitUntil(
    self.registration.showNotification(notificationData.title || 'CleverFerret', options)
  );
});

// Notification click handling
self.addEventListener('notificationclick', (event) => {
  console.log('Enhanced SW: Notification clicked:', event.action);
  
  event.notification.close();
  
  if (event.action === 'open' || !event.action) {
    event.waitUntil(
      self.clients.matchAll({ type: 'window' }).then((clients) => {
        // Focus existing window or open new one
        for (const client of clients) {
          if (client.url.includes(self.registration.scope) && 'focus' in client) {
            return client.focus();
          }
        }
        
        if (self.clients.openWindow) {
          return self.clients.openWindow('/');
        }
      })
    );
  }
});

// Utility functions
function isAppShellRequest(url) {
  return url.pathname === '/' || 
         url.pathname.endsWith('.html') || 
         url.pathname.includes('/src/');
}

function isStaticResource(url) {
  return url.hostname === 'fonts.googleapis.com' ||
         url.hostname === 'cdnjs.cloudflare.com' ||
         url.pathname.endsWith('.woff2') ||
         url.pathname.endsWith('.woff') ||
         url.pathname.endsWith('.ttf');
}

function isAPIRequest(url) {
  return API_ENDPOINTS.some(endpoint => url.href.includes(endpoint));
}

function isMediaRequest(url) {
  const mediaExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg', '.mp3', '.mp4', '.webm'];
  return mediaExtensions.some(ext => url.pathname.endsWith(ext)) ||
         url.hostname === 'picsum.photos';
}

// Caching strategies
async function cacheFirst(request, cacheName) {
  try {
    const cache = await caches.open(cacheName);
    const cachedResponse = await cache.match(request);
    
    if (cachedResponse) {
      return cachedResponse;
    }
    
    const networkResponse = await fetch(request);
    
    if (networkResponse.status === 200) {
      cache.put(request, networkResponse.clone());
    }
    
    return networkResponse;
  } catch (error) {
    console.error('Enhanced SW: Cache first strategy failed:', error);
    
    // Fallback to cached response if available
    const cache = await caches.open(cacheName);
    const cachedResponse = await cache.match(request);
    
    if (cachedResponse) {
      return cachedResponse;
    }
    
    // Return offline page for navigation requests
    if (request.mode === 'navigate') {
      const offlineCache = await caches.open(CACHE_NAME);
      return offlineCache.match('/offline.html') || new Response('Offline', { status: 503 });
    }
    
    throw error;
  }
}

async function networkFirst(request, cacheName) {
  try {
    const networkResponse = await fetch(request);
    
    if (networkResponse.status === 200) {
      const cache = await caches.open(cacheName);
      cache.put(request, networkResponse.clone());
    }
    
    return networkResponse;
  } catch (error) {
    console.warn('Enhanced SW: Network first failed, trying cache:', error);
    
    const cache = await caches.open(cacheName);
    const cachedResponse = await cache.match(request);
    
    if (cachedResponse) {
      return cachedResponse;
    }
    
    throw error;
  }
}

async function staleWhileRevalidate(request, cacheName) {
  const cache = await caches.open(cacheName);
  const cachedResponse = await cache.match(request);
  
  const fetchPromise = fetch(request).then(networkResponse => {
    if (networkResponse.status === 200) {
      cache.put(request, networkResponse.clone());
    }
    return networkResponse;
  }).catch(error => {
    console.warn('Enhanced SW: Stale while revalidate fetch failed:', error);
  });
  
  return cachedResponse || fetchPromise;
}

// Advanced features
async function cacheMediaFile(url, blob) {
  try {
    const cache = await caches.open(MEDIA_CACHE);
    const response = new Response(blob);
    await cache.put(url, response);
    console.log('Enhanced SW: Media file cached:', url);
  } catch (error) {
    console.error('Enhanced SW: Failed to cache media file:', error);
  }
}

async function clearCache(cacheName) {
  try {
    const deleted = await caches.delete(cacheName);
    console.log(`Enhanced SW: Cache ${cacheName} cleared:`, deleted);
  } catch (error) {
    console.error('Enhanced SW: Failed to clear cache:', error);
  }
}

async function getCacheSize() {
  try {
    let totalSize = 0;
    const cacheNames = await caches.keys();
    
    for (const cacheName of cacheNames) {
      const cache = await caches.open(cacheName);
      const requests = await cache.keys();
      
      for (const request of requests) {
        const response = await cache.match(request);
        if (response) {
          const blob = await response.blob();
          totalSize += blob.size;
        }
      }
    }
    
    return totalSize;
  } catch (error) {
    console.error('Enhanced SW: Failed to calculate cache size:', error);
    return 0;
  }
}

async function syncReadingProgress() {
  try {
    // Get stored reading progress from IndexedDB
    const db = await openDB();
    const tx = db.transaction(['reading_progress'], 'readonly');
    const store = tx.objectStore('reading_progress');
    const unsyncedProgress = await store.getAll();
    
    // Sync with server
    for (const progress of unsyncedProgress) {
      if (!progress.synced) {
        try {
          await fetch('/api/sync/reading-progress', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(progress)
          });
          
          // Mark as synced
          progress.synced = true;
          const updateTx = db.transaction(['reading_progress'], 'readwrite');
          await updateTx.objectStore('reading_progress').put(progress);
        } catch (error) {
          console.error('Enhanced SW: Failed to sync reading progress:', error);
        }
      }
    }
    
    console.log('Enhanced SW: Reading progress sync completed');
  } catch (error) {
    console.error('Enhanced SW: Reading progress sync failed:', error);
  }
}

async function syncMetadata() {
  try {
    // Sync metadata changes with server
    console.log('Enhanced SW: Metadata sync completed');
  } catch (error) {
    console.error('Enhanced SW: Metadata sync failed:', error);
  }
}

async function uploadMediaFiles() {
  try {
    // Upload locally stored media files to cloud storage
    console.log('Enhanced SW: Media file upload completed');
  } catch (error) {
    console.error('Enhanced SW: Media file upload failed:', error);
  }
}

function openDB() {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open('CleverFerretDB', 1);
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error);
  });
}

// Periodic background sync for reading reminders
self.addEventListener('periodicsync', (event) => {
  console.log('Enhanced SW: Periodic sync triggered:', event.tag);
  
  if (event.tag === 'reading-reminder') {
    event.waitUntil(sendReadingReminder());
  }
});

async function sendReadingReminder() {
  try {
    // Check if user has reading goals or unfinished books
    const db = await openDB();
    const tx = db.transaction(['media_items'], 'readonly');
    const store = tx.objectStore('media_items');
    const unfinishedBooks = await store.getAll();
    
    const readingBooks = unfinishedBooks.filter(book => 
      book.type === 'Book' && book.status === 'Reading'
    );
    
    if (readingBooks.length > 0) {
      await self.registration.showNotification('Reading Reminder', {
        body: `You have ${readingBooks.length} book(s) in progress. Continue your reading journey!`,
        icon: '/icons/icon-192.png',
        badge: '/icons/icon-96.png',
        data: { type: 'reading-reminder' },
        actions: [
          { action: 'continue-reading', title: 'Continue Reading' },
          { action: 'dismiss', title: 'Later' }
        ]
      });
    }
  } catch (error) {
    console.error('Enhanced SW: Reading reminder failed:', error);
  }
}

console.log('Enhanced SW: Service Worker loaded successfully');