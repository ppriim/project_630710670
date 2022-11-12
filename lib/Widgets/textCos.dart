import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textCos extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;

  const textCos({
    Key? key,
    required this.shadows,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.teal,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        shadows: shadows,
      ),
    );
  }
}
