import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/login_input_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot \npassword?",
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              LoginInputWidget(
                  loginController: _loginController,
                  themeData: themeData,
                  textTheme: textTheme),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: " * ",
                        style:
                            textTheme.bodySmall?.copyWith(color: Colors.red, fontSize: 20)),
                    TextSpan(
                        text:
                            "We will send you a message to set or reset your new password",
                        style: textTheme.bodySmall
                            ?.copyWith(color: themeData.cardColor)),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SubmitButtonWidget(
                themeData: themeData,
                textTheme: textTheme,
                title: 'Submit',
                onPressed: () {},
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
