
import 'package:flutter/material.dart';

import 'filter_bar_item_widget.dart';

class FilterBarWidget extends StatefulWidget {
  const FilterBarWidget({
    super.key,
  });

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
   List<Map<String, String>> filterBarItemsInfo = [
    {
      "title": "Beauty",
      "picture": "assets/images/homepage_images/filter_ava_1.png"
    },
    {
      "title": "Fashion",
      "picture": "assets/images/homepage_images/filter_ava_3.png"
    },
    {
      "title": "Kids",
      "picture": "assets/images/homepage_images/filter_ava_4.png"
    },
    {
      "title": "Mens",
      "picture": "assets/images/homepage_images/filter_ava_2.png"
    },
    {
      "title": "Womens",
      "picture": "assets/images/homepage_images/filter_ava_5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Featured",
                  style: Theme.of(context).textTheme.titleSmall
                      ?.copyWith(color: Colors.black, fontSize: 20),
                )),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filterBarItemsInfo
                    .map((itemInfo) => FilterBarItemWidget(
                        picture: itemInfo["picture"] ?? "",
                        title: itemInfo["title"] ?? "",
                        textTheme: Theme.of(context).textTheme))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
