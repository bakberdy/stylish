import 'package:stylish_ecommerce_app/src/model/domain/user.dart';

import 'item.dart';

class Order {
  final DateTime orderDate;
  final User user;
  final Map<Item, int> orderedItems;
  final double totalCost;

  Order({required this.orderDate, required this.user, required this.orderedItems, required this.totalCost});

}