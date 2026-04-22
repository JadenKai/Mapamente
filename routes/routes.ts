//Archaic File, in theory this should be replaced at some point.

import { Router, type Request, type Response } from 'express';
import { profileGet } from '../controllers/userController.js';

const router = Router();

router.get('/wip', (_req: Request, res: Response) => {
  res.render('wip');
});

router.get('/', (_req: Request, res: Response) => {
  res.redirect('/home');
});

router.get('/home', (_req: Request, res: Response) => {
  res.render('home');
});

router.get('/login', (_req: Request, res: Response) => {
  res.render('login');
});

router.get('/signup', (_req: Request, res: Response) => {
  res.render('signup');
});

router.get('/quiz', (_req: Request, res: Response) => {
  res.render('quizTemplate');
});

router.get('/madrid/wiki', (_req: Request, res: Response) => {
  res.render('madridWiki');
});

router.get('/madrid/quiz', (_req: Request, res: Response) => {
  res.render('madridQuiz');
});

router.get('/profile', profileGet);


export default router;
