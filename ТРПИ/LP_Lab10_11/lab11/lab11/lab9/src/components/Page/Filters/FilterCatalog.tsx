import Filter from "./Filter";
import IFilterCatalog from "./IFilterCatalog";
import './../../../assets/sass/FilterCatalog/filter.scss';
import SearchButton from "../../Buttons/SearchButton/SearchButton";
import {  useEffect, useState } from "react";
import FiltersButton from "../../Buttons/FiltersButton/FiltersButton";
import IFilter from "./IFilter";
import { connect } from "react-redux";
import { clearFilter } from "../../../redux/actions/filtAction";
import { clearLan } from "../../../redux/actions/lanAction";

const FilterCatalog = ({ filters, dispatch } : IFilterCatalog) => {
    const [showFiltres, setShowFiltres] = useState(filters);
    const [hiddenFiltres, setHiddenFiltres] = useState<IFilter[]>([]);
    const [showHidden, setShowHidden] = useState(false);

    useEffect(() => {
        const resize = () => {
            if(window.innerWidth < 850) {
                setShowFiltres([filters.at(0) as IFilter]);
                setHiddenFiltres(filters.slice(filters.length - 4, filters.length));
            } else if (window.innerWidth < 1000) {
                setShowFiltres(filters.slice(0, filters.length - 1));
                setHiddenFiltres([filters.at(-1) as IFilter])
            } else if (window.innerWidth >= 1000) {
                setShowFiltres(filters);
                setHiddenFiltres([]);
            }
        };
    
        window.addEventListener("resize", resize);
        resize();
    }, []);

    let i = 0;

    return (
        <div className="filter-catalog">
            
            { showFiltres?.map(el => 
                <Filter img={ el.img }
                        variables={ el.variables }
                        key = { i++ }/>) 
            }

            { filters?.length !== showFiltres?.length && 
            
            <FiltersButton context="Фильтры"
                           command={ () => {setShowHidden(!showHidden)} }
            />}

            { showHidden &&
                <div className="hidden-wrapper">
                { hiddenFiltres?.map(el => 
                    <Filter img={ el.img }
                            variables={ el.variables }
                            key = { i++ }
                />) }
            </div>
            }

            <SearchButton context='Поиск'
                          command={ () => {dispatch(clearFilter()); dispatch(clearLan())} }
                          />
        </div>
        )
}

export default connect()(FilterCatalog);