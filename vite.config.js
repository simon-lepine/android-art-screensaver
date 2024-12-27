import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import path from 'path';
const timestamp = Math.round(Date.now() / 1000);

// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    alias: {
      '~': path.resolve(__dirname, './src'),
      '~classes': path.resolve(__dirname, '/common/classes'),
      '~common': path.resolve(__dirname, '/common'),
      '~shared': path.resolve(__dirname, '/common/shared_components'),
    },
  },
  plugins: [svelte()],
  build: {
    rollupOptions: {
      output: {
        assetFileNames: `[name]-[hash][extname]`,
        chunkFileNames: '[name]-[hash].js',
        entryFileNames: '[name]-' + timestamp + '.js',
      },
    },
  },
});
