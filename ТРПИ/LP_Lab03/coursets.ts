// TypeScript base - 1

// tsc filename.ts - компиляция файла в JavaScript
// node filename.js - запуск кода из консоли

// 1 - base types
const boolVar : boolean = true; // boolean [true, false]

const numberVar : number = 2; // number [int, float]

const stringVar : string = 'aaa'; // string

const nullVar : null = null; // null

const undefinedVar : undefined = undefined; // undefined

const bigintVar : bigint = 19999n; // BigInt

let anyVar : any = '1'; // 1) any
anyVar = 5; // 2) any

const arrayVar : number [] = [1, 2, 3, 4]; // 1) Array
const arrayVar2 : Array<number> = [1, 2, 3, 4]; // 2) Array

function BreakingBad() : void // function
{
    console.log("My name is Walter White!");
}
BreakingBad();

const kortezhVar : [number, boolean] = [1, true]; // кортеж
function kortezhFunc() : [boolean, string] // кортеж в функции
{
    return [true, 'Gustavo Fring'];
}
console.log(kortezhFunc());
function kortezhFunc2(par : [number, string]) : void // кортеж в параметрах
{
    console.log(par[0]);
    console.log(par[1]);
}
kortezhFunc2([1, 'Gustavo']);

function printError(message) : never // 1) never
{
    throw new Error(message);
}
function infinityCycle() : never // 2) never
{
    while(true) {}
}

type Surname = string;
const surname : Surname = 'White'; // type
type password = string | number;
const pas1 : password = 1;
const pas2 : password = '123';  