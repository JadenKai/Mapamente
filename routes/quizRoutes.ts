import { Router } from "express";
import * as Controller from "../controllers/quizController.js"
const router = Router();

router.get("/quiz/:id", Controller.produceQuiz)

router.post("/quizSubmission", Controller.returnQuiz)

export default router;
