import { returnQuiz, produceQuiz } from "../../controllers/quizController.js";

jest.mock("../../models/quizModel.js");
jest.mock("../../models/cityModel.js");
jest.mock("../../models/scoreModel.js");

import * as quizModel from "../../models/quizModel.js";
import { getCityById, getCityIdByQuestionId } from "../../models/cityModel.js";
import { uploadScore } from "../../models/scoreModel.js";

const mockCheckCorrectAnswer =
  quizModel.checkCorrectAnswer as jest.MockedFunction<
    typeof quizModel.checkCorrectAnswer
  >;
const mockPollQuizQuestions =
  quizModel.pollQuizQuestions as jest.MockedFunction<
    typeof quizModel.pollQuizQuestions
  >;
const mockPollAnswersForQuestion =
  quizModel.pollAnswersForQuestion as jest.MockedFunction<
    typeof quizModel.pollAnswersForQuestion
  >;
const mockGetCityById = getCityById as jest.MockedFunction<typeof getCityById>;
const mockGetCityIdByQuestionId = getCityIdByQuestionId as jest.MockedFunction<
  typeof getCityIdByQuestionId
>;
const mockUploadScore = uploadScore as jest.MockedFunction<typeof uploadScore>;

function makeReq(overrides: Record<string, unknown> = {}): any {
  return { body: {}, params: {}, session: {}, ...overrides };
}

function makeRes(): any {
  return { render: jest.fn(), redirect: jest.fn() };
}

// ScoreMultiplier is a private nested function inside returnQuiz, so these tests
// Exercise it indirectly by asserting the score value passed to uploadScore.
describe("returnQuiz", () => {
  beforeEach(() => jest.clearAllMocks());

  it("scores correctly when time is above the 10000ms minimum", async () => {
    const req = makeReq({
      body: { "1": "10", "2": "20", timeRemaining: 20000 },
      session: { userId: 5 },
    });
    const res = makeRes();

    mockCheckCorrectAnswer.mockResolvedValue(1 as any);
    mockGetCityIdByQuestionId.mockResolvedValue(3 as any);
    mockUploadScore.mockResolvedValue(true);

    await returnQuiz(req, res);

    // 2 correct * 1000 * (20000/30000)
    const expectedScore = 2 * 1000 * (20000 / 30000);
    expect(mockUploadScore).toHaveBeenCalledWith(
      expect.objectContaining({
        correctCount: 2,
        score: expectedScore,
        userId: 5,
        cityId: 3,
      }),
    );
    expect(res.render).toHaveBeenCalledWith(
      "landing",
      expect.objectContaining({ scoreEntry: expect.any(Object) }),
    );
  });

  it("applies the floor multiplier when timeRemaining is at or below 10000ms", async () => {
    const req = makeReq({
      body: { "1": "10", timeRemaining: 5000 },
      session: { userId: 5 },
    });
    const res = makeRes();

    mockCheckCorrectAnswer.mockResolvedValue(1 as any);
    mockGetCityIdByQuestionId.mockResolvedValue(2 as any);
    mockUploadScore.mockResolvedValue(true);

    await returnQuiz(req, res);

    // floor: minimum(10000) / 30000
    const expectedScore = 1 * 1000 * (10000 / 30000);
    expect(mockUploadScore).toHaveBeenCalledWith(
      expect.objectContaining({ score: expectedScore }),
    );
  });

  it("does not upload score when no user session exists", async () => {
    const req = makeReq({
      body: { "1": "10", timeRemaining: 15000 },
      session: {},
    });
    const res = makeRes();

    mockCheckCorrectAnswer.mockResolvedValue(1 as any);
    mockGetCityIdByQuestionId.mockResolvedValue(2 as any);

    await returnQuiz(req, res);

    expect(mockUploadScore).not.toHaveBeenCalled();
    expect(res.render).toHaveBeenCalledWith("landing", expect.any(Object));
  });

  it("skips the timeRemaining field when counting correct answers", async () => {
    const req = makeReq({
      body: { "1": "10", "2": "20", timeRemaining: 15000 },
      session: { userId: 1 },
    });
    const res = makeRes();

    mockCheckCorrectAnswer.mockResolvedValue(1 as any);
    mockGetCityIdByQuestionId.mockResolvedValue(1 as any);
    mockUploadScore.mockResolvedValue(true);

    await returnQuiz(req, res);

    expect(mockCheckCorrectAnswer).toHaveBeenCalledTimes(2);
  });

  it("records zero corrects when all answers are wrong", async () => {
    const req = makeReq({
      body: { "1": "10", "2": "20", timeRemaining: 25000 },
      session: { userId: 2 },
    });
    const res = makeRes();

    mockCheckCorrectAnswer.mockResolvedValue(0 as any);
    mockGetCityIdByQuestionId.mockResolvedValue(1 as any);
    mockUploadScore.mockResolvedValue(true);

    await returnQuiz(req, res);

    expect(mockUploadScore).toHaveBeenCalledWith(
      expect.objectContaining({ correctCount: 0, score: 0 }),
    );
  });
});

describe("produceQuiz", () => {
  beforeEach(() => jest.clearAllMocks());

  it("renders quizTemplate with questions and city name", async () => {
    const req = makeReq({ params: { id: "1" } });
    const res = makeRes();

    mockPollQuizQuestions.mockResolvedValue([
      { questionId: 1, questionText: "What is the capital?", cityId: 1 } as any,
    ]);
    mockPollAnswersForQuestion.mockResolvedValue([
      { answerId: 1, answerText: "Paris" } as any,
      { answerId: 2, answerText: "London" } as any,
    ]);
    mockGetCityById.mockResolvedValue({
      cityName: "TestCity",
      cityId: 1,
    } as any);

    await produceQuiz(req, res);

    expect(res.render).toHaveBeenCalledWith("quizTemplate", {
      quizQuestions: [
        {
          questionId: 1,
          questionText: "What is the capital?",
          answers: [
            { answerId: 1, answerText: "Paris" },
            { answerId: 2, answerText: "London" },
          ],
        },
      ],
      cityName: "TestCity",
    });
  });

  it("fetches answers for each question independently", async () => {
    const req = makeReq({ params: { id: "2" } });
    const res = makeRes();

    mockPollQuizQuestions.mockResolvedValue([
      { questionId: 10, questionText: "Q1?", cityId: 2 } as any,
      { questionId: 11, questionText: "Q2?", cityId: 2 } as any,
    ]);
    mockPollAnswersForQuestion.mockResolvedValue([
      { answerId: 99, answerText: "A" } as any,
    ]);
    mockGetCityById.mockResolvedValue({ cityName: "City2", cityId: 2 } as any);

    await produceQuiz(req, res);

    expect(mockPollAnswersForQuestion).toHaveBeenCalledTimes(2);
    expect(mockPollAnswersForQuestion).toHaveBeenCalledWith(10);
    expect(mockPollAnswersForQuestion).toHaveBeenCalledWith(11);
  });
});
