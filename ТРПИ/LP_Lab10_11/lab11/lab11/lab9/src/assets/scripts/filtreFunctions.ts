import { DEFAULT } from "../../redux/reducers/filtRed";
import IVacation from "../models/IVacation";

export function doFiltre(vacations : IVacation[], filter : string, lan : string) : IVacation[] | undefined {
    const res1 = filterByInfo(vacations, filter);
    const res2 = filterByLan(vacations, lan);
    return intersect(res1, res2);
}

export function filterByInfo(vacations : IVacation[], filter : string)
{
    if(filter === DEFAULT) return vacations;

    const vacs : IVacation[] | undefined = vacations;

    const filtredVacs  = vacs?.filter(el => filter === el.grafic as string ||
                                            filter === el.city as string ||
                                            filter === el.loud as string ||
                                            filter === el.exp as string ||
                                            filter === el.pay as string) as IVacation[];

    
    return filtredVacs;
}

export function filterByLan(vacations : IVacation[], lan : string)
{
    if(lan === DEFAULT) return vacations;
    return vacations.filter(el => el.lans?.includes(lan))
}

export function intersect(arr1 : IVacation[], arr2 : IVacation[]) {
    return arr1.filter(el => arr2.map(el2 => el2.id).includes(el.id));
}