import pool from "../config/database.js";

import { type CityEntry, type QuestionEntry } from "../types.js";

// Function to take in the cityId and return the CityEntry from database
async function getCityById(cityId: number): Promise<CityEntry> {
  // Pull the results from the database
  const result = (
    await pool.query<CityEntry[]>("SELECT * FROM City WHERE cityId = ?", [
      cityId,
    ])
  )[0];
  // Give back only the first entry result (should only have 1)
  return result[0];
}

// Function to find the CityId given a QuestionId
async function getCityIdByQuestionId(questionId: number): Promise<number> {
  // Pull the QuestionEntry from the question junction table, then pull the cityId and pass it out
  const result = (
    await pool.query<QuestionEntry[]>(
      "SELECT * FROM Question WHERE questionId = ?",
      questionId,
    )
  )[0];
  return result[0].cityId;
}

// Function to get all cities in the database
async function getAllCities(): Promise<CityEntry[]> {
  // Pull all cities from the database
  const result = await pool.query<CityEntry[]>("SELECT * FROM City");
  return result[0];
}

export { getCityById, getCityIdByQuestionId, getAllCities };
