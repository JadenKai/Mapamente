import { Router, type Request, type Response } from "express";
import * as Controller from "../controllers/scoreController.js";
const router = Router();

// Load the leaderboard given a city id.
router.get("/leaderboard/:id", Controller.supply10FromCityAndPersonalBest);

router.get("/home", Controller.homePage);

router.get("/", (_req: Request, res: Response) => {
  res.redirect("/home");
});

export default router;
