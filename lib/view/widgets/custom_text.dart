import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final dynamic fontWeight;
  final Alignment alignment;
  const CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.fontWeight,
      this.alignment = Alignment.topLeft});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style:
            TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
            ),
      ),
    );
  }
}
