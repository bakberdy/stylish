import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/submit_button_widget.dart';
import '../setting_view_model.dart';

class AddressInfoScreen extends StatefulWidget {
  const AddressInfoScreen({super.key});

   @override
  _AddressInfoScreenState createState() => _AddressInfoScreenState();
}

class _AddressInfoScreenState extends State<AddressInfoScreen> {
  final TextEditingController _addressController = TextEditingController();
  @override
  void initState() {
    _addressController.text=context.read<SettingViewModel>().user?.address ?? '';
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
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  TextFormField(
                  controller: _addressController,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SubmitButtonWidget(
                themeData: Theme.of(context),
                textTheme: Theme.of(context).textTheme,
                title: 'Save Changes',
                onPressed: () {
                  context.read<SettingViewModel>().changeUserAddress(_addressController.text);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
