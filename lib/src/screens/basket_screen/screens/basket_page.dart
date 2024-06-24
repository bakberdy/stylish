import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';
import 'package:stylish_ecommerce_app/src/model/domain/order.dart';
import '../../../model/domain/item.dart';
import '../../../model/domain/user.dart';
import '../view_model/basket_view_model.dart';
import '../widgets/product_in_basket_item_widget.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasketPageContent();
  }
}

class BasketPageContent extends StatelessWidget {
  const BasketPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            children: [
              Row(
                children: [
                  _buildSelectAllCheckbox(context),
                  Expanded(
                    child: Text(
                      "Select All",
                      style: textTheme.titleSmall
                          ?.copyWith(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  context
                      .watch<BasketViewModel>()
                      .isSelectedAll
                      ? SizedBox(
                    height: 30,
                    child: Consumer(
                        builder: (context, BasketViewModel vm, child) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                              ),
                            ),
                            onPressed: () {
                              _showConfirmationDialog(
                                  index: null, vm: vm, context: context);
                            },
                            child: const Text(
                              "Delete All",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                          );
                        }),
                  )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer(
                  builder: (context, BasketViewModel vm, child) {
                    return ListView.builder(
                        itemCount: vm.basketItems.length,
                        itemBuilder: (context, index) {
                          return ProductInBasketItemWidget(
                            item: vm.basketItems[index],
                            isSelected: vm.selectedProducts[index],
                            onToggle: () {
                              vm.toggleProductSelection(index);
                            },
                            onDelete: () {
                              _showConfirmationDialog(
                                  index: index, vm: vm, context: context);
                            },
                            onIncrementItemButtonPressed: () {
                              vm.onIncrementItemButtonPressed(index);
                            },
                            onDecrementItemButtonPressed: () {
                              vm.onDecrementItemButtonPressed(index);
                            },
                            count: vm.numOfItems(index),
                          );
                        });
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.white,
                height: 50,
                child: Text(
                  "Total Cost: ${context.read<BasketViewModel>()
                      .totalPrice()}\$",
                  style: textTheme.titleMedium,
                ),
              ),
              SubmitButtonWidget(
                themeData: themeData,
                textTheme: textTheme,
                title: "Buy",
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      {required index, required vm, required context}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: index == null
              ? const Text(
              "Are you sure you want to remove all items in the basket?")
              : const Text(
              "Are you sure you want to remove one item in the basket?"),
          actions: [
            TextButton(
              onPressed: () {
                if (index != null) {
                  vm.removeProduct(index);
                } else {
                  vm.removeAllProducts();
                }
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectAllCheckbox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 35,
      child: InkWell(
        onTap: () {
          context.read<BasketViewModel>().toggleSelectAll();
        },
        child: Container(
          decoration: BoxDecoration(
            color: context
                .watch<BasketViewModel>()
                .isSelectedAll
                ? Colors.black
                : Colors.transparent,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(50),
          ),
          width: 15,
          height: 15,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
          onClosing: () {},
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                color: Colors.white,
              ),
              height: 200,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sum to pay: ${context.read<BasketViewModel>()
                              .totalPrice()}\$",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 60,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.8,
                            child: SubmitButtonWidget(
                                themeData: Theme.of(context),
                                textTheme: Theme
                                    .of(context)
                                    .textTheme,
                                title: "Pay",
                                onPressed: () {
                                  DateTime currentDate = DateTime.now();
                                  Map<Item, int> orderedItems = context.read<
                                      BasketViewModel>().orderedItems();
                                  double totalCost = context.read<
                                      BasketViewModel>().totalPrice();
                                  User? user = context
                                      .read<BasketViewModel>()
                                      .user;
                                  if (user != null && totalCost>0) {
                                    Order order = Order(
                                        orderDate: currentDate,
                                        user: user,
                                        orderedItems: orderedItems,
                                        totalCost: totalCost);
                                  }
                                })),
                      ])),
            );
          },
        );
      },
    );
  }
}
