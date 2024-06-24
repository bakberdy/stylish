import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/src/screens/onboard_screen/widgets/onboard_appbar_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/onboard_screen/widgets/onboard_body_widget.dart';
import 'package:stylish_ecommerce_app/src/screens/onboard_screen/widgets/onboard_bottom_nav_bar.dart';

import '../data/onboard_screen_data.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60),
      child: OnboardAppBarWidget(textTheme: textTheme, currentPage: _currentPage, themeData: themeData)),
      bottomNavigationBar: OnboardBottomNavBar(currentPage: _currentPage, pageController: _pageController, textTheme: textTheme, themeData: themeData),
      body: PageView.builder(
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            final onboard = OnboardScreenData.getOnboardData()[index];
            return OnboardBodyWidget(
                title: onboard['title'] ?? "(null)",
                textStyle: textTheme.bodySmall,
                titleStyle: textTheme.titleMedium,
                text: onboard['text'] ?? "(null)",
                svgImage: onboard["picture_path"] ?? "(null)");
          }),
    );
  }
}

