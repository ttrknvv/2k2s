// TypeScript base
// tsc filename.ts - компиляция файла в JavaScript
// node filename.js - запуск кода из консоли
// 1 - base types
const boolVar = true; // boolean [true, false]
const numberVar = 2; // number [int, float]
const stringVar = 'aaa'; // string
const nullVar = null; // null
const undefinedVar = undefined; // undefined
const bigintVar = 19999n; // BigInt
let anyVar = '1'; // 1) any
anyVar = 5; // 2) any
const arrayVar = [1, 2, 3, 4]; // 1) Array
const arrayVar2 = [1, 2, 3, 4]; // 2) Array
const kortezhVar = [1, true]; // кортеж
function kortezhFunc() {
    return [true, 'Gustavo Fring'];
}
console.log(kortezhFunc());
function kortezhFunc2(par) {
    console.log(par[0]);
    console.log(par[1]);
}
kortezhFunc2([1, 'Gustavo']);
function BreakingBad() {
    console.log("My name is Walter White!");
}
BreakingBad();
