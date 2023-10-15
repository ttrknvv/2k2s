import IVacation from "../../assets/models/IVacation";
import { IFavAction } from "../actions/favActions";

const favReducer = (state : IVacation[] = [], action : IFavAction) => {
    let obj : any;
    switch(action.type)
    {
        case "addFavVacation":
            return [...state, action.vacation];
        case "remFavVacation":
            return state.filter(el => el.id !== action.vacation.id);
        case "setSelected":
            return state.map(
                    el => {
                        obj = el;
                        return {
                            ...obj,
                            isSelected: el.id === action.vacation.id
                        } as IVacation;
                    }
                );
        default:
            return state;
    }
}

export default favReducer;