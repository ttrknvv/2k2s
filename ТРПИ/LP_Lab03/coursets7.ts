// TypeScript base - 7

// generic

const genericArray : Array<boolean> = [true, false, true];

function sortArrStroke<T>(arr : T[]) : T[]
{
    return arr.sort();
}

const arr : number[] = [15, 1, 9, 200];
const arr2 : string[] = ['f', 'e', 'd', 'c', 'b', 'a' ];
console.log(sortArrStroke(arr));
console.log(sortArrStroke(arr2));