import { useEffect, useState } from "react";
import IVacation from "../../../../assets/models/IVacation";
import LanTag from "../../../Tags/LanTag/LanTag";
import { Avatar, IconButton, Snackbar, Slide } from '@mui/material';
import './../../../../assets/sass/Catalog/Vacation/vacation.scss';
import { connect } from "react-redux";
import FavoriteIcon from '@mui/icons-material/Favorite';
import { addVacation, remVacation } from "../../../../redux/actions/favActions";
import { setCurrent } from "../../../../redux/actions/vacsAction";
import { setLan } from "../../../../redux/actions/lanAction";

const Vacation = ({ vac, dispatch }: { vac: IVacation, dispatch?: any }) => {
  let i = 0;

  const [like, setLike] = useState<boolean>();
  const [isSelected, setIsSelected] = useState<boolean>(vac.isSelected as boolean);
  const [showNotification, setShowNotification] = useState(false);

  useEffect(() => {
    setLike(vac?.isLiked);
    setIsSelected(vac?.isSelected as boolean);
  }, [vac]);

  const onVac = () => {
    dispatch(setCurrent(vac));
    setCurrent(vac);
  };

  const onLike = () => {
    vac.isLiked = !vac.isLiked;
    setLike(vac.isLiked);

    const func = vac.isLiked ? addVacation : remVacation;
    dispatch(func(vac));

    setShowNotification(true); // Показать оповещение при добавлении в избранное
    setTimeout(() => {
      setShowNotification(false);
    }, 2000); // Закрытие оповещения через 2 секунды
  };

  const onLan = (lan: string) => {
    dispatch(setLan(lan));
  };

  return (
    <section className={isSelected ? "selected-vac vacation" : "vacation"} id={vac.id?.toString()}>
      <Avatar src={vac.img} alt="" className="logo" onClick={() => onVac()} />

      <div className="info">
        <div className="company">{vac.company}</div>
        <div className="name">{vac.name}</div>
        <div className="city">{vac.city}</div>
        <div className="lans">
          {vac.lans?.map(el => (
            <LanTag text={el} onClick={() => onLan(el)} key={i++} />
          ))}
        </div>
      </div>

      <div className="like-and-date">
        <IconButton onClick={() => onLike()} color={like ? 'error' : 'default'}>
          <FavoriteIcon />
        </IconButton>
        <div className="date">{vac.date}</div>
      </div>

      <Snackbar
        open={showNotification}
        autoHideDuration={2000}
        TransitionComponent={Slide}
        anchorOrigin={{ vertical: 'bottom', horizontal: 'right' }}
        message={`Вакансия ${vac.name} добавлена в избранные`}
      />
    </section>
  );
};

export default connect()(Vacation);
