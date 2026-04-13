import { Router, type Request, type Response } from "express";
import * as Controller from "../controllers/scoreController.js"
const router = Router();

router.get("/leaderboard/:id", Controller.supply10FromCity)


export default router;
