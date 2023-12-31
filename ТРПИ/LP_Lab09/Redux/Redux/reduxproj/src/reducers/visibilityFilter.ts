import { Filter, IVisibilityFilterAction } from './../action/actions';

const visibilityFilter = (
    state : Filter = Filter.SHOW_ALL, // по умолчанию показать все
    action : IVisibilityFilterAction
  ) => {
    switch (action.type) {
      case 'SET_VISIBILITY_FILTER':
        return action.filter;
      default:
        return state;
    }
  };
  
  export default visibilityFilter;