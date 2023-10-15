import { useEffect, useState } from "react";
import IVacation from "../../../../assets/models/IVacation";
import CloseIcon from "@mui/icons-material/Close";
import { Avatar, Typography } from "@mui/material";

type Setters = {
  setShowVacations?: any,
  setShowInfo?: any
};

const InfoAboutVacation = ({ vacation, setters }: { vacation: IVacation, setters: Setters }) => {
  const [current, setCurrent] = useState<IVacation>({});
  const [isMobile, setIsMobile] = useState(false);

  useEffect(() => {
    const resize = () => {
      setIsMobile(window.innerWidth < 1000);
    };

    window.addEventListener("resize", resize);

    resize();
  }, []);

  useEffect(() => {
    setCurrent(vacation);
  }, [vacation]);

  const doClose = () => {
    setters.setShowVacations(true);
    setters.setShowInfo(false);
  };

  let i = 0;

  return (
    <div className="info-about-vacation">

      {isMobile &&
      <Avatar sx={{
        position: 'absolute',
        top: '3px',
        cursor:'pointer',
        background: 'white',
        right: '3px'
      }} onClick={() => doClose()} >
        <CloseIcon color={'disabled'} />
      </Avatar>
      }

      <div className="img-and-title">
        <img src={current?.img} alt="" className="logo" />

        <div className="title-info">
          <div className="title">{current?.name}</div>

          <div className="company-and-city">
            {`${current?.company}\t | \t${current?.city}`}
          </div>
        </div>
      </div>

      <div className="price">
        От {current?.pay} до 200 000
      </div>

      <div className="all-desc">
        <div className="description">
          {current?.desc?.map(el => (
            <Typography className="paragraph" key={i++}>
              {el}
            </Typography>
          ))}
        </div>

        <div className="exp-in">
          <Typography variant="h5" className="paragraph you-have">
            И если у вас есть:
          </Typography>
          <div>
            {current?.expIn?.map(el => (
              <Typography variant="h5" className="paragraph" key={i++}>
                {el}
              </Typography>
            ))}
          </div>
        </div>

        <div className="knowledge">
          <Typography className="paragraph important">
            Обязательные знания:
          </Typography>
          <div>
            {current?.lans?.map(el => (
              <Typography className="paragraph" key={i++}>
                {el}
              </Typography>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default InfoAboutVacation;
