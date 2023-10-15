import IVacation from "../../assets/models/IVacation";
import IFilter from "./Filters/IFilter";

export default interface IPage {
    filters?: IFilter[];
    vacations?: IVacation[];
    dispatch?: any;
}