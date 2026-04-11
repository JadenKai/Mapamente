import { Router, type Request, type Response } from "express";
import * as Controller from "../controllers/quizController.js"
console.log('quizRoutes loaded');
const router = Router();

router.post("/test/:id", Controller.produceQuiz);

router.get("/test/:id", Controller.produceQuiz)

router.get("/quiz/:id", Controller.produceQuiz)

router.post("/quizSubmission", Controller.returnQuiz)

export default router;
