CREATE DATABASE IF NOT EXISTS mapamente;
USE mapamente;

CREATE TABLE City (
    city_id INT NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL UNIQUE,
    history_text TEXT NOT NULL,
    facts_text TEXT NOT NULL,
    city_banner VARCHAR(255) NOT NULL,
    PRIMARY KEY (city_id)
);

CREATE TABLE Player (
    player_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    profile_pic VARCHAR(255) NOT NULL,
    is_public BOOLEAN NOT NULL,
    is_admin BOOLEAN NOT NULL,
    PRIMARY KEY (player_id)
);

CREATE TABLE Question (
    question_id INT NOT NULL AUTO_INCREMENT,
    city_id INT NOT NULL,
    question_text VARCHAR(255) NOT NULL,
    PRIMARY KEY (question_id),
    CONSTRAINT fk_question_city FOREIGN KEY (city_id) REFERENCES City(city_id)
);

CREATE TABLE AnswerChoice (
    choice_id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    choice_text VARCHAR(255) NOT NULL,
    is_correct BOOLEAN NOT NULL,
    PRIMARY KEY (choice_id),
    CONSTRAINT fk_answerchoice_question FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

CREATE TABLE Score (
    score_id INT NOT NULL AUTO_INCREMENT,
    city_id INT NOT NULL,
    player_id INT NOT NULL,
    PRIMARY KEY (score_id),
    CONSTRAINT fk_score_city FOREIGN KEY (city_id) REFERENCES City(city_id),
    CONSTRAINT fk_score_player FOREIGN KEY (player_id) REFERENCES Player(player_id)
);
