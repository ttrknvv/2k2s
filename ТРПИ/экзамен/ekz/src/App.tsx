import { click } from "@testing-library/user-event/dist/click";
import React from "react";
import Button from './components/Button'
import Numbers from "./components/Numbers";
import ArrayNumber from "./types/numbersP";

const App = () => {

  const [state, setState] = React.useState(ArrayNumber);

  return (<div>
    <Numbers array={state}/>
    <Button onClick={() => {
        setState(ArrayNumber.filter((el : number) => el % 2 == 0));
    }}/>
  </div>);
};

export default App;