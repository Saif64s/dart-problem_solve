import 'payment_context.dart';

import 'payments/bank_transfer_payment.dart';
import 'payments/bkash_payemnt.dart';
import 'payments/credit_card_payment.dart';

void main() {
  final paymentContext = PaymentContext();

  // Using Credit Card
  final creditCardPayment =
      CreditCardPayment('1234 5678 9012 3456', 'John Doe', '12/24', '123');
  paymentContext.setPaymentStrategy(creditCardPayment);
  paymentContext.makePayment(100.0);

  // Using Bkash
  final bkashPayment = BkashPayment('john.doe@example.com');
  paymentContext.setPaymentStrategy(bkashPayment);
  paymentContext.makePayment(50.0);

  // Using Bank Transfer
  final bankTransferPayment = BankTransferPayment('987654321', 'ABC123');
  paymentContext.setPaymentStrategy(bankTransferPayment);
  paymentContext.makePayment(200.0);
}
