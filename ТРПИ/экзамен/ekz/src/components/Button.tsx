import React from "react";

interface ButtonProps {
    onClick? : () => void,
    click?: boolean
}

const Button = ({onClick, click = false} : ButtonProps) => {

    return (<button onClick={onClick}>Filter</button>)

}

export default Button;
