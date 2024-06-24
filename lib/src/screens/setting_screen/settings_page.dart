import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/screens/address_info_screen.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/screens/bank_account_screen.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/screens/personal_info_screen.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/setting_view_model.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/widgets/bank_account_info_button.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/widgets/personal_info_button.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/widgets/user_address_info_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Scaffold(
            backgroundColor: const Color(0xfff5f5f5),
            appBar: AppBar(
                backgroundColor: const Color(0xfff5f5f5),
                centerTitle: true,
                title: SizedBox(
                    height: 50,
                    child: SvgPicture.asset(
                        "assets/images/homepage_images/appbar_logo.svg"))),
            body: Consumer(builder: (context, SettingViewModel vm, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 140,
                        width: 140,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          backgroundImage:
                              NetworkImage(vm.user?.avatarPhoto ?? ""),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${vm.user?.name} ${vm.user?.lastName}",
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonalInfoScreen()));
                      },
                      child: PersonalInfoButton(textTheme: textTheme),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddressInfoScreen()));
                      },
                      child: AddressInfoButton(textTheme: textTheme),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const BankAccountScreen()));
                      },
                      child: BankAccountInfoButton(textTheme: textTheme),
                    )
                  ],
                ),
              );
            }));
  }
}
