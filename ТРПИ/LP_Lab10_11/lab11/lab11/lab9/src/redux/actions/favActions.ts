import IVacation from "../../assets/models/IVacation";
import IAction from "./action";

export interface IFavAction extends IAction
{
    vacation : IVacation;
} 

export function addVacation(vac : IVacation) : IFavAction
{
    return {
        type: "addFavVacation",
        vacation: vac
    }
}

export function remVacation(vac : IVacation) : IFavAction 
{
    return {
        type: "remFavVacation",
        vacation: vac
    }
}

export function setSelected(vac : IVacation) : IFavAction
{
    return {
        type: "setSelected",
        vacation : vac
    }
}