import 'package:flutter/material.dart';
import 'package:mealchooser/widgets/textstyle.dart';

stylishButton(
  String buttonName,
  IconData icon,
  void Function()? onTap,
  BuildContext context,
) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        textStyle(buttonName, 15, FontWeight.bold, Colors.deepOrange.shade900, context, 0,
            TextAlign.right,
            top: 0, bottom: 0, right: 0)
      ],
    ),
  );
}
