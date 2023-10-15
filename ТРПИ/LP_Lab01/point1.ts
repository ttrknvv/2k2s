// TypeScript: функции, массив, строка

function createPhoneNumber(arr: number[]) : string
{
    if(arr.length != 10)
    {
        throw "Array size exception"
    }
    return `(${arr[0]}${arr[1]}${arr[2]}) ${arr[3]}${arr[4]}${arr[5]}-${arr[6]}${arr[7]}${arr[8]}${arr[9]}`;
}
const arrayNumb:number[] = [3,2,5,7,4,1,1,8,0,3];
try {
    console.log(createPhoneNumber(arrayNumb)); // все хорошо

    console.log(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])); // исключение
} catch (error) {
    console.log(error);
}