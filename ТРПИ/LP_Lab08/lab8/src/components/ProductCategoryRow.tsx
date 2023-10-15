interface ProductCategoryRowProps {
    category: string;
}

function ProductCategoryRow(props: ProductCategoryRowProps) {

  const { category }  = props;
 // объединить ячейки по горизонтали и вставить категорию
  return(
    <tr>
      <th colSpan={2}>{ category }</th>
    </tr>
  );
}

export default ProductCategoryRow; // экспорт строки категорий