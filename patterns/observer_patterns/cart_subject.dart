// cart_subject.dart
import 'cart_observer.dart';

class CartSubject {
  List<String> _cartItems = [];
  List<CartObserver> _observers = [];

  void addObserver(CartObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(CartObserver observer) {
    _observers.remove(observer);
  }

  void addToCart(String item) {
    _cartItems.add(item);
    notifyObservers();
  }

  void notifyObservers() {
    for (var observer in _observers) {
      observer.onCartUpdated(_cartItems);
    }
  }
}
