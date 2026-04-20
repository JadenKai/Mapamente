import { Router } from "express";
import * as Controller from "../controllers/cityController.js"
const router = Router();

//Load the wiki page using city information.
router.get("/wiki/:id", Controller.supplyCity)

export default router;
