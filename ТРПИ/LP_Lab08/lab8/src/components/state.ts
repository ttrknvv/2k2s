export type Product = { // тип Product, экспортируем его, чтобы импортировать
    category: string;
    price: string;
    stocked: boolean;
    name: string;
}

const productsArray: Array<Product> = [ // массив элементов Product
    {category: "Sporting Goods", price: "$49.99", stocked: true, name: "Football"},
    {category: "Sporting Goods", price: "$9.99", stocked: true, name: "Baseball"},
    {category: "Sporting Goods", price: "$99.99", stocked: true, name: "Voleyball"},
    {category: "Sporting Goods", price: "$59.99", stocked: false, name: "Basketball"},
    {category: "Sporting Goods", price: "$19.99", stocked: false, name: "Golf"},
    {category: "Electronics", price: "$99.99", stocked: true, name: "iPod Touch"},
    {category: "Electronics", price: "$399.99", stocked: false, name: "iPhone 5"},
    {category: "Electronics", price: "$199.99", stocked: true, name: "Nexus 7"},
    {category: "Electronics", price: "$199.99", stocked: true, name: "Xiaomi 2"},
    {category: "Electronics", price: "$199.99", stocked: false, name: "MI Band 3"}
]


export default productsArray; // экспортируем массив, чтобы его импортировать