// page_two.dart
import 'cart_observer.dart';

class PageTwo implements CartObserver {
  @override
  void onCartUpdated(List<String> cartItems) {
    print("Page Two - Cart Updated: $cartItems");
  }
}
