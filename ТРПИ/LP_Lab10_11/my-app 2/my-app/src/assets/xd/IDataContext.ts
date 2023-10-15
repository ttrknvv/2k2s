import IVac from './IVac'
export default interface IDataContext{
    cookies?:Map<string,string>;
    vacs?:IVac[];
    showedV?:number[];
    setShowedV?: any;
    favorite?: IVac[];
    setFavourite?: any;
}