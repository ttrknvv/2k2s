import favReducer from './favActionRedux';
import vacReducer from './vacReducer';
import filtReducer from './filterRedux';
import { combineReducers } from "redux";
import lanReducer from './lanReducer';

export default combineReducers({ favReducer, vacReducer, filtReducer, lanReducer });