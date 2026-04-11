import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";
import { UserEntry } from "../types.js";

async function createUser(username: string, passwordHash: string): Promise<boolean> {
  const [result] = await pool.query<ResultSetHeader>(
    "INSERT INTO User (username, passwordHash) VALUES (?, ?)",
    [username, passwordHash]
  );
  return result.affectedRows === 1;
}

async function findUserByUsername(username: string): Promise<UserEntry | null> {
  const [rows] = await pool.query<UserEntry[]>(
    "SELECT * FROM User WHERE username = ?",
    [username]
  );
  return rows[0] ?? null;
}

export {
  createUser,
  findUserByUsername,
}
