import {type Response, type Request} from 'express'
import {addQuestion} from "../models/quizModel.js"
import { type QuestionEntry, type AnswerEntry } from "../types.js";

async function defaultQuiz(req: Request, res: Response){
    console.log('test route hit')
    res.render("test")
}

async function returnQuiz(req: Request, res:Response){
    const {info} = req.body
    addQuestion(({questionId: 1,cityId: 2,questionText: "What"} as QuestionEntry))
}

export {
    defaultQuiz,
    returnQuiz
}