import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type ScoreEntry } from "../types.js";

async function uploadScore(score: ScoreEntry): Promise<Boolean> {
    const [result] = await pool.query<ResultSetHeader>
        ("INSERT INTO Score (userId, cityId, correctCount, score) VALUES (?,?,?,?)", 
        [score.userId,score.cityId,score.correctCount,score.score]);
    return result.affectedRows === 1;
}

async function pullTop10OfUser(userId: number): Promise<ScoreEntry[]>{
    const rows = (await pool.query<ScoreEntry[]>("SELECT userId, cityId, MAX(score) as score " + 
        "FROM Score WHERE userId = ? GROUP BY cityId ORDER BY score DESC LIMIT 10;",userId))[0];
    return(rows);
}

async function pullTop10OfCity(userId: number): Promise<ScoreEntry[]>{
    const rows = (await pool.query<ScoreEntry[]>("SELECT userId, cityId, MAX(score) as score " + 
        "FROM Score WHERE cityId = ? GROUP BY userId ORDER BY score DESC LIMIT 10;",userId))[0];
    return(rows);
}

export {
    uploadScore,
    pullTop10OfUser,
    pullTop10OfCity
}