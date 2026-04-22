import { Router } from "express";
import * as Controller from "../controllers/scoreController.js"
const router = Router();

//Load the leaderboard given a city id.
router.get("/leaderboard/:id", Controller.supply10FromCityAndPersonalBest)

export default router;
