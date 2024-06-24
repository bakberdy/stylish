import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/home_screen_view_model/home_screen_view_model.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/widgets/filter_bar_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/widgets/sale_announcement_bar.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/widgets/sale_product_bar_widget.dart';

import '../../../common_widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel()..loadItems(),
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
            backgroundColor: const Color(0xfff5f5f5),
            centerTitle: true,
            title: SizedBox(
                height: 50,
                child: SvgPicture.asset(
                    "assets/images/homepage_images/appbar_logo.svg"))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchBarWidget(
                  themeData: themeData,
                  textTheme: textTheme,
                  textController: _searchTextController,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const FilterBarWidget(),
              const SizedBox(
                height: 20,
              ),
              Consumer<HomeScreenViewModel>(
                  builder: (context, viewModel, child) {
                return SaleAnnouncementBarWidget(
                  saleAnnounces: viewModel.saleAnnounces,
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Consumer<HomeScreenViewModel>(
                builder: (context, viewModel, child) {
                  return SaleProductsBar(
                    items: viewModel.itemsInSale,
                    title: 'New Items',
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<HomeScreenViewModel>(
                builder: (context, viewModel, child) {
                  return SaleProductsBar(
                    items: viewModel.itemsInSale,
                    title: 'New Items',
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<HomeScreenViewModel>(
                builder: (context, viewModel, child) {
                  return SaleProductsBar(
                    items: viewModel.itemsInSale,
                    title: 'New Items',
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
