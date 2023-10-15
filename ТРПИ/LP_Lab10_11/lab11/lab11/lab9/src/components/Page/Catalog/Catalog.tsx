import IVacation from "../../../assets/models/IVacation";
import Vacation from "./Vacation/Vacation";
import './../../../assets/sass/Catalog/catalog.scss';
import {  useEffect, useState } from "react";
import { Stack } from "@mui/material";

const Catalog = ({ vacs, setCurrent } : { vacs : IVacation[], setCurrent : any } ) => {
    const [vacations, setVacations] = useState<IVacation[] | undefined>(vacs);

    useEffect(() => {
        setVacations(vacs);
    }, [vacs]);

return (
        <Stack className="catalog">
            { vacations?.map(el => <Vacation vac={ el } 
                                             key={ el.id }/>,
                                             ) }
        </Stack>
        )
}
export default Catalog;