import React from "react";
import { JsxElement } from "typescript";

interface DivExampleProps {
    count? : number
}

const ExampleDiv = ({count = 0} : DivExampleProps) => {
    const array = [];
  
    for(let i : number = 0; i < count; i++)
    {
        array.push((<div key={i} style={{width: 200, height: 200, background: 'red', margin: 20}}>{i}</div>));
    }

    return (<div style={{display: 'flex', flexWrap: 'wrap'}}>{array}</div>);
    
  };

  export default ExampleDiv;