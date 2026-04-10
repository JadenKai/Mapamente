import {type Response, type Request} from 'express'
import * as Model from "../models/quizModel.js"
import { getCityById } from '../models/cityModel.js';
import { type QuestionEntry, type AnswerEntry, type Answer, type Question} from "../types.js";

async function defaultQuiz(req: Request, res: Response){
    res.render("test")
}

async function returnQuiz(req: Request, res:Response){
    const {info} = req.body
    Model.addQuestion(({questionId: 1,cityId: 2,questionText: "What"} as QuestionEntry))
}

async function produceQuiz(req: Request, res: Response){
    const cityId = Number(req.params['id'] as string);
    const rows = await Model.pollQuizQuestions(cityId);
    let questionOutput: Question[] = []; 
    for(const qEntry of rows){
        const answerEntries = await Model.pollAnswersForQuestion(qEntry.questionId)
        let answerOutput: Answer[] = []
        for(const aEntry of answerEntries){
            answerOutput.push({answerId: aEntry.answerId, answerText: aEntry.answerText})
        }
        questionOutput.push({questionId: qEntry.questionId, questionText: qEntry.questionText, answers: answerOutput})
    }
    res.render('quizTemplate', {quizQuestions: questionOutput, cityName: (await getCityById(cityId)).cityName});
}

export {
    defaultQuiz,
    returnQuiz,
    produceQuiz
}