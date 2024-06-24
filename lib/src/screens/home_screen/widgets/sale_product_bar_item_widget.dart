
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:stylish_ecommerce_app/src/model/domain/item.dart';

import '../../item_info_screen/item_info_screen.dart';

class SaleProductBarItem extends StatelessWidget {
  const SaleProductBarItem({
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
  final double price =item.price;
  final double previousPrice = item.previousPrice;
  final ThemeData themeData = Theme.of(context);
  final int percentOfSale = item.percentOfSale;
  final double rating = item.rating;
  final int amountOfFeedbacks = item.amountOfFeedbacks;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemInfoScreen(item: item)));
      },
      child: Container(
        width: 175,
        height: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(picture), fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 175,
              height: 150,
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "\$$previousPrice ",
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                                color: themeData.cardColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: themeData.cardColor,
                              ),
                            ),
                            TextSpan(
                              text: "  $percentOfSale%Off",
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                                color: Colors
                                    .red, // Set the color to red for the "sale %" text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                          ))
                    ],
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
