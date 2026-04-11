import { loginPost, signupPost } from '../controllers/userController.js';
import { Router } from 'express';

const router = Router();

router.post('/addPlayer', signupPost);

router.post('/loginPlayer', loginPost);

export default router;
