import { useState } from "react";
import SearchBar from "./SearchBar";
import ProductTable from "./ProductTable";
import { Product } from './state';
  
interface FilterableProductTableProps {
  products: Product[];
}

function FilterableProductTable(props: FilterableProductTableProps) {
  const [filterText, setFilterText] = useState('');
  const [inStockOnly, setInStockOnly] = useState(false);

  function handleFilterTextChange(filterText: string): void {
    setFilterText(filterText);
  }

function handleInStockChange(inStockOnly: boolean): void {
    setInStockOnly(inStockOnly);
  }

  return (
    <div>
      <SearchBar
        filterText={filterText}
        inStockOnly={inStockOnly}
        onFilterTextChange={handleFilterTextChange}
        onInStockChange={handleInStockChange}
      />
      <ProductTable
        products={props.products}
        filterText={filterText}
        inStockOnly={inStockOnly}
      />
    </div>
  );
}

export default FilterableProductTable;