// typesccript : Set
var sizeLine = 9;
var mySudoku = [
    [5, 3, 7, null, null, null, null, null, null],
    [6, null, null, 1, 9, 5, null, null, null],
    [null, 9, 8, null, null, null, null, 6, null],
    [8, null, null, null, 6, null, null, null, 3],
    [4, null, null, 8, null, 3, null, null, 1],
    [7, null, null, null, 2, null, null, null, 6],
    [null, 6, null, null, null, null, 2, 8, null],
    [null, null, null, 4, 1, 9, null, null, 5],
    [null, null, null, null, 8, null, null, 7, 9]
];
function verificationLine(arr) {
    var SetV = new Set();
    var SetG = new Set();
    for (var i = 0; i < sizeLine; i++) {
        for (var j = 0; j < sizeLine; j++) {
            if (arr[i][j] != null) {
                if (arr[i][j] > 0 && arr[i][j] <= 9 && !SetG.has(arr[i][j])) {
                    SetG.add(arr[i][j]);
                }
                else
                    return false;
            }
            if (arr[j][i] > 0 && arr[j][i] <= 9 && arr[j][i] != null) {
                if (!SetV.has(arr[j][i])) {
                    SetV.add(arr[j][i]);
                }
                else
                    return false;
            }
        }
        SetV.clear();
        SetG.clear();
    }
    return true;
}
function verificationSmallMatrix(arr) {
    var i = 0;
    var mySet = new Set();
    for (var j = 0;; j++) {
        if (!mySet.has(arr[i][j])) {
            if (arr[i][j] != null) {
                mySet.add(arr[i][j]);
            }
        }
        else
            return false;
        if (i == 8 && j == 8)
            break;
        if (i == 8 && j != 8 && (j + 1) % 3 == 0) // i = 0 j = 0
         {
            i = 0;
            mySet.clear();
            continue;
        }
        if ((j + 1) % 3 == 0 && (i + 1) % 3 == 0) {
            i++;
            j -= 3;
            mySet.clear();
            continue;
        }
        if ((j + 1) % 3 == 0) {
            i++;
            j -= 3;
            continue;
        }
    }
    return true;
}
if (verificationLine(mySudoku) && verificationSmallMatrix(mySudoku)) {
    console.log("Sudoku is ok!");
}
else {
    console.log("Error in sudoku");
}
