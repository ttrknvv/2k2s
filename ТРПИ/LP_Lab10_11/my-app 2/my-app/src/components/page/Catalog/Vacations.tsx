import { useEffect, useState } from "react";
import IVacation from "../../../assets/xd/IVac";
import LanTag from "../../tags/LanTag/LanTag";
import { ReactComponent as Like } from '../../../assets/images/heart.svg'
import '../../../assets/styles/vacation.scss'
import { connect } from "react-redux";
import { addVacation, remVacation } from "../../../redux/actions/favActions";
import { setCurrent } from "../../../redux/actions/vacsAction";
import { setLan } from "../../../redux/actions/lanAction";


const Vacation = ( {vac, dispatch } : { vac : IVacation, dispatch ?: any } ) => {
    let i  = 0;

    const [like, setLike] = useState<boolean>();
    const [isSelected, setIsSelected] = useState<boolean>(vac.isSelected as boolean);

    useEffect(() => {
        setLike(vac?.isLiked);
        setIsSelected(vac?.isSelected as boolean)
    }, [vac])

    const onVac = () => {
        dispatch(setCurrent(vac));
        setCurrent(vac)
    }

    const onLike = () => {
        vac.isLiked = !vac.isLiked;
        setLike(vac.isLiked)
        const func = vac.isLiked ? addVacation : remVacation;
        dispatch(func(vac));
    };

    const onLan = (lan : string) => {
        dispatch(setLan(lan));
    }

    return (
        <section className={isSelected ? "selected-vac vacation" : "vacation"}
                 id={ vac.id?.toString() }
                 >
            <img src={ vac.img } alt="" className="logo" onClick={() => onVac()} />

            <div className="info">
                <div className="company">{ vac.company }</div>
                <div className="name">{ vac.name }</div>
                <div className="city">{ vac.city }</div>
                <div className="lans">
                    { 
                        vac.lans?.map(el => <LanTag 
                                                text={ el } 
                                                onClick={() => onLan(el)} 
                                                key={ i++ }/>) 
                    }
                </div>
            </div>

            <div className="like-and-date">
                <Like className={ like ? "like like-active" : "like"}
                      onClick={() => onLike()}
                      key={ i++ }/>
                <div className="date">
                    { vac.date }
                </div>
            </div>

        </section>
        )
}

export default connect()(Vacation);