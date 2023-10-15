import IFilter from "../../components/Page/Filters/IFilter";
import city from './../image/filters/city.svg';
import workDay from './../image/filters/workDay.svg';
import loud from './../image/filters/loud.svg';
import star from './../image/filters/star.svg';
import price from './../image/filters/price.svg';

const filters : IFilter[] = [
    { img: city, variables: ["Москва", "Минск", "Гродно", "Пинск"] },
    { img: workDay, variables: ["Полный день", "Гибкий график", "Удаленная работа"] },
    { img: loud, variables: ["Полная занятость", "Частичная занятость", "Проектная работа", "Стажировка"] },
    { img: star, variables: ["Нет опыта", "От 1 года до 3 лет", "От 3 до 6 лет", "Более 6 лет" ] },
    { img: price, variables: ["40 000", "80 000", "100 000", "150 000"] }
];

export default filters;