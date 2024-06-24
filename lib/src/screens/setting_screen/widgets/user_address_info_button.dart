
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/setting_view_model.dart';

class AddressInfoButton extends StatelessWidget {
  const AddressInfoButton({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(3, 3),
    ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    Text(
      "Address",
      style: textTheme.labelSmall?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16),
    ),
    SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: const Divider(
          color: Colors.grey,
        )),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.watch<SettingViewModel>().user?.address??"",
          style: textTheme.labelSmall?.copyWith(
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const Icon(
          CupertinoIcons.right_chevron,
          color: Colors.black,
        )
      ],
    )
            ],
          ),
        );
  }
}