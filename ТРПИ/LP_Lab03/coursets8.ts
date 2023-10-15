// TypeScript base - 8

// operators

interface User {
    login : string
    password : number
}

type UserKeys = keyof User // 'login' | 'password'

let myLogin: UserKeys = 'login'
let myPassword : UserKeys = 'password'

type Person = {
    _name: string
    surname: string
    birthday: Date
}

type person1 = Exclude<keyof Person, '_name' | 'surname'>
type person2 = Pick<Person, '_name'>

let var1 : person1 = 'birthday';
// var1 = '_name';

let var2 : person2 = {
    _name : "Nikita"
};
/* var2 = {
    surname: "22"
} */
var2._name = 'Masha';


