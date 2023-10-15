// typescript : object, 
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var products = /** @class */ (function () {
    function products(id, size, color, cost) {
        this._id = id;
        this._color = color;
        this._cost = cost;
        this._endCost = cost;
        this._size = size;
        this._discount = 0;
    }
    Object.defineProperty(products.prototype, "color", {
        get: function () {
            return this._color;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(products.prototype, "discount", {
        get: function () {
            return this._discount;
        },
        set: function (n) {
            if (n < 0 || n > 100) {
                throw "False discount";
            }
            this._discount = n;
            this._endCost = (n * this._cost) / 100;
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(products.prototype, "endCost", {
        get: function () {
            return this._endCost;
        },
        set: function (n) {
            if (n < 0) {
                throw "False cost";
            }
            if (n >= this._cost) {
                this._cost = n;
                this._endCost = n;
            }
            else {
                this._endCost = n;
                this._discount = 100 - (100 * n) / this._cost;
            }
        },
        enumerable: false,
        configurable: true
    });
    return products;
}());
var shoes = /** @class */ (function (_super) {
    __extends(shoes, _super);
    function shoes() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return shoes;
}(products));
var boots = /** @class */ (function (_super) {
    __extends(boots, _super);
    function boots() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return boots;
}(shoes));
var sneakers = /** @class */ (function (_super) {
    __extends(sneakers, _super);
    function sneakers() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return sneakers;
}(shoes));
var sandals = /** @class */ (function (_super) {
    __extends(sandals, _super);
    function sandals() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    return sandals;
}(shoes));
var ProsuctsIterator = /** @class */ (function () {
    function ProsuctsIterator(values) {
        this.values = values;
        this.index = 0;
        this.done = false;
    }
    ProsuctsIterator.prototype.next = function () {
        if (this.done) {
            return {
                done: this.done,
                value: undefined
            };
        }
        if (this.index == this.values.length) {
            this.done = true;
            return {
                done: this.done,
                value: this.index
            };
        }
        var value = this.values[this.index];
        this.index += 1;
        return {
            done: false,
            value: value
        };
    };
    return ProsuctsIterator;
}());
var boots2 = [new boots(1, 36, "blue", 12), new sneakers(2, 33, "yellow", 10), new sandals(3, 40, "blue", 9)];
for (var _i = 0, boots2_1 = boots2; _i < boots2_1.length; _i++) {
    var val = boots2_1[_i];
    if (val.color == "blue") {
        console.log(val);
    }
}
var sandals1 = new boots(1, 36, "blue", 12);
sandals1.discount = 50;
console.log(sandals1.endCost);
sandals1.discount = 0;
sandals1.endCost = 3;
console.log(sandals1.discount);
