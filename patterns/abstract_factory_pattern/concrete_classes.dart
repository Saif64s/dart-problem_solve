// Concrete Product A1 (iOSButton)
import 'abstractions.dart';

class iOSButton implements Button {
  @override
  void render() {
    print('Rendering iOS button.');
  }
}

// Concrete Product A2 (AndroidButton)
class AndroidButton implements Button {
  @override
  void render() {
    print('Rendering Android button.');
  }
}

// Concrete Product B1 (iOSTextField)
class iOSTextField implements TextField {
  @override
  void render() {
    print('Rendering iOS text field.');
  }
}

// Concrete Product B2 (AndroidTextField)
class AndroidTextField implements TextField {
  @override
  void render() {
    print('Rendering Android text field.');
  }
}

// Concrete Factory 1 (iOSUIFactory)
class iOSUIFactory implements UIFactory {
  @override
  Button createButton() {
    return iOSButton();
  }

  @override
  TextField createTextField() {
    return iOSTextField();
  }
}

// Concrete Factory 2 (AndroidUIFactory)
class AndroidUIFactory implements UIFactory {
  @override
  Button createButton() {
    return AndroidButton();
  }

  @override
  TextField createTextField() {
    return AndroidTextField();
  }
}
