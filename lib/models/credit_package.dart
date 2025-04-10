class CreditPackage {
  final int id;
  final double amount;
  final String currency;

  CreditPackage({required this.id, required this.amount, required this.currency});
}

List<CreditPackage> creditPackages = [
  CreditPackage(id: 1, amount: 1.0, currency: "KWD"),
  CreditPackage(id: 2, amount: 2.0, currency: "KWD"),
  CreditPackage(id: 3, amount: 3.0, currency: "KWD"),
  CreditPackage(id: 4, amount: 4.0, currency: "KWD"),
  CreditPackage(id: 5, amount: 5.0, currency: "KWD"),
  CreditPackage(id: 6, amount: 6.0, currency: "KWD"),
];
