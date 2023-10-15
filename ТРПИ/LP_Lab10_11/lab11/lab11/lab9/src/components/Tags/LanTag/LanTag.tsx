import { useState } from "react";
import Chip from "@mui/material/Chip";
import Snackbar from "@mui/material/Snackbar";
import ITag from "../ITag";

const LanTag = ({ text, onClick }: ITag) => {
  const [openSnackbar, setOpenSnackbar] = useState(false);

  const handleClick = () => {
    setOpenSnackbar(true);
    onClick(); // Вызов функции onClick
    setTimeout(() => {
      setOpenSnackbar(false);
    }, 2000); // Закрытие оповещения через 3 секунды
  };

  const handleCloseSnackbar = () => {
    setOpenSnackbar(false);
  };

  return (
    <>
      <Chip
        label={<span className="tag">{text}</span>}
        onClick={handleClick}
        variant="outlined"
        sx={{ padding: '1px', fontSize: '9px' }}
        color="default"
        clickable
      />

      <Snackbar
        open={openSnackbar}
        autoHideDuration={3000}
        onClose={handleCloseSnackbar}
        message={`Выбрана технология ${text}`}
      />
    </>
  );
};

export default LanTag;
