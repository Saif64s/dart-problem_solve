abstract class Price {
  double calculateArea();
}

class WithTax extends Price {
  double amount;
  WithTax(this.amount);

  @override
  double calculateArea() {
    return amount + (15 / 100);
  }
}

class WithoutTax extends Price {
  double amount;
  WithoutTax(this.amount);

  @override
  double calculateArea() {
    return amount - (15 / 100);
  }
}

class WithVoucher extends Price {
  double amount;
  WithVoucher(this.amount);

  @override
  double calculateArea() {
    return amount - 500;
  }
}

class PriceCalc {
  double calculatePrice(Price price) {
    return price.calculateArea();
  }
}
