import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/login_input_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/password_input_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/image_button_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/login_screen/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

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
                "Create an \naccount!",
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
                textTheme: textTheme, hintText: 'Password',),
              const SizedBox(
                height: 30,
              ),
              PasswordInputWidget(
                passwordController: _passwordConfirmController,
                themeData: themeData,
                textTheme: textTheme, hintText: 'Confirm Password',),
              const SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  style: textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: "By clicking the ",
                      style: textTheme.bodySmall?.copyWith(color: themeData.cardColor),
                    ),
                    TextSpan(
                      text: "Register",
                      style: textTheme.bodySmall?.copyWith(color: themeData.primaryColor),),
                    TextSpan(
                      text: " button, you agree to the public offer",
                      style: textTheme.bodySmall?.copyWith(color: themeData.cardColor),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              SubmitButtonWidget(themeData: themeData,
                textTheme: textTheme,
                title: 'Create Account',
                onPressed: () {},),
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
                    picture: 'assets/images/icons_of_providers/facebook_icon.png',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Align(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "I Already Have an Account ",
                          style: textTheme.labelMedium?.copyWith(
                              color: themeData.cardColor),
                        ),
                        TextSpan(
                          text: "Login",
                          style: textTheme.labelMedium?.copyWith(
                            color: themeData.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil(
                                  context, MaterialPageRoute(
                                  builder: (context) => const LoginScreen()), (
                                  e) => false);
                            },
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),)
      ,
    );
  }
}
