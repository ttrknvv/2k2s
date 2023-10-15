import React from "react";
import { isJsxElement, JsxElement } from "typescript";

interface DivExampleSecProps {
    text? : string[]
}

const ExampleDiv = ({text = []} : DivExampleSecProps) => {
    let i : number = 0;
  
    return (<div style={{display: 'flex', flexWrap: 'wrap'}}>{text.map((el) => (<div key={i++} style={{width: 200, height: 200, background: 'green', margin: 20}}>{el}</div>))}</div>);
    
  };

  export default ExampleDiv;