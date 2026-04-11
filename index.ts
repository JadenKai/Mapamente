import express from 'express';
import session from 'express-session';
import { fileURLToPath } from 'url';
import path from 'path';
import router from './routes/routes.js';
import quizRouter from './routes/quizRoutes.js';
import userRouter from './routes/userRoutes.js';

// UNECESSARY: only needed if running outside of docker.
// try { process.loadEnvFile('.env'); } catch { /* no .env file */ }

const dirname = path.dirname(fileURLToPath(import.meta.url));

const hostname: string = '0.0.0.0';
const port: number = 3321;

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(dirname, 'views'));

app.use(express.static(path.join(dirname, 'public')));
app.use(express.urlencoded({ extended: true }));

const secret = process.env.SESSION_SECRET;
if (!secret) throw new Error("SESSION_SECRET environment variable is not set");
app.use(session({
  secret,
  resave: false,
  saveUninitialized: false,
}));

// Expose session to all EJS templates via locals
app.use((req, res, next) => {
  res.locals.session = req.session;
  next();
});

app.use(router);
app.use(quizRouter);
app.use(userRouter);

app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
