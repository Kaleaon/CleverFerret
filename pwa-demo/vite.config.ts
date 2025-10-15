/// <reference types="vitest" />
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
// PWA is handled via custom public/sw.js and public/manifest.json

export default defineConfig({
  base: '/',
  plugins: [react()],
  server: {
    port: 5000,
    host: '0.0.0.0',
    hmr: {
      port: 5000,
    },
  },
  build: {
    outDir: 'dist',
    sourcemap: true,
  },
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: './src/test/setup.ts',
  },
});
