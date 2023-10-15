import IVacation from "../../assets/xd/IVac";
import IFilter from "./Filter/IFilter";

export default interface IPage {
    filters?: IFilter[];
    vacations?: IVacation[];
    dispatch?: any;
}