class InfoCardModel {
  final int square;
  final int price;
  final int previousPrice;
  final String image;
  final String currency;
  InfoCardModel({
    required this.square,
    required this.price,
    required this.previousPrice,
    required this.image,
    this.currency = '₽',
  });
}
