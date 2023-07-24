import '../payment_strategy.dart';

class CreditCardPayment implements PaymentStrategy {
  String cardNumber;
  String cardHolder;
  String expiryDate;
  String cvv;

  CreditCardPayment(
      this.cardNumber, this.cardHolder, this.expiryDate, this.cvv);

  @override
  void pay(double amount) {
    print('Paid $amount using Credit Card.');
  }
}
