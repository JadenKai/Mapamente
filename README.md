# Mapamente

A trivia site over latin cities

## Setup

### Docker

- `docker compose up` — regular usage
- `docker compose up --build` — only needed when you change `package.json`, `Dockerfile`, or anything that affects the image (adding/removing deps, etc.). For normal code changes, the bind mounts handle it live.
- `docker compose down -v` — only needed when you change `schema.sql` and want the database to re-initialize. MySQL won't re-run the init scripts unless the data volume is wiped.

### 1. Install dependencies

```
npm install
```

### 2. Compile the TypeScript to JavaScript

```
npm run build
```

### 3. Run the server

```
npm start
```

## Credits

- Dana Gingrey
- Kai Rangel
- Paige Grantz
- Sydney Cox
