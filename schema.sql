CREATE DATABASE IF NOT EXISTS mapamente;
USE mapamente;

CREATE TABLE City (
    cityId      INT AUTO_INCREMENT PRIMARY KEY,
    cityName    VARCHAR(100) NOT NULL UNIQUE,
    historyText TEXT NOT NULL,
    factsText   TEXT NOT NULL,
    cityBanner  VARCHAR(255) NOT NULL,
);

CREATE TABLE User (
    userId       INT AUTO_INCREMENT PRIMARY KEY,
    username     VARCHAR(50)  NOT NULL UNIQUE,
    passwordHash VARCHAR(255) NOT NULL,
    profilePic   VARCHAR(255),
    isPublic     BOOLEAN      NOT NULL DEFAULT true,
    isAdmin      BOOLEAN      NOT NULL DEFAULT false,
    themeLight   BOOLEAN      NOT NULL DEFAULT true
);

CREATE TABLE Question (
    questionId   INT AUTO_INCREMENT PRIMARY KEY,
    cityId       INT  NOT NULL,
    questionText TEXT NOT NULL,
    FOREIGN KEY (cityId) REFERENCES City(cityId)
);

CREATE TABLE Answer (
    answerId   INT AUTO_INCREMENT PRIMARY KEY,
    questionId INT          NOT NULL,
    answerText VARCHAR(255) NOT NULL,
    isCorrect  BOOLEAN      NOT NULL DEFAULT false,
    FOREIGN KEY (questionId) REFERENCES Question(questionId)
);

CREATE TABLE Score (
    scoreId      INT AUTO_INCREMENT PRIMARY KEY,
    userId       INT NOT NULL,
    cityId       INT NOT NULL,
    correctCount INT NOT NULL DEFAULT 0,
    score        INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId),
    FOREIGN KEY (cityId) REFERENCES City(cityId)
);
