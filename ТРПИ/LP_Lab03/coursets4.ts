// TypeScript base - 4

// function

function printMessage(message : string) : void
{
    console.log(message);
}

interface IProduct
{
    name : string | undefined,
    cost : number | undefined
}

interface IDopProduct extends IProduct
{
    count : number | undefined
}

function getProduct() : IProduct
function getProduct(namee : string) : IDopProduct
function getProduct(namee : string, costt : number,  countt : number) : IProduct

function getProduct(namee? : string, costt? : number,  countt? : number)
{
    if(!namee && !costt)
    {
        return {name : undefined, cost : undefined};
    }

    if(countt && !namee && !costt)
    {
        return {name : namee, cost : undefined, count : undefined};
    }

    return {name : namee, cost : costt, count : countt};
}

console.log('Empty: ', getProduct());
console.log('With name: ', getProduct('Alexa'));
console.log('Full: ', getProduct('Alexa', 1, 2));
