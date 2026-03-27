const pool = require("../config/database.ts")

async function getIngredients(){
    try{
        var all = (await pool.query("SELECT * FROM ingredients"))[0]
        return all;
    }catch(err){
        console.error("getIngredients Failed: ", err)
        throw err;
    }
}

module.exports = {
    getIngredients
};