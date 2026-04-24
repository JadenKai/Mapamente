//using promise since awaits are what we're familiar with from class
import mysql from 'mysql2/promise';

//initialize the pool and pass it out
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  charset: 'utf8mb4',
});

export default pool;
