import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import { resolve } from "path";

export default defineConfig({
  server: {
    port: 3000,
  },
  plugins: [react()],
  build: {
    // Carpeta de salida estándar
    outDir: "dist",
    // Usar index.html como entrada (SPA)
    rollupOptions: {
      input: resolve(__dirname, "index.html"),
    },
    sourcemap: true,
    emptyOutDir: true,
  },
});
