import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign align;
  final double? height;
  final Color color;
  final double size;
  final FontWeight weight;

  TextWidget(
      this.title, {
        this.maxLines,
        this.overflow,
        this.align = TextAlign.start,
        this.height,
        this.color = Colors.black,
        this.size = 14.0,
        this.weight = FontWeight.w400,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        height: height,
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}