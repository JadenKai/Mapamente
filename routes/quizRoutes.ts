import { Router, type Request, type Response } from "express";
import * as Controller from "../controllers/quizController.js"
console.log('quizRoutes loaded');
const router = Router();

router.get('/test', Controller.produceQuiz);

router.post("/test/:id", Controller.produceQuiz);

router.get("/quiz/:id", Controller.produceQuiz)

export default router;
