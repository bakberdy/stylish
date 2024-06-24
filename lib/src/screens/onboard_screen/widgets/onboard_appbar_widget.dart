import 'package:flutter/material.dart';

import '../../login_screen/screens/login_screen.dart';

class OnboardAppBarWidget extends StatelessWidget{
  const OnboardAppBarWidget({
    super.key,
    required this.textTheme,
    required int currentPage,
    required this.themeData,
  }) : _currentPage = currentPage;

  final TextTheme textTheme;
  final int _currentPage;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (val)=>false);
            },
            child: Text("Skip",
                style: textTheme.labelLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600)),
          ),
        )
      ],
      title: Text.rich(TextSpan(children: [
        TextSpan(
            text: "${_currentPage + 1}",
            style: textTheme.labelLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
        TextSpan(
            text: "/3",
            style: textTheme.labelLarge?.copyWith(
                color: themeData.canvasColor, fontWeight: FontWeight.w600))
      ])),
    );
  }
}
