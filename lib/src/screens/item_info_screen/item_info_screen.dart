import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/basket_screen/view_model/basket_view_model.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/wishlist_view_model.dart';

import '../../model/domain/item.dart';

class ItemInfoScreen extends StatelessWidget {
  const ItemInfoScreen({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    const TextStyle titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    final TextStyle descriptionStyle = TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
    );

    const TextStyle priceStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    const TextStyle previousPriceStyle = TextStyle(
        fontSize: 20,
        color: Colors.grey,
        decoration: TextDecoration.lineThrough,
        decorationColor: Colors.grey);

    const TextStyle saleStyle = TextStyle(
      fontSize: 20,
      color: Colors.red,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          backgroundColor: const Color(0xfff5f5f5),
          centerTitle: true,
          title: SizedBox(
            height: 50,
            child: SvgPicture.asset(
              "assets/images/homepage_images/appbar_logo.svg",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Image.network(
                  item.picture,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: titleStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.description,
                      style: descriptionStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Price: \$${item.price}',
                      style: priceStyle,
                    ),
                    if (item.isInSale)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Previous Price: \$${item.previousPrice}',
                            style: previousPriceStyle,
                          ),
                          Text(
                            'Sale: ${item.percentOfSale}%',
                            style: saleStyle,
                          ),
                        ],
                      ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        StarRating(
                          size: 20.0,
                          rating: item.rating,
                          color: Colors.orange,
                          borderColor: Colors.grey,
                          allowHalfRating: true,
                          starCount: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 4),
                          child: Text(
                            item.rating.toString(),
                            style: priceStyle.copyWith(
                                color: Colors.grey, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<WishlistViewModel>().addItemToWishlist(item);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                      ),
                      child: const Text(
                        'Add To WishList',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<BasketViewModel>().addItemToCart(item);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                          child: const Text(
                            'Add To Basket',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                          child: const Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
