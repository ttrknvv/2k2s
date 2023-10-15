"use strict";
// typescript : класс, метод, export
exports.__esModule = true;
exports.Challenge = void 0;
var Challenge = /** @class */ (function () {
    function Challenge() {
    }
    Challenge.solution = function (number) {
        if (number <= 0) {
            return 0;
        }
        var sum = 0;
        for (var i = 1; i < number; i++) {
            if (i % 3 == 0) {
                sum += i;
            }
            else if (i % 5 == 0) {
                sum += i;
            }
        }
        return sum;
    };
    return Challenge;
}());
exports.Challenge = Challenge;
console.log(Challenge.solution(10));
console.log(Challenge.solution(0));
console.log(Challenge.solution(-9));
console.log(Challenge.solution(99));
