// main.dart
import 'dart:io';
import 'cart_subject.dart';
import 'page_one.dart';
import 'page_two.dart';

void main() {
  // Create the subject (cart) and observers (pages)
  var cartSubject = CartSubject();
  var pageOne = PageOne();
  var pageTwo = PageTwo();

  // Register observers with the subject
  cartSubject.addObserver(pageOne);
  cartSubject.addObserver(pageTwo);

  // Loop to continuously add items to the cart
  while (true) {
    print("\nEnter item to add to the cart (or 'exit' to stop):");
    var input = stdin.readLineSync();

    if (input?.toLowerCase() == 'exit') {
      break;
    }

    cartSubject.addToCart(input!);
  }
}
