import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/search_bar_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/widgets/product_bar_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/widgets/sort_button.dart';
import 'package:stylish_ecommerce_app/src/screens/wishlist_screen/wishlist_view_model.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
  final TextEditingController _searchTextController = TextEditingController();

    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return  Scaffold(
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
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchBarWidget(
                  themeData: themeData,
                  textTheme: textTheme,
                  textController: _searchTextController,
                ),
              ),
              const SizedBox(height: 8),
              const SortButtonWidget(title: 'Your WishList'),
              const ProductsBar(),
            ],
        ),
        ));
  }
}
