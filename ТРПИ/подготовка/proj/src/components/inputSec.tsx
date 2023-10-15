import React from "react";

interface InputSecProps {
    onClick : (num : string) => void
}

const InputSec = ({onClick} : InputSecProps) => {

    const [mid, setMid] = React.useState('');

    return (<div>
        <form onSubmit={(e) => e.preventDefault()}>
            <input id='FormText' type='text' value={mid} onChange={(event) => setMid(event.target.value)}></input>
            <button onClick={() => {onClick(mid); setMid('');}}>Добавить</button>
        </form>
    </div>);
    
  };

  export default InputSec;