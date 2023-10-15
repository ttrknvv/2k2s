// typescript : object, 


class products
{
    private readonly _id : number;
    private readonly _size : number;
    private readonly _color : string;
    private _cost : number;
    private _discount : number;
    private _endCost : number;
    public get color() : string {
        return this._color;
    }
    public set discount(n : number) {
        if(n < 0 || n > 100) {
            throw "False discount"
        }
        this._discount = n;
        this._endCost = (n * this._cost) / 100;
    }
    public set endCost(n : number) {
        if(n < 0) {
            throw "False cost"
        }
        if(n >= this._cost) {
            this._cost = n;
            this._endCost = n;
        }
        else {
            this._endCost = n;
            this._discount = 100 - (100 * n) / this._cost;
        }
    }
    public get endCost() {
        return this._endCost;
    }
    public get discount() {
        return this._discount;
    }
    constructor(id : number, size : number, color : string, cost : number)
    {
        this._id = id;
        this._color = color;
        this._cost = cost;
        this._endCost = cost;
        this._size = size;
        this._discount = 0;
    }
}

class shoes extends products {}

class boots extends shoes {}
class sneakers extends shoes {}
class sandals extends shoes {}

class ProsuctsIterator<T> implements Iterator<T>
{
    private index : number;
    private done : boolean;
    elements : products[];
    constructor(private values : T[])
    {
        this.index = 0;
        this.done = false;
    }
    next() : IteratorResult<T, number | undefined> {
        if(this.done)
        {
            return {
                done: this.done,
                value:undefined
            };
        }
        if(this.index == this.values.length) {
            this.done = true;
            return {
                done: this.done,
                value: this.index
            };
        }
        const value = this.values[this.index];
        this.index += 1;
        return {
            done: false,
            value
        }
    }
}

const boots2 : products[] = [new boots(1, 36, "blue", 12), new sneakers(2, 33, "yellow", 10), new sandals(3, 40, "blue", 9)];

for(const val of boots2)
{
    if(val.color == "blue")
    {
        console.log(val);
    }
}

let sandals1 : boots = new boots(1, 36, "blue", 12);

sandals1.discount = 50;
console.log(sandals1.endCost);

sandals1.discount = 0;
sandals1.endCost = 3;
console.log(sandals1.discount);