import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Socialicon extends StatelessWidget {
  String iconPath;
  Socialicon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(iconPath),
        ),
      ),
    );
  }
}