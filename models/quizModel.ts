const pool = require("../config/database.ts")
import {type QuestionEntry, type AnswerEntry} from "../types.js";

async function getQuestionByID(qID:number): Promise<QuestionEntry>{
    try{
        var all = (await pool.query("SELECT * FROM Question WHERE questionID"))[0]
        return all;
    }catch(err){
        console.error("getIngredients Failed: ", err)
        throw err;
    }
}

export {
    getQuestionByID
}