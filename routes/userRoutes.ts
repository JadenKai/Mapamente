import { loginPost, signupPost } from '../controllers/userController.js';
import { Router, type Request, type Response } from 'express';

const router = Router();

router.post('/addPlayer', signupPost);

router.post('/loginPlayer', loginPost);

export default router;
