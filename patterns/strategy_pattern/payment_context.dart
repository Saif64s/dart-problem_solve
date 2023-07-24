import 'payment_strategy.dart';

class PaymentContext {
  late PaymentStrategy _paymentStrategy;

  void setPaymentStrategy(PaymentStrategy paymentStrategy) {
    _paymentStrategy = paymentStrategy;
  }

  void makePayment(double amount) {
    _paymentStrategy.pay(amount);
  }
}
