class Item {
  final String title;
  final String description;
  final String picture;
  final double price;
  final double rating;
  final int percentOfSale;
  final double previousPrice;
  final int amountOfFeedbacks;
  final bool isInSale;
  final List<String> sizes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          picture == other.picture &&
          price == other.price &&
          rating == other.rating &&
          percentOfSale == other.percentOfSale &&
          previousPrice == other.previousPrice &&
          amountOfFeedbacks == other.amountOfFeedbacks &&
          isInSale == other.isInSale &&
          sizes == other.sizes;

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      picture.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      percentOfSale.hashCode ^
      previousPrice.hashCode ^
      amountOfFeedbacks.hashCode ^
      isInSale.hashCode ^
      sizes.hashCode;

  const Item({this.sizes = const ["S", "M", "L", "XL", "XXL"],this.isInSale = false,required this.title, required this.description, required this.picture, required this.price, required this.rating,this.percentOfSale = -1, this.previousPrice = -1,this.amountOfFeedbacks = 0});

}