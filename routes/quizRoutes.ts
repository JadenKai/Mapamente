import { Router, type Request, type Response } from "express";
import { defaultQuiz, returnQuiz } from "../controllers/quizController.js"
console.log('quizRoutes loaded');
const router = Router();
router.get('/test', defaultQuiz);
console.log('test route registered'); // add this
router.post("/test", returnQuiz);

export default router;