import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import { ErrorBoundary } from './components/ErrorBoundary';
import { Logger } from './utils/Logger';

// Initialize the database on app start with error handling
import { db } from './services/database';
db.open()
  .then(() => {
    Logger.info('Database initialized successfully');
  })
  .catch((error) => {
    Logger.error('Failed to initialize database:', error);
    // App can still function in degraded mode without database
  });

// Register service worker for PWA functionality
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker
      .register('./sw.js')
      .then((registration) => {
        Logger.info('Service Worker registered successfully');

        // Listen for updates
        if (registration.waiting) {
          registration.waiting.postMessage({ type: 'SKIP_WAITING' });
        }
        registration.addEventListener('updatefound', () => {
          const newWorker = registration.installing;
          if (newWorker) {
            newWorker.addEventListener('statechange', () => {
              if (newWorker.state === 'installed' && navigator.serviceWorker.controller) {
                Logger.info('New Service Worker content available, reloading...');
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
      .catch((error) => {
        Logger.error('Service Worker registration failed:', error);
      });
  });
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <ErrorBoundary>
      <App />
    </ErrorBoundary>
  </React.StrictMode>,
);
