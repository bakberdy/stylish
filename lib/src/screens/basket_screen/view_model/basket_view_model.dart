import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/model/model.dart';
import '../../../model/domain/item.dart';
import '../../../model/domain/user.dart';

class BasketViewModel extends ChangeNotifier {
  final Model _model = Model();
  User? user;
  List<bool> _selectedProducts = [];
  List<int> _numOfSelectedProducts = [];
  List<Item> _basketItems = [];

  BasketViewModel() {
    user = _model.user;
    _basketItems = _model.user.cartItems.toList();
    _selectedProducts = List.generate(_basketItems.length, (_) => true);
    _numOfSelectedProducts = List.generate(_basketItems.length, (_) => 1);
  }

  bool get isSelectedAll => _selectedProducts.every((isSelected) => isSelected);
  List<Item> get basketItems => _basketItems;

  List<bool> get selectedProducts => _selectedProducts;
  List<int> get numOfSelectedProducts => _numOfSelectedProducts;

  int numOfItems(int index){
    if(_numOfSelectedProducts.isNotEmpty){
      return _numOfSelectedProducts[index];
    } else {
      return 0;
    }
  }
  Map<Item , int> orderedItems(){
    List<Item> items = [];
    for(int i = 0; i<_basketItems.length;i++){
      if(_selectedProducts[i]){
      items.add(basketItems[i]);
      }
    }
    return Map.fromIterables(items, _numOfSelectedProducts);
  }

  void toggleSelectAll() {
    bool newState = !isSelectedAll;
    _selectedProducts = List.generate(_basketItems.length, (_) => newState);
    notifyListeners();
  }

  void toggleProductSelection(int index) {
    _selectedProducts[index] = !_selectedProducts[index];
    notifyListeners();
  }

  void removeProduct(int index) {
    _model.removeFromBasket(basketItems[index]);
    _basketItems.removeAt(index);
    _numOfSelectedProducts.removeAt(index);
    _selectedProducts.removeAt(index);
    notifyListeners();
  }

  void removeAllProducts() {
    _model.removeAllFromBasket();
    _basketItems.clear();
    _selectedProducts.clear();
    _numOfSelectedProducts.clear();
    notifyListeners();
  }

  void onDecrementItemButtonPressed(int index) {
    if (_numOfSelectedProducts[index] > 1) {
      _numOfSelectedProducts[index]--;
      notifyListeners();
    }
  }

  double totalPrice(){
    double totalPrice = 0;
    for(int i=0; i<_basketItems.length;i++){
      if(_selectedProducts[i]){
        totalPrice += _basketItems[i].price * _numOfSelectedProducts[i];
      }
    }
    return totalPrice;
  }

  void onIncrementItemButtonPressed(int index) {
    _numOfSelectedProducts[index]++;
    notifyListeners();
  }


  void addItemToCart(Item item) {
    _basketItems.add(item);
    _model.addToCart(item);
    _selectedProducts.add(true);
    _numOfSelectedProducts.add(1);
    notifyListeners();
  }}
