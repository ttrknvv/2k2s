interface ProductRowProps {
    product: {
      name: string;
      price: string;
      stocked: boolean;
    };
}

function ProductRow(props: ProductRowProps) {

  const product = props.product; // если stocked === false, то цвет красный

  return(
    <tr>
      <td style={{color: product.stocked === false ? 'red' : ''}}>{product.name}</td> 
      <td>{product.price}</td>
    </tr>
  );
}

export default ProductRow; // экспорт строки продукта