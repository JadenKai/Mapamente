# Mapamente

A trivia site over latin cities

## Setup

### Using docker

- `docker compose up` — regular usage
- `docker compose up --build` — only needed when you change `package.json`, `Dockerfile`, or anything that affects the image (adding/removing deps, etc.). For normal code changes, the bind mounts handle it live.
- `docker compose down -v` — only needed when you change `schema.sql` and want the database to re-initialize. MySQL won't re-run the init scripts unless the data volume is wiped.

### Not using docker

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

## Testing

Tests are written with Jest and ts-jest. No database or running server is needed — all external dependencies are mocked.

```
npm test
```

Test files live in `__tests__/` and mirror the source layout:

- `controllers/quizController.test.ts` — quiz generation and score submission logic
- `controllers/scoreController.test.ts` — leaderboard, personal best, and homepage scores
- `controllers/userController.test.ts` — signup, login, and profile auth flows
- `models/scoreModel.test.ts` — score upload branching logic and query functions

## Credits

- Dana Gingrey
- Kai Rangel
- Paige Grantz
- Sydney Cox
