import '../payment_strategy.dart';

class BkashPayment implements PaymentStrategy {
  String email;

  BkashPayment(this.email);

  @override
  void pay(double amount) {
    print('Paid $amount using Bkash.');
  }
}
