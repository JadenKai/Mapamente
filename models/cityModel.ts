import pool from "../config/database.js";

import { type CityEntry , type QuestionEntry} from "../types.js";

async function getCityById(cityId: number): Promise<CityEntry> {
    const result = (await pool.query<CityEntry[]>("SELECT * FROM City WHERE cityId = ?", cityId))[0];
    return(result[0])
}

async function getCityIdByQuestionId(questionId: number): Promise<number>{
    const result = (await pool.query<QuestionEntry[]>("SELECT * FROM Question WHERE questionId = ?", questionId))[0];
    return(result[0].cityId);
}

export {
    getCityById,
    getCityIdByQuestionId
}