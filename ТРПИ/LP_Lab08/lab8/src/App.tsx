import FilterableProductTable from './components/FilterableProductTable';
import productsArray from './components/state';

function App() {
  return (
    <div className="App">
        <FilterableProductTable products = { productsArray }/>
    </div>
  );
}

export default App;
