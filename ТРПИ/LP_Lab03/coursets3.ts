// TypeScript base - 3

// enum

enum COLORS {
    RED, // 0
    BLACK, // 1
    BLUE, // 2
    WHITE // 3
}

const color = COLORS.BLACK;
const nameEnum = COLORS[0];
console.log(color);
console.log(nameEnum);

enum positions
{
    CHIEF = 'BOSS',
    E = 'ENGINEER',
    SWEEPER = 'CLEANER'
}

const pos = positions.E;
console.log(pos);