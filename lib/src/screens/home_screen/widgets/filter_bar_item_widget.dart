
import 'package:flutter/material.dart';

class FilterBarItemWidget extends StatefulWidget {
  const FilterBarItemWidget({
    super.key,
    required this.picture,
    required this.title,
    required this.textTheme,
  });

  final String picture;
  final String title;
  final TextTheme textTheme;

  @override
  State<FilterBarItemWidget> createState() => _FilterBarItemWidgetState();
}

class _FilterBarItemWidgetState extends State<FilterBarItemWidget> {
  bool isPressedButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 62,
            height: 62,
            child: GestureDetector(
              onTap: () {
                isPressedButton = !isPressedButton;
                setState(() {});
              },
              child: CircleAvatar(
                  backgroundColor: !isPressedButton
                      ? Colors.transparent
                      : Theme.of(context).primaryColor,
                  child: Image.asset(widget.picture)),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            widget.title,
            style: widget.textTheme.labelSmall
                ?.copyWith(color: Colors.black, fontSize: 13),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
