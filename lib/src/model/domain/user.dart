import 'package:stylish_ecommerce_app/src/model/domain/bank_account.dart';
import 'package:stylish_ecommerce_app/src/model/domain/order.dart';

import 'item.dart';

class User {
  String name;
  String lastName;
  String? avatarPhoto;
  String? address;
  BankAccount? bankAccount;


  var isPersonalInfoVerified = false;
  Set<Item> cartItems = {};
  Set<Item> wishListItems = {};
  List<Order> orders = [];

  User({required this.name, required this.lastName, required this.avatarPhoto, required this.address, this.bankAccount});

}