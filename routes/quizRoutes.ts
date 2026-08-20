import { Router } from "express";
import * as Controller from "../controllers/quizController.js";
const router = Router();

// Load the quiz given a specific city id.
router.get("/quiz/:id", Controller.produceQuiz);

// Process the score and submit it into the database, returning from quiz/:id
router.post("/quizSubmission", Controller.returnQuiz);

export default router;
