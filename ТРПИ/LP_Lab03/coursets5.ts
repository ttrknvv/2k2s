// TypeScript base - 5

// class

class Person
{
    name : string

    constructor(name: string)
    {
        this.name = name;
    }

    set Name(name : string)
    {
        this.name = name;
    }
    get Name() : string
    {
        return this.name;
    }
    getinfo()
    {
        console.log('Person ', this.name)
    }
}

class Mobile
{
    readonly version : string
    country : string
    constructor(readonly model : string) {}
}

class Laptop
{
    protected version : string
    public OS : string
    private country : string
}

class MyLaptop extends Laptop
{
    public setVersion(vers : string)
    {
        this.version = vers;
    }
}

const lap = new MyLaptop();
lap.OS = 'Android';
console.log(lap.OS);
lap.setVersion('1.0');
// console.log(lap.version)
// console.log(lap.country)

abstract class Company
{
    abstract infoCompany() : string
    abstract setDate(date : string) : void
}

class AppleCompany extends Company
{
    public date : string
    infoCompany() {
        return 'Apple company';
    }
    setDate(date : string)
    {
        this.date = date;
    }
}