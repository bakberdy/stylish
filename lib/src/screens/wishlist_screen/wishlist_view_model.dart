import 'package:flutter/material.dart';
import '../../model/domain/item.dart';
import '../../model/model.dart';

class WishlistViewModel extends ChangeNotifier{
  final Model _model = Model();
  Set<Item> _wishlistItems = {};

  Set<Item> get wishlistItems => _wishlistItems;

  WishlistViewModel() {
    _loadData();
    notifyListeners();
  }

  void _loadData() {
    if (_wishlistItems.isEmpty) {
      _wishlistItems = _model.user.wishListItems;
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    _model.removeFromWishlist(item);
    _wishlistItems.remove(item);
    notifyListeners();
  }
  void addItemToWishlist(Item item){
    _wishlistItems.add(item);
    _model.user.wishListItems.add(item);
    notifyListeners();
  }
}
