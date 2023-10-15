// TypeScript base - 2

// interface

interface IUser
{
    readonly id : number
    login : string
    password : string
    mobile_number : string
    email ? : string
    product: {
        name : string
        cost : number
        count : number
    }
}

const user1 : IUser = {
    id : 0,
    login : 'Tarkanov',
    password : '1234',
    mobile_number : '375257411803',
    email : 'chernaya@gmail.com',
    product : {
        name : 'Mobile',
        cost : 500,
        count : 1
    }
}

const user2 : IUser = {
    id : 1,
    login : 'Krasnov',
    password : '9876',
    mobile_number : '37544982345',
    product : {
        name : 'laptop',
        cost : 2000,
        count : 1
    }
}
user2.email = 'krasnov22@gmail.com';

console.log(user1);
console.log(user2);

const user3 = {} as IUser; // оператор as
const user3_2 = <IUser>{}; // альтернатива as

interface IFullUserMeth extends IUser // наследование
{
    getFullCost : () => number; 
}

const user4 : IFullUserMeth =
{
    id : 2,
    login : 'Belov',
    password : '1928',
    mobile_number : '375294029846',
    product : {
        name : 'microwave',
        cost : 500,
        count : 1
    },
    getFullCost() {
        return this.product.cost * this.product.count;
    }
}

interface ISpeed
{
    speed : number;
    setSpeed : () => void;
}

class Speed implements ISpeed // реализация
{
    speed : number;
    setSpeed()
    {
        console.log(`Скорость ${this.speed} км/ч`);
    }
}

interface IStyles
{
    [key : string] : string;
}

const css : IStyles = 
{
    border : '1px solid black',
    margin : '20px',
    borderRadius : '10px'
}
