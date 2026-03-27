import pool from "../config/database.js";

import { type QuestionEntry, type AnswerEntry } from "../types.js";

async function addQuestion(question: QuestionEntry): Promise<boolean> {
    try {
        await pool.query("INSERT INTO Question VALUES ? ", [question.questionId,question.cityId,question.questionText]);
        return true;
    } catch (err) {
        console.error("addQuestion Failed: ", err)
        throw err;
    }
}

async function getQuestionById(qId: number): Promise<QuestionEntry> {
    try {
        const rows = (await pool.query("SELECT * FROM Question WHERE questionId = ?", [qId]))[0];
        
        return (rows as unknown as QuestionEntry);
    } catch(err) {
        console.error("getQuestionById Failed: ", err)
        throw err;
    }
}




export {
    addQuestion,
    getQuestionById
}