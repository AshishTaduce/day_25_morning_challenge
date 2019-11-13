// Challenge 1
// Write Test cases for given challenges

// Challenge 2
// Sudoku Validation
// Write a sudoku validator. This function should return true if the 2-D array represents a valid sudoku and false otherwise. To be a valid sudoku:
//
// - Each row must have the digits from 1 to 9 exactly once.
// - Each column must have the digits from 1 to 9 exactly once.
// - Each 3x3 box must have the digits from 1 to 9 exactly once.
// Examples
//  sudokuValidator([
//  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
//  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
//  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
//  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
//  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
//  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
//  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
//  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
//  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]

//  ]) ➞ true
transposeMatrix(List<List> matrix) {
  List<List> transpose = List<List>();
  for (int i = 0; i < matrix[0].length; i++) {
    List newList = List();
    matrix.forEach((list) => {newList.add(list[i])});
    transpose.add(newList);
  }
  return transpose;
}

checkList(List<List<int>> board, int i) {
  return !(board[i]
      .toSet()
      .length != 9);
}

bool validInputs(List<List<int>> board) {
  for (List <int> x in board) {
    x.every((number) => number > 0 && number < 10);
  }
}

bool checkRow(List<List<int>> board) {
  return (board.every((List <int>list) =>
  (list
      .toSet()
      .length == 9)));
}

bool checkCol(List<List<int>> board) {
  List<List> transposed = transposeMatrix(board);
  return (transposed.every((List list) =>
  (list
      .toSet()
      .length == 9)));
}

bool checkBlock(List<List<int>> board, int row, int col) {
  List newList = [];
  for (var y in board) {
    newList = [newList, y].expand((x) => x).toList();
  }
  return (newList
      .toSet()
      .length == 9);
}

bool sudokuValidator(List<List<int>> board) {
  return checkRow(board) && checkCol(board) && validateBlock(board);
}

bool validateBlock(List<List<int>> board) {
  int n = 9;
  for (int row = 0; row < n; row + 3) {
    for (int col = 0; col < n; col + 3) {
      return checkBlock(board, row, col);
    }
  }
}

// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]

// Sort an array of numbers according
// to number of factors.

List factorSort(List<int> numbers) {
  numbers.sort(comparator);
  return numbers;
}

int comparator(int a, int b) {
  int aFactorCount = 0;
  int bFactorCount = 0;
  for (int i = 1; i < a; i++) {
    if (a % i == 0) {
      aFactorCount++;
    }
  }
  for (int i = 1; i < b; i++) {
    if (b % i == 0) {
      bFactorCount++;
    }
  }
  if (aFactorCount < bFactorCount) return 1;
  if (aFactorCount > bFactorCount) return -1;
  if (aFactorCount == bFactorCount) {
    if (a < b) return 1;
    if (a == b) return 0;
    if (a > b) return -1;
  }
}

main() {
  print(sudokuValidator([
    [1, 5, 2, 4, 8, 9, 3, 7, 6],
    [7, 3, 9, 2, 5, 6, 8, 4, 1],
    [4, 6, 8, 3, 7, 1, 2, 9, 5],
    [3, 8, 7, 1, 2, 4, 6, 5, 9],
    [5, 9, 1, 7, 6, 3, 4, 2, 8],
    [2, 4, 6, 8, 9, 5, 7, 1, 3],
    [9, 1, 4, 6, 3, 7, 5, 8, 2],
    [6, 2, 5, 9, 4, 8, 1, 3, 7],
    [8, 7, 3, 5, 1, 2, 9, 6, 4]
  ]));
  print(factorSort([9, 7, 13, 12]));
}
