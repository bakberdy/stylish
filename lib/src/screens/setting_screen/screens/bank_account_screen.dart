import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/model/domain/bank_account.dart';

import '../../../common_widgets/submit_button_widget.dart';
import '../setting_view_model.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});

  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  final _bankAccountNumberController = TextEditingController();
  final _bankAccountNameLastnameController = TextEditingController();
  final _bankAccountCvcCodeController = TextEditingController();

  @override
  void initState() {
    var bankData = context.read<SettingViewModel>().user?.bankAccount;
    _bankAccountNumberController.text = bankData?.cardNumber??"";
    _bankAccountNameLastnameController.text = bankData?.cardName??"";
    _bankAccountCvcCodeController.text = "***";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
            backgroundColor: const Color(0xfff5f5f5),
            centerTitle: true,
            title: SizedBox(
                height: 50,
                child: SvgPicture.asset(
                    "assets/images/homepage_images/appbar_logo.svg"))),
        body: SingleChildScrollView(
            child:
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5),
                  height: 66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            label: Text("Card Number")
                        ),
                        controller: _bankAccountNumberController,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5),
                  height: 66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            label: Text("Name Lastname")
                        ),
                        controller: _bankAccountNameLastnameController,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5),
                  height: 66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none),
                            label: Text("CVC code")
                        ),
                        controller: _bankAccountCvcCodeController,
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  child: SubmitButtonWidget(
                    themeData: Theme.of(context),
                    textTheme: Theme
                        .of(context)
                        .textTheme,
                    title: 'Save Changes',
                    onPressed: () {
                      BankAccount bankAccount = BankAccount(
                          cardNumber: _bankAccountNumberController.text,
                          cardName: _bankAccountNameLastnameController.text,
                          cvcCode: _bankAccountCvcCodeController.text);
                      context
                          .read<SettingViewModel>()
                          .changeUserBankCardData(bankAccount);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )));
  }
}
