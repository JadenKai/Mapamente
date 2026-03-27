import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import router from './routes/routes.js';
import quizRouter from './routes/quizRoutes.js';


const dirname = path.dirname(fileURLToPath(import.meta.url));

const hostname: string = '0.0.0.0';
const port: number = 3321;

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(dirname, '../', 'views'));
app.use(express.static(path.join(dirname, '../', 'public')));
app.use(express.urlencoded({ extended: true }));
app.use(quizRouter);
app.use(router);
console.log('mounting quizRouter');

app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

