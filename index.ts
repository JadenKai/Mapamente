import express from "express";
import session from "express-session";
import { fileURLToPath } from "url";
import path from "path";
import router from "./routes/routes.js";
import quizRouter from "./routes/quizRoutes.js";
import userRouter from "./routes/userRoutes.js";
import scoreRouter from "./routes/scoreRoutes.js";
import cityRouter from "./routes/cityRoutes.js";
import { findUserById } from "./models/userModel.js";

// UNECESSARY: only needed if running outside of docker.
// try { process.loadEnvFile('.env'); } catch { /* no .env file */ }

const dirname = path.dirname(fileURLToPath(import.meta.url));

// Required hostname is 0.0.0.0 for docker
const hostname: string = "0.0.0.0";
const port: number = 3321;

// Using express
const app = express();

// Using ejs
app.set("view engine", "ejs");
app.set("views", path.join(dirname, "views"));

app.use(express.static(path.join(dirname, "public")));
app.use(express.urlencoded({ extended: true }));

// Initializing Session
const secret = process.env.SESSION_SECRET;
if (!secret) throw new Error("SESSION_SECRET environment variable is not set");
app.use(
  session({
    secret,
    resave: false,
    saveUninitialized: false,
  }),
);

// Expose session to all EJS templates via locals
app.use((req, res, next) => {
  res.locals.session = req.session;
  next();
});

// Decode the stored WebP blob into a base64 data URI so all templates can display it
app.use(async (req, res, next) => {
  if (req.session.userId) {
    const user = await findUserById(req.session.userId);
    if (user?.profilePic) {
      res.locals.profilePicSrc = `data:image/webp;base64,${user.profilePic.toString("base64")}`;
    }
  }
  next();
});

// Use all the routers
app.use(router);
app.use(quizRouter);
app.use(userRouter);
app.use(scoreRouter);
app.use(cityRouter);

// Start the server
app.listen(port, hostname, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
