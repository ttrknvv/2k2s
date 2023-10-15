import React, { useEffect } from 'react';
import Header from './components/Header/Header';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

import './assets/styles/index.scss';
import getDatas from './assets/script/axiosGetData';
import IVacation from './assets/xd/IVac';
import { legacy_createStore as createStore } from 'redux';
import rootReducers from './redux/reducers'
import { Provider } from 'react-redux';
import FavoritePage from './redux/containers/favPage';
import MainPage from './redux/containers/mainPage';
import  {addVac}  from './redux/actions/vacsAction';

const store = createStore(rootReducers)

const App = () => {
  useEffect(() => {
    getDatas<IVacation>("vacation.json").then(data => {

      let isFirst = true;
      data.forEach(el => {
        el.img = "http://localhost:3000/smth/logos/" + el.img;
        el.isLiked = false;
        el.isSelected = isFirst;

        if(isFirst) isFirst = false;

        store.dispatch(addVac(el));
      });
    });
  }, []);

  return (
    <div className="App">
      <Provider store={ store }>
        <BrowserRouter> 
          <Header />
          
          <Routes>
            <Route index path='/search-vacations' 
                   element={<MainPage key={1}/>}/>
            <Route path='/selected-vacations'
                   element={ <FavoritePage key={2} /> }/>
          </Routes>
        </BrowserRouter>
      </Provider>
    </div>
  );
}

export default App;