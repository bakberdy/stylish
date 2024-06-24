import 'package:stylish_ecommerce_app/src/model/domain/bank_account.dart';
import 'package:stylish_ecommerce_app/src/model/domain/user.dart';

import 'domain/item.dart';

class Model {
  User user = User(
      name: "Bakberdi",
      lastName: "Yessentay",
      avatarPhoto:
          "https://nypost.com/wp-content/uploads/sites/2/2023/04/NYPICHPDPICT000008716622-2.jpg",
      address: "Taraz, baiterek 18");


  List<Item> itemsInSale = [
    const Item(
        title: "Rash Guard for Men",
        description:
            "UPF 50+ UV Sun Protection Swim Shirts Short Sleeve Quick Dry Lightweight Fishing Running Water Shirts",
        picture:
            "https://m.media-amazon.com/images/I/61SNOclP22L._AC_SY550_.jpg",
        price: 14,
        rating: 1,
        isInSale: true,
        previousPrice: 18.9,
        percentOfSale: 20),
    const Item(
        title: "COOFANDY Men's Linen Shirts",
        description:
            "Short Sleeve Casual Shirts Button Down Shirt for Men Beach Summer Wedding Shirt",
        picture:
            "https://m.media-amazon.com/images/I/81+oQBvBR-L._AC_SX569_.jpg",
        price: 29.9,
        rating: 4.3,
        isInSale: true,
        previousPrice: 58.9,
        percentOfSale: 70),
    const Item(
        title: "Rash Guard for Men",
        description:
            "UPF 50+ UV Sun Protection Swim Shirts Short Sleeve Quick Dry Lightweight Fishing Running Water Shirts",
        picture:
            "https://m.media-amazon.com/images/I/61SNOclP22L._AC_SY550_.jpg",
        price: 14,
        rating: 4.4,
        isInSale: true,
        previousPrice: 25.9,
        percentOfSale: 40),
    const Item(
        title: "Rash Guard for Men",
        description:
            "UPF 50+ UV Sun Protection Swim Shirts Short Sleeve Quick Dry Lightweight Fishing Running Water Shirts",
        picture:
            "https://m.media-amazon.com/images/I/61SNOclP22L._AC_SY550_.jpg",
        price: 14,
        rating: 4.4,
        isInSale: true,
        previousPrice: 18.9,
        percentOfSale: 50)
  ];

  final List<String> saleAnnounces = [
    "assets/images/homepage_images/sale.png",
    "assets/images/homepage_images/sale_2.png",
    "assets/images/homepage_images/sale_3.jpg"
  ];

  void removeFromWishlist(Item item) {
    user.wishListItems.remove(item);
  }
  void addToCart(Item item){
    user.cartItems.add(item);
  }

  void removeFromBasket(Item item) {
    user.cartItems.remove(item);
  }

  void removeAllFromBasket() {
    user.cartItems.clear();
  }


}
