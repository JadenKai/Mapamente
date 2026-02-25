import express, { Request, Response } from 'express';

const hostname: string = '127.0.0.1';
const port: number = 3000;

const app = express();

app.use(express.static('.'));

app.get('/', (_req: Request, res: Response) => {
  res.redirect('/home.html');
});

app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
