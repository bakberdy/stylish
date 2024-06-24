
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required TextEditingController textController,
    required this.themeData,
    required this.textTheme,
  }) : _textController = textController;

  final TextEditingController _textController;
  final ThemeData themeData;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
  child: TextFormField(
    controller: _textController,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      suffixIcon: const Icon(Icons.mic),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIcon: Icon(
        Icons.search,
        color: themeData.cardColor,
      ),
      hintText: "Search any Product.",
      hintStyle: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
    ),
    // Set keyboard type to email address
  ),
);

  }
}
