import 'dart:io';

class Node {
  int row;
  int col;
  List<Node> neighbors = [];

  Node(this.row, this.col);
}

List<List<Node>> graph = [];

void findLongestPaths(Node current, Node destination, List<Node> path,
    List<List<Node>> longestPaths, int count) {
  if (current == destination) {
    path.add(current);

    if (longestPaths.length < count ||
        path.length > longestPaths[longestPaths.length - 1].length) {
      longestPaths.add(List.from(path));

      if (longestPaths.length > count) {
        longestPaths.sort((a, b) => b.length - a.length);
        longestPaths.removeLast();
      }
    }

    path.removeLast();
    return;
  }

  path.add(current);

  for (var neighbor in graph[current.row][current.col].neighbors) {
    if (!path.contains(neighbor)) {
      findLongestPaths(neighbor, destination, path, longestPaths, count);
    }
  }

  path.removeLast();
}

void printMatrix(List<List<String>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      stdout.write(matrix[i][j] + " ");
    }
    print("");
  }
}

void main() {
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
  printMatrix(matrix);

  stdout.write("Enter the coordinates of the first point (row col): ");
  List<int> firstPoint =
      stdin.readLineSync()!.split(" ").map(int.parse).toList();

  stdout.write("Enter the coordinates of the second point (row col): ");
  List<int> secondPoint =
      stdin.readLineSync()!.split(" ").map(int.parse).toList();

  matrix[firstPoint[0]][firstPoint[1]] = "X";
  matrix[secondPoint[0]][secondPoint[1]] = "X";

  print("\nSelected two Nodes:");
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write(matrix[i][j] + " ");
    }
    print("");
  }

  Node firstNode = graph[firstPoint[0]][firstPoint[1]];
  Node secondNode = graph[secondPoint[0]][secondPoint[1]];

  print("First Point: (${firstNode.row}, ${firstNode.col})");
  print("Second Point: (${secondNode.row}, ${secondNode.col})");

  List<List<Node>> longestPaths = [];
  findLongestPaths(firstNode, secondNode, [], longestPaths, 4);

  print("\nLongest Paths:");
  for (int i = 0; i < longestPaths.length; i++) {
    stdout.write("Path ${i + 1}: ");
    for (var node in longestPaths[i]) {
      stdout.write("(${node.row},${node.col}) ");
    }
    print("");
  }
}
