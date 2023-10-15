import React from 'react';

type PLink = {
    active: boolean;
    children?: any;
    onClick?: () => void
} 

const Link = ({ active, children, onClick } : PLink) => (
  <button
    onClick={onClick} // связь события
    disabled={active} // кнопка активна или нет
    style={{ // стиль
      marginLeft: '14px',
    }}
  >
    {children}
  </button>
);

export default Link;