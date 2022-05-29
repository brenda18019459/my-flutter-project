import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/strings.dart';

class TextWidget extends StatelessWidget {
  double fontSize;
  String text;
  Color color;

  TextWidget({required this.fontSize, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontGlory,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0
          ),
        ]
    ),);
  }
}