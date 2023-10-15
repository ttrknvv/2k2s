import { DEFAULT } from "../reducers/filtRed";
import IAction from "./action";

export interface ILanAction extends IAction {
    language : string;
}

export function setLan(lan : string) : ILanAction {
    return {
        type: "setLan",
        language: lan
    }
}

export function clearLan() : ILanAction {
    return setLan(DEFAULT);
}