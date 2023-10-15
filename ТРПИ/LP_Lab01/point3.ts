// typescript : массив

function turnArr(arr:number[], step:number) : number[]
{
    if(step < 0)
    {
        throw "Wrong step"
    }
    let newArr:number[] = new Array();

    for(let i :number = 0; i < arr.length; i++)
    {
        newArr[i] = arr[i];
    }

    if(step >= arr.length)
    {
        step = Math.abs(Math.floor(step / arr.length)*arr.length -  step);
    }
    for(let i:number = 0; i < arr.length; i++)
    {
        if(step > i)
        {
            newArr[i] = arr[arr.length - step + i]
            continue;
        }
            newArr[i] = arr[i - step];
    }
    return newArr;
}

const arr:number[] = [1, 2, 3, 4, 5, 6, 7];
try
{
    console.log(turnArr(arr, 0));
    console.log(turnArr(arr, 1));
    console.log(turnArr(arr, 2));
    console.log(turnArr(arr, 3));
    console.log(turnArr(arr, 7));
    console.log(turnArr(arr, 14));
    console.log(turnArr(arr, 16));
    console.log(turnArr(arr, -1));
}
catch(error)
{
    console.log(error);
}
