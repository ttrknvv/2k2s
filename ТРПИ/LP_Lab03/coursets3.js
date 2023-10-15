// TypeScript base
// enum
var COLORS;
(function (COLORS) {
    COLORS[COLORS["RED"] = 0] = "RED";
    COLORS[COLORS["BLACK"] = 1] = "BLACK";
    COLORS[COLORS["BLUE"] = 2] = "BLUE";
    COLORS[COLORS["WHITE"] = 3] = "WHITE"; // 3
})(COLORS || (COLORS = {}));
const color = COLORS.BLACK;
const nameEnum = COLORS[0];
console.log(color);
console.log(nameEnum);
var positions;
(function (positions) {
    positions["CHIEF"] = "BOSS";
    positions["E"] = "ENGINEER";
    positions["SWEEPER"] = "CLEANER";
})(positions || (positions = {}));
const pos = positions.E;
console.log(pos);
