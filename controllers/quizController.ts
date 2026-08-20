import { type Response, type Request } from "express";
import * as Model from "../models/quizModel.js";
import { getCityById, getCityIdByQuestionId } from "../models/cityModel.js";
import { uploadScore } from "../models/scoreModel.js";
import { type Answer, type Question, type ScoreEntry } from "../types.js";

// Function to be called when a quiz is submitted
async function returnQuiz(req: Request, res: Response) {
  // Get the info
  const answerInfo = req.body;
  // Initialize value to store the amount of correct answers
  let corrects: number = 0;
  // Take the first 10 elements (corresponding to the answers)
  for (let [questionId, answerId] of Object.entries(answerInfo)) {
    // Verify that the field is a propery answer to be checked
    if (questionId === "timeRemaining") continue;
    // Check the answer in the database to see if it is correct
    corrects += Number(await Model.checkCorrectAnswer(Number(answerId)));
  }
  // Get the cityId from the first answer's question that is returned, should be the city
  const cityId = await getCityIdByQuestionId(
    Number(Object.entries(req.body)[0][0]),
  );
  // Get the userId from the current session
  const userId = req.session.userId;
  // Decreases linearly from max to the minimum amount of time (in ms) then locks in the score multiplier
  function scoreMultiplier(timeRemaining: number, minimum: number): number {
    if (timeRemaining <= minimum) return minimum / 30000;
    return timeRemaining / 30000;
  }
  // Use the amount of corrects then multiply by the multiplier
  const score =
    corrects * 1000 * scoreMultiplier(answerInfo["timeRemaining"], 10000);
  // Build the scoreEntry for the calculated information
  const scoreEntry: ScoreEntry = {
    scoreId: -1,
    userId: userId,
    cityId: cityId,
    correctCount: corrects,
    score: score,
    timeCompleted: 30000 - answerInfo["timeRemaining"],
    isPublic: true, //change later
  } as ScoreEntry;
  // If the user is logged in, upload it as that user
  if (userId) {
    await uploadScore(scoreEntry);
  }
  // Send them to the landing page
  res.render("landing", { scoreEntry });
}

// Generate a quiz for the system to use when accessing quiz/:id
async function produceQuiz(req: Request, res: Response) {
  // Get the city id from the url
  const cityId = Number(req.params["id"] as string);
  // Get 10 random quiz questions from the model
  const rows = await Model.pollQuizQuestions(cityId);
  // Construct output array
  let questionOutput: Question[] = [];
  // For each questionEntry
  for (const qEntry of rows) {
    // Get all the answers for the question based on the id
    const answerEntries = await Model.pollAnswersForQuestion(qEntry.questionId);
    // Build the answer array to pass into the question
    let answerOutput: Answer[] = [];
    // For each of the answers
    for (const aEntry of answerEntries) {
      // Build an Answer from AnswerEntry and add it to the list
      answerOutput.push({
        answerId: aEntry.answerId,
        answerText: aEntry.answerText,
      });
    }
    // Build a Question from QuestionEntry and the answer array we build
    questionOutput.push({
      questionId: qEntry.questionId,
      questionText: qEntry.questionText,
      answers: answerOutput,
    });
  }
  // Render the quiz template passing through the array of questions and the cityname by polling the city
  res.render("quizTemplate", {
    quizQuestions: questionOutput,
    cityName: (await getCityById(cityId)).cityName,
  });
}

// Export our functions
export { returnQuiz, produceQuiz };
