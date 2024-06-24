
import 'package:flutter/material.dart';

class SaleAnnouncementWidget extends StatelessWidget {
  const SaleAnnouncementWidget({
    super.key,
    required this.sale,
  });

  final String sale;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 190,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(sale), fit: BoxFit.cover),
            color: Colors.pink.shade100,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
