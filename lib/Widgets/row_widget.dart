import 'package:flutter/material.dart';
import 'package:flutter_api_task/Widgets/text.dart';

class RowWidget extends StatelessWidget {
  final String? text;
  final String? title;
  const RowWidget({this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextWidget(
          "$title",
          weight: FontWeight.bold,
          size: 18,
        ),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: TextWidget(text == null ? "no value" : "$text"))),
      ],
    );
  }
}