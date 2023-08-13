import 'abstractions.dart';
import 'concrete_classes.dart';

void main() {
  // Create a factory instance for iOS
  UIFactory iosFactory = iOSUIFactory();

  // Create UI components using the iOS factory
  Button iosButton = iosFactory.createButton();
  TextField iosTextField = iosFactory.createTextField();

  iosButton.render(); // Renders iOS button
  iosTextField.render(); // Renders iOS text field

  // Create a factory instance for Android
  UIFactory androidFactory = AndroidUIFactory();

  // Create UI components using the Android factory
  Button androidButton = androidFactory.createButton();
  TextField androidTextField = androidFactory.createTextField();

  androidButton.render(); // Renders Android button
  androidTextField.render(); // Renders Android text field
}
