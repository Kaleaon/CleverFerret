import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';

// Initialize the database on app start
import { db } from './services/database';
db.open().catch((error) => {
  console.error('Failed to initialize database:', error);
});

// Register service worker for PWA functionality
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker
      .register('./sw.js')
      .then((registration) => {
        console.log('SW registered: ', registration);

        // Listen for updates
        if (registration.waiting) {
          registration.waiting.postMessage({ type: 'SKIP_WAITING' });
        }
        registration.addEventListener('updatefound', () => {
          const newWorker = registration.installing;
          if (newWorker) {
            newWorker.addEventListener('statechange', () => {
              if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
                // New content available; prompt refresh or auto-reload
                console.log('New content is available; refreshing');
                newWorker.postMessage({ type: 'SKIP_WAITING' });
                window.location.reload();
              }
            });
          }
        });

        // Handle navigation messages from SW (e.g., notification clicks)
        navigator.serviceWorker.addEventListener('message', (event) => {
          if (event.data?.type === 'NAVIGATE' && typeof event.data.url === 'string') {
            window.location.assign(event.data.url);
          }
        });
      })
      .catch((registrationError) => {
        console.log('SW registration failed: ', registrationError);
      });
  });
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
