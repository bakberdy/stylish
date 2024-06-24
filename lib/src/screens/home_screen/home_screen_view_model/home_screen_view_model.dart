
import 'package:flutter/material.dart';

import '../../../model/domain/item.dart';
import '../../../model/model.dart';

class HomeScreenViewModel extends ChangeNotifier{
  final Model _model = Model();
  List<Item> _itemsInSale = [];
  List<String> _saleAnnounces = [];

  List<Item> get itemsInSale => _itemsInSale;
  List<String> get saleAnnounces =>_saleAnnounces;

  void loadItems() {
    _itemsInSale = _model.itemsInSale;
    _saleAnnounces = _model.saleAnnounces;
    notifyListeners();
  }


}