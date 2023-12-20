import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

textStyle(String title, double fontSize, FontWeight fontWeight, Color color,
    BuildContext context, double containerWidth, TextAlign textAlign,
    {required double top, required double bottom, required double right, }) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom, right: right),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    ),
  );
}

longText(
  String title,
  Color color,
  FontWeight fontWeight,
  double fontSize,
  int trimLines,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: ReadMoreText(
      title,
      trimLines: trimLines,
      colorClickableText: Colors.deepOrange.shade900,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' see more',
      trimExpandedText: ' see less',
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    ),
  );
}

headText(String head, double fontSize, Color color) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Text(
      head,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
    ),
  );
}

titleStyle(
  String title,
  double top,
  double bottom,
) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom),
    child: Text(
      title,
      style: const TextStyle(
        color: Color(0xff403939),
        fontWeight: FontWeight.bold,
        fontSize: 27,
      ),
    ),
  );
}
