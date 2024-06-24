import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/widgets/product_bar_item_widget.dart';
import '../wishlist_view_model.dart';

class ProductsBar extends StatelessWidget {
  const ProductsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, WishlistViewModel vm, child) {
        final products = vm.wishlistItems.toList();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: (MediaQuery.of(context).size.width - 20),
          height: products.length==1?500:products.length*220,
          child: MasonryGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: products.length,
            itemBuilder: (context, index) {
              var item = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ProductBarItem(
                  item: item,
                ),
              );
            },
          ),
        );
      }
    );
  }
}
