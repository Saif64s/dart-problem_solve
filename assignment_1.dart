// TreeNode max: 2
// maxDepth: 10
// Does not know the depth of its leaf
// Each Node will have max value of 100

// 2. value < 50 -> delete these and print again.

import 'dart:math';

class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTreeGenerator {
  Random random = Random();
  int maxDepth;
  int maxValue;

  BinaryTreeGenerator(this.maxDepth, this.maxValue);

  TreeNode? generateTree(int depth) {
    if (depth > maxDepth || random.nextInt(100) < 10) {
      return null;
    }

    TreeNode node = TreeNode(random.nextInt(maxValue) + 1);
    node.left = generateTree(depth + 1);
    node.right = generateTree(depth + 1);

    return node;
  }

  List<List<String?>> generateView(TreeNode? root) {
    List<List<String?>> view = [];
    if (root == null) {
      return view;
    }

    int maxLevel = maxDepth + 1;
    int maxNumNodes = pow(2, maxLevel).toInt() - 1;
    view = List.generate(maxLevel, (_) => List.filled(maxNumNodes, null));

    fillView(root, view, 0, 0, maxNumNodes - 1);

    return view;
  }

  void fillView(TreeNode? node, List<List<String?>> view, int level, int left,
      int right) {
    if (node == null) {
      return;
    }

    int mid = (left + right) ~/ 2;
    view[level][mid] = node.value.toString();

    fillView(node.left, view, level + 1, left, mid - 1);
    fillView(node.right, view, level + 1, mid + 1, right);
  }

  void printView(List<List<String?>> view) {
    for (int i = 0; i < view.length; i++) {
      String row = '';
      for (int j = 0; j < view[i].length; j++) {
        String? value = view[i][j];
        if (value == null) {
          row += '   ';
        } else {
          row += value.padLeft(3) + ' ';
        }
      }
      print(row);
    }
  }

  void generateAndPrintTree() {
    TreeNode? root = generateTree(0);

    if (root != null) {
      print('Binary Tree:\n');
      List<List<String?>> view = generateView(root);
      printView(view);
    } else {
      print('Failed to generate a binary tree.');
    }
  }
}

void main() {
  BinaryTreeGenerator generator = BinaryTreeGenerator(3, 15);
  generator.generateAndPrintTree();
}
