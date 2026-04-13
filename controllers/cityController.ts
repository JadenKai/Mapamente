import {type Response, type Request} from 'express'
import * as Model from "../models/cityModel.js"
import { type CityEntry} from "../types.js";

async function supplyCity(req: Request, res: Response){
    const cityId = Number(req.params['id'] as string);

    const cityEntry = await Model.getCityById(cityId);

    res.render('wikiTemplate', {city:cityEntry});
}

export {
    supplyCity
}