import { useEffect, useState } from "react";
import IVacation from "../../../assets/xd/IVac";
import close from '../../../assets/images/close.svg';

type Setters = {
    setShowVacations?: any,
    setShowInfo?: any
}

const InfoAboutVacation = ({ vacation, setters } : { vacation : IVacation, setters : Setters })  => {
    const [current, setCurrent] = useState<IVacation>({});
    const [isMobile, setIsMobile] = useState(false);

    useEffect(() => {
        const resize = () => {
            setIsMobile(window.innerWidth < 1000);
        }

        window.addEventListener("resize", resize);

        resize();
    }, []);

    useEffect(() => {
        setCurrent(vacation);
    }, [vacation])

    const doClose = () => {
        setters.setShowVacations(true);
        setters.setShowInfo(false);
    }

    let i = 0;

    return (
        <div className="info-about-vacation">

            { 
            isMobile &&
            <img src={ close } alt=""
                 onClick={() => doClose()}/>
            }

            <div className="img-and-title">
                <img src={ current?.img }  alt="" className="logo" />

                <div className="title-info">
                    <div className="title">{ current?.name }</div>

                    <div className="company-and-city">
                        { `${ current?.company }\t | \t${ current?.city }` }
                    </div>
                </div>
            </div>

            <div className="price">
                От { current?.pay } до  200 000
            </div>

            <div className="all-desc">
                <div className="description">
                    { current?.desc?.map(el => {
                        return (
                            <p className="paragraph" key = { i++ }>
                                { el }
                            </p>
                            )
                    }) }
                </div>

                <div className="exp-in">
                    <p className="you-have paragraph">И если у вас есть:</p>
                    <div>
                    {
                        current?.expIn?.map(el => {
                            return (
                                <p className="paragraph">
                                    { el }
                                </p>
                                )
                        })
                    }
                    </div>
                </div>

                <div className="knowledge">
                    <p className="paragraph important">
                        Обязательные знания:
                    </p>
                    <div>
                    {
                        current?.lans?.map(el => {
                            return (
                                <p className="paragraph">
                                    { el }
                                </p>
                                )
                        })
                    }
                    </div>
                </div>
            </div>
        </div>
        )
}

export default InfoAboutVacation;