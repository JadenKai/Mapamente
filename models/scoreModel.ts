import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type ScoreEntry } from "../types.js";

async function uploadScore(score: ScoreEntry): Promise<Boolean> {
    const [result] = await pool.query<ResultSetHeader>
        ("INSERT INTO Score (userId, cityId, correctCount, score) VALUES (?,?,?,?)", 
        [score.userId,score.cityId,score.correctCount,score.score]);
    return result.affectedRows === 1;
}

export {
    uploadScore
}