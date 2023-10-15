// TypeScript base - 6

// guards

function concatStroke(x : string | number, y : string) : string
{
    if(typeof x === 'string') // typeof
    {
       return x + y; 
    }
    return x.toString() + y;
}

console.log(concatStroke(1, 'prin'));
console.log(concatStroke('op', 'prin'));

class Helps {
    people = 'Tarakanov'
    help = 'help'
}

class Bad {
    people = 'Tarakanov'
    bad = 'bad'
}

function printSost(sost : Helps | Bad)
{
    if(sost instanceof Helps)
    {
        return {
            info : sost.people + ' ' + sost.help
        }
    }
    else{
        return {
            info : sost.people + ' ' + sost.bad
        }
    }
}

type MyType = 'help' | 'bad' | 'good';

function setType(type : MyType) { }

setType('help');
setType('bad');
setType('good');

// setType('def');