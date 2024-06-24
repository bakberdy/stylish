import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/login_input_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/password_input_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/image_button_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/login_screen/screens/start_page.dart';

import 'reset_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

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
                "Welcome \nBack!",
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
                height: 30,
              ),
              PasswordInputWidget(
                passwordController: _passwordController,
                themeData: themeData,
                textTheme: textTheme,
                hintText: 'Password',
              ),
              Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()));
                    },
                    child: Text(
                      "Forget Password?",
                      style: textTheme.labelSmall?.copyWith(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              SubmitButtonWidget(
                themeData: themeData,
                textTheme: textTheme,
                title: 'Login',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const StartPage()),
                      (a)=>false
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                  child: Text(
                "- OR Continue with -",
                style: textTheme.bodySmall?.copyWith(
                    color: themeData.cardColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButtonWidget(
                    themeData: themeData,
                    picture: 'assets/images/icons_of_providers/goole_icon.png',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ImageButtonWidget(
                    themeData: themeData,
                    picture: 'assets/images/icons_of_providers/apple_icon.png',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ImageButtonWidget(
                    themeData: themeData,
                    picture:
                        'assets/images/icons_of_providers/facebook_icon.png',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                  child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Create An Account ",
                      style: textTheme.labelMedium
                          ?.copyWith(color: themeData.cardColor),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: textTheme.labelMedium?.copyWith(
                        color: themeData.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                              (e) => false);
                        },
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
