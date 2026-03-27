import type { RowDataPacket, ResultSetHeader } from 'mysql2';

interface Answer {
  answerID: number;
  answerText: string;
}

interface Question {
  questionId: number;
  questionText: string;
  answers: Answer[];
}

interface UserResponse {
  questionId: number;
  answerId: number;
}

interface City extends RowDataPacket {
  cityId: number;
  cityName: string;
  historyText: string;
  factsText: string;
  cityBanner: string;
}

interface User extends RowDataPacket {
  userId: number;
  username: string;
  passwordHash: string;
  profilePic: string;
  isPublic: boolean;
  isAdmin: boolean;
  themeLight: boolean;
}

interface QuestionEntry extends RowDataPacket {
  questionId: number;
  cityId: number;
  questionText: string;
}

interface AnswerEntry extends RowDataPacket {
  answerId: number;
  questionId: number;
  choiceText: string;
  isCorrect: boolean;
}

interface Score extends RowDataPacket {
  scoreId: number;
  userId: number;
  cityId: number;
  correctCount: number;
  score: number;
}

export {
  Answer,
  Question,
  UserResponse,
  City,
  User,
  QuestionEntry,
  AnswerEntry,
  Score
}