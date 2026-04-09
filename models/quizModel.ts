import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type QuestionEntry, type AnswerEntry, type Question } from "../types.js";

async function addQuestion(question: QuestionEntry): Promise<boolean> {
    const [result] = await pool.query<ResultSetHeader>("INSERT INTO Question VALUES (?,?,?)", [question.questionId,question.cityId,question.questionText]);
    return result.affectedRows === 1;
}

async function getQuestionById(qId: number): Promise<QuestionEntry> {
    const rows = (await pool.query("SELECT * FROM Question WHERE questionId = ?", [qId]))[0];
    return (rows as unknown as QuestionEntry);
}

async function generateQuiz(cityID: number): Promise<Question[]>{
    const rows = (await pool.query("SELECT * FROM Question WHERE cityId = ? ORDER BY RAND() LIMIT 10;",[cityID]))[0];
    console.log(rows);
    return([{questionId:5,questionText:"hi", answers:[]}]);
}

export {
    addQuestion,
    getQuestionById,
    generateQuiz
}