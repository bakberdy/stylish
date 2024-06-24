import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../model/domain/item.dart';
import '../screens/wishlist_item_info_screen.dart';

class ProductBarItem extends StatelessWidget {
  const ProductBarItem({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {

    final String picture = item.picture;
    final String title = item.title;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String description = item.description;
    final double price = item.price;
    final ThemeData themeData = Theme.of(context);
    final double rating = item.rating;
    final int amountOfFeedbacks = item.amountOfFeedbacks;

    var media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WishListItemInfoScreen(
                      item: item,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        width: (media.width - 40) / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                picture,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    maxLines: 1,
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text("\$$price",
                      style: textTheme.titleSmall?.copyWith(fontSize: 16)),
                  Row(
                    children: [
                      StarRating(
                        size: 20.0,
                        rating: rating,
                        color: Colors.orange,
                        borderColor: Colors.grey,
                        allowHalfRating: true,
                        starCount: 5,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("$amountOfFeedbacks",
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            color: themeData.cardColor,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
