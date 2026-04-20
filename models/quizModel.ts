import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type QuestionEntry, type AnswerEntry} from "../types.js";

async function addQuestion(question: QuestionEntry): Promise<boolean> {
    const [result] = await pool.query<ResultSetHeader>("INSERT INTO Question VALUES (?,?,?)", [question.questionId,question.cityId,question.questionText]);
    return result.affectedRows === 1;
}

async function getQuestionById(qId: number): Promise<QuestionEntry> {
    const rows = (await pool.query("SELECT * FROM Question WHERE questionId = ?", [qId]))[0];
    return (rows as unknown as QuestionEntry);
}

async function pollQuizQuestions(cityId: number): Promise<QuestionEntry[]>{
    const rows = (await pool.query<QuestionEntry[]>("SELECT * FROM Question WHERE cityId = ? ORDER BY RAND() LIMIT 10;",[cityId]))[0];
    return(rows);
}

async function pollAnswersForQuestion(questionId: number): Promise<AnswerEntry[]>{
    const rows = (await pool.query<AnswerEntry[]>("SELECT * FROM Answer WHERE questionId = ? ORDER BY RAND();", questionId))[0];
    return(rows);
}

async function checkCorrectAnswer(answerId: number): Promise<Boolean>{
    if(!answerId){
        return false;
    }
    const result = (await pool.query<AnswerEntry[]>("SELECT * FROM Answer WHERE answerId = ?", answerId))[0];
    return result[0].isCorrect
}

export {
    addQuestion,
    getQuestionById,
    pollQuizQuestions,
    pollAnswersForQuestion,
    checkCorrectAnswer
}
