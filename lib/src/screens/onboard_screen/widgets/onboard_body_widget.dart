
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardBodyWidget extends StatelessWidget {
  const OnboardBodyWidget(
      {super.key,
      required this.titleStyle,
      required this.textStyle,
      required this.title,
      required this.text,
      required this.svgImage});

  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final String title;
  final String text;
  final String svgImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 420,
              width: double.infinity,
              child: SvgPicture.asset(svgImage)),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: textStyle,
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }
}
