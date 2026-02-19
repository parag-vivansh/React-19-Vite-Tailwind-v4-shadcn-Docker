# React 19 + Tailwind v4 (Docker)

A React 19 app with TypeScript, Vite, and Tailwind CSS v4, set up for development and production with Docker.

## Tech stack

- **React 19** with TypeScript  
- **Vite 7** (dev server & build)  
- **Tailwind CSS v4** (with `@tailwindcss/vite`)  
- **Docker** (Node 22 Alpine for dev, nginx for production)

## Prerequisites

- **Local dev:** Node.js 22+, Yarn  
- **Docker:** Docker and Docker Compose

---

## Quick start

### Option 1: Local (no Docker)

```bash
yarn install
yarn dev
```

App: [http://localhost:5173](http://localhost:5173)

### Option 2: Docker (development)

```bash
docker compose build --no-cache frontend
docker compose up -d frontend
```

App: [http://localhost:5173](http://localhost:5173)  
Dependencies are installed at first run into the container volume (image stays small).

### Option 3: Docker (production build)

Small image (~50–80 MB): nginx + built static files only.

```bash
docker compose -f docker-compose.prod.yml build --no-cache
docker compose -f docker-compose.prod.yml up -d
```

App: [http://localhost:80](http://localhost:80)

---

## Scripts

| Command        | Description              |
|----------------|--------------------------|
| `yarn dev`     | Start Vite dev server    |
| `yarn build`   | TypeScript + Vite build  |
| `yarn preview` | Preview production build |
| `yarn lint`    | Run ESLint               |
| `yarn format`  | Format with Prettier     |

---

## Docker details

- **Development:** `target: development` — Node 22 Alpine; `node_modules` live in a volume (installed on first start).  
- **Production:** `target: production` — Multi-stage build; final image is `nginx:alpine` + `dist/` only.  
- **Rebuild after Dockerfile changes:**  
  `docker compose build --no-cache frontend && docker compose up -d frontend`

---

## Further configuration

- **React Compiler:** Not enabled by default. See [React Compiler installation](https://react.dev/learn/react-compiler/installation) to add it.  
- **ESLint:** For type-aware rules, use `tseslint.configs.recommendedTypeChecked` (or `strictTypeChecked`) in `eslint.config.js` and set `parserOptions.project` to your tsconfig files.
