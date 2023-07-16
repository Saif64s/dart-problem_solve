// Define a mixin for logging functionality
mixin LoggingMixin {
  void log(String message) {
    print('[LOG]: $message');
  }
}

// Define a class that uses the logging mixin
class Calculator with LoggingMixin {
  int add(int a, int b) {
    int result = a + b;
    log('Adding $a and $b. Result: $result');
    return result;
  }
}

void main() {
  // Create an instance of the Calculator class
  Calculator calculator = Calculator();

  // Use the add method, which also logs the operation
  int sum = calculator.add(5, 7);
  print('Sum: $sum');
}
