import { useState } from "react";
import IFilter from "./IFilter";
import { setFilter as addFilter } from "./../../../redux/actions/filterAction";
import { connect } from "react-redux";

const Filter = ({ img, variables, dispatch } : IFilter) => {
    const [selectedFilter, setFilter] = useState(variables.at(0));
    const [showVariables, setShowVariables] = useState(false);

    const key = Math.random() % 2_000_000_000;
    let i = 0;

    const onVariable = (filter : string) => {
        console.log(dispatch)
        setFilter(filter);
        dispatch(addFilter(filter));
    }

    return (
        <section className="filter"
                 >
            <img src={ img } alt="" onClick={ () => setShowVariables(!showVariables) }/>
            <span className="filter-text" onClick={ () => setShowVariables(!showVariables) }>
                { selectedFilter }
            </span>

            { showVariables &&
            <div className="variables">
                {
                    variables.map(el => 
                    <div className="variable">

                        <input type="radio" 
                               id={ `variable${key + i}` }
                               name={ `variable${key}` }
                               onClick={ () => onVariable(el) }/>
                        <label className="text"
                               htmlFor={ `variable${key + i++}` }>
                            { el }
                        </label>

                    </div>)
                }
            </div>
            }
        </section>
        );
}

export default connect()(Filter);