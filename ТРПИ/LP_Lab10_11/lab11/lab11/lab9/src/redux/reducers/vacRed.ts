import IVacation from "../../assets/models/IVacation";
import IVacAction from "../actions/vacsAction";

const vacReducer = (state : IVacation[] = [], action : IVacAction) => {
    let obj;
    switch(action.type) {
        case "addVac":
            return [...state, action.vacation];
        case "remVac":
            return state.filter(el => el.id !== action.vacation.id);
        case "setCurrent":
            return state.map(el => {
                obj = el;
                return {
                    ...obj,
                    isSelected: el.id === action.vacation.id
                }
            });
        default:
            return state;
    }
} 

export default vacReducer;