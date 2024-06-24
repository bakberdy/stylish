
import 'package:flutter/material.dart';

class SortButtonWidget extends StatelessWidget {
  const SortButtonWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(title, style: Theme.of(context).textTheme.titleSmall
                      ?.copyWith(color: Colors.black, fontSize: 20),),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10,bottom: 5),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 35,
          width: 78,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          child: const Row(
            children: [
              Text("Sort", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
              SizedBox(width: 5,),
              Icon(Icons.sort, size: 18,)
            ],
          ),
        ),
      ],
    );
  }
}
