// page_one.dart
import 'cart_observer.dart';

class PageOne implements CartObserver {
  @override
  void onCartUpdated(List<String> cartItems) {
    print("Page One - Cart Updated: $cartItems");
  }
}
