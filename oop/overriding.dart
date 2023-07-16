// A -> B -> C -> D -> new D()

class Model1 {
  String? name;

  void printDetails() {
    print('This is model1');
  }
}

/// if IS A then extends
class Model2 extends Model1 {
  @override
  void printDetails() {
    print('this is model2');
  }
}

class Model3 extends Model2 {
  @override
  void printDetails() {
    print('this is model3');
  }

  void printLG() {}
}

class Model4 extends Model3 {
  @override
  void printDetails() {
    print('this is model4');
  }

  void printLegacy(String legacyItem) {
    print('The Model is $legacyItem');
  }
}

void main(List<String> args) {
  var model4 = Model4();

  model4.printDetails();
  model4.printLegacy('Model2');
}
