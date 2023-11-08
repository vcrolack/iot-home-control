class Product {
  final int id;
  final String name;
  final DateTime purchaseDate;
  final DateTime expiryDate;
  final double quantity;
  final String sizes;
  final int userId;

  Product(
      {required this.id,
      required this.name,
      required this.purchaseDate,
      required this.expiryDate,
      required this.quantity,
      required this.sizes,
      required this.userId});
}
