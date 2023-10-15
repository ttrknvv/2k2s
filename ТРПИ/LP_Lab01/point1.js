// TypeScript: функции, массив, строка
function createPhoneNumber(arr) {
    if (arr.length != 10) {
        throw "Array size exception";
    }
    return "(".concat(arr[0]).concat(arr[1]).concat(arr[2], ") ").concat(arr[3]).concat(arr[4]).concat(arr[5], "-").concat(arr[6]).concat(arr[7]).concat(arr[8]).concat(arr[9]);
}
var arrayNumb = [3, 2, 5, 7, 4, 1, 1, 8, 0, 3];
try {
    console.log(createPhoneNumber(arrayNumb)); // все хорошо
    console.log(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])); // исключение
}
catch (error) {
    console.log(error);
}
