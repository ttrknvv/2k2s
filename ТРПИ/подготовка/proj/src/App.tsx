import React, { useState } from 'react'
import Card, {CardVariant} from './components/card'
import UserList from './components/UserList';
import IUser from "./types/types" 
import ExampleDiv from './components/exampleDiv' 
import Input from './components/Input';
import InputSec from './components/inputSec';
import ExampleDivSec from './components/exampleDivSec';

const App = () => {
  const users : IUser[] = [{id: 1, name: 'nik'},
                {id: 2, name: 'nik'},
                {id: 3, name: 'nik'}];
  let ex : string[] = [];
  const [count, setCount] = useState(0);
  const [textArr, setTextArr] = useState(ex);

  return (<div>
    работает!
    <Card onClick={(num : number) => console.log('Нажатие', num)} width='200px' height='200px' variant={CardVariant.outlined}>
      <button>dd</button>
      </Card>
      <UserList users={users}/>
      <Input countStr={count} onClick={(num) => setCount(num)} onChange={(numb) => setCount(numb)}/>
      <ExampleDiv count={count}/>

      <InputSec onClick={(newText) => setTextArr([...textArr, newText])}/>
      <ExampleDivSec text={textArr}/>
  </div>)
};

export default App;