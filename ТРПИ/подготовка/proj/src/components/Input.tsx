import React from "react";

interface InputProps {
    countStr? : number,
    onClick : (num : number) => void,
    onChange : (numb : number) => void
}

const Input = ({countStr, onClick, onChange} : InputProps) => {

    let mid : number = 0;

    return (<div>
        <form onSubmit={(e) => e.preventDefault()}>
            <input id='FormText' type='text' onChange={(event) => onChange(Number(event.target.value))}></input>
            <button onClick={() => onClick(mid)}>Стереть</button>
        </form>
    </div>);
    
  };

  export default Input;