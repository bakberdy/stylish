import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/common_widgets/submit_button_widget.dart';

import '../../../common_widgets/home_screen_bottom_nav_bar/home_screen_bottom_nav_bar.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var textTheme = themeData.textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/homepage_images/get_start_bg.png"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(
                        0.5), // Adjust the shadow color and opacity as needed
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "You want \n Authentic, here \nyou go!",
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Find it here, buy it now!",
                  style: textTheme.labelSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: SubmitButtonWidget(
                        themeData: themeData,
                        textTheme: textTheme,
                        title: "Get Started",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeScreenBottomNavigationBar()),
                              (e) => false);
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
