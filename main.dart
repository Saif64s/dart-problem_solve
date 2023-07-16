// Map<dynamic, dynamic> map = HashMap();
// int? a;

// String s = 'Selise';

// a = int.tryParse(s);

void main(List<String> args) {
  List<int> list = [2, 1, 5, 8, 3];
  list.sort((a, b) => b - a);

  print(list);
}

class A {
  int a = 1;

  static int bStatic = 2;
}
