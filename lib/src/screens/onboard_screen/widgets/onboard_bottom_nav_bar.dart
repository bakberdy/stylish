import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../login_screen/screens/login_screen.dart';

class OnboardBottomNavBar extends StatelessWidget {
  const OnboardBottomNavBar({
    super.key,
    required int currentPage,
    required PageController pageController,
    required this.textTheme,
    required this.themeData,
  })  : _currentPage = currentPage,
        _pageController = pageController;

  final int _currentPage;
  final PageController _pageController;
  final TextTheme textTheme;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _currentPage != 0
              ? GestureDetector(
                  onTap: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: SizedBox(
                    width: 120,
                    child: Text("Prev",
                        style: textTheme.labelLarge?.copyWith(
                            color: themeData.canvasColor,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              : const SizedBox(
                  width: 120,
                ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: themeData.primaryColor,
              dotColor: themeData.canvasColor,
              dotHeight: 8.0,
              dotWidth: 12.0,
              expansionFactor: 4,
              spacing: 8.0,
            ),
          ),
          _currentPage != 2
              ? GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 120,
                    child: Text("Next",
                        style: textTheme.labelLarge?.copyWith(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              : Container(
                  alignment: Alignment.centerRight,
                  width: 120,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (val) => false);
                    },
                    child: Text("Get Started",
                        style: textTheme.labelLarge?.copyWith(
                            color: themeData.primaryColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
        ],
      ),
    );
  }
}
