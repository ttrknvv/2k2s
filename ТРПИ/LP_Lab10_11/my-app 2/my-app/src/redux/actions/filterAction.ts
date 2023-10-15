import IAction from "./action";

export interface IFiltAction extends IAction {
    filter: string;
}

export function setFilter(filter : string) : IFiltAction {
    return {
        type: "setFilter",
        filter: filter
    }
}

export function clearFilter() : IAction {
    return {
        type: "clearFilter"
    }
}