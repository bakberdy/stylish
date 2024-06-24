import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/widgets/sale_product_bar_item_widget.dart';

import '../../../model/domain/item.dart';

class SaleProductsBar extends StatefulWidget {
  const SaleProductsBar({
    super.key,
    required this.items,
    required this.title,
  });

  final List<Item> items;
  final String title;

  @override
  State<SaleProductsBar> createState() => _SaleProductsBarState();
}

class _SaleProductsBarState extends State<SaleProductsBar> {
  final ScrollController _listViewController = ScrollController();
  double _currentOffset = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            widget.title,
            style: textTheme.labelMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 280,
              width: double.infinity,
              child: ListView.builder(
                  controller: _listViewController,
                  itemCount: widget.items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = widget.items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SaleProductBarItem(
                        item: item,
                      ),
                    );
                  }),
            ),
            Positioned(
                top: 120,
                right: 20,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: Colors.white.withOpacity(0.9),
                      onPressed: () {
                        setState(() {
                          _currentOffset += 150;
                          if (_currentOffset >
                              _listViewController.position.maxScrollExtent) {
                            _currentOffset = 0;
                          }
                          _listViewController.animateTo(
                            _currentOffset,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInSine,
                          );
                        });
                      },
                      child: const Icon(CupertinoIcons.right_chevron)),
                ))
          ],
        ),
      ],
    );
  }
}


