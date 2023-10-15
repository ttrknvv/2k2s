import favReducer from './favProductRed';
import vacReducer from './vacRed';
import filtReducer from './filtRed';
import { combineReducers } from "redux";
import lanReducer from './lanReducer';

export default combineReducers({ favReducer, vacReducer, filtReducer, lanReducer });