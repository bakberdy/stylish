import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/setting_screen/setting_view_model.dart';

class PersonalInfoScreen extends StatefulWidget {
   const PersonalInfoScreen({super.key});
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {


  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = context.read<SettingViewModel>().user;
    _nameController.text = user?.name ?? '';
    _lastNameController.text = user?.lastName ?? '';
  }

   @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    super.dispose();
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
        body: SingleChildScrollView(child: Column(
          children: [
            SizedBox(
                height: 140,
                width: 140,
                child: CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(0.3),
                  backgroundImage: NetworkImage(
                      context.read<SettingViewModel>().user?.avatarPhoto ?? ""),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Change Photo",
                  style: TextStyle(color: Colors.blue),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    cursorColor: Colors.black,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SubmitButtonWidget(
                themeData: Theme.of(context),
                textTheme: Theme.of(context).textTheme,
                title: 'Save Changes',
                onPressed: () {
                  context.read<SettingViewModel>().changeUserNameAndLAstName(_nameController.text, _lastNameController.text);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )));
  }
}
