import '../payment_strategy.dart';

class BankTransferPayment implements PaymentStrategy {
  String accountNumber;
  String bankCode;

  BankTransferPayment(this.accountNumber, this.bankCode);

  @override
  void pay(double amount) {
    print('Paid $amount using Bank Transfer.');
  }
}
