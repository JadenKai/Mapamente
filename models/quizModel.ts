import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type QuestionEntry, type AnswerEntry} from "../types.js";

//Function to intake a QuestionEntry and upload it to the database, returns true if the database accepts the data, false otherwise.
async function addQuestion(question: QuestionEntry): Promise<boolean> {
    const [result] = await pool.query<ResultSetHeader>("INSERT INTO Question VALUES (?,?,?)", [question.questionId,question.cityId,question.questionText]);
    return result.affectedRows === 1;
}

//Pull the question from the table based on the id number
async function getQuestionById(qId: number): Promise<QuestionEntry> {
    const rows = (await pool.query<QuestionEntry[]>("SELECT * FROM Question WHERE questionId = ?", [qId]))[0];
    return (rows[0]);
}

//Pull 10 questions from the database of questions for a city, at random
async function pollQuizQuestions(cityId: number): Promise<QuestionEntry[]>{
    const rows = (await pool.query<QuestionEntry[]>("SELECT * FROM Question WHERE cityId = ? ORDER BY RAND() LIMIT 10;",[cityId]))[0];
    return(rows);
}

//Pull all the answers given a questionId
async function pollAnswersForQuestion(questionId: number): Promise<AnswerEntry[]>{
    const rows = (await pool.query<AnswerEntry[]>("SELECT * FROM Answer WHERE questionId = ? ORDER BY RAND();", questionId))[0];
    return(rows);
}

//Function to intake an answer and return if it is correct or not
async function checkCorrectAnswer(answerId: number): Promise<Boolean>{
    //If answerId is undefined, return false (in case they didn't answer the question)
    if(!answerId){
        return false;
    }
    //otherwise poll the answerEntry from the database
    const result = (await pool.query<AnswerEntry[]>("SELECT * FROM Answer WHERE answerId = ?", answerId))[0];
    //and check if it is correct
    return result[0].isCorrect
}

export {
    addQuestion,
    getQuestionById,
    pollQuizQuestions,
    pollAnswersForQuestion,
    checkCorrectAnswer
}
