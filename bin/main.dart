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
////  [ 1, 5, 2, 4, 8, 9, 3, 7, 6 ],
////  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
////  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
////  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
////  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
////  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
////  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
////  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
////  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]
////  ]) ➞ true

// Challenge 3
// Sort by Factor Length
// A numbers factor length is simply its total number of factors.
// Create a function that sorts an array by factor length in descending order.
// If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.
//
// In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.
//
// factorSort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]
List factorSort(List<int> numbers) {
  numbers.sort(comparator);
  print(numbers);
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

bool sudokuValidator(List<List<int>> board) {
  int count = 0;
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if(i%3==0&&j%3==0){}
      if (rowContainsElement(board, board[i][j], i, j + 1)) {
        count++;
        print('row $i col $j');
        print('row invalidation');
      }
      if (colContainsElement(board, board[i][j], i + 1, j)) {
        count++;
        print('row $i col $j');
        print('col invalidation');
      }
    }
  }
  if (!containsNumbers(board, 0, 0)) count++;
  if (!containsNumbers(board, 0, 3)) count++;
  if (!containsNumbers(board, 0, 6)) count++;
  if (!containsNumbers(board, 3, 0)) count++;
  if (!containsNumbers(board, 3, 3)) count++;
  if (!containsNumbers(board, 3, 6)) count++;
  if (!containsNumbers(board, 6, 0)) count++;
  if (!containsNumbers(board, 6, 3)) count++;
  if (!containsNumbers(board, 6, 6)) count++;
  return count == 0;
}

bool containsNumbers(List<List<int>> board, int row, int col) {
  int count = 0;
  List numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  numbers.forEach((number) {
//   print('number is $number');
    if (in3x3Matrix(board, number, row, col)) count++;
  });
  return count == 9;
}

//checks 3x3 matrix contains all digits
bool in3x3Matrix(List<List<int>> board, int element, int row, int column) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[row + i][column + j] == element) {
//        print('${row + i} and ${column + j}');
        return true;
      }
      if (board[row + j][column + i] == element) {
//        print('${row + j} and ${column + i}');
        return true;
      }
    }
  }
  return false;
}

//checks for invalid column move
bool colContainsElement(
    List<List<int>> board, int element, int row, int column) {
  for (int i = row; i < board.length; i++) {
    if (element == board[i][column]) return true;
  }
  return false;
}

//checks for invalid row move
bool rowContainsElement(
    List<List<int>> board, int element, int row, int column) {
  for (int i = column; i < board[row].length; i++) {
    if (element == board[row][i]) return true;
  }
  return false;
}

main() {
  containsNumbers([
    [1, 2, 3],
    [4, 5, 6, 88],
    [07, 8, 9, 99],
  ], 0, 0);
  in3x3Matrix([
    [1, 2, 7, 77],
    [4, 7, 6, 88],
    [07, 8, 49, 99],
  ], 7, 0, 1);
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
  print(sudokuValidator([
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [2, 3, 4, 5, 6, 7, 8, 9, 1],
    [3, 4, 5, 6, 7, 8, 9, 1, 2],
    [4, 5, 6, 7, 8, 9, 1, 2, 3],
    [5, 6, 7, 8, 9, 1, 2, 3, 4],
    [6, 7, 8, 9, 1, 2, 3, 4, 5],
    [7, 8, 9, 1, 2, 3, 4, 5, 6],
    [8, 9, 1, 2, 3, 4, 5, 6, 7],
    [9, 1, 2, 3, 4, 5, 6, 7, 8]
  ]));
  factorSort([9, 7, 13, 12, 36, 19]);
}
