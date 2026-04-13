import {type Response, type Request} from 'express'
import * as Model from "../models/quizModel.js"
import { getCityById, getCityIdByQuestionId } from '../models/cityModel.js';
import { uploadScore } from '../models/scoreModel.js';
import { type Answer, type Question, type ScoreEntry} from "../types.js";

async function defaultQuiz(req: Request, res: Response){
    res.render("test")
}

async function returnQuiz(req: Request, res:Response){
    const answerInfo = req.body
    let corrects: number = 0;
    for(let [_,answerId] of Object.entries(answerInfo)){
        corrects = corrects + Number((await Model.checkCorrectAnswer(Number(answerId))));
    }

    uploadScore({
        scoreId:-1, 
        userId:req.session.userId, 
        cityId:(await getCityIdByQuestionId(Number(Object.entries(req.body)[0][0]))),
        correctCount: corrects,
        score: corrects*1000
    } as ScoreEntry)
    res.redirect("wip")
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