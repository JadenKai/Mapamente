import {type Response, type Request} from 'express'
import * as Model from "../models/scoreModel.js"
import { findUserById } from '../models/userModel.js';
import {type ScoreEntry, type Score} from "../types.js";
import { getCityById } from '../models/cityModel.js';



async function supply10FromCity(req: Request, res: Response){
    const cityId = Number(req.params['id'] as string);
    const top10 = (await Model.pullTop10OfCity(cityId)).map(entry => convertScoreEntryToScore(entry));
    res.render('leaderboardTemplate', {scores:top10,cityName: (await getCityById(cityId)).cityName});
}

async function getTop10OfUser(userId:number): Promise<Score[]> {
    return Promise.all((await Model.pullTop10OfUser(userId)).map(entry => convertScoreEntryToScore(entry)));
}

async function convertScoreEntryToScore(entry: ScoreEntry): Promise<Score>{
    return {username: (await findUserById(entry.userId))!.username, correctCount: entry.correctCount, 
        score: entry.score, cityName: (await getCityById(entry.cityId)).cityName}
}

export {
    supply10FromCity,
    getTop10OfUser
}
