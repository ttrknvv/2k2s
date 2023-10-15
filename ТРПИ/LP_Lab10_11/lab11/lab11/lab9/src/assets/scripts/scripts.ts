export const removeFrom = <T>(arr : T[], index : number) => {
    return arr.filter((el, i) => i === index);
}

export const equalsArrays = <T> (arr1 : T[], arr2 : T[]) => {
    for(let i = 0; i < arr1.length; i++) {
        if(arr1.at(i) !== arr2.at(i)) {
            return false;
        }
    }

    return true;
}