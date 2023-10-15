import city from './../images/city.svg'
import loud from './../images/loud.svg'
import price from './../images/price.svg'
import star from './../images/star.svg'
import workDay from './../images/workDay.svg'
import IFilter from "../../components/page/Filter/IFilter";

const filtration:IFilter[]=[
    {img: city, variables:["Минск","Лепель","Дзержинск","Столбцы","Лида","Полоцк","Пинск","Гродно"]},
    {img: workDay, variables:["Полный день","Гибкий график","Удалённая работа"]},
    {img: loud, variables:["Полная занятость","Частичная занятость","Проектная работа","Стажировка"]},
    {img: price, variables:["Нет опыта","От 1 до 3 лет","От 3 до 6 лет","Более 6 лет"]},
    {img: star, variables:["40000","80000","100000","150000"]}
];

export default filtration;
