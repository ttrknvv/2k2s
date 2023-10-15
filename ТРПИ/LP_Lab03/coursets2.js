// TypeScript base - 2
const user1 = {
    id: 0,
    login: 'Tarkanov',
    password: '1234',
    mobile_number: '375257411803',
    email: 'chernaya@gmail.com',
    product: {
        name: 'Mobile',
        cost: 500,
        count: 1
    }
};
const user2 = {
    id: 1,
    login: 'Krasnov',
    password: '9876',
    mobile_number: '37544982345',
    product: {
        name: 'laptop',
        cost: 2000,
        count: 1
    }
};
user2.email = 'krasnov22@gmail.com';
console.log(user1);
console.log(user2);
