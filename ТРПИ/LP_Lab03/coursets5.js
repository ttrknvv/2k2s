// TypeScript base
// class
class Person {
    constructor(name) {
        this.name = name;
    }
    set Name(name) {
        this.name = name;
    }
    get Name() {
        return this.name;
    }
    getinfo() {
        console.log('Person ', this.name);
    }
}
class Mobile {
    constructor(model) {
        this.model = model;
    }
}
class Laptop {
}
class MyLaptop extends Laptop {
    setVersion(vers) {
        this.version = vers;
    }
}
const lap = new MyLaptop();
lap.OS = 'Android';
console.log(lap.OS);
lap.setVersion('1.0');
// console.log(lap.version)
// console.log(lap.country)
class Company {
}
class AppleCompany extends Company {
    infoCompany() {
        return 'Apple company';
    }
    setDate(date) {
        this.date = date;
    }
}
