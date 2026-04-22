import {type Response, type Request} from 'express'
import * as Model from "../models/cityModel.js"

//Function for loading the wiki page of a city
async function supplyCity(req: Request, res: Response){
    //get the cityId from the url
    const cityId = Number(req.params['id'] as string);
    //pull the entry from the supplied id
    const cityEntry = await Model.getCityById(cityId);
    //pass it on and render the wikitemplate
    res.render('wikiTemplate', {city:cityEntry});
}

//Function for loading the cities selection page
async function supplyCities(req: Request, res: Response){
    //render the cities page
    const cities = await Model.getAllCities();
    res.render('cities', {cities});
}

export {
    supplyCity,
    supplyCities
}