import { connect } from 'react-redux';
import filters from "../../assets/xd/filter"
import Page from '../../components/page/Page';
import { doFiltre } from '../../assets/script/filterFunc';

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