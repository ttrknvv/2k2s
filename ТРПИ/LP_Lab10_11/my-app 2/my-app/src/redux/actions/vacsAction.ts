import IVacation from "../../assets/xd/IVac";
import IAction from "./action";

export interface IVacAction extends IAction
{
    type:string;
    vacation: IVacation;
}

export function addVac(vac : IVacation) : IVacAction {
    return {
        type: "addVac",
        vacation: vac
    }
}

export function remVac(vac : IVacation) : IVacAction {
    return {
        type: "remVac",
        vacation: vac
    }
}

export function setCurrent(vac : IVacation) : IVacAction {
    return {
        type: "setCurrent",
        vacation: vac
    }
}