import {type Response, type Request} from 'express'
import * as Model from "../models/quizModel.js"
import { getCityById, getCityIdByQuestionId } from '../models/cityModel.js';
import { uploadScore } from '../models/scoreModel.js';
import { type Answer, type Question, type ScoreEntry} from "../types.js";

async function returnQuiz(req: Request, res:Response){
    const answerInfo = req.body
    let corrects: number = 0;
    // Take the first 10 elements (corresponding to the answers)
    for(let [_,answerId] of Object.entries(answerInfo).slice(0,10)){
        //Check the answer to see if it is correct
        corrects += Number((await Model.checkCorrectAnswer(Number(answerId))));
    }
    const cityId = (await getCityIdByQuestionId(Number(Object.entries(req.body)[0][0])))
    const userId = req.session.userId

    // Decreases linearly from max to the minimum amount of time then locks in the score multiplier
    function scoreMultiplier(timeRemaining:number, minimum:number): number{
        if(timeRemaining <= minimum) return minimum/30000;
        return timeRemaining/30000
    }

    // Use the amount of corrects then multiply by the multiplier
    const score = corrects*1000*scoreMultiplier(answerInfo["timeRemaining"],10000)
    //console.log(corrects + " " + score + " " + answerInfo["timeRemaining"] + " " + scoreMultiplier(answerInfo["timeRemaining"],10000))
    if(userId){
        uploadScore({
        scoreId:-1, 
        userId: userId, 
        cityId: cityId,
        correctCount: corrects,
        score: score
    } as ScoreEntry)
    }
    res.redirect("leaderboard/" + cityId)
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
    returnQuiz,
    produceQuiz
}