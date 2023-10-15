import React, { ChangeEvent } from "react"; // импортируем реакт и типы событий для таких форм, как <input>

interface SearchBarProps {
    filterText: string;
    inStockOnly: boolean;
    onFilterTextChange: (filterText: string) => void;
    onInStockChange: (inStockOnly: boolean) => void;
}

function SearchBar(props: SearchBarProps) {

  function handleFilterTextChange(e: ChangeEvent<HTMLInputElement>) {
    props.onFilterTextChange(e.target.value);
  }
  
  function handleInStockChange(e: ChangeEvent<HTMLInputElement>) {
    props.onInStockChange(e.target.checked);
  }

  return (
    <form style={{textAlign: "center"}}>
      <input
        type="text"
        placeholder="Search..."
        value={props.filterText}
        onChange={handleFilterTextChange}
      />
      <p>
        <input
          type="checkbox"
          checked={props.inStockOnly}
          onChange={handleInStockChange}
        />
        {' '}
        Only show products in stock
      </p>
    </form>
  );
}

export default SearchBar; // экспорт модуля для его импорта