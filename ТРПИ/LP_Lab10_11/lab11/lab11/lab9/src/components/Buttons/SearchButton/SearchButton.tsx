import { Button } from '@mui/material';
import './searchButton.scss';
import IButton from '../IButton';

const SearchButton = ({ context, command }: IButton) => {
  return (
    <Button
    onClick={() => command()}
    className="searchButton"
    sx={{
      padding: '17px',
      borderRadius: '0px 10px 10px 0px',
      background: '#0070FB',
      fontWeight: '700',
      fontSize: '14px',
      color: 'white',
      '&:hover': {
        background: '#0055fC', // Измените на подходящий цвет фона при наведении
      },
    }}
  >
    {context}
  </Button>
  
  );
};

export default SearchButton;
