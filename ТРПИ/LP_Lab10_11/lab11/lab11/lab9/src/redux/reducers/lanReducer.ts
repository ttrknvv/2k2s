import { ILanAction } from "../actions/lanAction";
import { DEFAULT } from "./filtRed";

const lanReducer = (state : string = DEFAULT, action : ILanAction) : string => {
    if(state === action.language) {
        action.language = DEFAULT;
    }

    switch(action.type) {
        case "setLan": case "clearLan": 
            return action.language;
        default: 
            return state;
    }
}

export default lanReducer;