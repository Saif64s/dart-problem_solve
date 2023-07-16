class Apple {
  String device;
  String model;

  Apple(this.device, this.model);
}

class Macbook extends Apple {
  Macbook(super.device, super.model);

  void displayModelDetails() {
    print('this is $device $model');
  }
}

class Air extends Macbook {
  Air(super.device, super.model);

  void displayAirSpec() {
    print('this is $device $model');
  }
}

void main(List<String> args) {
  var air = new Air('Macbook', 'Air 2023');
  air.displayAirSpec();
}
