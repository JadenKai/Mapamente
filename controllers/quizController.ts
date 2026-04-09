import {type Response, type Request} from 'express'
import * as Model from "../models/quizModel.js"
import { type QuestionEntry, type AnswerEntry } from "../types.js";

async function defaultQuiz(req: Request, res: Response){
    res.render("test")
}

async function returnQuiz(req: Request, res:Response){
    const {info} = req.body
    Model.addQuestion(({questionId: 1,cityId: 2,questionText: "What"} as QuestionEntry))
}

async function produceQuiz(req: Request, res: Response){
    const cityID = Number(req.params['id'] as string);
    const questions = await Model.generateQuiz(cityID);
    res.render('test');
}

export {
    defaultQuiz,
    returnQuiz,
    produceQuiz
}