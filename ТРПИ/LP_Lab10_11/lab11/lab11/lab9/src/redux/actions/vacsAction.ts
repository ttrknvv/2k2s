import IVacation from "../../assets/models/IVacation";
import IAction from "./action";

export default interface IVacAction extends IAction
{
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