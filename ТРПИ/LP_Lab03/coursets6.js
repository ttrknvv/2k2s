// TypeScript base
// guards
function concatStroke(x, y) {
    if (typeof x === 'string') // typeof
     {
        return x + y;
    }
    return x.toString() + y;
}
console.log(concatStroke(1, 'prin'));
console.log(concatStroke('op', 'prin'));
class Helps {
    constructor() {
        this.people = 'Tarakanov';
        this.help = 'help';
    }
}
class Bad {
    constructor() {
        this.people = 'Tarakanov';
        this.bad = 'bad';
    }
}
function printSost(sost) {
    if (sost instanceof Helps) {
        return {
            info: sost.people + ' ' + sost.help
        };
    }
    else {
        return {
            info: sost.people + ' ' + sost.bad
        };
    }
}
function setType(type) { }
setType('help');
setType('bad');
setType('good');
// setType('def');
