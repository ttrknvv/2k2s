import IAction from "../actions/action";
import { IFiltAction } from "../actions/filterAction";

export const DEFAULT = "default";

const filtReducer = (state : string = DEFAULT, action : IAction) => {
    switch(action.type) {
        case "setFilter":
            return (action as IFiltAction).filter;
        case "clearFilter":
            return DEFAULT;
        default:
            return state;
    }
}

export default filtReducer;