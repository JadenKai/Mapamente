import { Router } from "express";
import * as Controller from "../controllers/cityController.js"
console.log('quizRoutes loaded');
const router = Router();

router.get("/city/:id", Controller.supplyCity)

export default router;
