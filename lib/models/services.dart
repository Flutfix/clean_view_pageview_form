class ServicesModel {
  final String name;
  final int price;
  final String currency;
  int count;

  ServicesModel({
    required this.name,
    required this.price,
    this.currency = 'руб',
    this.count = 0,
  });
}