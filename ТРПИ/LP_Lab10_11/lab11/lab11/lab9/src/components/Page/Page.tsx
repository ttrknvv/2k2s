import { useEffect, useState } from "react";
import IVacation from "../../assets/models/IVacation";
import Catalog from "./Catalog/Catalog";
import FilterCatalog from "./Filters/FilterCatalog";
import IFilter from "./Filters/IFilter";
import IPage from "./IPage";
import InfoAboutVacation from "./Catalog/Vacation/InfoAboutVacation";
import './../../assets/sass/Page/page.scss'
import { Container, Stack } from "@mui/material";

const Page = ({ vacations, filters } : IPage) => {
    const [vacations_, setVacations] = useState<IVacation[]>([])
    const [currentVacation, setCurrent] = useState<IVacation>({});
    const [showInfo, setShowInfo] = useState(false);
    const [showVacations, setShowVacations] = useState(true);
    const [isFirst, setIsFirst] = useState(true);
    const [isMobile, setIsMobile] = useState(false); 

    useEffect(() => {
        setVacations(vacations as IVacation[]);
        setCurrent(vacations?.filter(el => el.isSelected).at(0) as IVacation || vacations?.at(0));
    }, [vacations])

    useEffect(() => {
        if(!isFirst) {
            setShowInfo(true);
            setShowVacations(false);
        } else if(currentVacation?.desc !== undefined) {
            setIsFirst(false);
        }
        if(currentVacation !== undefined) {   
            setVacations(vacations_?.map(el => {
                return {
                    ...el,
                    isSelected: el.id === currentVacation.id
                } as IVacation;
            }))
        }
    }, [currentVacation])

    useEffect(() => {
        const resize = () => {
            setIsMobile(window.innerWidth < 1000);

            if(window.innerWidth < 1000) {
                setShowInfo(false);
                setShowVacations(true);
            } else {
                setShowInfo(true);
                setShowVacations(true);
            }
        }

        window.addEventListener("resize", resize);
        resize();
    }, [])

    return (
        <Stack 
        className="page" 
        spacing={0.5} 
        sx={{ padding: '13px 0 0 0' }}>
            { filters === undefined || 
            <FilterCatalog filters={ filters as IFilter[] }/> }

            <div className="vac-wrapper">
                {
                !(!showVacations && isMobile) &&                
                <Catalog vacs={vacations as IVacation[]}
                         setCurrent={ setCurrent }/>
                }
                {
                !(!showInfo && isMobile) &&
                <InfoAboutVacation vacation={ currentVacation }
                                   setters={ { setShowInfo: setShowInfo, setShowVacations: setShowVacations } }/>
                }
            </div>
        </Stack>
        )
}

//show & isMobile
// 1 1 = 1
// 1 0 = 1
// 0 1 = 0
// 0 0 = 1
export default Page;