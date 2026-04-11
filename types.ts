import type { RowDataPacket } from 'mysql2';

declare module 'express-session' {
  interface SessionData {
    userId: number;
  }
}

interface Answer {
  answerId: number;
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

interface CityEntry extends RowDataPacket {
  cityId: number;
  cityName: string;
  historyText: string;
  factsText: string;
  cityBanner: string;
}

interface UserEntry extends RowDataPacket {
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

interface ScoreEntry extends RowDataPacket {
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
  CityEntry,
  UserEntry,
  QuestionEntry,
  AnswerEntry,
  ScoreEntry
}
