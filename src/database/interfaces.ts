import type { RowDataPacket, ResultSetHeader } from 'mysql2';

interface City extends RowDataPacket {
  cityId: number;
  cityName: string;
  historyText: string;
  factsText: string;
  cityBanner: string;
}

interface Player extends RowDataPacket {
  playerId: number;
  username: string;
  profilePic: string;
  isPublic: boolean;
  isAdmin: boolean;
}

interface Question extends RowDataPacket {
  questionId: number;
  cityId: number;
  questionText: string;
}

interface AnswerChoice extends RowDataPacket {
  choiceId: number;
  questionId: number;
  choiceText: string;
  isCorrect: boolean;
}

interface Score extends RowDataPacket {
  scoreId: number;
  cityId: number;
  playerId: number;
}
