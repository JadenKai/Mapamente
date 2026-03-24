interface Answer {
  answerID: number;
  answerText: string;
}

interface Question {
  questionId: number;
  questionText: string;
  answers: Answer[];
}

interface Repsponce {
  questionId: number;
  answerId: number;
}
