import 'package:flutter/cupertino.dart';
import 'package:stylish_ecommerce_app/src/model/domain/bank_account.dart';
import 'package:stylish_ecommerce_app/src/model/model.dart';

import '../../model/domain/user.dart';

class SettingViewModel extends ChangeNotifier{
  final Model _model = Model();
  User? user;

  SettingViewModel(){
     user = _model.user;
  }


  void changeUserAddress(String address){
    user?.address = address;
    notifyListeners();
  }
  void changeUserNameAndLAstName(String name, String lastName){
    user?.name = name;
    user?.lastName = lastName;
    notifyListeners();
  }
  void changeUserBankCardData(BankAccount bankAccount){
    user?.bankAccount = bankAccount;
    notifyListeners();
  }

}