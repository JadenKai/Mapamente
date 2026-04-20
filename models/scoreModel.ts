import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type ScoreEntry } from "../types.js";

//Function to intake a scoreentry and upload it into the database
async function uploadScore(score: ScoreEntry): Promise<Boolean> {
    //Decompose the input into its components and upload through ? form
    const [result] = await pool.query<ResultSetHeader>
        ("INSERT INTO Score (userId, cityId, correctCount, score) VALUES (?,?,?,?)", 
        [score.userId,score.cityId,score.correctCount,score.score]);
    //Return true if accepted, false otherwise
    return result.affectedRows === 1;
}


//Function to pull the top 10 scores of a user, no repeating cities
async function pullTop10OfUser(userId: number): Promise<ScoreEntry[]>{
    const rows = (await pool.query<ScoreEntry[]>("SELECT userId, cityId, MAX(score) as score " + 
        "FROM Score WHERE userId = ? GROUP BY cityId ORDER BY score DESC LIMIT 10;",userId))[0];
    return(rows);
}

//Function to pull the top 10 scores of a city, no repeating users, overcomplicated but its fine
async function pullTop10OfCity(cityId: number): Promise<ScoreEntry[]>{
    const rows = (await pool.query<ScoreEntry[]>(
        `SELECT s.userId, s.cityId, s.correctCount, s.score
         FROM Score s
         INNER JOIN (
             SELECT userId, MAX(score) as maxScore
             FROM Score WHERE cityId = ? GROUP BY userId
         ) m ON s.userId = m.userId AND s.score = m.maxScore
         WHERE s.cityId = ?
         ORDER BY s.score DESC LIMIT 10`,
        [cityId, cityId]
    ))[0];
    return(rows);
}

export {
    uploadScore,
    pullTop10OfUser,
    pullTop10OfCity
}