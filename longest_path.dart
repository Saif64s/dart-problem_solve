import 'dart:io';
import 'dart:async';

class Node {
  int row;
  int col;
  List<Node> neighbors = [];

  Node(this.row, this.col);
}

List<List<Node>> graph = [];

void _findLongestPaths(Node current, Node destination, List<Node> visited,
    List<List<Node>> longestPaths, int count) {
  if (current == destination) {
    visited.add(current);

    if (longestPaths.length < count ||
        visited.length > longestPaths[longestPaths.length - 1].length) {
      longestPaths.add(List.from(visited));

      if (longestPaths.length > count) {
        longestPaths.sort((a, b) => b.length - a.length);
        longestPaths.removeLast();
      }
    }

    visited.removeLast();
    return;
  }

  visited.add(current);

  for (var neighbor in graph[current.row][current.col].neighbors) {
    if (!visited.contains(neighbor)) {
      _findLongestPaths(neighbor, destination, visited, longestPaths, count);
    }
  }

  visited.removeLast();
}

void _printMatrix(List<List<String>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      stdout.write(matrix[i][j] + " ");
    }
    print("");
  }
  print("\n");
}

// Helper function to print matrix with a delay and animate the longest path
Future<void> _printMatrixWithDelayAndAnimatePath(
    List<List<String>> matrix, List<Node> longestPath) async {
  // Create a copy of the matrix to keep the original state intact
  List<List<String>> animatedMatrix =
      matrix.map((row) => List<String>.from(row)).toList();

  for (int i = 1; i < longestPath.length; i++) {
    // Determine the direction of movement
    int fromRow = longestPath[i - 1].row;
    int fromCol = longestPath[i - 1].col;
    int toRow = longestPath[i].row;
    int toCol = longestPath[i].col;

    if (fromRow < toRow) {
      animatedMatrix[fromRow][fromCol] = "↓"; // Down arrow
    } else if (fromRow > toRow) {
      animatedMatrix[fromRow][fromCol] = "↑"; // Up arrow
    } else if (fromCol < toCol) {
      animatedMatrix[fromRow][fromCol] = "→"; // Right arrow
    } else if (fromCol > toCol) {
      animatedMatrix[fromRow][fromCol] = "←"; // Left arrow
    }

    // Introduce a delay after marking a node with an arrow
    await Future.delayed(Duration(milliseconds: 200));
    // Clear the console
    if (Platform.isWindows) {
      // For Windows OS
      await Process.run('cls', []);
    } else {
      // For other OS (Linux, macOS)
      await Process.run('clear', []);
    }
    // Print the updated matrix with the animated path
    _printMatrix(animatedMatrix);
  }
}

Future<void> main() async {
  stdout.write("Enter the number of rows (m): ");
  int m = int.parse(stdin.readLineSync()!);

  stdout.write("Enter the number of columns (n): ");
  int n = int.parse(stdin.readLineSync()!);

  List<List<String>> matrix = List.generate(
    m,
    (_) => List<String>.filled(n, 'o'),
  );

  graph = List.generate(
    m,
    (i) => List<Node>.generate(n, (j) => Node(i, j)),
  );

  // Creating the connections between neighbors
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (i > 0) graph[i][j].neighbors.add(graph[i - 1][j]); // Up
      if (i < m - 1) graph[i][j].neighbors.add(graph[i + 1][j]); // Down
      if (j > 0) graph[i][j].neighbors.add(graph[i][j - 1]); // Left
      if (j < n - 1) graph[i][j].neighbors.add(graph[i][j + 1]); // Right
    }
  }

  print("Matrix:");
  _printMatrix(matrix);

  stdout.write("Enter the coordinates of the first point (row col): ");
  List<int> firstPoint =
      stdin.readLineSync()!.split(" ").map(int.parse).toList();

  stdout.write("Enter the coordinates of the second point (row col): ");
  List<int> secondPoint =
      stdin.readLineSync()!.split(" ").map(int.parse).toList();

  matrix[firstPoint[0]][firstPoint[1]] = "X";
  matrix[secondPoint[0]][secondPoint[1]] = "X";

  print("\nSelected two Nodes:");
  _printMatrix(matrix);

  Node firstNode = graph[firstPoint[0]][firstPoint[1]];
  Node secondNode = graph[secondPoint[0]][secondPoint[1]];

  print("First Point: (${firstNode.row}, ${firstNode.col})");
  print("Second Point: (${secondNode.row}, ${secondNode.col})");

  List<List<Node>> longestPaths = [];
  _findLongestPaths(firstNode, secondNode, [], longestPaths, 4);

  print("\nLongest Paths:");
  for (int i = 0; i < longestPaths.length; i++) {
    stdout.write("Path ${i + 1}: ");
    for (var node in longestPaths[i]) {
      stdout.write("(${node.row},${node.col}) ");
    }
    print("");
  }
  for (int i = 0; i < longestPaths.length; i++) {
    print("Path ${i + 1}: ");

    // Introduce a delay before printing each path
    await Future.delayed(Duration(milliseconds: 500));
    // Print the matrix with the animated path for the current longest path
    await _printMatrixWithDelayAndAnimatePath(matrix, longestPaths[i]);
  }
}
