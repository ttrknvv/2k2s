import { connect } from "react-redux";
import Page from "../../components/page/Page";
import IVacation from "../../assets/xd/IVac";
import { filterByLan } from "../../assets/script/filterFunc";

const mapStateToProps = (state : any) => 
(
    {
        vacations: filterByLan((state.vacReducer as IVacation[]).filter(el => el.isLiked), state.lanReducer),
        filters: undefined
    }
)

const mapDispatchToProps = (dispatch : any) => 
(
    {
        onDispatch: dispatch
    }    
)

export default connect(mapStateToProps, mapDispatchToProps)(Page);