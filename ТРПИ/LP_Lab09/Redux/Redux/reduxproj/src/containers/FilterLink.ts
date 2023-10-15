import { connect } from 'react-redux';
import Link from '../components/Link';
import { IVisibilityFilterAction, setVisibilityFilter } from '../action/actions';

const mapStateToProps = (state : any, ownProps : IVisibilityFilterAction) => ({
  active: ownProps.filter === state.visibilityFilter,
});

const mapDispatchToProps = (dispatch : any, ownProps : IVisibilityFilterAction) => ({
  onClick: () =>
    dispatch(setVisibilityFilter(ownProps.filter)),
});

const FilterLink =  connect( // связать компонент реакт с redux хранилищем
  mapStateToProps,
  mapDispatchToProps
)(Link);

export default FilterLink;