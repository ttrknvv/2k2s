import IVacation from "./../../../assets/xd/IVac";
import Vacation from "./Vacations";
import './../../../assets/styles/catalog.scss';
import {  useEffect, useState } from "react";

const Catalog = ({ vacs } : { vacs : IVacation[], setCurrent : any } ) => {
    const [vacations, setVacations] = useState<IVacation[] | undefined>(vacs);

    useEffect(() => {
        setVacations(vacs);
    }, [vacs]);

return (
        <div className="catalog">
            { vacations?.map(el => <Vacation vac={ el } 
                                             key={ el.id }/>,
                                             ) }
        </div>
        )
}
export default Catalog;