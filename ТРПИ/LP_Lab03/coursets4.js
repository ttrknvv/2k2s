// TypeScript base
// function
function printMessage(message) {
    console.log(message);
}
function getProduct(namee, costt, countt) {
    if (!namee && !costt) {
        return { name: undefined, cost: undefined };
    }
    if (countt && !namee && !costt) {
        return { name: namee, cost: undefined, count: undefined };
    }
    return { name: namee, cost: costt, count: countt };
}
console.log('Empty: ', getProduct());
console.log('With name: ', getProduct('Alexa'));
console.log('Full: ', getProduct('Alexa', 1, 2));
