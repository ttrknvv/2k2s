import React from 'react'

export enum CardVariant {
    outlined = 'outlined',
    primary = 'primary'
} 

interface CardProps {
    width? : string,
    height? : string,
    children : React.ReactNode | React.ReactChild,
    variant? : CardVariant,
    onClick : (num : number) => void
    count? : number
}

const Card = ({width, height, children, variant, onClick} : CardProps) => {
  const [state, setState] = React.useState(0);


  return (<div style={{width, height, border: variant === CardVariant.outlined ? '1px solid black' : 'none',
  background: variant === CardVariant.primary ? 'red' : 'none'}}
  
  onClick={() => onClick(state)}>
      {children}
  </div>)
};

export default Card;