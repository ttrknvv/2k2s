// export default interface IPage {
//     filters?: IFilter[];
//     vacations?: IVacation[];
// }

import { connect } from "react-redux";
import Page from "../../components/Page/Page";
import IVacation from "../../assets/models/IVacation";
import { filterByLan } from "../../assets/scripts/filtreFunctions";

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