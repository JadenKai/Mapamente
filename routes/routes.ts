import { Router, type Request, type Response } from 'express';

const router = Router();

router.get('/', (_req: Request, res: Response) => {
  res.redirect('/home');
});

router.get('/home', (_req: Request, res: Response) => {
  console.log('home route hit')
  res.render('home');
});

router.get('/cities', (_req: Request, res: Response) => {
  res.render('cities');
});

router.get('/madrid/wiki', (_req: Request, res: Response) => {
  res.render('madridWiki');
});

router.get('/madrid/quiz', (_req: Request, res: Response) => {
  res.render('madridQuiz');
});

router.get('/profile', (_req: Request, res: Response) => {
  res.render('profile');
});

export default router;
