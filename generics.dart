void calculate<T extends num>(T a, T b) {
  print(a + b);
}

void contat<T extends dynamic>(T val1, T val2) {
  print("$val1 is a String: $val2");
}

void main(List<String> args) {
  calculate(4, 5);
  contat(5.1, "Double Value");
}
