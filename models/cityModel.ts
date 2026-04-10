import { ResultSetHeader } from "mysql2";
import pool from "../config/database.js";

import { type CityEntry } from "../types.js";

async function getCityById(cityId: number): Promise<CityEntry> {
    const result = (await pool.query<CityEntry[]>("SELECT * FROM City WHERE CityId = ?", cityId))[0];
    console.log(result)
    return(result[0])
}

export {
    getCityById
}