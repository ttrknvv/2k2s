import { combineReducers } from 'redux';
import todos from './todos';
import visibilityFilter from './visibilityFilter';

export default combineReducers({
  todos,
  visibilityFilter
}); // преобразование в одну функцию редьюсера( редьюсер определяет изменение экшена )