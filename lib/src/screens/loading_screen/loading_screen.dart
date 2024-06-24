import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboard_screen/screens/onboard_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const OnboardScreen()), (Route<dynamic> route) => false );
    // TODO: implement initState
    super.initState();
  });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/images/loading_screen_img/logo.svg"),
      ),
    );
  }
}
