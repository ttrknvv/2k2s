import { connect } from 'react-redux';
import filters from "../../assets/models/filters"
import Page from '../../components/Page/Page';
import { doFiltre } from '../../assets/scripts/filtreFunctions';

const mapStateToProps = (state : any) => {
    return {
        vacations: doFiltre(state.vacReducer, state.filtReducer, state.lanReducer),
        filters: filters
    }
}

const mapDispatchToProps = (dispatch : any) => {
    return {
        onLoad: dispatch
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Page);
