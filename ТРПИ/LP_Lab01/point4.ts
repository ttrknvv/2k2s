// typescript : массив

function returnMiddle(arr1 : number[], arr2 : number[]) : number[]
{
    let eq : number = 0;
    let arr : number[] = new Array(arr1.length + arr2.length);
    if(arr1.length == 0 || arr2.length == 0)
    {
        throw "No elements in Array"
    }
    for(let i : number = 0, j : number = 0; i < arr1.length || j < arr2.length;)
    {
        if(arr1[i] >= arr2[j])
        {
            arr[eq++] = arr2[j++];
        }
        else
        {
            arr[eq++] = arr1[i++];
        }
        if(j == arr2.length)
            {
                while(i != arr1.length) arr[eq++] = arr1[i++];
            }
        if(i == arr1.length)
            {
                while(j != arr2.length) arr[eq++] = arr2[j++];
            }
    }
    console.log(arr); // получившийся массив
    if(arr.length % 2 == 0)
    {
        return [(arr[Math.floor(arr.length / 2) - 1] + arr[Math.floor(arr.length / 2)]) / 2]
    }
    else
    {
        return [arr[Math.floor(arr.length / 2)]];
    }

}

const arr1 : number[] = [1, 2, 3, 3, 4, 5];
const arr2 : number[] = [2, 10];


try {
    console.log(returnMiddle(arr1, arr2));
    console.log(returnMiddle([1], [2]));
    console.log(returnMiddle([2], [1]));
    console.log(returnMiddle([4, 5, 9], [1, 2, 11, 30]));
    console.log(returnMiddle([1], []));
} 
catch (error) {
    console.log(error);
}
